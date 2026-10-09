#!/bin/sh
# Symlink this repo into place. Safe to re-run.
set -e
D="$(cd "$(dirname "$0")" && pwd)"
GHOSTTY="$HOME/Library/Application Support/com.mitchellh.ghostty"
mkdir -p ~/.claude/skills ~/.codex ~/.agents ~/.config/fish "$GHOSTTY"

ln -sfn "$D/AGENTS.md" ~/.claude/CLAUDE.md
ln -sfn "$D/AGENTS.md" ~/.codex/AGENTS.md
for s in "$D"/skills/*/; do
  [ -d "$s" ] || continue  # no own skills: the glob stays unexpanded
  s="${s%/}"; rm -rf ~/.claude/skills/"$(basename "$s")"; ln -sfn "$s" ~/.claude/skills/
done
ln -sfn "$D/skill-lock.json" ~/.agents/.skill-lock.json
ln -sfn "$D/ghostty/config" "$GHOSTTY/config"
ln -sfn "$D/fish/config.fish" ~/.config/fish/config.fish

# Third-party skills are not vendored. The skills CLI has no restore for the global lock,
# so install each source's skills from it again (`skills add` keeps the lock up to date).
command -v node >/dev/null || { echo "node missing: third-party skills not restored"; exit 0; }
node -e '
  const { spawnSync } = require("child_process");
  const by = {};
  for (const [name, s] of Object.entries(require(process.argv[1]).skills)) (by[s.source] ??= []).push(name);
  for (const [src, names] of Object.entries(by)) {
    const r = spawnSync("npx", ["-y", "skills", "add", src, "-g", "-y", "-a", "claude-code", "codex", "-s", ...names]);
    if (r.status !== 0) console.log("skills: " + src + " failed");
  }
' "$D/skill-lock.json"
