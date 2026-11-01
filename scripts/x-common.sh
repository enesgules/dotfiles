# Shared helpers for scripts/x-post, scripts/x-thread, and scripts/x-media.
# Source this file. Do not run it.

x_die() {
  echo "$(basename "$0"): $*" >&2
  exit 1
}

x_need_jq() {
  command -v jq >/dev/null 2>&1 || x_die "jq is not installed. Install jq and try again."
}

# Set X_USER (empty when the URL has no handle) and X_ID.
x_parse() {
  local input="$1"
  input="${input%%#*}"
  input="${input%%\?*}"
  X_USER=""
  X_ID=""
  if [[ "$input" =~ ^[0-9]{2,20}$ ]]; then
    X_ID="$input"
    return 0
  fi
  local rest="$input"
  rest="${rest#http://}"
  rest="${rest#https://}"
  rest="${rest#www.}"
  local host="${rest%%/*}"
  local path="${rest#*/}"
  if [[ "$host" == "$rest" || -z "$path" ]]; then
    x_die "bad URL: $1"
  fi
  case "$host" in
    x.com|twitter.com|mobile.twitter.com|mobile.x.com) ;;
    *) x_die "bad URL: $1" ;;
  esac
  path="${path%/}"
  if [[ "$path" =~ ^i/status/([0-9]{2,20})(/.*)?$ ]]; then
    X_ID="${BASH_REMATCH[1]}"
    return 0
  fi
  if [[ "$path" =~ ^@?([A-Za-z0-9_]{1,15})/status/([0-9]{2,20})(/.*)?$ ]]; then
    X_USER="${BASH_REMATCH[1]}"
    X_ID="${BASH_REMATCH[2]}"
    return 0
  fi
  x_die "bad URL: $1"
}

# Print the fxtwitter JSON for X_USER / X_ID. Exit non-zero on failure.
x_fetch() {
  local url
  if [[ -n "$X_USER" ]]; then
    url="https://api.fxtwitter.com/${X_USER}/status/${X_ID}"
  else
    url="https://api.fxtwitter.com/i/status/${X_ID}"
  fi
  local body http
  body="$(mktemp)"
  if ! http="$(curl -sS -A 'dotfiles-x' --max-time 30 -o "$body" -w '%{http_code}' "$url")"; then
    rm -f "$body"
    x_die "could not reach fxtwitter"
  fi
  if [[ "$http" == "429" ]]; then
    rm -f "$body"
    x_die "rate limited by fxtwitter. Wait and try again."
  fi
  if ! jq -e 'type == "object"' "$body" >/dev/null 2>&1; then
    rm -f "$body"
    x_die "fxtwitter did not return JSON (HTTP ${http}). Check the URL."
  fi
  local code message
  code="$(jq -r '.code // empty' "$body")"
  message="$(jq -r '.message // empty' "$body")"
  if [[ "$code" == "429" || "$message" == *[Rr][Aa][Tt][Ee]* ]]; then
    rm -f "$body"
    x_die "rate limited by fxtwitter. Wait and try again."
  fi
  if [[ "$code" != "200" || "$(jq -r '.tweet == null' "$body")" == "true" ]]; then
    rm -f "$body"
    case "$code" in
      404) x_die "post not found" ;;
      401) x_die "post is private" ;;
      *) x_die "fxtwitter error ${code:-$http} ${message}" ;;
    esac
  fi
  cat "$body"
  rm -f "$body"
}

# jq program. $mode is md, json, or urls. Input is a fxtwitter response.
X_JQ='
def num($v): if $v == null then "n/a" else ($v | tostring) end;
def repost_count:
  if .reposts != null then .reposts
  elif .retweets != null then .retweets
  else null end;
def media_urls:
  (
    if (.media.all | type) == "array" and (.media.all | length) > 0 then
      [.media.all[].url]
    else
      [(.media.photos[]?.url // empty), (.media.videos[]?.url // empty)]
    end
    + [
        (.article.cover_media.media_info.original_img_url // empty),
        (.article.media_entities[]?.media_info.original_img_url // empty),
        (
          (.article.media_entities[]?.media_info.video_info.variants // [])
          | map(select(.content_type == "video/mp4" and .url != null))
          | if length == 0 then empty else (max_by(.bitrate // 0).url) end
        )
      ]
  )
  | map(select(. != null and . != ""))
  | reduce .[] as $u ([]; if (index($u) != null) then . else . + [$u] end);
def article_body:
  if (.article | type) != "object" then ""
  elif (.article.content.blocks | type) != "array" or (.article.content.blocks | length) == 0 then
    (.article.preview_text // "")
  else
    reduce .article.content.blocks[] as $b ({n: 0, out: []};
      if $b.type == "atomic" then .
      elif (($b.text // "") | gsub("[[:space:]]+"; "")) == "" then .
      else
        (if $b.type == "ordered-list-item" then .n + 1 else 0 end) as $n
        | .n = $n
        | .out += [
            if $b.type == "header-one" then "# \($b.text)"
            elif $b.type == "header-two" then "## \($b.text)"
            elif $b.type == "header-three" then "### \($b.text)"
            elif $b.type == "unordered-list-item" then "- \($b.text)"
            elif $b.type == "ordered-list-item" then "\($n). \($b.text)"
            elif $b.type == "blockquote" then "> \($b.text)"
            else $b.text end
          ]
      end
    )
    | .out | join("\n\n")
  end;
def counts:
  "\(num(.likes)) likes · \(num(repost_count)) reposts · \(num(.bookmarks)) bookmarks · \(num(.views)) views";
def when:
  if .created_timestamp != null then (.created_timestamp | strftime("%Y-%m-%d %H:%M UTC"))
  else (.created_at // "") end;
def render:
  "\(.author.name) (@\(.author.screen_name)) · \(when)",
  .url,
  "",
  (if ((.text // "") | length) > 0 then .text else empty end),
  (if (.article | type) == "object" then
    (if ((.text // "") | length) > 0 then "" else empty end),
    "article: \(.article.title)",
    "",
    article_body
  else empty end),
  "",
  counts,
  (media_urls as $m | if ($m | length) > 0 then "", "media:", ($m[] | "- \(.)") else empty end),
  (if (.quote | type) == "object" and .quote.author then
    "",
    "quoted:",
    "\(.quote.author.name) (@\(.quote.author.screen_name))",
    "",
    (.quote.text // "")
  else empty end);
def trimmed:
  {
    id, url, text, created_at,
    author: {name: .author.name, screen_name: .author.screen_name},
    likes,
    reposts: repost_count,
    bookmarks, views,
    replying_to, replying_to_status,
    media: media_urls
  }
  + (if (.quote | type) == "object" and .quote.id then
      {quote: {
        id: .quote.id, url: .quote.url, text: .quote.text,
        author: {name: .quote.author.name, screen_name: .quote.author.screen_name}
      }}
    else {} end)
  + (if (.article | type) == "object" then
      {article: {title: .article.title, preview_text: .article.preview_text, text: article_body}}
    else {} end);
if $mode == "json" then .tweet | trimmed
elif $mode == "urls" then .tweet | media_urls[]
else .tweet | render end
'

x_emit() {
  if [[ "$1" == "json" ]]; then
    jq --arg mode json "$X_JQ"
  else
    jq -r --arg mode "$1" "$X_JQ"
  fi
}
