# Charlie Marsh (@charliermarsh): code-review research

Research date: 2026-11-26. Weighting: 2025 to Nov 2026 highest.
Main corpus: 1,925 of his GitHub comments in 1,043 threads, 2025-01-02 to 2026-11-26 (found with GraphQL search `reviewed-by:charliermarsh` and `commenter:charliermarsh`, then filtered by `author.login`). By kind: 701 inline review comments, 226 review bodies, 998 PR and issue comments. By repo: `astral-sh/uv` 1,163, `astral-sh/ruff` (ruff and the ty engine) 482, `astral-sh/ty` 280. Other sources: 4 of his own 2026 PR bodies, 6 Astral blog posts (5 by him, 2023 to 2026), 165 of his X posts (2026-10-06 to 2026-11-25, 15 timeline pages), 66 HN comments (author `charliermarsh`), and 100 Bluesky posts (`crmarsh.com`, 2024-12-15 to 2025-11-10).
Second pass (2026-11-26, last year only): GraphQL search sliced into 27 two-week windows (no window near the 1,000 cap) for `commenter:charliermarsh`, `reviewed-by:charliermarsh`, and `author:charliermarsh is:pr`, 7,741 threads. Last-year items: 2,766 PR and issue comments, 1,332 inline review comments, 169 review bodies, and 5,481 of his own PR bodies (2025-11-26 to 2026-10-13; most are in `astral-experiments/*` agent repos). On other people's threads: 1,480 (932 comments, 399 inline, 149 review bodies), in `astral-sh/uv` 614, `astral-sh/ruff` 503, `astral-sh/ty` 280, `wheelnext/peps` 39, `openai/codex` 9. Also: 450 X posts (2026-06-25 to 2026-11-25), 7 HN comments from the last year, one podcast transcript (The Peterman Pod, 2026-06-22), and the CodSpeed home page testimonial.
Every quote is verbatim. A script (`check_quotes.py`, second pass) checked each linked quote in this file against the fetched text. "Inference" marks my own reading. "Paraphrase" marks text that I did not quote.

**Employer.** Astral agreed to join OpenAI on the Codex team ([Astral to join OpenAI, 2026-03-19](https://astral.sh/blog/openai)). His GitHub bio now says "@OpenAI. Building Ruff, uv, ty, and other high-performance Python tools with the @astral-sh team." ([GitHub](https://github.com/charliermarsh)) His late-2026 X posts are mostly about Codex speed and memory.

**Agent-written text.** He works with Codex a lot, and he says so. 30 of his comments relay a Codex finding in his own words: "Codex points out (sorry) that we now get this wrong:" ([ruff#28006](https://github.com/astral-sh/ruff/pull/28006#pullrequestreview-5013249403)). This file treats those as his review position, because he chose to post them. Some 2026 texts read like agent output with no label: the approval bodies on uv#21529 and uv#21146 ("Verified that the test fails without trimming and passes with the fix" ([uv#21529](https://github.com/astral-sh/uv/pull/21529#pullrequestreview-5135856571))), the "Independent HTTPX cross-check" ([ruff#30435](https://github.com/astral-sh/ruff/pull/30435#issuecomment-6879379359)) comment, and his long 2026 performance PR bodies (paired-run tables). He wrote that for one 2026 crate "all code changes, PR summaries, and additional documentation were authored entirely by GPT-6 Astra in Codex" ([X](https://x.com/charliermarsh/status/2107891166016643328)). Quotes from these are marked `(likely agent-written)`. They show the standard that he merges under his name, not his phrasing. The second pass adds one more unlabeled agent-style approval: "The canonical on-disk identity approach preserves case-sensitive distinctions while converging path aliases, and the protocol and regression coverage now exercise the integration boundary." ([hawk#141](https://github.com/astral-sh/hawk/pull/141#pullrequestreview-4823640710)) (likely agent-written). He also runs Codex as a second reviewer in the open: "(I'm also asking Codex to `/goal` find a bug introduced by this branch.)" ([ruff#26085](https://github.com/astral-sh/ruff/pull/26085#pullrequestreview-4514899946)). Most of his 2026 own PR bodies (5,481, mostly in `astral-experiments/*`) are agent-written and are not quoted.

---

## Current focus (what he works on now)

- **ty speed, in many small PRs.** In Nov 2026 he opened dozens of `[ty] Avoid ...` and `[ty] Cache ...` PRs (for example ruff#30550, ruff#30095, ruff#30869). Each one names one cost and gives instruction counts.
- **Codex harness speed and memory at OpenAI.** "If you are waste in the harness I will hunt you down." ([X](https://x.com/charliermarsh/status/2124507314384146925)). "We should keep driving this down, I'd like it to be even lower (lower always better)." ([X](https://x.com/charliermarsh/status/2125676414573703318))
- **Release builds of uv and ty.** PGO, LTO, `codegen-units = 1`, `panic = "abort"`, and binary size: "We've reduced the uv binary size by over 40% since July (57% on Windows!)." ([X](https://x.com/charliermarsh/status/2108597610181455956))
- **Agent-written Rust.** He runs agent-authored experiments (serc, an HTML parser, tar-codec), and he checks them against real-world output: serc "emits byte-for-byte identical output on the top 10,000 PyPI packages" ([X](https://x.com/charliermarsh/status/2119900423066669175)).

---

## Core values

1. **Speed is the product.** "When a tool is 10x, or 20x, or 100x faster, it completely changes the ergonomics." ([The Ruff Formatter, 2023-10-24](https://astral.sh/blog/the-ruff-formatter)). "Caring is the moat, you should feel visceral pain when things are bad or broken and stop at nothing to fix them" ([X](https://x.com/charliermarsh/status/2114040855073820966)).
2. **Fast and correct, not fast and different.** "The results here are really strong but I keep finding behavioral changes / regressions unfortunately." ([ruff#30155](https://github.com/astral-sh/ruff/pull/30155#issuecomment-7172762095)). "Closing this. Skipping the variance lookup changes how ty resolves recursive types." ([ruff#30745](https://github.com/astral-sh/ruff/pull/30745#issuecomment-7084047903))
3. **Drop-in for the tool users already have.** The formatter "achieves >99.9% compatibility with Black, as measured by changed lines" ([The Ruff Formatter](https://astral.sh/blog/the-ruff-formatter)). uv began as "a drop-in replacement for common pip workflows." ([uv: Unified Python packaging, 2024-08-20](https://astral.sh/blog/uv-unified-python-packaging))
4. **Measure on real code, and distrust weak methods.** "I'm seeing benchmark methodologies you wouldn't BELIEVE in some of these agent-authored projects" ([X](https://x.com/charliermarsh/status/2114948698878919048)). "One thing I'm noticing from these agent-driven Rust forks is that \"time to recompile after edit\" is a very lossy metric." ([X](https://x.com/charliermarsh/status/2115188442024075611)) (the inner quote marks are his).
5. **Memory and size count too.** "Making things faster is much easier than making things smaller." ([HN](https://news.ycombinator.com/item?id=49510034)). "I'm a little saddened by the memory increase here, though I can also try to reduce that hit separately." ([ruff#24949](https://github.com/astral-sh/ruff/pull/24949#issuecomment-4634015812))
6. **Diagnostics are the interface.** "Diagnostic output is the primary user interface for a type checker" ([ty, 2025-12-16](https://astral.sh/blog/ty)).
7. **Small PRs.** "As a side quest, I got Astra to reduce uv's peak RSS for large solves by around 15-20% with a few small PRs." ([X](https://x.com/charliermarsh/status/2113443874907832818))
8. **Speed never pays for correctness.** "It is possible to care too much about performance (made evident by making bad tradeoffs around security or correctness)" ([X](https://x.com/charliermarsh/status/2091937073263480842)). "Growing a bit concerned about \"benchmaxxed\" software: tools or libraries that pass some reference test suite, but are objectively bad when you look inside or evaluate them outside of that narrow scope" ([X](https://x.com/charliermarsh/status/2083684355738673259)). He keeps speed and correctness reasons apart: "I don't think that ignoring upper bounds has a significant impact on uv's performance. We do this for a totally different reason, which is that it leads to better solves." ([HN](https://news.ycombinator.com/item?id=46464453))
9. **Software gets faster over time, measured in CI.** "Software should get faster, not slower, over time!" ([X](https://x.com/charliermarsh/status/2102826616653054010)). "We already have infrastructure in ty to track retained memory (and record it in CI), so we could easily push the model to bring that number down and iterate." ([X](https://x.com/charliermarsh/status/2075683931484000715)). On CodSpeed: "CodSpeed is a key part of the development loop for Ruff, uv, and ty. Its stable, instrumented benchmarks help us avoid regressions and keep a high-performance culture." ([codspeed.io testimonial](https://codspeed.io)) (marketing copy). In a podcast: "we have tons of like benchmarks like that run under Valgrind like through Codspeed like on every PR." and "So we benchmark like memory usage and simulation time and wall time like on every PR." ([The Peterman Pod, 2026-06-22](https://podscripts.co/podcasts/the-peterman-pod/openai-eng-dev-tools-founder-how-software-engineering-is-changing-charlie-marsh)) (auto transcript).
10. **Ask how fast it should be.** "if you're not like using your brain to like think about from first principles," and "should we be thinking a bit bigger about like why we have to represent the data this way?" and "All benchmarks are bad and wrong in some way." ([The Peterman Pod](https://podscripts.co/podcasts/the-peterman-pod/openai-eng-dev-tools-founder-how-software-engineering-is-changing-charlie-marsh)). "I'm out here GRINDING to shave eight bytes from our AST expression node (which reduces ty's retained memory by another 1-2%)" ([X](https://x.com/charliermarsh/status/2086173088593408285))
11. **Review is the bottleneck now.** "The cost of putting up a plausible PR has gone to zero, while the cost to like review has remained the same." and "I'd like to get to a world where if you put up a PR and it's all green, then the odds of it getting merged are like extremely high, right?" ([The Peterman Pod](https://podscripts.co/podcasts/the-peterman-pod/openai-eng-dev-tools-founder-how-software-engineering-is-changing-charlie-marsh)). "Every change was closely human-reviewed. That's the bar we have for ty -- we still do very close human review, it's an extremely complex project. Review is absolutely the bottleneck." ([X](https://x.com/charliermarsh/status/2075683928879313050)). For his own PRs: "I should understand like each line in the PR." (Peterman Pod).

---

## Review checklist (what he checks or pushes back on)

1. **Is there a number, and is it real?**
   - "Are you able to include some (brief) summarized numbers on cache size and performance? More concerned with the former, I trust the latter is similar." ([ruff#26374](https://github.com/astral-sh/ruff/pull/26374#issuecomment-4802017788))
   - "Probably worth at least checking how much it saves us" ([uv#11446](https://github.com/astral-sh/uv/pull/11446#discussion_r1954651921))
   - "Is it surprising that the benchmarks moved here? I guess even within a run we're now caching the result -- or is it noise?" ([ruff#26741](https://github.com/astral-sh/ruff/pull/26741#issuecomment-4951337937))
   - "This probably makes more sense as a PR comment than in code, since it won't be clear from the code alone what \"faster\" means. Like faster relative to what?" ([uv#10346](https://github.com/astral-sh/uv/pull/10346#discussion_r1905481928))
   - On a release-build change he measured 162 ecosystem projects: "The current pipeline doesn't regress CPU time in any of the ecosystem projects." ([ty#4213](https://github.com/astral-sh/ty/pull/4213#issuecomment-5253831869))
   - His own PR bodies give paired instruction counts and noise: "used 10.62–10.70% fewer instructions under Cachegrind in opposite run orders. Repeating the baseline varied by 0.01%." ([ruff#30550](https://github.com/astral-sh/ruff/pull/30550)) (likely agent-written)
   - He reads the CodSpeed report and credits a clean one: "Also, easy to overlook but: no CodSpeed regression! Nice job." ([ruff#24357](https://github.com/astral-sh/ruff/pull/24357#issuecomment-4178084714))
   - "Does building natively end up being faster, slower, or does it not make a big difference (with and without PGO)?" ([python-build-standalone#1272](https://github.com/astral-sh/python-build-standalone/pull/1272#pullrequestreview-5242793100))
   - He re-runs a published benchmark before he trusts it: "I re-ran the documents benchmarks both with the pinned versions, and with latest." ([ty#3023](https://github.com/astral-sh/ty/issues/3023#issuecomment-4360609792))
2. **Does the fast path give the same answer?**
   - "I'm mildly surprised that this has no ecosystem hits. Is the expectation that we are reaching the same result, just faster? Or did you expect this to _change_ the outcome in some cases?" ([ruff#30220](https://github.com/astral-sh/ruff/pull/30220#pullrequestreview-5847471385))
   - "According to Codex (sorry), the fast-path doesn't properly error for cases like `resolution-mode = { highest = }`." ([uv#20648](https://github.com/astral-sh/uv/pull/20648#discussion_r3668435942))
   - "I'm a little worried about getting into a situation whereby we make some mistake and silently fall back to the `Err(...)` case for all lockfiles. I don't know how best to guard against this. At minimum, could we have debug assert here somehow?" ([uv#20648](https://github.com/astral-sh/uv/pull/20648#discussion_r3668441946))
   - "Is this for performance or correctness (or necessary to avoid a hang)?" ([ruff#29026](https://github.com/astral-sh/ruff/pull/29026#discussion_r4190473891))
   - "Does the constraint solver end up with the \"same\" result here?" ([ruff#30220](https://github.com/astral-sh/ruff/pull/30220#discussion_r4529096085))
   - On a skip that the author called sound: "On main we infer `Row` for `result = ...`, but on this PR we infer `Row | dict[str, int]` and error on the last line." ([ruff#30054](https://github.com/astral-sh/ruff/pull/30054#discussion_r4482064131))
3. **What is the worst input?** He builds the bad case and times it.
   - "This is 34ms on main and >2 seconds on the PR (at least with a debug build). Any good ideas?" ([ruff#30054](https://github.com/astral-sh/ruff/pull/30054#discussion_r4482034813))
   - "Yeah I think re-compiling patterns for every tested member is clearly an anti-pattern" ([uv#20988](https://github.com/astral-sh/uv/pull/20988#issuecomment-5206514283))
   - His PR: "This makes capture registration quadratic in the number of functions." ([ruff#30550](https://github.com/astral-sh/ruff/pull/30550)) (likely agent-written)
4. **Is there hidden work on the hot path?**
   - "Should we avoid doing re-reading this in this hot path?" ([uv#16773](https://github.com/astral-sh/uv/pull/16773#discussion_r2539738416))
   - "Could we do this inside of the `if err.kind() == std::io::ErrorKind::NotFound` branch instead, to avoid paying this cost in the common case?" ([uv#11833](https://github.com/astral-sh/uv/pull/11833#discussion_r1973916865))
   - "I think this should all happen in the `trace!` macro, so that it doesn't run at all unless `trace!` is enabled (extremely rare)." ([uv#13333](https://github.com/astral-sh/uv/pull/13333#discussion_r2078068492))
   - "Nit: do the cheap check first (i.e., move `class_defines_property` to the second condition)?" ([ruff#25681](https://github.com/astral-sh/ruff/pull/25681#discussion_r3366172024))
   - "There are a few unnecessary allocations here. You're cloning all the data here, and then collecting it into a `Vec`, but then in `UrlAuthPolicies::from_tuples`, you're again cloning all the data because it takes a slice." ([uv#11896](https://github.com/astral-sh/uv/pull/11896#discussion_r1977923702))
   - "Consider using the return value of `requirements.insert` instead of the `contains`-`insert`?" ([uv#15657](https://github.com/astral-sh/uv/pull/15657#discussion_r2319140160))
   - "Can you omit this lookup in the above case (when you just inserted into it)?" ([ruff#25960](https://github.com/astral-sh/ruff/pull/25960#discussion_r3410576424))
   - "Is this doing more work than before, since we're returning all the iterators here?" ([uv#11143](https://github.com/astral-sh/uv/pull/11143#discussion_r1937979384))
   - "Should we not grab both of these with a single lock acquisition?" ([uv#11165](https://github.com/astral-sh/uv/pull/11165#discussion_r1943853482))
   - "I assume you can't use entry API here for contains + insert?" ([ruff#25960](https://github.com/astral-sh/ruff/pull/25960#discussion_r3410575524))
   - "Filter on this first to avoid all the rest?" ([uv#20840](https://github.com/astral-sh/uv/pull/20840#discussion_r3686034083)). "The second condition may be cheaper here?" ([uv#20078](https://github.com/astral-sh/uv/pull/20078#discussion_r3529780354)). "(Can we do this with a once cell or similar?)" ([uv#20004](https://github.com/astral-sh/uv/pull/20004#discussion_r3483418936))
   - "My only question is: can we avoid the startup costs (around indexing and reading all files / scripts) when `experimental.useUv` isn't enabled?" ([ruff#28038](https://github.com/astral-sh/ruff/pull/28038#pullrequestreview-5050415117))
   - "Should we... pass this in everywhere / set it, rather than parsing the env var in the client? :sick:" ([uv#21352](https://github.com/astral-sh/uv/pull/21352#discussion_r3883922906))
   - Memory, both ways: "IMO the memory gains here are clearly worth a 1-2% linter regression." ([ruff#25368](https://github.com/astral-sh/ruff/pull/25368#issuecomment-4543435867)). "Haven't reviewed the code but just want to note that the memory increase here is fairly significant -- is it avoidable?" ([ruff#25387](https://github.com/astral-sh/ruff/pull/25387#issuecomment-4596274694)). "That's a meaningful memory increase but seems worthwhile." ([ruff#27301](https://github.com/astral-sh/ruff/pull/27301#pullrequestreview-4808310200)). "Hmm, should we also clear the source file AST loaded during stub mapping?" ([ruff#29232](https://github.com/astral-sh/ruff/pull/29232#discussion_r4278139489))
5. **Does it match pip, the PEP, or the tool users came from?**
   - "Unless I'm misunderstanding, cycles in dependency groups are an error. Per the PEP:" ([uv#12005](https://github.com/astral-sh/uv/pull/12005#discussion_r1984333817))
   - "I think we need to look at this closely and cross-reference against our existing behavior for respecting (or not) executable bits when unzipping, and again when installing." ([uv#20737](https://github.com/astral-sh/uv/pull/20737#discussion_r3659477453))
   - His changelog edit: "Now, uv requests credentials for the index URL instead. This behavior matches `pip`." ([uv#13201](https://github.com/astral-sh/uv/pull/13201#discussion_r2067277026))
   - "I believe this exists for `pip` compatibility -- pip does not support relative paths like that (`my_package @ ../my_package`)." ([uv#15988](https://github.com/astral-sh/uv/issues/15988#issuecomment-3320536208))
   - "My only concern is that Cargo does it in the order we have here 🤔 Can you briefly check if there are any such issues reported in Cargo?" ([uv#12156](https://github.com/astral-sh/uv/pull/12156#issuecomment-2722921775))
   - "Do you know why this isn't present already? Could you check the history of [virtualenv](https://github.com/pypa/virtualenv) to see why they're not in there?" ([uv#11831](https://github.com/astral-sh/uv/pull/11831#issuecomment-2688215484))
   - "I think it's unspecified... I think Pyright does inherit `_value_`, mypy does not." ([ruff#22228](https://github.com/astral-sh/ruff/pull/22228#discussion_r2835700923))
   - "It might be worth including a mention of the similar mypy rule, even just for SEO / search purposes." ([ruff#27561](https://github.com/astral-sh/ruff/pull/27561#discussion_r3735548509))
   - "I know this used to exist in some form, can you just double-check the Git history to make sure this matches anything we learned from our prior implementation?" ([uv#14790](https://github.com/astral-sh/uv/pull/14790#discussion_r2220776119))
   - "There's a lot of history to this, documented here: https://github.com/astral-sh/uv/pull/14511. The TL;DR is that a trailing slash can be semantically significant (and normalizing these led to actual regressions for some users)." ([uv#20635](https://github.com/astral-sh/uv/issues/20635#issuecomment-5111938035))
   - On a non-standard syntax: "users to start to use this syntax, and then it proliferates through the ecosystem and makes future standardization more difficult." ([ruff#26035](https://github.com/astral-sh/ruff/pull/26035#issuecomment-4720247263))
   - "Hopefully the implementation here is largely taken from a corresponding Ruff rule?" ([ruff#28179](https://github.com/astral-sh/ruff/pull/28179#pullrequestreview-5062239824))
6. **Does a check fail too early, or on what a future upstream may add?**
   - "So my concern here is... what if, in the future, setuptools supports something like `setup.toml`? Then existing versions of uv will fail here, overly-aggressively." ([uv#11394](https://github.com/astral-sh/uv/pull/11394#discussion_r1954948798))
   - "It seems a little sketchy to show these preemptively. Could we show them as a hint after the operation fails?" ([uv#11394](https://github.com/astral-sh/uv/pull/11394#issuecomment-2649292974))
   - "I think this isn't quite right -- older uv versions should be able to read newer revisions! They just might miss out on features, etc., right?" ([uv#21890](https://github.com/astral-sh/uv/pull/21890#discussion_r4067855527))
7. **Is the message on the right channel, in the house style?**
   - "This seems wrong -- shouldn't it be using [`Hinted`](https://github.com/astral-sh/uv/blob/4ae7a0631904111dd797a881adf0e6d186a8192e/crates/uv-errors/src/lib.rs#L12-L22)? The hint also appears _before_ the error." ([uv#21284](https://github.com/astral-sh/uv/pull/21284#discussion_r4133324717))
   - "Should this be `warn_user` so that it appears without verbose logs?" ([uv#12706](https://github.com/astral-sh/uv/pull/12706#discussion_r2031310042))
   - "Hmm, are you sure this should be a user-facing warning? I don’t think any of the other lockfile-invalidation messages are user-facing. They just go through tracing." ([uv#14076](https://github.com/astral-sh/uv/pull/14076#discussion_r2152066672))
   - "I would be okay with this being a tracing warning, since it isn't necessarily something the user can proactively fix (if they don't control the server)." ([uv#18780](https://github.com/astral-sh/uv/pull/18780#discussion_r3018447771))
   - "I don't know that we should make this user-facing, to be honest. Isn't it going to trigger any time anyone installs Jupyter?" ([uv#13437](https://github.com/astral-sh/uv/pull/13437#issuecomment-2894602672))
   - "The exclamation mark is a bit much, I don't think we do that anywhere else." ([uv#13437](https://github.com/astral-sh/uv/pull/13437#discussion_r2140984673))
   - "I think I'd stylize this as: \"Missing `project.name` field in: {}\" (note the backticks)" ([uv#13317](https://github.com/astral-sh/uv/pull/13317#discussion_r2100241373))
   - "Should this be enforced in Clap? Separately, I believe we omit periods if it's a single sentence." ([uv#11486](https://github.com/astral-sh/uv/pull/11486#discussion_r1955144804))
   - "can we just show the package name instead of the full URL? Like \"anyio\"." ([uv#15251](https://github.com/astral-sh/uv/pull/15251#discussion_r2274710125))
   - "Should this use the same style from our dry-run reporter? Or even the same underlying formatter?" ([uv#21284](https://github.com/astral-sh/uv/pull/21284#discussion_r4133327820))
   - "What does \"stop searching\" mean, for a user? Similarly, what does it mean to \"keep\" searching?" ([uv#12805](https://github.com/astral-sh/uv/pull/12805#discussion_r2059492201))
8. **Is the output a contract?**
   - "Sorry, can you expand on that comment? What frameworks are depending on uv, and why are they breaking here? Comments are part of the output format." ([uv#12350](https://github.com/astral-sh/uv/pull/12350#issuecomment-2772920063))
   - "If we change that output, I think we would consider it breaking (so, per our versioning policy, it would only change in a minor (and not a patch) release)." ([uv#12392](https://github.com/astral-sh/uv/issues/12392#issuecomment-2748080378))
   - "Personally I think I'd prefer to sort by name -- it's a little easier to parse visually since it's predictable." ([uv#12350](https://github.com/astral-sh/uv/pull/12350#discussion_r2017610728))
9. **Is there a test that fails on main, and does the snapshot mean something?**
   - "It would be useful to include a test here (that fails on `main` but passes on this branch) to guard against regressions (and make sure we understand the problematic scenario)." ([uv#10827](https://github.com/astral-sh/uv/pull/10827#issuecomment-2605816217))
   - "This looks great! The one thing that's missing is a few tests to verify that the lockfile is _actually_ getting updated." ([uv#13317](https://github.com/astral-sh/uv/pull/13317#pullrequestreview-2823506382))
   - "It _might_ be easier to do this via snapshot testing?" ([uv#12501](https://github.com/astral-sh/uv/pull/12501#discussion_r2017514840))
   - "I looked into it briefly but I think `insta` strips some whitespace, and these tests are intentionally quite whitespace-sensitive, so lets leave it as-is." ([uv#12501](https://github.com/astral-sh/uv/pull/12501#discussion_r2017618731))
   - "Do we know where these changes are coming from? Is it an Insta version mismatch on the team? Would be good to understand prior to merging so that they don't oscillate." ([uv#12005](https://github.com/astral-sh/uv/pull/12005#discussion_r1983715626))
   - "Not totally sure we need to encode these in tests, it's kind of just repeating the enum match, no?" ([uv#17110](https://github.com/astral-sh/uv/pull/17110#discussion_r3983019074))
   - "Should this use a package that _isn't_ installed above, like `iniconfig`?" ([uv#12941](https://github.com/astral-sh/uv/pull/12941#discussion_r2048915030))
   - "Can we add a few test cases where there are comments between the groups, to understand how they move around?" ([uv#11591](https://github.com/astral-sh/uv/pull/11591#discussion_r1959857459))
10. **Is this one change?**
    - "Did you consider putting this file-move into a separate PR? It looks separable from the rest of the changes, and would be easy to merge on its own." ([uv#12005](https://github.com/astral-sh/uv/pull/12005#discussion_r1983713311))
    - "Are these parts just moved? Could you consider doing that in a separate PR?" ([uv#11167](https://github.com/astral-sh/uv/pull/11167#discussion_r1940306205))
    - "(I think I understand this (avoid suggesting keys that aren't valid for, e.g., an entire union), but should it be a separate bugfix?)" ([ruff#24097](https://github.com/astral-sh/ruff/pull/24097#discussion_r3086916767))
    - "The change makes sense to me conceptually though not super clear to me from the summary how much we're changing behavior here vs. a pure refactor." ([ruff#27707](https://github.com/astral-sh/ruff/pull/27707#issuecomment-5274817713))
    - "I found a smaller fix here: add a new discovery mode that reads members if they exists, but skips if they're absent." ([uv#19423](https://github.com/astral-sh/uv/pull/19423#issuecomment-4471531942))
    - His PR: "We split this draft into six independent PRs against `main`." ([ruff#30869](https://github.com/astral-sh/ruff/pull/30869)) (likely agent-written)
11. **Is there a concrete input for each branch?** He asks for a Python example over and over, and he answers a PR with a counterexample program.
    - "It's really just how my brain works but I would find it really useful if we have a clear Python example for each variant." ([ruff#26892](https://github.com/astral-sh/ruff/pull/26892#discussion_r3599928697))
    - "I always find a comment with a Python example useful for these kinds of conditional blocks." ([ruff#25326](https://github.com/astral-sh/ruff/pull/25326#discussion_r3291344985))
12. **Is the cache right?**
    - "Should we not just ignore the cached entry here, like with hashes?" ([uv#21717](https://github.com/astral-sh/uv/pull/21717#discussion_r4018694850))
    - "I'm confused. On main, `--refresh` will force us to re-query here always. On this branch, `--refresh` will no longer re-query here unless the timestamp has changed." ([uv#10361](https://github.com/astral-sh/uv/pull/10361#discussion_r1918712704))
    - "It does hurt cache (plaintext) readability a bit which is inconvenient for debugging" ([uv#11738](https://github.com/astral-sh/uv/pull/11738#issuecomment-2682252556))
13. **Did it run on real projects?** (second pass) He asks for the ecosystem report and a triage of it.
    - "Can you also use the ecosystem analyzer skill locally, review the report, and upload it here (assuming no issues)?" ([ruff#27763](https://github.com/astral-sh/ruff/pull/27763#issuecomment-5298148296))
    - "It's worth running the ecosystem summarizer skill on this, then including the results in a collapsed comment." ([ruff#29131](https://github.com/astral-sh/ruff/pull/29131#issuecomment-6018284491))
    - "The ecosystem impact here is pretty dramatic:" ([ty#1971](https://github.com/astral-sh/ty/issues/1971#issuecomment-4754705617))
    - "every time you put up a PR, we run before and after on like a bunch of projects in the ecosystem and then we create this report of the diff of all the diagnostics," ([The Peterman Pod](https://podscripts.co/podcasts/the-peterman-pod/openai-eng-dev-tools-founder-how-software-engineering-is-changing-charlie-marsh))
14. **Does the new input work in every path that reads it?** (second pass)
    - "It looks like these are dropped in `uv run --with-requirements` and the tool commands." ([uv#20934](https://github.com/astral-sh/uv/pull/20934#discussion_r3708383767))
    - "I think these need to get added to the workspace root." ([uv#20934](https://github.com/astral-sh/uv/pull/20934#discussion_r3708386425))
    - "Do we do this in `uv lock` too?" ([uv#19306](https://github.com/astral-sh/uv/pull/19306#discussion_r3198995671))
15. **What about the variant that the code does not name?** (second pass) He lists input variants and answers with a program.
    - "Hmm, does this assume that the method is a class method, and not a static method? In this case, it should be returning `int`:" ([ruff#29253](https://github.com/astral-sh/ruff/pull/29253#discussion_r4285743420))
    - "It looks like protocols and abstract method stubs contribute `None` right now -- maybe they should be excluded?" ([ruff#29253](https://github.com/astral-sh/ruff/pull/29253#discussion_r4285767434))
    - "What should happen if the requirement has a marker on it?" ([uv#20934](https://github.com/astral-sh/uv/pull/20934#discussion_r3708388766))
    - "Does this do the right thing if `__import__` is shadowed or aliased?" ([ruff#22987](https://github.com/astral-sh/ruff/pull/22987#discussion_r2747562616))
    - "Where do we guard against this being empty or length-1?" ([ruff#23607](https://github.com/astral-sh/ruff/pull/23607#discussion_r2864586344))
    - "I think in Ruff we tend to search for either `\n\r` or `\n`, and split on whichever one we find." ([uv#20648](https://github.com/astral-sh/uv/pull/20648#discussion_r3668405173))
    - "Is it possible for a method to be a static method, named `__new__`, but not be the \"special\" `__new__`? I.e., is this check too broad? (I assume not?)" ([ruff#22943](https://github.com/astral-sh/ruff/pull/22943#discussion_r2743705724))
16. **Can this be omitted?** (second pass)
    - "Actually, it looks like all tests pass if we remove the definition fallback entirely -- is it necessary?" ([ruff#25671](https://github.com/astral-sh/ruff/pull/25671#discussion_r3421931770))
    - "Do we need both `needs_peer_type` and `track_peer_types`?" ([ruff#25848](https://github.com/astral-sh/ruff/pull/25848#discussion_r3392562923))
    - "Is this not covered already by the ignore / gitignore behavior?" ([uv#20009](https://github.com/astral-sh/uv/pull/20009#discussion_r3483774364))
    - "We're adding complexity to the parser that we'll have to maintain and continue to extend into the future to uphold new guarantees." ([ruff#25464](https://github.com/astral-sh/ruff/pull/25464#issuecomment-4612009738))

---

## What he praises

- Big measured wins: "Wow, that's a huge improvement. It seems like a nice side-effect here that we were able to drop a lot case-sensitivity code too." ([ruff#25962](https://github.com/astral-sh/ruff/pull/25962#pullrequestreview-4493940627))
- A better idea backed by a chart: "Great ideas, much better:" ([ruff#30555](https://github.com/astral-sh/ruff/pull/30555#issuecomment-7041415930))
- A summary that lists the options: "The PR summary with the enumeration of the alternatives was very valuable." ([ruff#26587](https://github.com/astral-sh/ruff/pull/26587#pullrequestreview-4646761501))
- A test with the fix: "This looks reasonable and I greatly appreciate the test." ([uv#12156](https://github.com/astral-sh/uv/pull/12156#issuecomment-2722921775))
- Contributors: "Thanks @nkitsaini! This was a great contribution. I hope you'll consider continuing to contribute to uv." ([uv#11738](https://github.com/astral-sh/uv/pull/11738#issuecomment-2686373882))

---

## Tone and phrasing

- Questions, not orders: `Should we...`, `Can we...`, `Is this...`. Most inline comments end in a question mark.
- He marks weight: `Nit:`, "Not blocking though." ([ruff#26762](https://github.com/astral-sh/ruff/pull/26762#discussion_r3573751668)), "It doesn't need to block this PR, but..." ([ruff#24357](https://github.com/astral-sh/ruff/pull/24357#discussion_r3028062111)), "(You def don't need to do this, just thought you mind find it interesting.)" ([uv#15539](https://github.com/astral-sh/uv/pull/15539#discussion_r2305838326)).
- He shows the diff: many comments are a ```` ```suggestion ```` block or a full `diff`.
- He owns his doubt: "I feel so dumb, can you explain this math?" ([uv#10442](https://github.com/astral-sh/uv/pull/10442#discussion_r1909389319)). "Bro... my poor optimization... (Probably never deserved to get merged.)" ([ruff#25360](https://github.com/astral-sh/ruff/pull/25360#discussion_r3410613436))
- He says "sorry" when he relays a Codex finding or asks for a small change: "Can we use an enum instead of `true` / `false` here? (Sorry)" ([uv#20840](https://github.com/astral-sh/uv/pull/20840#discussion_r3686018792)).

---

## Hard "no"s / pet peeves

- A speed PR that changes behavior. He closes it or asks to revert (ruff#30745, ruff#30155, above).
- A regression on the hot path that "only" costs a little: "Na I think that would be a worse outcome. We should find a way to fix this at zero cost. I'm working on it in the background." ([ruff#24810](https://github.com/astral-sh/ruff/pull/24810#issuecomment-4488088528)). Later, with a number: "I pushed a variant with a 1% regression on `parser[unicode/pypinyin.py]`, but no other clear regression on the other parser benchmarks. I consider this acceptable." ([ruff#24810](https://github.com/astral-sh/ruff/pull/24810#issuecomment-4492671721))
- A warning on a common, healthy path (Jupyter, above).
- Re-doing work that already exists: "Can we reuse this logic anywhere else? I thought we had a utility / abstraction for this already." ([uv#20439](https://github.com/astral-sh/uv/pull/20439#discussion_r3590898469)). "Don't we have a fast-path for fetching metadata from the GitHub API within the distribution database? Does this need to be re-implemented here?" ([uv#19577](https://github.com/astral-sh/uv/pull/19577#discussion_r3313949985))
- A narrow patch for a problem that will come back. He asks for the general fix, or reverts: "I don't want to block on it but isn't it plausible that we'll run into this problem again? Do we need a more general model to retrieve the annotated metadata?" ([ruff#26650](https://github.com/astral-sh/ruff/pull/26650#pullrequestreview-4671064107)). "Concerned that we should just revert that change again and reconsider TypeOf handling more broadly, wdyt?" ([ruff#26316](https://github.com/astral-sh/ruff/pull/26316#pullrequestreview-4560879165)). "I’ll revert. Those both seem fixable? So I can follow up on them separately!" ([ruff#24929](https://github.com/astral-sh/ruff/pull/24929#issuecomment-4407568699))
- A removal that leaves a reference behind: "I think these are still referenced in `stdlib.yml` so the standard library tests would now fail!" ([python-build-standalone#1265](https://github.com/astral-sh/python-build-standalone/pull/1265#discussion_r4042526904)) (Linus or Mitchell lane).
- New dependencies for a speed-up: "I think we should just vendor any speed-ups because this is pulling in a bunch of new dependencies (e.g., a second version of Clap)." ([uv#17015](https://github.com/astral-sh/uv/pull/17015#discussion_r2594952514)) (handoff to antirez).

---

## Heuristics that generalize (incl. other Rust tools)

1. Put the number in the PR body, measured on real projects, with the noise. A move in a benchmark that nobody explains is a question. (Inference from checklist 1.)
2. Every fast path, skip, or cache is a second implementation. It needs proof that it agrees with the slow one: an ecosystem diff, a test that runs both, or a `debug_assert!`. (Inference from checklist 2.)
3. Time the worst input that a user can write. A debug build is enough to find a cliff (34ms to >2s).
4. Do the expensive work only on the rare branch: the error branch, the `trace!` macro, the second operand of `&&`.
5. For behavior that another tool or a PEP defines, link it and match it. If you do not match it, say so in the docs.
6. A message that the user cannot act on goes to tracing. A hint comes after the error, in the shared hint type.
7. Output is a contract. Pin it with a snapshot test, and change it on purpose.
8. Split moves, renames, and side fixes out. A perf PR with six ideas is six PRs.
9. When CI runs CodSpeed on each PR, read the report before you ask for a number. Credit a clean report. Ask about a move with no reason. (Inference from checklist 1 and core value 9.)
10. A behavior change in a checker or resolver runs on real projects, and somebody sorts the diff into true and false positives. (Checklist 13.)
11. A new input or setting works, or fails clearly, in every command that reads the same input. (Checklist 14.)
12. Name the input variants that the code does not name (static method, protocol, marker, empty list, CRLF, shadowed name) and write a program for each doubtful one. (Checklist 15.)

---

## Lane fit (for the seat)

The seat reviews a Rust tool or service as users run it: measured speed, memory and binary size, the fast path agreeing with the slow path, the behavior users expect from pip, Black, mypy, Cargo, or the PEP, user-facing messages, snapshot tests, and PR size.

Hand off:
- Rust library API shape (`&str` vs `&String`, slices, `Cow`, `Copy`, enum vs bool, `String` as a type), panics vs errors, `unsafe`, and error types: burntsushi. He comments on these often ("I recommend always approaching `String` with skepticism by default" ([uv#12805](https://github.com/astral-sh/uv/pull/12805#discussion_r2059487493)); "We typically want to avoid using `anyhow` in library crates." ([uv#12805](https://github.com/astral-sh/uv/pull/12805#discussion_r2049637193))), but those are API, not runtime.
- JS and TS hot paths: Yagiz.
- The decision to add a dependency: antirez.
- Regressions to users, breaking-release timing, and commit hygiene: Linus.
- CLI flags and option scope (`--backend` as a flag, `auth-policy` naming, a new env var): Dax.
- Whether a failure stays loud (`silently fall back`, "Do we now lose this error?" ([uv#12805](https://github.com/astral-sh/uv/pull/12805#discussion_r2059490992))): Armin.

---

## Not adopted

- **Salsa query rules** (ruff#28168, ruff#26650: he asks if a query for another file breaks the ty Salsa rules). Specific to ty. Not general.
- **"probably worth adding an alias and removing it in the next breaking release, just as a best-practice."** ([uv#12592](https://github.com/astral-sh/uv/pull/12592#pullrequestreview-2730988050)). An alias is a compat layer. This repo does not keep them. A user-visible break goes to Linus.
- **Preview flags for risky changes** (uv#15612, uv#19979). Product rollout, not code review. Goes to Theo or Linus.
- **Import style, `TODO(name)`, RustDoc links in brackets, field order.** House style for uv. Low value for the council.
- **Agent and model opinions on X** (GPT-6.2, "RSI", benches). Out of lane.
- **Jokes** ("Asked my toddler for a good elliptic-curve private key and he said '4'" ([X](https://x.com/charliermarsh/status/2112888555299381737))).
- **Type-design suggestions** (state types for pre-checked and post-checked bindings on ruff#24357). Good, but poteto's lane.

---

## Sources

**GitHub** (GraphQL search, then `author.login == charliermarsh`; links go to the exact comment): uv#10346, #10361, #10442, #10827, #11143, #11165, #11167, #11394, #11446, #11486, #11591, #11738, #11831, #11833, #11896, #12005, #12156, #12350, #12392, #12501, #12592, #12706, #12805, #12941, #13201, #13317, #13333, #13437, #14076, #14790, #15251, #15539, #15657, #15988, #16773, #17015, #17110, #18780, #19423, #19577, #20439, #20648, #20737, #20840, #20988, #21284, #21717, #21890; ruff#22228, #24097, #24810, #24949, #25326, #25360, #25681, #25960, #25962, #26374, #26587, #26741, #26892, #27561, #27707, #29026, #30054, #30155, #30220, #30555, #30745; ty#4213. Each quote above has its own link.

**His PR bodies** (fetched with `gh api repos/astral-sh/ruff/pulls/<n>`): [ruff#30550](https://github.com/astral-sh/ruff/pull/30550), [ruff#30869](https://github.com/astral-sh/ruff/pull/30869), [ruff#30944](https://github.com/astral-sh/ruff/pull/30944), [ruff#30095](https://github.com/astral-sh/ruff/pull/30095). All 2026-11. Likely agent-written.

**Blog posts (astral.sh, by him):** [The Ruff Formatter](https://astral.sh/blog/the-ruff-formatter) (2023-10-24), [uv](https://astral.sh/blog/uv) (2024-02-15), [uv: Unified Python packaging](https://astral.sh/blog/uv-unified-python-packaging) (2024-08-20), [ty](https://astral.sh/blog/ty) (2025-12-16), [Astral to join OpenAI](https://astral.sh/blog/openai) (2026-03-19). Also read: [tar-codec](https://astral.sh/blog/tar-codec) (not by him; not quoted).

**X posts** (`api.fxtwitter.com/2/profile/charliermarsh/statuses`, 15 pages, retweets removed): [2125676414573703318](https://x.com/charliermarsh/status/2125676414573703318), [2124507314384146925](https://x.com/charliermarsh/status/2124507314384146925), [2114948698878919048](https://x.com/charliermarsh/status/2114948698878919048), [2115188442024075611](https://x.com/charliermarsh/status/2115188442024075611), [2114040855073820966](https://x.com/charliermarsh/status/2114040855073820966), [2113443874907832818](https://x.com/charliermarsh/status/2113443874907832818), [2108597610181455956](https://x.com/charliermarsh/status/2108597610181455956), [2119900423066669175](https://x.com/charliermarsh/status/2119900423066669175), [2107891166016643328](https://x.com/charliermarsh/status/2107891166016643328).

**HN:** [49510034](https://news.ycombinator.com/item?id=49510034) (2026-08-31), [46464453](https://news.ycombinator.com/item?id=46464453) (2026-01-02). 66 comments read through the Algolia API; 7 of them from the last year.

**Second pass, GitHub** (new links): ruff#22943, #22987, #23607, #24357, #24929, #25368, #25387, #25464, #25671, #25848, #25960, #26035, #26085, #26316, #26650, #27301, #27763, #28038, #28179, #29131, #29232, #29253, #30054, #30220; uv#19306, #20004, #20009, #20078, #20635, #20648, #20671, #20840, #20934, #21352; ty#1971, #3023; python-build-standalone#1265, #1272; hawk#141.

**Second pass, other:** X posts [2091937073263480842](https://x.com/charliermarsh/status/2091937073263480842), [2083684355738673259](https://x.com/charliermarsh/status/2083684355738673259), [2102826616653054010](https://x.com/charliermarsh/status/2102826616653054010), [2075683931484000715](https://x.com/charliermarsh/status/2075683931484000715), [2075683928879313050](https://x.com/charliermarsh/status/2075683928879313050), [2086173088593408285](https://x.com/charliermarsh/status/2086173088593408285). Podcast: [The Peterman Pod, 2026-06-22](https://podscripts.co/podcasts/the-peterman-pod/openai-eng-dev-tools-founder-how-software-engineering-is-changing-charlie-marsh). CodSpeed: [codspeed.io](https://codspeed.io) testimonial.

**Bluesky:** `crmarsh.com`, 100 posts read. Mostly launch threads (ty preview, pyx, uv build backend) that repeat the blog. Not quoted.

**Reach (2026-11-26):** X @charliermarsh 55,379 followers, posts daily. Bluesky @crmarsh.com 7,858 followers, last post 2025-11-10. GitHub 7,092 followers.

---

## Changed mind (second pass)

No standard is contradicted by the last year. He still asks for numbers, but in repos with CodSpeed on each PR he reads the report and credits it, so the seat now reads the report before it asks (standard 1). He still dislikes preview flags for fixes: "I think I would consider _not_ making this a preview feature. Isn't it a bug fix?" ([uv#20671](https://github.com/astral-sh/uv/pull/20671#pullrequestreview-4780276673)).

## Replay results (second pass)

Five of his last-year reviews, run blind with the seat. Score = his points that the seat raised (half point for the same class of issue at another line).
- uv#20648 (lockfile fast path, training): 2.5 of 7 before the edit.
- ruff#30054 (ty fixpoint skip, training): 0.5 of 2 before, 1 of 2 after.
- ruff#25960 (ty directory tracking, training): 0 of 2 before, 2 of 2 after.
- uv#20934 (per-requirement build settings, held out): 1.5 of 6 before, 2.5 of 6 after.
- ruff#29253 (ty return type inference, held out): 1.5 of 5 before, 0.5 of 5 after.
Misses that stay: struct and `thiserror` asks (burntsushi lane), test readability ("Can you walk me through what's going on in this test?" ([uv#20648](https://github.com/astral-sh/uv/pull/20648#discussion_r3668391646))), and the static-method and protocol variants on ruff#29253 in the second run.

## Failed sources

- **fxtwitter:** false 404s on many pages. Retry with the same cursor worked, except at page 43 (2026-06-25): two full runs stopped there after 6 and 14 retries. X before 2026-06-25 stays unread.
- **GitHub search (second pass):** the 1,000 cap is solved for the last year by two-week slices. The `author:charliermarsh is:pr` slices stopped at 2026-10-14 on a GraphQL rate limit (shared token), so his own PR bodies after that date come only from the first pass. Threads older than 2025-11-26 were not re-read; the about 1,500 older uv issue threads from the first pass stay unread. Review threads were read with `reviews(first:50)` and `comments(first:50)`; 9 threads had 100+ comments and may be cut.
- **Talks and podcasts:** one 2026 transcript found and used (The Peterman Pod, auto transcript with timestamps; quotes avoid the timestamp marks). Older interviews (Changelog, Rust in Production, 2025) not read.
- **CodSpeed:** filled. One review comment (ruff#24357), the CodSpeed home page testimonial (marketing copy), and the podcast.
- **Blog post dates:** the page shows the date split over three lines. I read them by hand.
