# Dax Raad (thdxr): code-review research

Research date: 2026-10-30. Weighting: Nov 2025 to Oct 2026 highest. Older 2025 comments are used only for his voice and for rules that are still in the repo docs.
Repo: `sst/opencode` now redirects to `anomalyco/opencode` (default branch `dev`). All opencode links use `anomalyco/opencode`.
Main corpus: his comments on about 470 opencode PRs (conversation comments, reviews, inline comments, pulled with `gh api` and filtered by `user.login == thdxr`), his commits, the repo docs and lint config, his X posts (text pulled through the fxtwitter API), and two 2026 podcasts.
Every quote is verbatim, with his original lowercase and typos. "Inference" marks my own reading.

Link key: `#N c` = conversation comment (`#issuecomment-ID`), `#N d` = inline diff comment (`#discussion_rID`), `#N r` = review.

**Provenance warning (important for a persona).** Since about May 2026, many comments on the `thdxr` account are written by an agent. Some end with "— from 𝕺𝖕𝖊𝖓𝕮𝖔𝖉𝖊" (example: [#50248 c](https://github.com/anomalyco/opencode/pull/50248#issuecomment-6272746699)). Others have no signature but use full sentences, capitals, and test logs (example: [#25821 c](https://github.com/anomalyco/opencode/pull/25821#issuecomment-4427433274)). His own hand-written comments are short, lowercase, and casual. The agent comments still show his decisions (what he cuts, what he keeps), but not his voice. In this file, "agent-written" marks these comments. Also, in the last 3 days (2026-10-28 to 10-30) the account made about 100 commits and many issue replies in `anomalyco/hex`, `hokum`, `rune`, which is an agent pipeline (inference from volume and the signature).

---

## Current focus (what he and opencode work on now)

- **OpenCode 2.0 ("opencode2") is the main product now.** He wrote "chore: promote v2 to dev" on 2026-10-10 ([commit 5caf1f9](https://github.com/anomalyco/opencode/commit/5caf1f9f6f5f30e13fc50a788ad953d97ae3748f)). The `v2.0.0` tag points at a commit from 2026-09-11. Stable v2.2.0 to v2.2.4 shipped 2026-10-27 to 10-30, and v1.19.x continues as a separate line ([releases](https://github.com/anomalyco/opencode/releases)).
  - All open V1 PRs were closed with one bot message on 2026-10-10/11: "This branch has been upgraded to V2. We're no longer taking PRs for V1." ([#48448 c](https://github.com/anomalyco/opencode/pull/48448#issuecomment-6100422948)). I counted 224 of these in my sample.
  - V2 architecture, in his words: "an architectural change we made in opencode2 is nearly everything is an internal plugin" and "this means you can disable any behavior and we also properly dogfood our plugin apis" ([X, 2026-08-13](https://x.com/thdxr/status/2087945880863191162)). On tool search and codemode: "and it's the simplest implementation we've seen" ([X, 2026-08-07](https://x.com/thdxr/status/2085865399195779308)). On the API: "we included a cli client so you or your agents can query it easily" ([X, 2026-07-13](https://x.com/thdxr/status/2076690783810224568)).
- **Stack in Oct 2026 (from root `package.json` and `AGENTS.md`):** Bun 1.4.4 workspaces monorepo with about 30 packages, Effect 4.0.6 everywhere in core, Drizzle + SQLite, Solid (app, TUI on OpenTUI), an Electron desktop app, SST for infra, Turbo, oxlint + ast-grep, and TypeScript 7.1 native (`@typescript/native`) in CI. The layering rule is "Keep runtime dependencies directed from Schema to Core and Protocol, then from Core and Protocol to Server." ([AGENTS.md](https://github.com/anomalyco/opencode/blob/dev/AGENTS.md)). He announced a provider library: "it's written in effect but will also have a vanilla api" ([X, 2026-05-10](https://x.com/thdxr/status/2053290393727324313)).
- **Release and CI security hardening, Oct 2026.** His own commits from 2026-10-25 to 10-27: "ci: gate production deploys and release publishing behind approval environments (#58898)", "ci(release): only releasers can start stable releases (#59488)", "ci: separate release builds from signing and publishing (#59046)". Context: "they've been non stop trying to attack our systems for the past 48 hours" ([X, 2026-10-18](https://x.com/thdxr/status/2111790511409258796)).
- **Deleting old surfaces.** His recent commits include "Remove the OpenCode GitHub Action (#59032)" ([commit](https://github.com/anomalyco/opencode/commit/1743d1a24e2356b3f631d3d384f44cb9d8359add)), "Remove the stats and containers workflows (#59075)", "chore(infra): delete legacy share storage (#57548)", "refactor(app): remove the turn navigator" ([commit](https://github.com/anomalyco/opencode/commit/ee8221c5d1e7c94e70024df6c428faf2ea49b3c1)), and "fix(app): remove sidebar slide animation". In a PR he wrote: "Removed `publish-vscode.yml` (we no longer publish the VS Code extension)." ([#59028 c](https://github.com/anomalyco/opencode/pull/59028#issuecomment-6401064179), agent-written).
- **Desktop/web app polish, Oct 2026.** Many small `feat(app)` and `fix(app)` commits (activity capsule, session search, location dialog, MCP status links).
- **New anomalyco Rust desktop apps** (`hex` dictation, `hokum` notifications, `rune` UI toolkit, `deadbolt`). Hex does not take outside PRs: "Hex's team writes every code change, so we don't accept pull requests from outside the team." ([hex commit 8473145](https://github.com/anomalyco/hex/commit/847314564b880d85d5952c15db925bdb7cff16fc), 2026-10-29). Release paths are locked to him: "**Left for Dax: agents must not merge this.**" ([hex #377](https://github.com/anomalyco/hex/pull/377), agent-written).
- **Public position on AI and quality (2026).** Podcasts: Kent C. Dodds, 2026-04-01 ([page with transcript](https://kentcdodds.com/chats/07/01/product-sense-restraint-and-opencode-with-dax-raad)), and The Pragmatic Engineer, 2026-05-27 ([page](https://newsletter.pragmaticengineer.com/p/opencode)).

---

## Core values

1. **Do not add new concepts. Reuse what exists.** "would prefer fixing this without adding new concepts to the command bar yet" ([#3782 c](https://github.com/anomalyco/opencode/pull/3782#issuecomment-3478698337), 2025-11-03). "can you help me understand why using `display` isn't enough? would try to avoid introducing a new concept if possible." ([#3722 c](https://github.com/anomalyco/opencode/pull/3722#issuecomment-3478262135)).
2. **Wait for the right primitive. Do not build each special case.** "We could have went and added Git WorkTree support. We could have went and added Docker support." ([Kent C. Dodds, 2026-04-01](https://kentcdodds.com/chats/07/01/product-sense-restraint-and-opencode-with-dax-raad)). Same talk: these are "all just a special case of the workspace concept".
3. **Each feature is a permanent cost.** "do you want to maintain this feature forever?" ([Kent C. Dodds](https://kentcdodds.com/chats/07/01/product-sense-restraint-and-opencode-with-dax-raad)). "So it feels like the work is to convince ourselves to slow down a bit." (same).
4. **Keep behavior local. Avoid central coordinators.** "we generally want to avoid anything that requires centralization of functionality. this is what leads to things being difficult to maintain as local behavior leaks globally" ([#3942 c](https://github.com/anomalyco/opencode/pull/3942#issuecomment-3492374214)).
5. **Fewer config options. Prefer good defaults and auto-detection.** "i think i'm just going to have it remember the last state instead of making it a config option" ([#3694 c](https://github.com/anomalyco/opencode/pull/3694#issuecomment-3476443742)). "is it possible to not need to specify `oauth: {}` on the config? can we detect the 401 error?" ([#5014 c](https://github.com/anomalyco/opencode/pull/5014#issuecomment-3615326055)). "also i don't know if we want to go as far as making all this deeply configurable yet" ([#5422 c](https://github.com/anomalyco/opencode/pull/5422#issuecomment-3647978270)).
6. **Code quality matters, even when tests pass.** "tests pass, ui works well but man the code is just not quite right - uses more variables than it should, things named poorly, hard to comprehend, inelegant" ([X, 2026-01-13](https://x.com/thdxr/status/2010941870528983363)). Same post: "every atom in me says they are relevant and add up to create a mess we pay for later".
7. **Small codebases are a feature for agents too.** "no one struggles with large amounts of code more than an LLM, if you don't keep that in check you have a self defeating codebase" ([X, 2026-03-03](https://x.com/thdxr/status/2028827251534352764)).
8. **Quality is a belief you must act on.** "if you start to be lazy in one place, you start to become lazy everywhere. It's like an infection." ([Pragmatic Engineer, auto-transcript](https://podscripts.co/podcasts/the-pragmatic-engineer/building-opencode-with-dax-raad)). Also: "it's easier than ever to rot your product" (same transcript).
9. **The user's experience decides, not code beauty.** "I'm not just like looking at the code being like, it's ugly." Then: "Stuff that impacts end users, stuff that makes our team work less well together, stuff that makes it less fun to work on things day to day." ([Kent C. Dodds](https://kentcdodds.com/chats/07/01/product-sense-restraint-and-opencode-with-dax-raad)).
10. **Judgment stays with the human.** "I don't trust them in terms of judgment or tastes or sense" and "the agent's never gonna push back and be like, hey, Dax, like slow down" ([Kent C. Dodds](https://kentcdodds.com/chats/07/01/product-sense-restraint-and-opencode-with-dax-raad)).

---

## Code style rules (exact, from repo docs)

Source: [`AGENTS.md` on `dev`](https://github.com/anomalyco/opencode/blob/dev/AGENTS.md), section "Style Guide". He restructured this section into its current form on 2026-02-02 ([commit eade8ee](https://github.com/anomalyco/opencode/commit/eade8ee07ba36ab3ee2e409135172c5503ae1c11), "docs: Restructure AGENTS.md style guide with organized sections and code examples"). Other team members edited it after that. Verbatim lines:

**General principles**
- "Keep things in one function unless composable or reusable"
- "Validate unknown values once at the boundary that owns them. Pass typed values inward instead of repeating `typeof value === "object"` and property-existence checks."
- "Do not extract single-use helpers preemptively."
- "Before adding complexity for a speculative or vanishingly unlikely race or security edge case, explain the concrete failure mode, likelihood, and complexity cost to the user and get their buy-in."
- "Avoid `try`/`catch` where possible"
- "Avoid using the `any` type"
- "Use Bun APIs when possible, like `Bun.file()`"
- "Rely on type inference when possible; avoid explicit type annotations or interfaces unless necessary for exports or clarity"
- "Prefer functional array methods (flatMap, filter, map) over for loops; use type guards on filter to maintain type inference downstream"
- "In Effect generators, bind services to named variables before calling methods. Do not use nested service yields such as `yield* (yield* Foo.Service).bar()`."
- "Reduce total variable count by inlining when a value is only used once." (Example: inline `path.join(...)` into `Bun.file(...)`.)

**Destructuring:** "Avoid unnecessary destructuring. Use dot notation to preserve context." (Good: `obj.a`. Bad: `const { a, b } = obj`.)

**Imports**
- "Never alias imports."
- "Never use star imports."
- "Never use type-position `import("...")` references"
- "Prefer dynamic imports for heavy modules that are only needed in selected code paths, especially in startup-sensitive entrypoints."

**Variables:** "Prefer `const` over `let`. Use ternaries or early returns instead of reassignment."

**Control flow:** "Avoid `else` statements. Prefer early returns."

**Complex logic**
- "make the main function read as the happy path and move supporting details into small helpers below it."
- "Do not return `Effect` from helpers unless they actually perform effectful work."
- "Prefer Effect schema helpers such as `Schema.UnknownFromJsonString` and `Schema.decodeUnknownOption` over manual `JSON.parse` wrapped in `Effect.try`"
- "Add comments for non-obvious constraints and surprising behavior, not for obvious assignments or control flow."

**Drizzle schema:** "Use snake_case for field names so column names don't need to be redefined as strings."

**Experimental API:** "New endpoints and new default behaviors start experimental." Also: "Experimental HTTP routes change without aliases". But shipped SDK/plugin API moves keep "deprecated aliases of the new ones until the next minor".

**Testing:** "Avoid mocks as much as possible, you shouldn't be using globalThis.\* at all unless it's the only option." And: "Test actual implementation, do not duplicate logic into tests".

**Checks:** "Run `bun run check` from the repository root as the canonical full lint and type-check verification." And: "Never run `tsc` directly." Tests run only from package directories.

**Branches and titles:** "Use a short branch name of at most three words, separated by hyphens." He added this rule on 2026-06-10 ("docs: add branch naming guidance"). PR titles use `type(scope): summary`.

**Rules you recalled, verified:**
- "avoid else": present (quoted above).
- "avoid let": present as "Prefer `const` over `let`". The older text was blunter: "We don't like `let` statements, especially combined with if/else statements." ([old STYLE_GUIDE.md](https://github.com/anomalyco/opencode/blob/c86c2acf4/STYLE_GUIDE.md), removed 2026-01-25 by rekram1-node).
- "avoid try/catch": present.
- **"single word variable names": REMOVED.** It was "Prefer single word variable names where possible", plus a block "THIS RULE IS MANDATORY FOR AGENT WRITTEN CODE." with "Good short names to prefer: `pid`, `cfg`, `err`, `opts`, `dir`, `root`, `child`, `state`, `timeout`." ([AGENTS.md at 3ebebe0](https://github.com/anomalyco/opencode/blob/3ebebe0a96de5ec4757de12a21cb9f933e0fbba0/AGENTS.md)). Kit Langton deleted it on 2026-04-15 in PR #22670 ([commit 672ee28](https://github.com/anomalyco/opencode/commit/672ee28635f471c5fcdc7e77c518d4465678d786)). Inference: the code base still uses short names a lot, but it is no longer a written rule. Do not put it in the persona as a current rule.

**Rules turned into lint (the "make the review a constraint" pattern).**
- ast-grep rules in [`script/ast-grep/rules`](https://github.com/anomalyco/opencode/tree/dev/script/ast-grep/rules), all `severity: error`: `no-import-alias`, `no-star-import`, `no-drizzle-column-name`, `no-json-parse-cast` ("Prefer Effect Schema JSON decoding over JSON.parse casts."), `no-effect-die-string` ("die with `new Error(...)`."), `no-nested-effect-service-yield`. Kit Langton added the Effect lint infrastructure (2026-07-03).
- [`.oxlintrc.json`](https://github.com/anomalyco/opencode/blob/dev/.oxlintrc.json) loads an `anti-slop` plugin (vendored from `dmmulroy/anti-slop`) for the GUI packages: `no-object-parameters`, `no-runtime-typeof`, `no-unknown-returns`, `no-chained-type-assertions`, `require-safety-comment-for-type-assertion`, `no-module-mocking`, and others, at `warn`. Hona added it. It also bans `Reflect` globally.
- The [`/rmslop` command](https://github.com/anomalyco/opencode/blob/dev/.opencode/command/rmslop.md) lists what the team calls slop: "Extra comments that a human wouldn't add", "Extra defensive checks or try/catch blocks that are abnormal for that area of the codebase", "Casts to any to get around type issues", "Unnecessary emoji usage".
- [Effect skill](https://github.com/anomalyco/opencode/blob/dev/.opencode/skills/effect/SKILL.md): "Keep HTTP handlers thin: decode input, read request context, call services, and map transport errors." And: "Do not introduce `any`, non-null assertions, unchecked casts, or older Effect APIs just to satisfy types."

---

## Review checklist (what he checks or pushes back on)

1. **Does this add a new concept?** If an existing mechanism can do it, use that. "would try to avoid introducing a new concept if possible." ([#3722 c](https://github.com/anomalyco/opencode/pull/3722#issuecomment-3478262135)).
2. **Is it too general for the real need?** "thought about this more and i think i actually don't want to do something this general" ([#3722 c](https://github.com/anomalyco/opencode/pull/3722#issuecomment-3488736083)). He then narrows to the one case that matters ("the only /commands that actually need to be checked are the custom commands").
3. **Can this be a default instead of a config option?** See value 5. Older example: "is there any way to autodetect this?" ([#444 c](https://github.com/anomalyco/opencode/pull/444#issuecomment-3012712534), 2025).
4. **New flag or endpoint: is it under `experimental`?** "can you put this flag under `experimental` ? will merge it after" ([#2116 c](https://github.com/anomalyco/opencode/pull/2116#issuecomment-3211098081), 2025). This is now a written rule: "New endpoints and new default behaviors start experimental." ([AGENTS.md](https://github.com/anomalyco/opencode/blob/dev/AGENTS.md)). His newest commit: "fix(core): keep schedules off unless experimental.schedules is enabled" (2026-10-30).
5. **Does the diff stay in scope?** "slop why would this be touching infra files for our web stuff?" ([#13183 c](https://github.com/anomalyco/opencode/pull/13183#issuecomment-3885835124), 2026-02-11). Older: "it mixes in a lot of changes most of which i don't want to accept" ([#898 c](https://github.com/anomalyco/opencode/pull/898#issuecomment-3071530943)).
6. **Unneeded changes to unrelated text.** "/oc why was the error message changed? i don't think it needed to be right" ([#6785 c](https://github.com/anomalyco/opencode/pull/6785#issuecomment-3707457217)).
7. **Does it re-add something that was removed on purpose?** "we removed this tool on purpose, it served no real purpose. why do you want to reintroduce it?" ([#12594 c](https://github.com/anomalyco/opencode/pull/12594#issuecomment-4023917695)).
8. **Real user workflows it breaks.** "we know users have a `./tmp/` style folder where they have symlinks to other projects" and "this would cause a prompt on those right?" ([#7515 c](https://github.com/anomalyco/opencode/pull/7515#issuecomment-3745872080)). "this will break all kinds of workflows currently and we will flip the behavior in a larger update" ([#9328 c](https://github.com/anomalyco/opencode/pull/9328#issuecomment-3766285890)).
9. **Will users understand the behavior?** "it is more efficient but i don't think the majority of people will understand how this works" ([#4499 c](https://github.com/anomalyco/opencode/pull/4499#issuecomment-3566993991)).
10. **Does it actually work (reactivity, results, compiled binary)?** "this doesn't really work because `input?.focused` is not reactive" ([#3782 c](https://github.com/anomalyco/opencode/pull/3782#issuecomment-3478698337)). "this fails to return results properly." ([#15339 c](https://github.com/anomalyco/opencode/pull/15339#issuecomment-3977555502)). "this needs to be tested by running `./script/build.ts --single` and verifying it doesn't break anything" ([#3660 c](https://github.com/anomalyco/opencode/pull/3660#issuecomment-3476453856)).
11. **Odd design choices: why this marker or field?** "i'm a bit confused - why uses `sessionID` as the marker to opt into this?" ([#7109 c](https://github.com/anomalyco/opencode/pull/7109#issuecomment-3857791715)). "any reason you didn't combine them into 1 theme with light/dark variants?" ([#5138 c](https://github.com/anomalyco/opencode/pull/5138#issuecomment-3618754941)).
12. **Naming consistency with the rest of the code base.** "stupid nit but we use `projectID` everywhere" ([#15120 d](https://github.com/anomalyco/opencode/pull/15120#discussion_r2856164631), 2026-02-26). Older: "should we just call this `options` the same way we have `options` on the provider?" ([#202 c](https://github.com/anomalyco/opencode/pull/202#issuecomment-2988394108)).
13. **Lost checks after a refactor (permissions, security).** "fyi this removes the agent permission filtering from tool init - we'll need to add that back at execution time instead." ([#21052 c](https://github.com/anomalyco/opencode/pull/21052#issuecomment-4187871370)).
14. **Does it fit the roadmap?** "hang onto this - we're reworking a bunch of permissions stuff and this can come after that" ([#5987 c](https://github.com/anomalyco/opencode/pull/5987#issuecomment-3684528497)). "also we're moving to fff so not sure if it's worth doing" ([#15339 c](https://github.com/anomalyco/opencode/pull/15339#issuecomment-3977555502)).
15. **Core UX features need design first.** "given that it'll be one of the most complex UX interactions in the product we'll need to look at it from scratch" ([#5958 c](https://github.com/anomalyco/opencode/pull/5958#issuecomment-3706838328)). CONTRIBUTING: "UI and core product features require design review before implementation." ([CONTRIBUTING.md](https://github.com/anomalyco/opencode/blob/dev/CONTRIBUTING.md)).
16. **Errors must stay loud.** Older but still in the docs as "Avoid `try`/`catch`": "can you remove the try catch that skips it though? i want it to fail loudly so people continue to complain if it breaks" ([#1546 c](https://github.com/anomalyco/opencode/pull/1546#issuecomment-3165936994), 2025-08).
17. **Single-use helpers: inline them.** "if loadMcpFile is just used once just keep it inline in the for loop" ([#2001 c](https://github.com/anomalyco/opencode/pull/2001#issuecomment-3194081271), 2025). Now a rule: "Do not extract single-use helpers preemptively."
18. **Use existing utilities, not new deps.** "you don't need npm! opencode itself has the functionality to run any npm package" ([#551 c](https://github.com/anomalyco/opencode/pull/551#issuecomment-3018997000), 2025). Agent-written but his decision: "Tweaked this a bit to keep the client dependency-free" and "without us baking npm semver parsing into the client" ([#42023 c](https://github.com/anomalyco/opencode/pull/42023#issuecomment-5267758052), 2026-08-12).
19. **Special cases versus the general plugin model.** Agent-written summary of his changes to a contributor PR: "Removed the new `register` shortcuts and used transforms like our other plugin APIs, so web search is not a special case." Also: "Kept the web search domain pretty dumb" and "Removed the rollout flags and the UI/API for changing the default provider." ([#35558 c](https://github.com/anomalyco/opencode/pull/35558#issuecomment-5081822960), 2026-07-26).
20. **Hidden coupling between settings.** Agent-written: "`settings.apiKey: ""` was also being used as a catalog enablement signal, which coupled provider activation to authentication settings." ([#42509 c](https://github.com/anomalyco/opencode/pull/42509#issuecomment-5303121953), 2026-08-15).

---

## What he praises / merges fast

- **Root-cause investigation.** "wow ty for tracking that down" ([#5014 c](https://github.com/anomalyco/opencode/pull/5014#issuecomment-3623227582)). "thanks for investigating this - we heard reports of it happening in the edit/write/patch tool" ([#15387 c](https://github.com/anomalyco/opencode/pull/15387#issuecomment-4018038146)). "thanks for prodding us on this!" ([#18986 c](https://github.com/anomalyco/opencode/pull/18986#issuecomment-4123488849)).
- **Clean, complete PRs that need no rework.** "wow this is a really good PR thank you so much" ([#5014 c](https://github.com/anomalyco/opencode/pull/5014#issuecomment-3615326055)). "this is good we're gonna merge it, aiden will follow up" ([#4604 c](https://github.com/anomalyco/opencode/pull/4604#issuecomment-3607819343)). "thank you! likely will merge this in a bit" ([#25449 c](https://github.com/anomalyco/opencode/pull/25449#issuecomment-4364535399)).
- **Focused fixes with a regression test that fails without the fix.** Agent-written: "I confirmed the test still fails without the `timeout: false` change." ([#50248 c](https://github.com/anomalyco/opencode/pull/50248#issuecomment-6272746699)).
- **Things on the accepted list** in [CONTRIBUTING.md](https://github.com/anomalyco/opencode/blob/dev/CONTRIBUTING.md): "Bug fixes", "Additional LSPs and formatters", "LLM performance improvements", "Environment-specific fixes", "Missing standard behavior", "Documentation improvements".
- **Pattern: he often takes the idea, rewrites it himself, and credits the author.** "hey - thanks for pointing this out. ended up handling it slightly differently, just pushed." ([#6698 c](https://github.com/anomalyco/opencode/pull/6698#issuecomment-3706488386)). "fixed differently" ([#13580 c](https://github.com/anomalyco/opencode/pull/13580#issuecomment-3902346559)). "sorry we didn't see this earlier. we did a similar fix" ([#12185 c](https://github.com/anomalyco/opencode/pull/12185#issuecomment-4123482659)). Agent-written: "We carried your original commit and attribution into #42791" ([#42509 c](https://github.com/anomalyco/opencode/pull/42509#issuecomment-5303121953)). Older: "manually grabbed these changes - added you as a coauthor on the commit. thank you!" ([#495 c](https://github.com/anomalyco/opencode/pull/495#issuecomment-3017450531)).

---

## Tone and phrasing

Hand-written style: all lowercase, no greeting, one to three short lines, often a question. He thanks people a lot ("ty", "appreciate it"), says "sorry" when he closes, and is blunt about bad code ("slop", "super ugly", "stupid"). He uses "we" for team decisions and "i" for his own taste. He often asks the agent in public with `/oc ...` or "hey opencode ...".

Verbatim examples:
1. "slop why would this be touching infra files for our web stuff?" ([#13183 c](https://github.com/anomalyco/opencode/pull/13183#issuecomment-3885835124), 2026-02)
2. "stupid nit but we use `projectID` everywhere" ([#15120 d](https://github.com/anomalyco/opencode/pull/15120#discussion_r2856164631), 2026-02)
3. "maybe i'm not following but we know users have a `./tmp/` style folder" ([#7515 c](https://github.com/anomalyco/opencode/pull/7515#issuecomment-3745872080), 2026-01)
4. "i'm a bit confused - why uses `sessionID` as the marker to opt into this?" ([#7109 c](https://github.com/anomalyco/opencode/pull/7109#issuecomment-3857791715), 2026-02)
5. "we removed this tool on purpose, it served no real purpose. why do you want to reintroduce it?" ([#12594 c](https://github.com/anomalyco/opencode/pull/12594#issuecomment-4023917695), 2026-03)
6. "/oc look at the diff the target thing isn't even a thing anymore" ([#5033 c](https://github.com/anomalyco/opencode/pull/5033#issuecomment-3609437364), 2025-12)
7. "hey thanks for taking a swing at this - this is one of our most requested features so we will be adding this functionality" ([#5958 c](https://github.com/anomalyco/opencode/pull/5958#issuecomment-3706838328), 2026-01)
8. "gonna close this PR - i'm gonna work on it fresh because i changed a bunch about how the theme system works. appreciate it though" ([#3693 c](https://github.com/anomalyco/opencode/pull/3693#issuecomment-3519564821), 2025-11)
9. "i can also just read the PR/have opencode summarize haha." ([#5422 c](https://github.com/anomalyco/opencode/pull/5422#issuecomment-3647994380), 2025-12)
10. Older, to the agent: "hey opencode super ugly - can we just switch to native unzip in js?" ([#974 c](https://github.com/anomalyco/opencode/pull/974#issuecomment-3069994627), 2025-07). And: "hey opencode do not put stuff in its own function. just do everything inline in the list function and use BUN APIs where possible." ([#918 c](https://github.com/anomalyco/opencode/pull/918#issuecomment-3071403539)).
11. About bot reviews: "lol ignore these reviews they're garbage" ([#1843 c](https://github.com/anomalyco/opencode/pull/1843#issuecomment-3180542978), 2025-08).

Agent-written style on his account (since about May 2026): full sentences, a bullet list of exactly what changed and why, the exact test commands run, and a split between failures caused by the PR and existing failures. Example: "Base verification: `bun test test/auth.test.ts` from `packages/cli` → 7 passed, 2 failed." ([#48056 c](https://github.com/anomalyco/opencode/pull/48056#issuecomment-5594835815)).

---

## Hard "no"s / pet peeves

- **Long AI-generated PR text.** "**If you paste a large clearly AI generated description here your PR may be IGNORED or CLOSED!**" ([PR template](https://github.com/anomalyco/opencode/blob/dev/.github/pull_request_template.md)). "Long, AI-generated PR descriptions and issues may be ignored. Write a short explanation in your own words." ([CONTRIBUTING.md](https://github.com/anomalyco/opencode/blob/dev/CONTRIBUTING.md)). The template also asks the author to say when they do not understand the change: "if you do not understand why at least say as much so a maintainer knows how much to value the PR."
- **Large features without design approval.** "Wait for design approval before opening the implementation PR." ([CONTRIBUTING.md](https://github.com/anomalyco/opencode/blob/dev/CONTRIBUTING.md)). Older, his words: "we try to make it clear you should chat with us before working on any large feature" ([#1304 c](https://github.com/anomalyco/opencode/pull/1304#issuecomment-3118196589)).
- **New providers in core.** "New providers should rarely require OpenCode changes. Add the provider to [models.dev] first." ([CONTRIBUTING.md](https://github.com/anomalyco/opencode/blob/dev/CONTRIBUTING.md)). Older: "i don't currently want to merge such a large specific fix for a single provider (novita) - the other providers work" ([#932 c](https://github.com/anomalyco/opencode/pull/932#issuecomment-3071475033)).
- **Prompt tweaks without evals.** Older: "it's easy to accidentally make things worse in some cases and right now we're conservatively sticking to claude code prompts" ([#382 c](https://github.com/anomalyco/opencode/pull/382#issuecomment-3005069586)).
- **Swallowed errors, defensive try/catch, `any` casts, extra comments, emoji.** See the `/rmslop` list and "Avoid `try`/`catch` where possible".
- **Centralized global handlers.** See value 4 ([#3942 c](https://github.com/anomalyco/opencode/pull/3942#issuecomment-3492374214)).
- **Mystery code nobody owns.** Older: "i have no idea what this cached logger thing is - we should just get rid of that" ([#1650 c](https://github.com/anomalyco/opencode/pull/1650#issuecomment-3169552535)).
- **Speculative hardening without buy-in.** Written rule: "Do not silently expand scope for theoretical robustness." ([AGENTS.md](https://github.com/anomalyco/opencode/blob/dev/AGENTS.md)).
- **Process rules that close PRs automatically:** title not in `type(scope): summary` format ([triage-pr-standards.yml](https://github.com/anomalyco/opencode/blob/dev/.github/workflows/triage-pr-standards.yml)); bug fixes without a linked issue; old PRs with few reactions. The daily cleanup closes PRs older than one month with fewer than 2 positive reactions ([triage-close-prs.yml](https://github.com/anomalyco/opencode/blob/dev/.github/workflows/triage-close-prs.yml); the script and message are by rekram1-node): "Due to the high volume of PRs from users and AI agents, we periodically close older PRs using automated criteria" ([#8263 c](https://github.com/anomalyco/opencode/pull/8263#issuecomment-4456566456)).
- **Bypassing git hooks.** He added a rule against it on 2026-07-08 ("docs: prohibit bypassing git hooks").

---

## How the opencode team reviews contributions (incl. AI-generated PRs)

- **They say they do not review each other's code.** "we've never done code review" ([X, 2026-03-03](https://x.com/thdxr/status/2028827251534352764)). Inference: the team relies on written rules, lint, types, and the owner's judgment, and keeps code volume low. Outside PRs get the review.
- **Filters before a human looks:** issue templates and compliance bots ("Automated checks flag missing templates, placeholder text, AI-generated walls of text" — [CONTRIBUTING.md](https://github.com/anomalyco/opencode/blob/dev/CONTRIBUTING.md)), title checks, linked-issue checks, reaction-based cleanup, and mass closes at big rewrites (V1 to V2, 2026-10-10).
- **Agent tools in review:** maintainers call bots in comments (`/oc review this for any bugs or gaps`, `@copilot`, `@greptile`, `/review`). Dax does not trust these blindly: "lol ignore these reviews they're garbage" ([#1843 c](https://github.com/anomalyco/opencode/pull/1843#issuecomment-3180542978)).
- **Common outcome: the team re-implements.** Many good PRs end as "fixed differently" with credit. Inference: a contributor PR is often treated as a bug report with a proof of concept.
- **Newest trend (Oct 2026):** in `anomalyco/hex`, outside PRs are not accepted at all, only issues with diagnoses. Agent PRs there need a policy check and owner approval for release paths ([hex #377](https://github.com/anomalyco/hex/pull/377)). Inference: this may spread to other anomalyco repos, but opencode still takes PRs today.
- **His public view on slop:** "the slop conversation is so one sided, it's not just that you can produce more code" and "you can also observe, debug, and refactor more code" ([X, 2026-10-12](https://x.com/thdxr/status/2109640383462511044)). On teams: "80 % of team were just like throwing slop over the fence" ([Kent C. Dodds](https://kentcdodds.com/chats/07/01/product-sense-restraint-and-opencode-with-dax-raad)). On agents as guardrail-needing juniors: "We've always been like a big domain driven design company." ([Pragmatic Engineer auto-transcript](https://podscripts.co/podcasts/the-pragmatic-engineer/building-opencode-with-dax-raad)).

---

## Heuristics that generalize to any TypeScript app or tool

1. Before you approve a new type, option, flag, hook, or file, ask: can an existing concept do this? If yes, request that.
2. If two or more requests look different, look for one primitive under them before you add special cases.
3. Treat each new feature or option as permanent maintenance. Ask the author who maintains it and why a default is not enough.
4. New public endpoints, flags, and default behaviors go behind an `experimental` namespace first.
5. Keep behavior local to the module that owns it. Push back on central registries or global handlers that know about every feature.
6. Validate `unknown` data once at the boundary with a schema. Inside, trust the types. Flag repeated `typeof` checks and `as` casts.
7. Flag `try/catch` that hides failures. Prefer errors that fail loudly or typed errors.
8. Flag `let` with reassignment, `else` after `return`, single-use variables, single-use helpers, needless destructuring, import aliases, star imports, and explicit types where inference works.
9. Flag a diff that touches files outside its stated purpose, or changes text (error messages, prompts) with no reason.
10. Flag code that re-adds something the project removed on purpose.
11. Ask for proof in the real artifact: the compiled binary, the real UI, a reactive update, a test that fails without the fix.
12. Check names against the rest of the code base (`projectID`, not `projectId`).
13. After a refactor, check that permission and safety checks still run somewhere.
14. Ask "will users understand this behavior?" A clever but surprising behavior is a defect.
15. Prefer platform and runtime APIs (Bun, Effect) and existing internal utilities over new dependencies.
16. Turn repeated review comments into lint rules or written rules (opencode does this with ast-grep, oxlint, and AGENTS.md).
17. Keep the PR description short and in the author's own words. If it cannot be short, the PR is too big.

---

## Other opencode reviewers worth noting

- **Aiden Cline (rekram1-node)** has the strongest public review signal. Since 2025-11 he reviewed about 224 opencode PRs (Dax: about 9) and commented on 1000+ (search limit). Themes: scope, "not necessary", MVP first, no new task-tool features, models.dev as the source of truth, performance of provider calls, and no default UI changes.
  - "Let's try to stay scoped to what we need to do to get mvp working" ([#7156 d](https://github.com/anomalyco/opencode/pull/7156#discussion_r2729929688))
  - "I don't want to introduce new things to task tool" ([#7156 d](https://github.com/anomalyco/opencode/pull/7156#discussion_r2729939419))
  - "this pr has so many unrelated changes, i thought it'd be a 2 line pr?" ([#20467 c](https://github.com/anomalyco/opencode/pull/20467#issuecomment-4272787310))
  - "can we follow style guide here prefer inlining things that arent used multiple times" ([#30482 d](https://github.com/anomalyco/opencode/pull/30482#discussion_r3345450570))
  - "we should Promise.all or use worker queue to prevent super slow linear requests" ([#8359 d](https://github.com/anomalyco/opencode/pull/8359#discussion_r2693102530))
  - "Yeah talked w/ team we don't want to change the default behaviors here" ([#28255 c](https://github.com/anomalyco/opencode/pull/28255#issuecomment-4514566348))
  - He also owns the triage automation (PR cleanup script, AGENTS.md trims).
- **Kit Langton (kitlangton)**: about 56 reviews since 2025-11. He owns the Effect v4 patterns and the ast-grep lint rules, and wrote much of the Session Core section of AGENTS.md. He removed the single-word naming rule. His recent comments are mostly agent-written fix reports. One closing note shows his bar: "A replacement will use Effect-native scoped drains and will be opened only after deterministic red-green-red proof across the production Session seam." ([#31043 c](https://github.com/anomalyco/opencode/pull/31043#issuecomment-4637108985)).
- **Hona and Brendonovich**: code owners of `packages/app` and `packages/desktop` ([CODEOWNERS](https://github.com/anomalyco/opencode/blob/dev/.github/CODEOWNERS)); Hona added the `anti-slop` oxlint plugin. About 81 and 40 reviews.
- **Adam (adamdotdevin)**: about 34 reviews, mostly UI. **Frank (fwang)** and **Jay (jayair)**: almost no public PR review signal in this period (4 and 0 reviews).

---

## Sources

Repo docs and config (anomalyco/opencode, branch `dev`):
- https://github.com/anomalyco/opencode/blob/dev/AGENTS.md
- https://github.com/anomalyco/opencode/blob/dev/CONTRIBUTING.md
- https://github.com/anomalyco/opencode/blob/dev/.github/pull_request_template.md
- https://github.com/anomalyco/opencode/blob/dev/.opencode/command/rmslop.md
- https://github.com/anomalyco/opencode/blob/dev/.opencode/skills/effect/SKILL.md
- https://github.com/anomalyco/opencode/tree/dev/script/ast-grep/rules
- https://github.com/anomalyco/opencode/blob/dev/.oxlintrc.json
- https://github.com/anomalyco/opencode/blob/dev/.github/workflows/triage-pr-standards.yml
- https://github.com/anomalyco/opencode/blob/dev/.github/workflows/triage-close-prs.yml
- https://github.com/anomalyco/opencode/blob/dev/.github/CODEOWNERS
- Old style guide and naming rule: https://github.com/anomalyco/opencode/blob/3ebebe0a96de5ec4757de12a21cb9f933e0fbba0/AGENTS.md ; removal: https://github.com/anomalyco/opencode/commit/672ee28635f471c5fcdc7e77c518d4465678d786 ; his restructure: https://github.com/anomalyco/opencode/commit/eade8ee07ba36ab3ee2e409135172c5503ae1c11
- V2 promotion: https://github.com/anomalyco/opencode/commit/5caf1f9f6f5f30e13fc50a788ad953d97ae3748f ; releases: https://github.com/anomalyco/opencode/releases
- Hex policy: https://github.com/anomalyco/hex/commit/847314564b880d85d5952c15db925bdb7cff16fc ; https://github.com/anomalyco/hex/pull/377

PR comments by thdxr (opencode): #3660, #3693, #3694, #3722, #3782, #3942, #4499, #4604, #5014, #5033, #5138, #5422, #5958, #5987, #6698, #6785, #7109, #7515, #9328, #12185, #12594, #13183, #13580, #15120, #15339, #15387, #18986, #21052, #25449, #25821, #35558, #42023, #42509, #48056, #48448, #50248, #59028 (links inline above). Older 2025 voice samples: #202, #382, #444, #495, #551, #898, #918, #932, #951, #974, #1304, #1546, #1650, #1843, #2001, #2116.
Other reviewers: #7156, #8359, #20467, #28255, #30482, #31043, #8263.

X posts (text via api.fxtwitter.com):
- https://x.com/thdxr/status/2028827251534352764 (2026-03-03)
- https://x.com/thdxr/status/2010941870528983363 (2026-01-13)
- https://x.com/thdxr/status/2109640383462511044 (2026-10-12)
- https://x.com/thdxr/status/2087945880863191162 (2026-08-13)
- https://x.com/thdxr/status/2085865399195779308 (2026-08-07)
- https://x.com/thdxr/status/2076690783810224568 (2026-07-13)
- https://x.com/thdxr/status/2053290393727324313 (2026-05-10)
- https://x.com/thdxr/status/2111790511409258796 (2026-10-18)
- https://x.com/thdxr/status/2031579270389059978 (2026-03-11)
- https://x.com/thdxr/status/1950278219153784850 (2025-07-29, TypeScript + Bun choice)

Podcasts:
- Kent C. Dodds, "Product sense, restraint, and OpenCode with Dax Raad", 2026-04-01: https://kentcdodds.com/chats/07/01/product-sense-restraint-and-opencode-with-dax-raad (quotes checked against the page transcript)
- The Pragmatic Engineer, "Building OpenCode with Dax Raad", 2026-05-27: https://newsletter.pragmaticengineer.com/p/opencode ; auto-transcript: https://podscripts.co/podcasts/the-pragmatic-engineer/building-opencode-with-dax-raad (machine transcript, wording can be slightly off)

Failed or empty sources: xcancel.com (HTTP 451), digg.com (TLS error), thdxr.com (only old 2021 posts). The "memo" he sent to his team (Pragmatic Engineer chapter 48:47) is not public.
