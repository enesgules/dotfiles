# Rhys Sullivan (@RhysSullivan): code-review research

Research date: 2026-11-26. Weighting: 2025 to Nov 2026 highest.
Main corpus: 1,014 of his GitHub comments in 755 threads, 2023-03-03 to 2026-11-26 (found with `commenter:RhysSullivan` and `reviewed-by:RhysSullivan`, then filtered by `user.login`). After I removed 368 template and bot-style comments (Graphite stack lists, "We're clearing the backlog" closes, "This pull request is not..." warnings), 646 are left: 166 inline review comments, 11 review bodies, and the rest issue and PR comments. Most are in `UsefulSoftwareCo/executor` (the repo that `RhysSullivan/executor` now redirects to), `AnswerOverflow/AnswerOverflow`, and `RhysSullivan/answeroverflow-rewrite`. Other sources: the AGENTS.md files that he committed to Executor (5 versions, 2026-04-05 to 2026-11-25), the Executor lint plugin and `.oxlintrc.jsonc`, `e2e/README.md`, `e2e/AGENTS.md` (v1 `main`), `DEVELOPMENT.md`, and 707 of his X posts (2026-08-24 to 2026-11-26, 43 timeline pages). Second pass (same date): 13 more review comments from 5 replayed PRs (2025-11-26 to 2026-05-29), the Next.js code and 8 commit messages of the Answer Overflow main site (2025-11-24 to 2026-01-30), and 2 of his PR bodies (AnswerOverflow#801, #966).
Every quote is verbatim. I kept his typos ("effet", "manaul", "shoulnt", "poitns", "exiting"). A script checked each quote against the fetched text. **Inference** marks my own reading.

**Important: much of the text under his account is written by an agent.** From June 2026 on, most of his PR comments are agent replies ("Fixed in <sha>: ...", "claude - ...", "Sent from my Claude", "> **Note:** everything below was written by an AI agent working on the author's behalf"). The "Resolved: ..." replies in AnswerOverflow#819 (2025-12-27) are also agent output. This file quotes his own short review comments for his opinions, and marks every agent-written quote with **(agent-written)**. The AGENTS.md files, lint messages, and e2e docs after May 2026 read as agent-drafted, but he committed them as the repo rules. Inference: he endorses them, because the rules are enforced by `bun run check` and by his review.

**How he reviews.** His human review comments are very short, one line, on the exact hunk: "use effect try", "no legacy fallback", "dont dupe", "why's this nullish now". Most target agent-written PRs (titles start with "[codex]"). The big rules then go into AGENTS.md and lint rules, so that the next agent cannot repeat the mistake.

---

## Current focus (what he works on now)

- **Executor v2** (executor.sh): "The missing integration layer for AI agents" (repo description). An Effect v4 codebase on Cloudflare Workers, Node, a desktop app, and a CLI, with an MCP server and a Promise SDK. In November 2026: skills over MCP and apps v2.
- **Effect upstream work.** On 2026-11-26 he (through an agent) asked for MCP features in `Effect-TS/effect` and offered a branch with tests ([effect#10946](https://github.com/Effect-TS/effect/issues/10946#issuecomment-7184467423), agent-written).
- **Speaker at Effect Days 2026:** "Excited to talk at Effect days!" ([X, 2026-11-06](https://x.com/RhysSullivan/status/2118796821250310555)). No talk transcript yet.
- **Agent-driven development.** Agents write most PRs. He reviews them, closes the bad ones, and rebuilds the good ones as stacks.

---

## Core values

1. **Effect everywhere inside the product.** "basically every time i write typescript without effect i regret it and end up having to retcon that mistake" ([X, 2026-10-11](https://x.com/RhysSullivan/status/2109349584124449197)). In review: "do this in effect, use effet schema etc is kind of a mess" ([executor#244](https://github.com/UsefulSoftwareCo/executor/pull/244#discussion_r3083196194)) on a hand-written error serializer with `JSON.parse(JSON.stringify(value))`.
2. **Effect inside, ordinary values at the author edge.** His repo rule: "**Effect v4 internally, ordinary values and Promises at public SDK / `apps` author boundaries.** Derive author callback types from native contracts; compose Effects directly inside the library." ([AGENTS.md, v2](https://github.com/UsefulSoftwareCo/executor/blob/v2/AGENTS.md)). DEVELOPMENT.md: "The root `@executor-js/sdk` exports Promise-based `createExecutor` and" ... "`@executor-js/sdk/core` exports the same constructors and operations as Effects, with typed failures and native Stream subscriptions." and "Both entry points use the same operations." ([DEVELOPMENT.md](https://github.com/UsefulSoftwareCo/executor/blob/v2/DEVELOPMENT.md)).
3. **Use the patterns the codebase already has.** "use effect atom etc we have proper ways to implement this" ([executor#842](https://github.com/UsefulSoftwareCo/executor/pull/842#discussion_r3255348846)). "implement this file not like an idiot who has no idea that data parsing, effect, and all the patterns that we leverage in the codebase do exist rather than disabling a bunch of stuff" ([executor#842](https://github.com/UsefulSoftwareCo/executor/pull/842#discussion_r3255329959)). "This should be in the call discord wrapper" ([AnswerOverflow#758](https://github.com/AnswerOverflow/AnswerOverflow/pull/758#discussion_r2573150935)).
4. **Make the bad state impossible instead of checking for it.** "lets solve this by just making organizationId not nullable in our schema instead then its always required to be defined  and we can get rid of all this ensure crap in the codebase" ([executor#2](https://github.com/UsefulSoftwareCo/executor/pull/2#discussion_r2779776396)). "make ctx oauth not nullable to eliminate this class of bug + use effect errors" ([executor#376](https://github.com/UsefulSoftwareCo/executor/pull/376#discussion_r3124954170)).
5. **Tests run the real product.** "All tests live in `e2e/` and drive a real server through HTTP, MCP, CLI, or browser. Unit tests are banned everywhere else (`scripts/check-no-unit-tests.ts`)." ([AGENTS.md, v2](https://github.com/UsefulSoftwareCo/executor/blob/v2/AGENTS.md)).
6. **Traces are how he sees the product.** "i can't overstate how good the combination of effect and alchemy are here, i have traces throughout the whole application and it just deploys and measures, its so good" ([X, 2026-10-06](https://x.com/RhysSullivan/status/2107377971543814597)).
7. **Agent output is cheap, so delete it when it is wrong.** "code is very cheap to write. do not give time estimates with agents code is practically instant to generate therefore unless stated otherwise time to implement is not a blocker" ([AGENTS.md, 2026-04-18](https://github.com/UsefulSoftwareCo/executor/blob/90ed099c0/AGENTS.md)). "clean up the codex slop" ([executor#341](https://github.com/UsefulSoftwareCo/executor/pull/341#discussion_r3112282071)).

---

## Review checklist (what he checks or pushes back on)

1. **Is a Promise or a callback brought into Effect the right way?**
   - "use effect try" ([executor#843](https://github.com/UsefulSoftwareCo/executor/pull/843#discussion_r3255372025)), on a hand-written `try`/`catch` helper in a React file.
   - Lint rule `authored-code-through-adapter`: "Wait on Promises only through fromPromise, so an app's own code is timed as the app's." Its message: "{{call}} waits on a Promise outside fromPromise. If any function in it can come from an app (a callback, or a method of a value the app passed, such as its cache), use fromPromise(callback, code) so its time is the app's. Otherwise add a disable comment naming the API that is not the app's." ([oxlint-plugin.ts](https://github.com/UsefulSoftwareCo/executor/blob/v2/scripts/oxlint-plugin.ts)).
2. **Is the input decoded, or cast by hand?**
   - "holy fuck bro" ([executor#842](https://github.com/UsefulSoftwareCo/executor/pull/842#discussion_r3255349338)), on a route handler that did `(await request.json()) as Record<string, unknown>` and then checked fields with `typeof`.
   - "brother use parsing" ([executor#867](https://github.com/UsefulSoftwareCo/executor/pull/867#discussion_r3321659619)).
   - "why are we manually defining json schema cant you use effects json schema" ([executor#1062](https://github.com/UsefulSoftwareCo/executor/pull/1062#discussion_r3447839990)).
   - Lint rule `exportable-schema-pattern`: "Give Schema.isPattern a RegExp that Effect can export to JSON Schema." ([oxlint-plugin.ts](https://github.com/UsefulSoftwareCo/executor/blob/v2/scripts/oxlint-plugin.ts)).
3. **Do errors keep their information until one edge mapping?**
   - On a PR titled "feat(sdk): typed errors propagate to one edge mapping (StorageError, InternalError, Telemetry)": "wrap provider error is weird, looks like this is being used to mask new Error from other poitns we havent upated, which we'll just go through and fix those rather than doing this so we get the full error info" ([executor#282](https://github.com/UsefulSoftwareCo/executor/pull/282#discussion_r3103662861)).
   - Same PR: "specifically 'withStorageCapture' is odd, think more generic about with capture or something like that and applying it to all errors" ([executor#282](https://github.com/UsefulSoftwareCo/executor/pull/282#discussion_r3103665634)). And for the local app with no error capture wired: "just log to console" ([executor#282](https://github.com/UsefulSoftwareCo/executor/pull/282#discussion_r3103673248)).
   - "use effect's error pattern matching / just have this error propagate through no need to remap" ([executor#376](https://github.com/UsefulSoftwareCo/executor/pull/376#discussion_r3124926535)).
   - "use tagged errors not regular error here" ([executor#332](https://github.com/UsefulSoftwareCo/executor/pull/332#discussion_r3109203635)), on `Effect.fail(new Error(...))`.
   - "use effets errors, dont have manaul _tag anywhere" ([executor#842](https://github.com/UsefulSoftwareCo/executor/pull/842#discussion_r3255327742)) and "shoulnt need to manually specify tag" ([executor#842](https://github.com/UsefulSoftwareCo/executor/pull/842#discussion_r3255326693)).
   - "bro has never heard of pattern matching 😭" ([executor#842](https://github.com/UsefulSoftwareCo/executor/pull/842#discussion_r3255346823)).
   - Product result: "in Executor v2, it's actually taking advantage of effect's error system now" and "all of the error states will have clear error messages, along with that, for the ones that are fixable via your agent i.e apps using the wrong auth they will include a prompt to use" ([X, 2026-09-23](https://x.com/RhysSullivan/status/2102606210029781405)).
4. **Is there state shared across requests?**
   - Lint rule `no-module-level-mutable-state`: "Module-level let and var are shared by every request a Worker isolate or server process handles. Keep state in a Ref or service owned by a Layer, or in storage." ([oxlint-plugin.ts](https://github.com/UsefulSoftwareCo/executor/blob/v2/scripts/oxlint-plugin.ts)).
   - Lint rule `no-shared-wait-in-worker-initialization`: "{{call}} in a Worker's initialization is shared by every request the isolate serves. A request that waits on it resumes in the I/O context of the request that finished it: its timers can be dropped when that request ends, and its Dynamic Workers count against that request's limit. Create it per call, or keep only settled values." (same file).
5. **Do tests use the real edge and Layers, not a hand runtime or a stub?**
   - Lint rule `no-manual-effect-runtime-in-tests`: "{{call}} runs an Effect outside the scenario's runtime. Use @effect/vitest `layer` and `it.effect`, and inject capabilities as services. Bridges to Promise callbacks need a disable comment saying which API requires one." It flags `Effect.runPromise`, `Effect.runSync`, `Effect.runFork`, and `ManagedRuntime.make` in `e2e/**` ([oxlint-plugin.ts](https://github.com/UsefulSoftwareCo/executor/blob/v2/scripts/oxlint-plugin.ts), [.oxlintrc.jsonc](https://github.com/UsefulSoftwareCo/executor/blob/v2/.oxlintrc.jsonc)).
   - "The suite uses Effect v4 and `@effect/vitest`. Scenarios use `layer` and `it.effect`." and "It does not import Executor implementations or construct partial" "application servers." ([e2e/README.md](https://github.com/UsefulSoftwareCo/executor/blob/v2/e2e/README.md)).
   - "Tests and demos that need an upstream API, OAuth/OIDC provider, or webhook use" "the published `@executor-js/emulate` emulators rather than stubs." ([AGENTS.md, v1 main](https://github.com/UsefulSoftwareCo/executor/blob/main/AGENTS.md)).
   - "Clean up created resources with `Effect.ensuring`; trailing cleanup statements" "are insufficient because mid-test failures must not leak state." ([e2e/AGENTS.md, v1 main](https://github.com/UsefulSoftwareCo/executor/blob/main/e2e/AGENTS.md)).
   - "Never add retries, longer deadlines, or skips to paper over flakes; fix the race. Delete scenarios that no longer guard real user/API behavior." ([AGENTS.md, v2](https://github.com/UsefulSoftwareCo/executor/blob/v2/AGENTS.md)).
   - Before the e2e-only rule: "do a quick test to using a react testing framework to make sure this isnt gonna fuck up caching / invalidation" ([executor#476](https://github.com/UsefulSoftwareCo/executor/pull/476#discussion_r3177381606)), on a new Effect Atom HTTP client.
   - After a bug: "fixed sorry about that! added a smoke test too to catch in the future" ([executor#800](https://github.com/UsefulSoftwareCo/executor/issues/800#issuecomment-4437430449)) and "thanks, hooking up the e2e tests to catch this moving forward as well" ([executor#1235](https://github.com/UsefulSoftwareCo/executor/pull/1235#issuecomment-4849707703)).
6. **Do traces reach the collector?**
   - "Telemetry assertions target spans that reached the motel store, not values" "stamped only inside application memory." ([e2e/AGENTS.md, v1 main](https://github.com/UsefulSoftwareCo/executor/blob/main/e2e/AGENTS.md)).
   - "`Telemetry`: queries spans that actually reached the collector over HTTP." ([e2e/README.md](https://github.com/UsefulSoftwareCo/executor/blob/v2/e2e/README.md)). "Partial or truncated" "results fail; missing parents are never replaced by synthetic success records." (same file).
   - On a fix for span lookups in Kit Langton's motel (an OpenTelemetry viewer): "there is no way this is the right fix fable" ([motel#13](https://github.com/kitlangton/motel/pull/13#discussion_r3400506708)).
7. **Does the code guard against things that cannot happen?**
   - "when is it ever gonna be unknown" ([executor#1062](https://github.com/UsefulSoftwareCo/executor/pull/1062#discussion_r3447840560)).
   - "ctx.oauth should never be nullable" ([executor#376](https://github.com/UsefulSoftwareCo/executor/pull/376#discussion_r3124933262)).
   - "why's this nullish now" ([executor#825](https://github.com/UsefulSoftwareCo/executor/pull/825#discussion_r3252426289)) and "Weird this is now || null" ([executor#713](https://github.com/UsefulSoftwareCo/executor/pull/713#discussion_r3209583931)).
   - "the models love to add so much extra code for cases that will never happen" ([X, 2026-10-16](https://x.com/RhysSullivan/status/2111168428883235002)).
8. **Is there an old path, a fallback, or dead code left?**
   - "no legacy fallback" ([executor#842](https://github.com/UsefulSoftwareCo/executor/pull/842#discussion_r3255349590)), on an `allow_model_resume` legacy query parameter.
   - "just remove this completely it isnt used" ([executor#867](https://github.com/UsefulSoftwareCo/executor/pull/867#discussion_r3321661611)).
   - "dont have unused variables" ([executor#843](https://github.com/UsefulSoftwareCo/executor/pull/843#discussion_r3255369342)).
   - "higher in the stack once we're fully moved over to effect schema these can be removed" ([AnswerOverflow#848](https://github.com/AnswerOverflow/AnswerOverflow/pull/848#discussion_r2649754690)).
9. **Is it duplicated, or is there a helper or converter already?**
   - "dont dupe" ([executor#326](https://github.com/UsefulSoftwareCo/executor/pull/326#discussion_r3106086626)).
   - "is there an existing converter we can use " ([executor#867](https://github.com/UsefulSoftwareCo/executor/pull/867#discussion_r3321669196)) and "can we just convert google discovery -> openapi" ([executor#867](https://github.com/UsefulSoftwareCo/executor/pull/867#discussion_r3321670442)).
   - "see if you can make this plugin agnostic or implement in plugins in some way - llm is getting lazy here" ([executor#341](https://github.com/UsefulSoftwareCo/executor/pull/341#discussion_r3112284692)).
   - "its fine to duplicate it but you can do some ts magic to import the sdk type and ensure the constatns match up via providing it as a generic? " ([executor#476](https://github.com/UsefulSoftwareCo/executor/pull/476#discussion_r3177379013)).
10. **Is the interface hard to misuse?**
    - "interface for store needs to be an object, should never have multiple strings in a row like this leads to bugs" ([executor#332](https://github.com/UsefulSoftwareCo/executor/pull/332#discussion_r3109041242)).
    - "branded types to org scope id, workspace scope id" ([executor#502](https://github.com/UsefulSoftwareCo/executor/pull/502#discussion_r3183204600)).
11. **Is the data access scoped, and is the query at the right level?**
    - "are we giving raw db access that bypasses the filtering we have" and "options.db probs shouldnt exist" ([executor#821](https://github.com/UsefulSoftwareCo/executor/pull/821#discussion_r3244843211), [executor#821](https://github.com/UsefulSoftwareCo/executor/pull/821#discussion_r3244844138)).
    - "is weird this isn't happening on the query level" ([AnswerOverflow#793](https://github.com/AnswerOverflow/AnswerOverflow/pull/793#discussion_r2617574603)).
12. **Is the DX right for the next caller?**
    - "i thought we were removing the explicit set source binding function in favor of better dx, chat with me on this" ([executor#843](https://github.com/UsefulSoftwareCo/executor/pull/843#discussion_r3255370788)).
    - "separating 'executor the platform' from 'executor the product' so it'll be a lot easier to use these sdks without bringing along a bunch of other stuff like toolkits and policies" ([executor#1310](https://github.com/UsefulSoftwareCo/executor/pull/1310#issuecomment-4881273338)).
    - "dont call this one by one, instead pass this an array of { channelId, tags }[] and have it output in the same format" ([AnswerOverflow#797](https://github.com/AnswerOverflow/AnswerOverflow/pull/797#discussion_r2651719507)).

---

## What he praises

- Small UI fixes from contributors: "love it, lgtm" ([fastergh#7](https://github.com/RhysSullivan/fastergh/pull/7#issuecomment-3943335641)), "beautiful" ([executor#1049](https://github.com/UsefulSoftwareCo/executor/pull/1049#issuecomment-4745443624)), "good pr thanks" ([executor#1648](https://github.com/UsefulSoftwareCo/executor/pull/1648#issuecomment-5330537504)).
- A diff he can review: "diff was +945-333, very reviewable and now my app is faster" ([X, 2026-09-20](https://x.com/RhysSullivan/status/2101807287421808805)).
- Agents that check flows end to end: "agents don't have to produce slop, they can also help you make great software" ([X, 2026-09-22](https://x.com/RhysSullivan/status/2102476810181292299)).
- Effect plus infrastructure as code, because it measures each change: "i can't overstate how good the combination of effect and alchemy are here" ([X, 2026-10-06](https://x.com/RhysSullivan/status/2107377971543814597)).

---

## Tone and phrasing

- One line, lowercase, no punctuation: "dont dupe", "inline", "not needed", "duplicate", "Reuse from schema", "use effect try".
- He asks why when a change is not clear: "why'd we remove embedded migrations" ([executor#817](https://github.com/UsefulSoftwareCo/executor/pull/817#discussion_r3245002810)), "why's this nullish now".
- Blunt with agent PRs, often with swearing or jokes ("holy fuck bro", "brother use parsing", "lol no dont do this", "i miss fable"). Polite and fast with human contributors ("Thanks for the PR!", "credited you as coauthor").
- Review summaries are short and name the theme: "Decent first pass but needs revisions, especially around reducing duplicate logic, sharing schemas, and simplifying the data flow" ([answeroverflow-rewrite#13](https://github.com/RhysSullivan/answeroverflow-rewrite/pull/13#pullrequestreview-3508213439)). "Seeing a lot of anti patterns on querying unindexed fields and raw queries rather than using getOneFrom or other convex helpers" ([answeroverflow-rewrite#13](https://github.com/RhysSullivan/answeroverflow-rewrite/pull/13#pullrequestreview-3508580828)).
- He asks people for human write-ups: "Can you do a non ai write up though about how these PRs have been generated and tested, there's too much ai slop in the writing atm" ([executor#1585](https://github.com/UsefulSoftwareCo/executor/issues/1585#issuecomment-5301011848)).

---

## Hard "no"s / pet peeves

- Hand parsing and casts where Effect Schema exists ("holy fuck bro", "brother use parsing").
- `new Error` and hand `_tag` in Effect failures.
- Wrappers that remap or mask errors ("wrap provider error is weird").
- Legacy fallbacks and code for cases that cannot happen.
- Duplicate logic and new helpers next to existing ones.
- Prose comments. Lint rule `no-comments`: "Avoid prose comments. Express intent through clear names, types, or checks. Allowed: tooling directives, license headers, public SDK/apps contract JSDoc, URLs/RFCs/upstream issues, or 'external: <reason>' for non-obvious external platform constraints." ([oxlint-plugin.ts](https://github.com/UsefulSoftwareCo/executor/blob/v2/scripts/oxlint-plugin.ts)).
- Retries or skips for flaky tests (AGENTS.md rule above). He admits flakes when he sees them: "yeah they're flakey tests, will fix" ([executor#1648](https://github.com/UsefulSoftwareCo/executor/pull/1648#issuecomment-5330540790)).
- AI-written PR text that hides how the work was tested ([executor#1585](https://github.com/UsefulSoftwareCo/executor/issues/1585#issuecomment-5301011848)).

---

## Heuristics that generalize (incl. TypeScript web apps)

1. Run Effect at the edge. Inside, compose. (Core value 2. Inference: a Next.js route handler or server action is such an edge.)
2. Bring each Promise in through one adapter. (Checklist 1.)
3. Decode once at the edge with Schema. (Checklist 2.)
4. Map typed errors once, at the edge. Keep the full cause. (Checklist 3.)
5. No module-level mutable state on servers and Workers. (Checklist 4.)
6. Test through the real edge with `@effect/vitest` Layers and shared emulators, not mocks. (Checklist 5.)
7. Assert on spans that reached the collector. (Checklist 6.)
8. Turn each repeated review comment into a lint rule with a message that says what to do instead. Inference from his enforcement map: "| Rule | Enforcer |" with each rule tied to `bun run check`, `pr:check`, or a script ([AGENTS.md, v2](https://github.com/UsefulSoftwareCo/executor/blob/v2/AGENTS.md)).
9. Move to Effect in stacked PRs, and delete the old path at the top of the stack. (Checklist 8.)

---

## Lane fit (for the seat)

The seat owns the edge between Effect and other code, tests, and traces. Evidence for each: core value 2 and checklist 1 (edge), checklist 2 (decode at the edge), checklist 4 (state across requests), checklist 5 (tests), checklist 6 (traces), checklist 7 to 9 (DX for the next agent). Error-channel details (tagged errors, `catchTag`, pattern matching) are strong in his corpus, but they go to the Kit seat. This seat checks only where errors are mapped and that they keep their information. Layer and Scope design go to the Michael seat.

Next.js route handlers, server actions, and `ManagedRuntime` at the app edge now have a source: his Answer Overflow main-site code (second pass). It is code, not review comments, so it stays thin. Structured logs: only "just log to console" and the move to `Effect.logError` in #966. The seat keeps the log line as a baseline check with no quote.

---

## Second pass: the Next.js edge, logs, and replayed reviews

**Next.js edge (his own code in Answer Overflow `apps/main-site`, Effect v3).** This fills the gap for `ManagedRuntime`, route handlers, and server actions. It is code, not a review comment.
- One runtime module for the app, built from Layers: "export const runtime = ManagedRuntime.make(" with "Layer.mergeAll(DatabaseHttpLayer, ConfigProviderLayer)," ([lib/runtime.ts](https://github.com/AnswerOverflow/AnswerOverflow/blob/main/apps/main-site/src/lib/runtime.ts)).
- Route handlers and server actions run their Effect through that one runtime, then map the result to Next.js outside Effect: "}).pipe(runtime.runPromise);" in a `GET` route handler that then calls `notFound()` ([m/[messageId]/markdown/route.ts](https://github.com/AnswerOverflow/AnswerOverflow/blob/main/apps/main-site/src/app/%5Bdomain%5D/(content)/m/%5BmessageId%5D/markdown/route.ts)), and the same pattern in the `use server` file [lib/server/chat.ts](https://github.com/AnswerOverflow/AnswerOverflow/blob/main/apps/main-site/src/lib/server/chat.ts). Inference: the baseline check on one runtime for each app edge now has a source.
- The Layer is picked for the edge, not per handler: "use HTTP client for main-site SSR to eliminate WebSocket timeout cliffs (#801)" ([commit 0a7e33b](https://github.com/AnswerOverflow/AnswerOverflow/commit/0a7e33bce6544b8cf652ed4b3f60bba47c91255b)). The PR body (likely agent-drafted): "Same `ConvexClientUnified` interface via Effect's dependency injection" ([AnswerOverflow#801](https://github.com/AnswerOverflow/AnswerOverflow/pull/801)).
- Tracing in this app came and went: "send otel in main site to axiom" ([commit e3d2ea2](https://github.com/AnswerOverflow/AnswerOverflow/commit/e3d2ea2dca10c7ecff842b4b020a7889c976da42)), then "fix: remove tracing from main-site runtime to fix crypto.randomUUID prerender error" ([commit ec62d7f](https://github.com/AnswerOverflow/AnswerOverflow/commit/ec62d7f88eb7eb25ea5faa84552ab62c24239a06)).

**Logs and telemetry (changed view, per repo).** On 2026-11-10 he removed all observability from Answer Overflow. PR body (likely agent-drafted, merged by him): "Removes product analytics and observability entirely." and "Bot error helpers (`catchAllWithReport` etc.) now log with `Effect.logError` instead of sending to Sentry." ([AnswerOverflow#966](https://github.com/AnswerOverflow/AnswerOverflow/pull/966)). Executor keeps its traces (checklist 6). Inference: he wants traces where the repo already has a collector, and `Effect.logError` elsewhere. He does not ask every repo to add tracing. The seat now asks for spans only where the repo already traces.

**Replayed reviews (new quotes).**
- An entry point calls the shared function, not another entry point: "Action calling another action is weird, should just call this function directly" ([answeroverflow-rewrite#13](https://github.com/RhysSullivan/answeroverflow-rewrite/pull/13#discussion_r2562665548)).
- Use the existing auth helper: "We have an exiting place for manageGuild, reference manage guild query and manage guild mutation" ([answeroverflow-rewrite#13](https://github.com/RhysSullivan/answeroverflow-rewrite/pull/13#discussion_r2562867348)). Use the existing query helper: "Use getOneFrim convex helpers here" ([answeroverflow-rewrite#13](https://github.com/RhysSullivan/answeroverflow-rewrite/pull/13#discussion_r2562682081)).
- Product detail, not a standard: "Add the user id to the metadata so we know who checked out" ([answeroverflow-rewrite#13](https://github.com/RhysSullivan/answeroverflow-rewrite/pull/13#discussion_r2562673333)).
- One-off migration code stays out of the core module: "dont put migration logic into core executor.ts file, put it into its own file" ([executor#867](https://github.com/UsefulSoftwareCo/executor/pull/867#discussion_r3321658758)). A whole unused file goes: "whole file" ([executor#867](https://github.com/UsefulSoftwareCo/executor/pull/867#discussion_r3321661898)).
- Types come from the schema: ":maybe: pull these from our schema / existing types instead" ([AnswerOverflow#797](https://github.com/AnswerOverflow/AnswerOverflow/pull/797#discussion_r2651720560)), on new hand-written `ChannelInfo` and `TagInfo` types. "duplicate" ([AnswerOverflow#797](https://github.com/AnswerOverflow/AnswerOverflow/pull/797#discussion_r2651717246)), on a new defaults constant.
- Scoped access by default, no raw handle beside it: "why isnt .db already scoped" ([executor#821](https://github.com/UsefulSoftwareCo/executor/pull/821#discussion_r3244845063)), with "options.db probs shouldnt exist" (checklist 11).
- Lint escapes: "rather than disabling a bunch of stuff" (part of the executor#842 quote in core value 3). That diff added many `oxlint-disable-next-line ... -- boundary:` comments. Inference: a new disable comment is a finding unless the boundary is real.
- Hand type guards where `Schema` and pattern matching exist: "bro has never heard of pattern matching 😭" (checklist 3) sits on a hand `isRecord`/`isStringArray` parser of a JSON Schema in a React component.
- Product wording, out of lane: "native elictaiton isnt a thing in the cli" ([executor#842](https://github.com/UsefulSoftwareCo/executor/pull/842#discussion_r3255325028)).

---

## Not adopted

- **E2E only, unit tests banned.** "Unit tests are banned everywhere else" is a rule for his repo, with a large e2e harness. The seat asks for tests through the real edge, but does not ban unit tests in other repos.
- **Repo process rules:** stacked PRs with `gh stack`, the `e2e` fenced block in PR bodies, the Worker size budget, `Release-note:` lines, CI on macOS runners, rift workspaces. Specific to Executor.
- **"Migrations must keep the app online. ... Add schema first, deploy code that uses it, drop obsolete fields in a later release."** This is a staged migration rule for hosted data. Out of lane, and the seat never asks for compatibility layers in internal code.
- **Sync stdio lint rule** (`no-sync-stdio-write`) and the secure-context browser rule. Platform details, out of lane.
- **CI tips on X** ("let your agent pick what the most relevant parts of CI are to run" ([X, 2026-10-06](https://x.com/RhysSullivan/status/2107577951206486098))). Process, not review.
- **Jokes and swearing:** "boo!", "i miss fable", "opening your agents.md after a month of not looking at it" ([X, 2026-09-24](https://x.com/RhysSullivan/status/2103268757636591990)). Tone only.
- **Product opinions on MCP app stores** ("i also don't really like a premade apps list existing, your agent is meant to just write the integration" ([X, 2026-11-23](https://x.com/RhysSullivan/status/2124905574865498176))). Out of lane.
- **Security comments** ("LLMs should not be listing secrets from users." ([executor#357](https://github.com/UsefulSoftwareCo/executor/pull/357#discussion_r3114391024)), the DNS-rebinding fix in executor#261). They go to the Daniel seat (`review-bagder`).
- **Code he did not review:** "i have reviewed none of this code, mostly none of the dx, and am not currently building discord bots so this is the work of claude not me" ([X, 2026-11-06](https://x.com/RhysSullivan/status/2118584878329643025)), about `effect-discord-perms`. Not evidence of his style.
- **Agent-written replies** such as "Resolved: Replaced custom runtime with the main app's atomRuntime to ensure consistency with the rest of the application." ([AnswerOverflow#819](https://github.com/AnswerOverflow/AnswerOverflow/pull/819#discussion_r2649211126)) (agent-written). It matches core value 3, but I do not use it as his voice.

---

## Sources

**GitHub review and issue comments** (all fetched with `gh api` and checked by `user.login`; links go to the exact comment):
[executor#2 a](https://github.com/UsefulSoftwareCo/executor/pull/2#discussion_r2779776396), [executor#244](https://github.com/UsefulSoftwareCo/executor/pull/244#discussion_r3083196194), [executor#282 a](https://github.com/UsefulSoftwareCo/executor/pull/282#discussion_r3103662861), [executor#282 b](https://github.com/UsefulSoftwareCo/executor/pull/282#discussion_r3103665634), [executor#282 c](https://github.com/UsefulSoftwareCo/executor/pull/282#discussion_r3103673248), [executor#326](https://github.com/UsefulSoftwareCo/executor/pull/326#discussion_r3106086626), [executor#332 a](https://github.com/UsefulSoftwareCo/executor/pull/332#discussion_r3109041242), [executor#332 b](https://github.com/UsefulSoftwareCo/executor/pull/332#discussion_r3109203635), [executor#341 a](https://github.com/UsefulSoftwareCo/executor/pull/341#discussion_r3112282071), [executor#341 b](https://github.com/UsefulSoftwareCo/executor/pull/341#discussion_r3112284692), [executor#357](https://github.com/UsefulSoftwareCo/executor/pull/357#discussion_r3114391024), [executor#376 a](https://github.com/UsefulSoftwareCo/executor/pull/376#discussion_r3124926535), [executor#376 b](https://github.com/UsefulSoftwareCo/executor/pull/376#discussion_r3124933262), [executor#376 c](https://github.com/UsefulSoftwareCo/executor/pull/376#discussion_r3124954170), [executor#476 a](https://github.com/UsefulSoftwareCo/executor/pull/476#discussion_r3177379013), [executor#476 b](https://github.com/UsefulSoftwareCo/executor/pull/476#discussion_r3177381606), [executor#502](https://github.com/UsefulSoftwareCo/executor/pull/502#discussion_r3183204600), [executor#713](https://github.com/UsefulSoftwareCo/executor/pull/713#discussion_r3209583931), [executor#800](https://github.com/UsefulSoftwareCo/executor/issues/800#issuecomment-4437430449), [executor#817](https://github.com/UsefulSoftwareCo/executor/pull/817#discussion_r3245002810), [executor#821 a](https://github.com/UsefulSoftwareCo/executor/pull/821#discussion_r3244843211), [executor#821 b](https://github.com/UsefulSoftwareCo/executor/pull/821#discussion_r3244844138), [executor#825](https://github.com/UsefulSoftwareCo/executor/pull/825#discussion_r3252426289), [executor#842 a](https://github.com/UsefulSoftwareCo/executor/pull/842#discussion_r3255326693), [executor#842 b](https://github.com/UsefulSoftwareCo/executor/pull/842#discussion_r3255327742), [executor#842 c](https://github.com/UsefulSoftwareCo/executor/pull/842#discussion_r3255329959), [executor#842 d](https://github.com/UsefulSoftwareCo/executor/pull/842#discussion_r3255346823), [executor#842 e](https://github.com/UsefulSoftwareCo/executor/pull/842#discussion_r3255348846), [executor#842 f](https://github.com/UsefulSoftwareCo/executor/pull/842#discussion_r3255349338), [executor#842 g](https://github.com/UsefulSoftwareCo/executor/pull/842#discussion_r3255349590), [executor#843 a](https://github.com/UsefulSoftwareCo/executor/pull/843#discussion_r3255369342), [executor#843 b](https://github.com/UsefulSoftwareCo/executor/pull/843#discussion_r3255370788), [executor#843 c](https://github.com/UsefulSoftwareCo/executor/pull/843#discussion_r3255372025), [executor#867 a](https://github.com/UsefulSoftwareCo/executor/pull/867#discussion_r3321659619), [executor#867 b](https://github.com/UsefulSoftwareCo/executor/pull/867#discussion_r3321661611), [executor#867 c](https://github.com/UsefulSoftwareCo/executor/pull/867#discussion_r3321669196), [executor#867 d](https://github.com/UsefulSoftwareCo/executor/pull/867#discussion_r3321670442), [executor#1049](https://github.com/UsefulSoftwareCo/executor/pull/1049#issuecomment-4745443624), [executor#1062 a](https://github.com/UsefulSoftwareCo/executor/pull/1062#discussion_r3447839990), [executor#1062 b](https://github.com/UsefulSoftwareCo/executor/pull/1062#discussion_r3447840560), [executor#1235](https://github.com/UsefulSoftwareCo/executor/pull/1235#issuecomment-4849707703), [executor#1310](https://github.com/UsefulSoftwareCo/executor/pull/1310#issuecomment-4881273338), [executor#1585](https://github.com/UsefulSoftwareCo/executor/issues/1585#issuecomment-5301011848), [executor#1648 a](https://github.com/UsefulSoftwareCo/executor/pull/1648#issuecomment-5330537504), [executor#1648 b](https://github.com/UsefulSoftwareCo/executor/pull/1648#issuecomment-5330540790), [AnswerOverflow#758](https://github.com/AnswerOverflow/AnswerOverflow/pull/758#discussion_r2573150935), [AnswerOverflow#793](https://github.com/AnswerOverflow/AnswerOverflow/pull/793#discussion_r2617574603), [AnswerOverflow#797](https://github.com/AnswerOverflow/AnswerOverflow/pull/797#discussion_r2651719507), [AnswerOverflow#819](https://github.com/AnswerOverflow/AnswerOverflow/pull/819#discussion_r2649211126) (agent-written), [AnswerOverflow#848](https://github.com/AnswerOverflow/AnswerOverflow/pull/848#discussion_r2649754690), [answeroverflow-rewrite#13 a](https://github.com/RhysSullivan/answeroverflow-rewrite/pull/13#pullrequestreview-3508213439), [answeroverflow-rewrite#13 b](https://github.com/RhysSullivan/answeroverflow-rewrite/pull/13#pullrequestreview-3508580828), [fastergh#7](https://github.com/RhysSullivan/fastergh/pull/7#issuecomment-3943335641), [motel#13](https://github.com/kitlangton/motel/pull/13#discussion_r3400506708), [effect#10946](https://github.com/Effect-TS/effect/issues/10946#issuecomment-7184467423) (agent-written).

**Second pass, Answer Overflow main site** (fetched with `gh api`): [lib/runtime.ts](https://github.com/AnswerOverflow/AnswerOverflow/blob/main/apps/main-site/src/lib/runtime.ts) and its 8 commits, [markdown route.ts](https://github.com/AnswerOverflow/AnswerOverflow/blob/main/apps/main-site/src/app/%5Bdomain%5D/(content)/m/%5BmessageId%5D/markdown/route.ts), [lib/server/chat.ts](https://github.com/AnswerOverflow/AnswerOverflow/blob/main/apps/main-site/src/lib/server/chat.ts), [AnswerOverflow#801](https://github.com/AnswerOverflow/AnswerOverflow/pull/801), [AnswerOverflow#966](https://github.com/AnswerOverflow/AnswerOverflow/pull/966). Replayed review threads: [answeroverflow-rewrite#13](https://github.com/RhysSullivan/answeroverflow-rewrite/pull/13), [executor#842](https://github.com/UsefulSoftwareCo/executor/pull/842), [executor#867](https://github.com/UsefulSoftwareCo/executor/pull/867), [AnswerOverflow#797](https://github.com/AnswerOverflow/AnswerOverflow/pull/797), [executor#821](https://github.com/UsefulSoftwareCo/executor/pull/821).

**Repo rules that he committed** (Executor):
- [AGENTS.md, v2 branch](https://github.com/UsefulSoftwareCo/executor/blob/v2/AGENTS.md), latest export 2026-11-25.
- [AGENTS.md at 90ed099c0](https://github.com/UsefulSoftwareCo/executor/blob/90ed099c0/AGENTS.md), "update agents", 2026-04-18. Hand-written, lowercase.
- [AGENTS.md, v1 main](https://github.com/UsefulSoftwareCo/executor/blob/main/AGENTS.md), 2026-07-28, and [e2e/AGENTS.md, v1 main](https://github.com/UsefulSoftwareCo/executor/blob/main/e2e/AGENTS.md).
- [scripts/oxlint-plugin.ts](https://github.com/UsefulSoftwareCo/executor/blob/v2/scripts/oxlint-plugin.ts) and [.oxlintrc.jsonc](https://github.com/UsefulSoftwareCo/executor/blob/v2/.oxlintrc.jsonc).
- [e2e/README.md](https://github.com/UsefulSoftwareCo/executor/blob/v2/e2e/README.md) and [DEVELOPMENT.md](https://github.com/UsefulSoftwareCo/executor/blob/v2/DEVELOPMENT.md).

**X posts** (from `api.fxtwitter.com/2/profile/RhysSullivan/statuses`, filtered on `author.screen_name`): [2109349584124449197](https://x.com/RhysSullivan/status/2109349584124449197), [2107377971543814597](https://x.com/RhysSullivan/status/2107377971543814597), [2102606210029781405](https://x.com/RhysSullivan/status/2102606210029781405), [2111168428883235002](https://x.com/RhysSullivan/status/2111168428883235002), [2101807287421808805](https://x.com/RhysSullivan/status/2101807287421808805), [2102476810181292299](https://x.com/RhysSullivan/status/2102476810181292299), [2118796821250310555](https://x.com/RhysSullivan/status/2118796821250310555), [2107577951206486098](https://x.com/RhysSullivan/status/2107577951206486098), [2103268757636591990](https://x.com/RhysSullivan/status/2103268757636591990), [2124905574865498176](https://x.com/RhysSullivan/status/2124905574865498176), [2118584878329643025](https://x.com/RhysSullivan/status/2118584878329643025). The X window (2026-08-24 to 2026-11-26) is mostly Executor launches, MCP opinions, agents, and astrophotography. Few posts are about code review.

**Reach (2026-11-26):** X @RhysSullivan 65,921 followers, posts daily. GitHub @RhysSullivan 1,013 followers, 166 public repos; Executor has 4,611 stars. Bluesky @rhys.dev 768 followers, last post 2025-03-06 (inactive). Blog [rhys.dev/blog](https://rhys.dev/blog) has 2 posts (2026-01-19 and 2026-11-23), neither about code.

---

## Failed sources

- **Talks:** no transcript found (second pass too). His Effect Days 2026 talk is announced but not given yet. A web search found no Effect podcast episode with him. This Week in Effect #65 links an older talk about Effect tests at Vercel, outside the one-year window and with no transcript.
- **X before 2026-08-24:** the fxtwitter timeline stopped after 43 pages. Earlier Effect posts (for example a 2025 reply about an MCP built with Effect, which the Effect newsletter of 2025-10-31 mentions) were not read. Second pass: fxtwitter search returns "X/Twitter search is unavailable" (503), and a web search found no older post. Still open.
- **Executor `notes/` folder** (`notes/coding-style.md`, `notes/storage.md`, `notes/effect-mcp.md`): AGENTS.md links them, but the public mirror does not have them (404). The coding-style note is likely the strongest missing source.
- **HN:** no comments under `RhysSullivan` (Algolia, 0 hits).
- **Bluesky:** 46 posts, all before 2025-03-07, none about Effect. Not used.
- **Commit messages:** v2 commits are all "Export <sha>" from a private repo, so they carry no review text.
