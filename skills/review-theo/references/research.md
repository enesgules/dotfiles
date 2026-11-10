# Theo Browne (t3dotgg) — research for a code-review seat

- **Research date:** 2026-11-03
- **Weighting:** Late 2025 to November 2026 has the highest weight. Items from 2022–2024 (create-t3-app, UploadThing, QuickPic) have low weight. I use them only where they agree with recent evidence, and I mark them "older".
- **Corpus:** 1,864 GitHub comments, reviews and inline comments by `t3dotgg` (June 2025 – Nov 2026, mostly `pingdotgg/t3code`), from GraphQL searches `commenter:t3dotgg` and `reviewed-by:t3dotgg`; 293 older items (create-t3-app, UploadThing, QuickPic, stripe-recommendations, T3-Content; 0 in `t3-oss/t3-env`); T3 Code `AGENTS.md`, `CONTRIBUTING.md`, `docs/internals/testing.md`, `.macroscope/*` and the PRs that changed them; all 9 `SKILL.md` files in `t3dotgg/tstack`; YouTube RSS, 300 recent titles, auto-captions for 19 videos; 2 t3.gg blog posts; X post texts only as shown in search-index page titles (X returned HTTP 402).
- **Important filter.** In 2026, most text from his GitHub account is agent-written. These comments carry a marker such as `> 🤖 **Claude Opus 5.5 responding on behalf of Theo**` or "Agent comment posted on behalf of @t3dotgg". Bulk triage replies start with "Thanks for the detailed report". I removed all of them, and also removed bulk "automated pass" duplicate notices. About 100 items remain that read as his own words. I use the agent-written PR bodies under his name only as evidence of process (what he asks for), never as evidence of his voice. He marks this split himself: "Human Theo here coming in before my agents do." ([t3code#23433](https://github.com/pingdotgg/t3code/issues/23433#issuecomment-6437172447)).
- **Video quotes** come from YouTube auto-captions. I copied them word for word. Words in [square brackets] are my fixes for product names that the captions spelled wrong. Timestamps can be off by a few seconds.

---

## Current focus

**Verified role.**
- His GitHub profile says `"company": "CEO @ Ping.gg"` and `"bio": "I'm just here for the vibes, man"` ([api.github.com/users/t3dotgg](https://github.com/t3dotgg)).
- His profile README (updated 2026-10-29) begins: "Founder of [T3 Chat](https://t3.chat). Creator of T3 Stack. Popular on [YouTube](https://www.youtube.com/@theo)" ([t3dotgg/t3dotgg](https://github.com/t3dotgg/t3dotgg)).

**What he spends his time on (Nov 2026).**
- **T3 Code** ([pingdotgg/t3code](https://github.com/pingdotgg/t3code), homepage [t3.codes](https://t3.codes), about 42.8k stars). `AGENTS.md` describes it as "a minimal GUI for coding agents. A Node WebSocket server wraps provider CLIs and agents … and serves web, desktop, and mobile clients." The same file says "We have over 500,000 users". The video description of "T3 Code broke me" (2026-10-29) says "over 700,000 users" ([video](https://www.youtube.com/watch?v=uLGxb4F3SyI)).
- His account authored 1,433 PRs and reviewed 624 PRs since June 2025 (GitHub search). Almost all are in t3code. Agents write most of this work, and a "council" of models from different providers reviews it.
- **YouTube** (`@theo`): recent titles are almost all about AI models and harnesses, for example "These 3 skills changed my life" (2026-10-26). Blog: one 2026 post, ["What is a 'harness'?"](https://t3.gg/blog/post/what-is-a-harness) (2026-10-22).

**Inference:** In 2026 his reviews are about T3 Code, a high-volume open-source desktop, web and mobile app for AI agents. Most of the code comes from agents. So his review lens now has two parts: (a) a fast gate on agent "slop" from outsiders, and (b) the taste of a product owner for UX, defaults, and scope.

---

## Core values

1. **Simple systems, small model of the problem, fight scope creep.** His note in T3 Code's `AGENTS.md`, added in his PR [#4782](https://github.com/pingdotgg/t3code/pull/4782) (merged 2026-07-28):
   > "I like ambitious ideas, simple systems, and software that feels obvious. Do not preserve complexity just because it already exists. Do not introduce machinery because it looks architecturally impressive. Understand the real constraint, then fight for the smallest model that makes the correct behavior unsurprising."
   > "Channel both "measure twice, cut once" and "yagni". Fight scope creep. Try to honor the dev's intent in both a minimal and realistic fashion."

   On video: "I focus on building complex things as simple as possible." ([My AGENTS.md & SKILLS.md Breakdown, 2026-08-11, 6:03](https://www.youtube.com/watch?v=e1snsuY4lTI&t=363)).

2. **Evidence over claims.** On a closed PR: "I need evidence of both claims: that the problem exists and that the solution works. This PR provides neither and instead introduces a lot of noise." ([t3code#7909](https://github.com/pingdotgg/t3code/pull/7909#issuecomment-5420779627), 2026-08-26). On an issue: "If your only evidence is subjective differences in percentages used in your limits, that is not going to help us at all. I need real evidence before we can do anything here." ([t3code#7338](https://github.com/pingdotgg/t3code/issues/7338#issuecomment-5458802300), 2026-08-28).

3. **Ship fast, but with safety nets.** "you should build good verification systems so your agents can check if the thing works, but you should also build good safety nets." ([These 3 skills changed my life, 2026-10-26, 19:27](https://www.youtube.com/watch?v=5Bmp9cz1JN8&t=1167)). T3 Code ships "a nightly that goes out every 6 hours" (same video).

4. **Do not waste the team's attention.** "I don't want to throw a bunch of slop at my team." ([same video, 11:57](https://www.youtube.com/watch?v=5Bmp9cz1JN8&t=717)).

5. **Perceived performance is product quality.** From `AGENTS.md` (PR #4782): "Our users drive agents all day and notice a dropped frame, a lying spinner, and a stale label. No continuously repainting animations; they peg the GPU on high-refresh displays."

6. **Types come from a source of truth.** Current `AGENTS.md` (PR #4782): "Inferred types over annotations. `any` is the enemy." Older (2021), from his blog: "The type safety doesn't come from defining our own types. It comes from the source of truth being honored and all further contracts being inferred from that source." ([t3.gg/blog/post/types-and-nextjs](https://t3.gg/blog/post/types-and-nextjs)).

7. **Security has a place, but do not over-index.** `AGENTS.md` (PR #4782): "Security is important, but should not be over-indexed on, especially for dev mode/maintainer-only features."

**Inference — how he is different from the other six seats:** He reviews as the product owner and merge gate. His first questions are: Should this exist? Is it proven? Does it hurt the default user or the UI? Is it the smallest change? He does not focus on internal elegance (Hashimoto), line-level TypeScript style (Raad), measured speed (Nizipli), threat models (Valsorda), visual craft (Evil Rabbit), or motion polish (Kowalski). He overlaps with Raad on scope, but at the product and PR level ("one problem per PR", "not something we want in app"), not at the code level.

---

## Review checklist (what he checks or pushes back on)

Each item has at least one 2026 source. Older support is marked.

1. **Proof that it works. Screenshots for UI.**
   - "You need screenshots on PRs that make UI changes, cmon man" ([t3code#430](https://github.com/pingdotgg/t3code/pull/430#issuecomment-4017308777)).
   - "Closing until you add screenshots." ([t3code#420](https://github.com/pingdotgg/t3code/pull/420#issuecomment-4020473151)).
   - "This definitely needs before/after screenshots, ideally also a video of the loading in behavior (i hate layout shifts)" ([t3code#7378](https://github.com/pingdotgg/t3code/pull/7378#issuecomment-5366956219)).
   - Repo rule (PR #4782): "UI changes need before/after images. Motion or timing needs a short video."

2. **One problem per PR. Size is a reason to close.**
   - "Way too much shit for a pr, cmon man." ([t3code#552](https://github.com/pingdotgg/t3code/pull/552#issuecomment-4020405318)).
   - "Way too big for us to consider." ([t3code#470](https://github.com/pingdotgg/t3code/pull/470#issuecomment-4020593927)).
   - "Can you separate this into 2 PRs? First change seems sensical but the scroll to bottom seems like a lot of code changed and is also broken in the UI as-is" ([t3code#615](https://github.com/pingdotgg/t3code/pull/615#issuecomment-4021046409)).

3. **The problem statement must be true and current.**
   - "The problem that it states in the title is entirely inaccurate and does not reflect the current state of the problem or the solution." ([t3code#7909](https://github.com/pingdotgg/t3code/pull/7909#issuecomment-5420779627)).
   - "I haven't seen any of the issues this supposedly fixes for a while. If I'm wrong file a new up-to-date PR with the changes and clarity on how to get into the bad cases that it fixes" ([t3code#3520](https://github.com/pingdotgg/t3code/pull/3520#issuecomment-5562744579)).

4. **Defaults and the happy path for most users.**
   - "Default "download for MacOS" assumes x64. Unshippable sadly." ([t3code#401](https://github.com/pingdotgg/t3code/pull/401#issuecomment-4017387924)).
   - "This should not have been merged and it caused a bunch of users to incorrectly download the Intel build." ([t3code#4197](https://github.com/pingdotgg/t3code/pull/4197#issuecomment-5337608178)).
   - "Does this hide if you only have 1 environment? That will be the default case for most users so I don't want to clog up UI unnecessarily." ([t3code#7634](https://github.com/pingdotgg/t3code/pull/7634#issuecomment-5366975331)).
   - Repo rule: "any pull request that changes product defaults is not auto-approvable and requires human review." ([.macroscope/approvability.md](https://github.com/pingdotgg/t3code/blob/main/.macroscope/approvability.md), added in [#8603](https://github.com/pingdotgg/t3code/pull/8603) by Julius Marminge).
   - Older: "Not in love with requiring `url`, would like to set sane defaults since most users will be on happy path" ([uploadthing#310](https://github.com/pingdotgg/uploadthing/pull/310#pullrequestreview-1612120111)).

5. **Existing users must not break.**
   - "Will this force all existing users of CLI Web to deauth because the cookie is now named differently?" ([t3code#8085](https://github.com/pingdotgg/t3code/pull/8085#issuecomment-5448254245)).
   - "A quick read suggests this might break opening code-file links in IDE, can you confirm those are fine? If so will merge" ([t3code#599](https://github.com/pingdotgg/t3code/pull/599#issuecomment-4020900504)).

6. **Visible regressions: repaint, layout shift, render churn.**
   - "Biggest thing: There's a regression on starting new threads where the chat view gets populated, then a big visible repaint happens before the thread actually starts moving. Def need that fixed before we can ship." ([t3code#2451](https://github.com/pingdotgg/t3code/pull/2451#issuecomment-4362332653), 2026-05-02).
   - "This is super close. Want to make sure react state doesn't go out of sync." ([t3code#8569](https://github.com/pingdotgg/t3code/pull/8569#issuecomment-5460466783)).
   - Older: "This is gonna trigger a _shitload_ of re-renders, minimum 10 per item being uploaded." ([uploadthing#176](https://github.com/pingdotgg/uploadthing/pull/176#discussion_r1234788738)).

7. **UI clutter and attention cost.**
   - "Don't love this, feels unnecessary and makes UI feel crowded. Even ChatGPT doesn't include timestamps inline on mobile" ([t3code#7372](https://github.com/pingdotgg/t3code/pull/7372#issuecomment-5366910322)).
   - "Takes up way too much space sadly, branch names are too long for this to work" ([t3code#4425](https://github.com/pingdotgg/t3code/pull/4425#issuecomment-5066456748)).
   - "Generally I think people care too much about tool calls and we were intentional with our decision to make them look uninteresting" ([t3code#2451](https://github.com/pingdotgg/t3code/pull/2451#issuecomment-4362332653)).

8. **Fragile state and hot-path work.**
   - "Read code, don't really love the amount of persistence. Can cause weird issues down the road." ([t3code#302](https://github.com/pingdotgg/t3code/pull/302#issuecomment-4017376629)).
   - "This seems weird and fragile to put in a hot path." ([t3code#7373](https://github.com/pingdotgg/t3code/pull/7373#issuecomment-5366945252)).

9. **Fix the root cause everywhere, and in the right place.**
   - "Would prefer to fix this everywhere and not just one spot." ([t3code#569](https://github.com/pingdotgg/t3code/pull/569#issuecomment-4020617948)).
   - Repo rule "Hit every surface" (PR #4782): "The most common defect in this repo is a change that works on the path you tested and is missing everywhere else." Also: "If you added a way in, add the way out and the way to see it. Snooze needs unsnooze. Close needs reopen. A one-way door is a bug."
   - Upstream bugs go upstream: "You guys know this is an UPSTREAM NODE ISSUE right?? Why has everyone made it our problem and NOBODY has reported it to node???" ([t3code#23433](https://github.com/pingdotgg/t3code/issues/23433#issuecomment-6437172447)).

10. **Comment the "why" of a workaround, and nothing else.**
    - "Can you leave a comment as to "why" we do this in the places where it is done? This is one of those things that will silently be forgotten about and break again otherwise" ([t3code#495](https://github.com/pingdotgg/t3code/pull/495#issuecomment-4020233904)).
    - The repo rule (later) is strict: "Default to no comment. Write one only for a constraint, an external quirk, or an invariant the code can't show" ([AGENTS.md](https://github.com/pingdotgg/t3code/blob/main/AGENTS.md)).

11. **Maintenance and support cost of a feature.**
    - "This is the actual last thing I'd ever want to keep up to date and have to answer questions about. It would quickly become a support burden" ([t3code#7614](https://github.com/pingdotgg/t3code/pull/7614#issuecomment-5366990170)).

12. **Tests: signal only.** In his PR [#22557](https://github.com/pingdotgg/t3code/pull/22557) ("delete 11k low-signal tests", −258,735 lines, merged 2026-10-21), the body says the deleted tests "check things types already guarantee, mirror the code, or wait on real timers. They cost time and give no signal." His follow-up PR [#26166](https://github.com/pingdotgg/t3code/pull/26166) set this review rule: "In review, ask for a missing test only when it would catch a real regression." ([docs/internals/testing.md](https://github.com/pingdotgg/t3code/blob/main/docs/internals/testing.md)). The Macroscope test check tells the bot: "Ask only for fewer or smaller tests, never for more coverage." ([.macroscope/check-run-agents/test-signal.md](https://github.com/pingdotgg/t3code/blob/main/.macroscope/check-run-agents/test-signal.md)). (Both PR bodies say an agent wrote them.)

---

## What he praises or merges fast

- **Small, obvious fixes. He replies in one line.** "Good fix ty" ([t3code#224](https://github.com/pingdotgg/t3code/pull/224#issuecomment-4015208420)). "ty" ([t3code#465](https://github.com/pingdotgg/t3code/pull/465#issuecomment-4020251333)). "Thought I fixed this already, my bad. Ty." ([t3code#7676](https://github.com/pingdotgg/t3code/pull/7676#issuecomment-5365455049)).
- **Fixes that handle the hard edge case.** "Nice ty for doing this with arch detection" ([t3code#558](https://github.com/pingdotgg/t3code/pull/558#issuecomment-4020427198)). This is the same feature he called "Unshippable" when the PR assumed x64 (#401).
- **Good enough beats perfect.** "A bit overkill w/ the error boundary but whatever" (approved and merged, [t3code#279](https://github.com/pingdotgg/t3code/pull/279#pullrequestreview-3908460566)). Older: "Okay fiiiiiine" ([uploadthing#524](https://github.com/pingdotgg/uploadthing/pull/524#pullrequestreview-1785572906)).
- **He finishes good PRs himself.** "Will push a few small changes and get this merged" ([t3code#8569](https://github.com/pingdotgg/t3code/pull/8569#issuecomment-5460466783)).
- **Concept sign-off first, then the bots and the team.** "This concept has my sign-off. If you get this to the point where the review agents, ci and julius or maria are okay with it, more than happy to merge :)" ([t3code#16800](https://github.com/pingdotgg/t3code/pull/16800#issuecomment-6048441275)). "I am okay with this, review'd pretty hard." ([t3code#28414](https://github.com/pingdotgg/t3code/pull/28414#issuecomment-6556697069)).
- **Good-faith reliability work.** "reopening because this feels like a good faith attempt to make the Grok integration more reliable." ([t3code#7638](https://github.com/pingdotgg/t3code/pull/7638#issuecomment-5432253289)). Repo policy: "Focused bug fixes, reliability fixes, performance improvements, and maintenance work are the most likely to be accepted." ([CONTRIBUTING.md](https://github.com/pingdotgg/t3code/blob/main/CONTRIBUTING.md)).
- **Big UI passes get itemized feedback, not a rejection.** In [t3code#2451](https://github.com/pingdotgg/t3code/pull/2451#issuecomment-4362332653) he numbers each item ("3. The "glow" is a bit much", "32. This is so much better omfg") and ends with "Overall this is great and I can't wait to merge it".
- **Agent PRs with a clear problem and a demo.** "Sure, there's a bit of bot slop, but I think there are good comments in here too. Let me know when you've tested thoroughly, and if you have a video that you can use to demo it, let me know." ([t3code#8207](https://github.com/pingdotgg/t3code/pull/8207#issuecomment-5432134651)).
- **Readable PR text.** X post (2026-08-27, ID 2093125841408729320): "Biggest improvement isn't to code funny enough. The PR names and descriptions are 100% easier to understand. The code is better too since we push to keep changes simple and concise." ([x.com/theo/status/2093125841408729320](https://x.com/theo/status/2093125841408729320)). Unverified: I read this text from the search-index page title only, because X blocked the fetch. His `file-pr` skill shows the target style, "GOOD > ✅ perf(server): cut websocket frame size by 70%+ with gzipping".

---

## Tone and phrasing

- **Short, blunt, informal.** Lowercase "ty", "pls", "cmon man", "lol", "omfg", and swearing ("Way too much shit for a pr"). One-word closes: "No" ([t3code#215](https://github.com/pingdotgg/t3code/pull/215#issuecomment-4015228904), a Dockerfile PR) and "Nah" ([t3-cloneathon#11](https://github.com/T3-Content/t3-cloneathon/pull/11#issuecomment-2974808236)).
- **Personal taste, said directly, often with a door left open.** "Don't love this", "I hate this", "Leaning no, so closing, but I can be convinced if others want it enough." ([t3code#7634](https://github.com/pingdotgg/t3code/pull/7634#issuecomment-5366975331)). "Blur is a _little_ too intense but I'm convince-able" ([t3code#2451](https://github.com/pingdotgg/t3code/pull/2451#issuecomment-4362332653)).
- **He admits mistakes fast.** "OH I misunderstood, reopening" ([t3code#500](https://github.com/pingdotgg/t3code/pull/500#issuecomment-4020501566)).
- **Harsh with low-effort or bad-etiquette PRs.** "Did you ignore the contribution instructions entirely? lol. Nobody's reviewing 4k lines of your slop." ([t3code#600](https://github.com/pingdotgg/t3code/pull/600#issuecomment-4020786398)). "Tagging a bunch of us doesn't make us more likely to merge, it just makes me want to block you from the repo." ([t3code#533](https://github.com/pingdotgg/t3code/pull/533#issuecomment-4020394805)). "This PR is an atrocity" ([t3code#7909](https://github.com/pingdotgg/t3code/pull/7909#issuecomment-5420779627)).
- **Rejects with a recovery path.** On #7909: "If you want to fix this: 1. Cut an issue that actually describes the problem. 2. Follow up with a concise fix that doesn't touch a single Markdown file and actually fixes the problem as described."
- **Visual feedback by screenshot.** A screenshot, then "This looks awful" ([t3code#5789](https://github.com/pingdotgg/t3code/pull/5789#issuecomment-5299346148)). "Can you make it slightly less hideous? Like a fainter yellow" ([t3code#5972](https://github.com/pingdotgg/t3code/pull/5972#issuecomment-5299318288)).
- **Inference for the seat voice:** Use a short verdict first ("Unshippable", "Leaning no", "Good fix ty"). Then give one concrete reason tied to a user or a default. Then say what would change the decision ("I can be convinced if…", "Closing until you add screenshots."). Do not write long essays. Note: the repo's own policy for automated closures asks for "Feedback should be firm, specific, and free of insults" ([CONTRIBUTING.md](https://github.com/pingdotgg/t3code/blob/main/CONTRIBUTING.md)). A seat skill should copy his directness, not his insults.

---

## Hard "no"s

1. **UI change with no before/after evidence** → closed (#420, #430, #326, where he quotes "no screenshot" and replies "Closing" [t3code#326](https://github.com/pingdotgg/t3code/pull/326#issuecomment-4016165488)).
2. **Multi-problem or huge unsolicited PRs** → closed (#470, #552, #600). The repo rule is that a PR "that solves multiple independent problems must be split" ([CONTRIBUTING.md](https://github.com/pingdotgg/t3code/blob/main/CONTRIBUTING.md#one-problem)).
3. **A PR that changes review rules or criteria to pass its own review** → "It changes the review rule criteria because it couldn't pass reviews because of how much of a mess it is." ([t3code#7909](https://github.com/pingdotgg/t3code/pull/7909#issuecomment-5420779627)). Related repo rule: a PR that "adds or broadens a directive that disables or suppresses a lint, type-checker, LSP, or other static-analysis diagnostic is not auto-approvable" ([.macroscope/approvability.md](https://github.com/pingdotgg/t3code/blob/main/.macroscope/approvability.md)).
4. **A wrong default that sends most users down the wrong path** → "Unshippable" (#401, #4197).
5. **Features he does not want to own** → "Not interested in toggleable sidebar at this time." ([t3code#260](https://github.com/pingdotgg/t3code/pull/260#issuecomment-4020591044)). "Very stale, not really something we want to do in app" ([t3code#5287](https://github.com/pingdotgg/t3code/pull/5287#issuecomment-5214158146), container support). "No" to font settings ([t3code#629](https://github.com/pingdotgg/t3code/pull/629#issuecomment-4021782428)).
6. **Dockerfiles in app repos** → "No" ([t3code#215](https://github.com/pingdotgg/t3code/pull/215#issuecomment-4015228904)). Older, same answer: "Please do not do this" ([create-t3-app#78](https://github.com/t3-oss/create-t3-app/issues/78#issuecomment-1172115027)) and "No." ([quickpic#92](https://github.com/t3dotgg/quickpic/pull/92#issuecomment-2495772234)).
7. **Unsupported runtimes and platform hacks** → "We do not support Bun and probably won't ever support it for the runner." ([t3code#204](https://github.com/pingdotgg/t3code/issues/204#issuecomment-4015110782)). "If there is ONE MORE REGRESSION FOR ARM LINUX that exists OUTSIDE OF OUR CODEBASE, I will be killing Arm builds forever" ([t3code#23433](https://github.com/pingdotgg/t3code/issues/23433#issuecomment-6437172447)).
8. **Code written by certain models** (project policy, added in his PR [#19286](https://github.com/pingdotgg/t3code/pull/19286); see [CONTRIBUTING.md#models](https://github.com/pingdotgg/t3code/blob/main/CONTRIBUTING.md#models)). Do not make this a general review rule.
9. **Offline and local-first work, for now** → "wontfix for a long ass time. We are not prioritizing offline behavior until we have fixed pretty much everything else." ([t3code#9114](https://github.com/pingdotgg/t3code/issues/9114#issuecomment-5502376629)).

---

## Heuristics that generalize to a TypeScript web app (Next.js, React, API routes, DB)

Each heuristic shows its source, or says "Inference".

1. **Ask "who is the default user?" for every new option, flag, or UI element.** Hide controls that only matter in rare cases. Never change a default without a human sign-off. (#7634, #401, #4197, approvability.md, uploadthing#310.)
2. **Require proof that matches the change.** UI: before/after captures, plus a video for motion or loading. Logic bug: a failing test first. Server-only: a test plus a short runtime transcript. ([testing.md](https://github.com/pingdotgg/t3code/blob/main/docs/internals/testing.md): "Purely visual bugs … get before/after captures as their proof and no test").
3. **Flag visible jank as a blocker:** layout shift, repaint on navigation, spinners that lie, labels that go stale, continuous animations (#2451, #7378, AGENTS.md "Taste").
4. **React: derive, do not sync.** "React effects are for synchronizing with something outside React. Derive in render and act in handlers instead of syncing state" ([AGENTS.md](https://github.com/pingdotgg/t3code/blob/main/AGENTS.md); in T3 Code a lint rule makes every effect state its reason). Watch for state that "goes out of sync" (#8569).
5. **Types flow from one source of truth across the wire.** Schemas live in one contracts package. Infer, do not annotate. No `any`. ("Contracts. Anything crossing the wire is typed in `packages/contracts`. Change the schema and the server, web, mobile, and desktop all follow." — AGENTS.md; 2021 blog post.)
6. **Keep client and server versions in lockstep.** "the amount of bugs that occur when your front end and back end are out of sync is absurd." ([I moved off of Next.js, 2026-01-07, 9:17](https://www.youtube.com/watch?v=Sc5ca-VJdxY&t=557)). Older: "Concern w/ this solution is it breaks the "contract" - the types in dev will not necessarily be the same as in prod." ([uploadthing#22](https://github.com/pingdotgg/uploadthing/pull/22#issuecomment-1542962364)).
7. **Use the framework the way it is built, or leave it.** "If the [Next.js] router is not the right router for your app, then [Next.js] is not the right framework for your app, move out of it." ([same video, 15:03](https://www.youtube.com/watch?v=Sc5ca-VJdxY&t=903)). He moved T3 Chat to TanStack Start. He still defends RSC in general: "I was wrong and ended up really, really liking server components to the point where I was their main defender." ([Watch this if you hate React Server Components, 2025-10-31, 0:28](https://www.youtube.com/watch?v=C84YEp-8-hI&t=26)). **Inference:** the rule is "client and server boundaries must match the app's real interaction model", not "RSC good" or "RSC bad".
8. **Prefer boring, proven building blocks, but delete small libraries that fight you.** "I wanted to bet on boring tech." ([I moved off of Next.js, 5:26](https://www.youtube.com/watch?v=Sc5ca-VJdxY&t=324)). Then, in 2026: "it's actually more convenient to just rip it out and rewrite it using prompts than it is to try and massage around the library" ([I don't really use libraries anymore, 2026-01-23, 1:00](https://www.youtube.com/watch?v=u9P3CKwtRnM&t=58)). **Inference:** the evidence is mixed, so "boring tools" is not a hard rule. Flag a new dependency when it adds weight or fights the framework (older: "I don't think Framer is necessary for this project" — [quickpic#72](https://github.com/t3dotgg/quickpic/pull/72#pullrequestreview-2431408362)).
9. **Watch bandwidth and egress, not only compute.** "Every time I see one of those viral bills where it's like, "Oh my god, Vercel cost me $5,000." All but one of those instances, it was bandwidth." ([Where Should You Deploy In 2026?, 2026-02-16, 13:50](https://www.youtube.com/watch?v=yfxDdQo2cyI&t=830)). "It is not the right solution for any static asset that is bigger than like 400 KB." ([14:43](https://www.youtube.com/watch?v=yfxDdQo2cyI&t=883)). "Free egress is a ticking timer in my opinion." ([30:06](https://www.youtube.com/watch?v=yfxDdQo2cyI&t=1806)). **Review rule:** flag big files in `public/`, and flag images or video served from the app CDN when blob storage fits better.
10. **AI cost is a real cost.** "Real agent turns cost money. … Use a real provider only when the change depends on that provider's behavior, and then pick its cheapest model" ([AGENTS.md](https://github.com/pingdotgg/t3code/blob/main/AGENTS.md)). In #2451 he asks: "do tool call summaries use inference? Not sure how I feel about that being on by default." **Review rule:** flag new default-on LLM calls.
11. **DB and integration state: prefer a pull/sync model over partial updates.** Older but direct: "Race conditions don't matter on a pull model." ([stripe-recommendations#6](https://github.com/t3dotgg/stripe-recommendations/issues/6#issuecomment-2586053909)). "adding status to the unique constraint sounds like a race condition disaster waiting to happen." ([uploadthing#948](https://github.com/pingdotgg/uploadthing/issues/948#issuecomment-2401198212)).
12. **Reviews must not grow the diff.** "Do not let review feedback expand the PR beyond the user's original goal. Address real shortcomings, but avoid scope creep." ([AGENTS.md & SKILLS.md Breakdown, 12:15](https://www.youtube.com/watch?v=e1snsuY4lTI&t=735), read from his babysit skill). He saw "the PR getting three times larger than it should have been because it would address every single comment like it was mission critical" ([11:03](https://www.youtube.com/watch?v=e1snsuY4lTI&t=663)).

---

## Agent skills he publishes or uses

### Published: `t3dotgg/tstack`
- "The agent skills I use every day. Works with Claude Code and Codex." Created 2026-10-24. About 2.6k stars. MIT. Repo: [github.com/t3dotgg/tstack](https://github.com/t3dotgg/tstack). Linked from the video "These 3 skills changed my life" (2026-10-26): "Oh also I did make tstack... https://github.com/t3dotgg/tstack".
- Path pattern: `skills/<name>/SKILL.md`.

| Skill | Path | What it does (from README / SKILL.md) |
|---|---|---|
| `council` | `skills/council/SKILL.md` | "Gets review from three models from different providers, and loops until they agree." Asks each delegate for a score out of 10. Writes a "Council review" table in the PR description. Ends with: "Do not let repeated reviews result in scope creep. It is your job to fight to keep scope limited." |
| `sol-loop` | `skills/sol-loop/SKILL.md` | Review with OpenAI GPT Sol in a loop. "Make the most minimal possible changes to appease the Sol reviewers. Be careful of scope creep and don't be scared to push back." Budget of 3 rounds (5 only for security, permissions, auth, data loss, or state/concurrency). Severity scale: "blocker = intended case wrong. should = real bug callers will hit, in intent. nit = rest." |
| `file-pr` | `skills/file-pr/SKILL.md` | "Files a short PR that leads with the problem, not an inventory of changes." Ends the PR with the model and harness. |
| `full-send` | `skills/full-send/SKILL.md` | Finish → prove → sol-loop → file-pr → babysit → merge, with nobody watching. It has a "Merge gate" and a "Proof" section ("Green mocked tests do not prove that the user experience works."). |
| `full-stop` | `skills/full-stop/SKILL.md` | Same as `full-send`, but stops before the merge. |
| `babysit-pr` | `skills/babysit-pr/SKILL.md` (+ `scripts/pr-wait`, needs `python3`) | Watches CI and review bots, and fixes the real findings. |
| `modernize` | `skills/modernize/SKILL.md` | Rebase an old PR and decide MODERNIZE / REWORK / CLOSE. "Be willing to recommend `CLOSE`. Age alone is not evidence, and sunk effort is not a reason to keep a PR alive." |
| `takeover` | `skills/takeover/SKILL.md` | Finish someone else's PR, branch, or agent thread, and keep their credit. |
| `leaving-pr-comments` | `skills/leaving-pr-comments/SKILL.md` | Formats agent comments with the "🤖 … responding on behalf of …" header. |

- **Install.** The README's official method is `git clone https://github.com/t3dotgg/tstack`, then `cp -R tstack/skills/* ~/.claude/skills/`. The `skills` CLI also reads `skills/<name>/SKILL.md` ([vercel-labs/skills docs: "Skill Discovery"](https://github.com/vercel-labs/skills/blob/main/docs/creating-skills.md)), so this form should work: `npx skills add t3dotgg/tstack --skill council`. I did not run it.
- **Dependencies** (README): "`full-send` uses `sol-loop`, `file-pr`, and `babysit-pr`. `full-stop` uses `full-send`. `takeover` uses `modernize`, `file-pr`, `babysit-pr`, and `leaving-pr-comments`." The `council` and `sol-loop` skills need subagents on models from other providers.
- **Most relevant for a seat:** `council` (the scoring format) and `sol-loop` (severity scale, round budget, "Hold to the smallest change. Flag code, tests, or guards the intent does not need.").

### In the T3 Code repo: `pingdotgg/t3code/.agents/skills/` (`.claude/skills` is a symlink to it)
- `contribution-triage` — "Enforce T3 Code's PR contribution policy by closing ineligible submissions and triggering Macroscope review". Written by Julius Marminge (#14480).
- `test-t3-app` — browser checks against an isolated dev state.
- `test-t3-mobile` — mobile checks.
- These are specific to the repo. `npx skills add pingdotgg/t3code --skill contribution-triage` should resolve, because `.agents/skills/` is a discovery path, but the skill depends on T3 Code files.
- **Review-bot prompts** (not skills, but his review criteria in prompt form): `.macroscope/check-run-agents/test-signal.md` (from his PR #26166), `ui-consistency.md`, `effect-service-conventions.md`, and `.macroscope/approvability.md`.

### Skills he says he uses from others
- **Matt Pocock's grilling skill:** "I still love pulling out the Matt Pocock grilling skill here and there" ([These 3 skills changed my life, 3:19](https://www.youtube.com/watch?v=5Bmp9cz1JN8&t=199)). Path: `mattpocock/skills` → `skills/productivity/grilling/SKILL.md`. He thanked Matt on PR [mattpocock/skills#879](https://github.com/mattpocock/skills/pull/879#issuecomment-5304847197) ("Remove em-dashes from grilling skill"). Install: `npx skills add mattpocock/skills --skill grilling`.
- **Not published:** his global `AGENTS.md` ("You can't. I very intentionally not publish this file." — [AGENTS.md & SKILLS.md Breakdown, 9:00](https://www.youtube.com/watch?v=e1snsuY4lTI&t=540)) and his "custom file upload skill" for R2 ([12:04](https://www.youtube.com/watch?v=e1snsuY4lTI&t=722)).
- **AI review bots on his repos:** Macroscope, CodeRabbit, Cursor Bugbot, and Greptile (named in the 3-skills video, 6:50; `.coderabbit.config.ts` and `.macroscope/` are in the repo).

---

## Sources

**GitHub — profile and repos**
- https://github.com/t3dotgg (API: company, bio)
- https://github.com/t3dotgg/t3dotgg (profile README, updated 2026-10-29)
- https://github.com/t3dotgg/tstack and its `skills/*/SKILL.md`
- https://github.com/pingdotgg/t3code — `AGENTS.md`, `CONTRIBUTING.md`, `docs/internals/testing.md`, `.github/pull_request_template.md`, `.macroscope/approvability.md`, `.macroscope/check-run-agents/*.md`, `.agents/skills/*`
- PRs by him: [#4782](https://github.com/pingdotgg/t3code/pull/4782), [#22557](https://github.com/pingdotgg/t3code/pull/22557), [#26166](https://github.com/pingdotgg/t3code/pull/26166), [#26167](https://github.com/pingdotgg/t3code/pull/26167), [#19286](https://github.com/pingdotgg/t3code/pull/19286)
- https://github.com/vercel-labs/skills/blob/main/docs/creating-skills.md (discovery paths)

**GitHub — his comments.** Every comment, review and inline comment quoted above is linked inline with its anchor. High-weight items are in `pingdotgg/t3code` (2026). Low-weight items are in `pingdotgg/uploadthing`, `t3-oss/create-t3-app`, `t3dotgg/quickpic`, `t3dotgg/stripe-recommendations` and `T3-Content/*` (2022–2025).

**YouTube (auto-captions)**
- These 3 skills changed my life — 2026-10-26 — https://www.youtube.com/watch?v=5Bmp9cz1JN8
- T3 Code broke me — 2026-10-29 — https://www.youtube.com/watch?v=uLGxb4F3SyI ("we have kept T3 code almost like absurdly unopinionated." at [16:04](https://www.youtube.com/watch?v=uLGxb4F3SyI&t=964); "Every time you open a thread, the goal should be to close it." at [16:15](https://www.youtube.com/watch?v=uLGxb4F3SyI&t=975))
- My AGENTS.md & SKILLS.md Breakdown (Don't copy them) — 2026-08-11 — https://www.youtube.com/watch?v=e1snsuY4lTI
- Write Code You Will Never Read Again — 2026-07-22 — https://www.youtube.com/watch?v=434cG4g5KLE ("if your code is that important, you should be writing an unbelievable amount of slop. Not to put in your product, but to verify your product." at [9:14](https://www.youtube.com/watch?v=434cG4g5KLE&t=554))
- Stop Pretending You Understand Your Codebase — 2026-09-07 — https://www.youtube.com/watch?v=5KvY8CnBB3w
- Where Should You Deploy In 2026? — 2026-02-16 — https://www.youtube.com/watch?v=yfxDdQo2cyI
- I don't really use libraries anymore — 2026-01-23 — https://www.youtube.com/watch?v=u9P3CKwtRnM
- I moved off of Next.js — 2026-01-07 — https://www.youtube.com/watch?v=Sc5ca-VJdxY
- Watch this if you hate React Server Components — 2025-10-31 — https://www.youtube.com/watch?v=C84YEp-8-hI
- Channel feed: https://www.youtube.com/feeds/videos.xml?channel_id=UCbRP3c757lWg9M-U7TyEkXA

**Blog**
- https://t3.gg/blog (index)
- https://t3.gg/blog/post/what-is-a-harness (2026-10-22)
- https://t3.gg/blog/post/types-and-nextjs (2021-12-02)

**X (text from search-index titles only; not opened)**
- https://x.com/theo/status/2093125841408729320 (2026-08-27, from the snowflake ID)
- https://x.com/theo/status/2093125623334232254 (2026-08-27): "It's crazy how much the quality of PRs to T3 Code has improved after fine tuning the agentsmd/claudemd"
- https://x.com/theo/status/2098769191226740966 (2026-09-12): "@dhh I feel you man. We’re at like 300 a day for T3 Code 🫠 Agent triaging is the only reason we can survive. Thankfully our surface area is way less risky"

**Gaps and limits**
- X posts could not be opened. I could not check reply threads or exact text beyond the page titles.
- No HN material was found that adds to the above.
- In 2026, most text under his name is agent-written. His human review voice is about 100 short comments, which is thin for line-level code taste.
- Full-stack type safety and tRPC show up in his values and docs, not in 2026 review comments. Local-first sync is not a current lens (he removed T3 Chat's custom sync engine, and offline is "wontfix").
- The `npx skills add` commands are not tested.

---

## Update 2026-11-03: recent posts

Source: 256 of his own X posts, 2026-10-22 to 2026-11-03, read through the fxtwitter timeline API. Quotes are verbatim.

- Role. Bio: "Full time CEO @t3dotcodes & @t3dotchat. Part time YouTuber, investor, and developer" (https://x.com/theo).
- Scale: "Almost $5m/day in tokens going through T3 Code 🤯 Almost at 750,000 installations. 100k DAUs will be hit this week." (https://x.com/theo/status/2114897663821038017)
- Evals as proof (4 posts): "turned them into a generic eval I can run to test changes to the tools and their descriptions" and "Step 5: merge it (because error rates are better now)" (https://x.com/theo/status/2114955695434993702).
- Size is a cost (3 posts): "Just had an agent's PR get blocked because it added 100 bytes to a payload. You can prevent the slop, you just have to care enough to do it." (https://x.com/theo/status/2115611204001661029)
- Slow networks (4 posts): "Pretty sure we're the only major player that's measuring their load times in 3g speeds" (https://x.com/theo/status/2114353462825886096)
- Agents are a surface (4 posts): "If I have to go to a dashboard to use your product, I'm not going to use your product." (https://x.com/theo/status/2115260769558478964)
- Nightly as QA: "nightly users are our QA team" (https://x.com/theo/status/2114631715201376709)
- Platform cost: "One of my biggest regrets is letting the team support this garbage." (Windows ARM, https://x.com/theo/status/2115347721255350602)
- Change of mind on hard "no" 5: "T3 Code has /btw and side chats now. I caved." (https://x.com/theo/status/2116446018506236371). A feature that many users ask for now often ships as an opt-in.
- Merging: "If you're still merging most PRs by hand, you're behind" (https://x.com/theo/status/2114479901416071208)
- On persona seats: "Defined roles and "agent" archetypes are so 2024" (https://x.com/theo/status/2117086643547177469). His own council uses one model from each provider, not roles.
