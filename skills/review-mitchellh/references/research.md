# Mitchell Hashimoto (mitchellh): code-review research

Research date: 2026-10-30. Weighting: late 2025 to Oct 2026 highest.
Main corpus: about 90 ghostty-org/ghostty PRs he reviewed (reviews, inline comments, conversation comments, pulled with `gh api`), his own recent PR bodies, the contribution docs he wrote, his blog, and HN comments.
Every quote below is verbatim (I kept original typos such as "its", "lets", "draggign"). Inline links point to the exact review or comment. "Inference" marks my own reading.

Link key: `PR#N r` = review (`#pullrequestreview-ID`), `d` = inline diff comment (`#discussion_rID`), `c` = conversation comment (`#issuecomment-ID`).

---

## Current focus (what he works on now)

- **libghostty / libghostty-vt is the main technical work.** In the Ghostty 1.4 HN thread (2026-10-27) he wrote: "I plan on tagging libghostty 1.0 in the next few months and declaring ABI stability at that point!" ([HN](https://news.ycombinator.com/item?id=50262760)). In the same comment: "Libghostty powers all JetBrains IDE terminals, over 12.5 million active users." It also says libghostty is built and tested in CI for Apple platforms, Windows, Linux, FreeBSD, Android, WASM, and freestanding targets.
  - His own PRs, Sep to Oct 2026: FreeBSD support ([#14867](https://github.com/ghostty-org/ghostty/pull/14867), 10-27), `vt_write_until` ([#14802](https://github.com/ghostty-org/ghostty/pull/14802), 10-21), Kitty graphics moved into RenderState ([#14789](https://github.com/ghostty-org/ghostty/pull/14789), [#14780](https://github.com/ghostty-org/ghostty/pull/14780)), terminal search API ([#14097](https://github.com/ghostty-org/ghostty/pull/14097)), and memory cuts per terminal ([#14130](https://github.com/ghostty-org/ghostty/pull/14130), [#14137](https://github.com/ghostty-org/ghostty/pull/14137), [#14138](https://github.com/ghostty-org/ghostty/pull/14138), early Sep 2026).
- **Security hardening of the VT/terminal input surface (Oct 2026).** Escape injection through directory names ([#14859](https://github.com/ghostty-org/ghostty/pull/14859)), hostile tmux layouts ([#14858](https://github.com/ghostty-org/ghostty/pull/14858)), u16 row overflow ([#14856](https://github.com/ghostty-org/ghostty/pull/14856)), use-after-free when scrollback prunes ([#14686](https://github.com/ghostty-org/ghostty/pull/14686)), untrusted links and paths on macOS ([#14683](https://github.com/ghostty-org/ghostty/pull/14683), [#14688](https://github.com/ghostty-org/ghostty/pull/14688)), and paste protection ([#14679](https://github.com/ghostty-org/ghostty/pull/14679), [#14687](https://github.com/ghostty-org/ghostty/pull/14687)).
- **Ghostty 1.4 shipped 2026-10-27** (commit "Bump version to 1.4.0"). Releases come every 6 months: "We run on a 6 month release cycle" ([HN, 2026-10-07](https://news.ycombinator.com/item?id=49996923)). After the release he started CI speed work: "Test on main takes over an hour and I'm tired of it." ([#14911](https://github.com/ghostty-org/ghostty/pull/14911), 2026-10-28).
- **New terminal protocol: OSC 7501 Program Status** (spec plus [blog, 2026-10-06](https://mitchellh.com/writing/program-status-osc7501); PRs [#14560](https://github.com/ghostty-org/ghostty/pull/14560), [#14630](https://github.com/ghostty-org/ghostty/pull/14630)). The blog says it "emerged from my work on Superlogical and Ghostty".
- **Superlogical, his new company** ([blog, 2026-07-29](https://mitchellh.com/writing/superlogical)). It ships a terminal multiplexer first: "We will build on libghostty exactly as it was designed to be used: as a public building block for terminal applications." He also mentioned "a fully supported Swift framework for macOS and iOS on top of libghostty-vt" that Superlogical will maintain ([#13767 c](https://github.com/ghostty-org/ghostty/pull/13767#issuecomment-5272194278), 2026-08-12).
- **Moving Ghostty off GitHub** ([blog, 2026-04-28](https://mitchellh.com/writing/ghostty-leaving-github)): "This is no longer a place for serious work if it just blocks you out for hours per day, every day." Inference: on 2026-10-30 the GitHub repo still takes PRs and merges every day, so the migration is not finished yet.
- **Contribution trust tooling.** He released [mitchellh/vouch](https://github.com/mitchellh/vouch) (Feb 2026), and Ghostty uses it to gate first-time contributors. Ghostty became a non-profit on 2025-12-03 ([blog](https://mitchellh.com/writing/ghostty-non-profit)).
- **Zig.** He keeps up with Zig releases (Zig 0.16 work, e.g. [#12259](https://github.com/ghostty-org/ghostty/pull/12259)), maintains `mitchellh/zig-overlay` (commits up to 2026-10-30), and pledged another $400K to the Zig Software Foundation ([blog, 2026-06-21](https://mitchellh.com/writing/zig-donation-2026)). Recent technical posts: Tripwire error-path testing (Jan 2026), SIMD (Jul 2026), simdutf without libc++ (Apr 2026).

---

## Core values

1. **The contributor must understand the change. Disclosed AI use is fine.** "**The most important rule: you must understand your code.**" ([CONTRIBUTING.md](https://github.com/ghostty-org/ghostty/blob/main/CONTRIBUTING.md)). In his own work: "I'm not shipping code I don't understand." ([Vibing a Non-Trivial Ghostty Feature](https://mitchellh.com/writing/non-trivial-vibing))
2. **Small, single-purpose changes.** "The major issue is I think this PR spans too many subsystems" ([#12068 r](https://github.com/ghostty-org/ghostty/pull/12068#pullrequestreview-4052932442)). Also: "smaller chunks of work are easier to review, understand, and iterate on." ([vibing post](https://mitchellh.com/writing/non-trivial-vibing))
3. **Fix the root cause where it starts.** "I think we should instead verify this bug in resize and fix it there, rather than band-aid it elsewhere." ([#14260 d](https://github.com/ghostty-org/ghostty/pull/14260#discussion_r4047157528))
4. **Clean layers and generic, stable public APIs.** "This is some abstraction leakage here. Ideally we can reuse this callback for ANY type of clipboard set protocol" ([#13182 d](https://github.com/ghostty-org/ghostty/pull/13182#discussion_r3523860174)). Also: "we should not be introducing ~24 symbols to the C ABI that we have to commit to." ([#14511 r](https://github.com/ghostty-org/ghostty/pull/14511#pullrequestreview-5406294308))
5. **Hot paths are protected and performance claims need numbers.** "`print` is the HOTTEST path in libghostty and I want to make sure this is thoughtfully done." ([#14552 r](https://github.com/ghostty-org/ghostty/pull/14552#pullrequestreview-5431335207)). His own PRs include before/after tables and the line "no noticeable change" ([#14138](https://github.com/ghostty-org/ghostty/pull/14138)).
6. **Evidence and reference behavior beat opinion.** "Can you produce some minimal shell scripts that prove a divergence with xterm here?" ([#14362 r](https://github.com/ghostty-org/ghostty/pull/14362#pullrequestreview-5312728270)). He also tests his own claims: "Okay, I'm wrong! `publish` **does** retain self." ([#13092 c](https://github.com/ghostty-org/ghostty/pull/13092#issuecomment-4802774548))
7. **Tests prove the fix.** "Please add a test that would've failed without this fix." ([#14262 r](https://github.com/ghostty-org/ghostty/pull/14262#pullrequestreview-5259189091)). Error paths get tests too: "error cleanup is one of the most error-prone parts of Zig programs" ([Tripwire post](https://mitchellh.com/writing/tripwire))
8. **Maintainer time is the scarce resource.** "It is rude and disrespectful to approach this boundary with low-effort, unqualified work, since it puts the burden of validation on the maintainer." ([AI_POLICY.md](https://github.com/ghostty-org/ghostty/blob/main/AI_POLICY.md)). Also: "Every PR has an associated human cost on the other side to review and fix up or provide feedback." ([#11537 c](https://github.com/ghostty-org/ghostty/pull/11537#issuecomment-4076333160))
9. **Simplicity and no speculative scaffolding.** "I recommend simplifying by removing the generic wrapper for now. I think that's going to hang this whole thing up." ([#10328 r](https://github.com/ghostty-org/ghostty/pull/10328#pullrequestreview-3666021526))
10. **Release risk management.** "Complex features need time to bake" ([#9756 c](https://github.com/ghostty-org/ghostty/pull/9756)). Also: "I don't want to risk something in the core parse table for 1.3." ([#11216 r](https://github.com/ghostty-org/ghostty/pull/11216#pullrequestreview-3911971798))

---

## Review checklist (what he checks or pushes back on)

1. **Does the PR do one thing?** If it does more, he asks for a split, even when the commits are already separate.
   - "There seem to be multiple fixes in this PR, can you please split them up." ([#14701 r](https://github.com/ghostty-org/ghostty/pull/14701#pullrequestreview-5523348584))
   - "I know you broke it down by commit but it'd be easier to review and merge separate PRs." ([#14450 r](https://github.com/ghostty-org/ghostty/pull/14450#pullrequestreview-5351242825))
   - "The other two changes are acceptable, if you split them out." ([#14273 r](https://github.com/ghostty-org/ghostty/pull/14273#pullrequestreview-5259190671))
   - He also separates risk levels: "the PageList changes require far higher scrutiny." ([#14701 r](https://github.com/ghostty-org/ghostty/pull/14701#pullrequestreview-5523348584))
2. **Is the fix in the right layer, or is it a band-aid?**
   - "This isn't the right way to do this, because the terminal program can undo it via standard sequences." ([#12252 r](https://github.com/ghostty-org/ghostty/pull/12252#pullrequestreview-4095663541))
   - "It doesn't seem like a surface should have any business freeing the entire app (which owns N surfaces)." ([#13364 r](https://github.com/ghostty-org/ghostty/pull/13364#pullrequestreview-4723256733))
   - "Special casing by field is not the right long term maintainable solution" ([#10200 r](https://github.com/ghostty-org/ghostty/pull/10200#pullrequestreview-3633208010))
3. **Duplication.** Shared logic must have one home.
   - "It feels like this and linkAtPos should somehow be shared/unified." ([#10132 d](https://github.com/ghostty-org/ghostty/pull/10132#discussion_r2656807998))
   - "The worst part is you duplicated the process info enum I think 6 times lol." ([#11639 r](https://github.com/ghostty-org/ghostty/pull/11639#pullrequestreview-3976073599))
4. **One path, not a new API per symptom.** Lifecycle and teardown should go through one idempotent path.
   - "my motivation is just to try to bring together all the "close" paths through one path rather than more APIs." ([#9760 c](https://github.com/ghostty-org/ghostty/pull/9760#issuecomment-5079156048))
   - "The intention of `deinit` is that we should be waiting for the process to exit, it shouldn't require a separate call and wait." ([#9760 r](https://github.com/ghostty-org/ghostty/pull/9760#pullrequestreview-3564432247))
5. **Abstraction leaks and knowledge in the wrong layer.** A component must not know about its callers or about how its data was sourced.
   - "Red flag. I don't think tunneling this type of information deep into the core of the config is the right way to do this." ([#11277 d](https://github.com/ghostty-org/ghostty/pull/11277#discussion_r2912824418))
   - "I don't want `SurfaceDragSource` aware of our other classes, so a protocol would be a better approach" ([#10129 r](https://github.com/ghostty-org/ghostty/pull/10129#pullrequestreview-3636102777))
   - "for apprt authors there doesn't have to be any awareness these come from OSC 133." ([#9134 d](https://github.com/ghostty-org/ghostty/pull/9134#discussion_r2423148969))
6. **Public API / ABI shape.** Use generic, extensible surfaces. Add few symbols. Prefer tagged unions and `_set` functions over new callbacks and option structs.
   - "The `kitty_dnd` effect is too specific. We try to make our libghostty effects generic so that they can be shared by multiple protocols" ([#14511 r](https://github.com/ghostty-org/ghostty/pull/14511#pullrequestreview-5406294308))
   - "it'd be nicer this way than introducing more callback functions." ([#14610 d](https://github.com/ghostty-org/ghostty/pull/14610#discussion_r4238858899))
   - "I've fallen out of favor of options structs and prefer `_set` methods unless there are truly required items." ([#14815 d](https://github.com/ghostty-org/ghostty/pull/14815#discussion_r4373618476))
   - "the patterns we pick here are likely to extend to what we do with other APIs." ([#9240 d](https://github.com/ghostty-org/ghostty/pull/9240#discussion_r2441233065))
7. **Supported surface vs internal surface.** He does not take features for internal APIs that nobody downstream is supposed to use.
   - "`libghostty-vt` is the only downstream-supported lib version of Ghostty." ([#13767 c](https://github.com/ghostty-org/ghostty/pull/13767#issuecomment-5272194278))
   - He renamed internal artifacts because they are "Not meant for external use" ([#12214 c](https://github.com/ghostty-org/ghostty/pull/12214#issuecomment-4224010572))
8. **Hot-path changes need benchmarks against a baseline.**
   - "we're going to definitely have to test throughput of this one since `print` is the number one hot path." ([#10465 r](https://github.com/ghostty-org/ghostty/pull/10465#pullrequestreview-3712120382))
   - "Any way you can run (or prompt an agent to run) benchmarks for us against a baseline to see if this affects IO throughput." ([#13265 r](https://github.com/ghostty-org/ghostty/pull/13265#pullrequestreview-4665746224))
   - "requires significantly more benchmark data in a variety of scenarios." ([#13708 r](https://github.com/ghostty-org/ghostty/pull/13708#pullrequestreview-4891620242))
9. **Unjustified optimizations or extra retained state.**
   - "Not sure if this one has any justified performance associated with it to keep a high-water-mark buffer alongside the state at all times." ([#13930 r](https://github.com/ghostty-org/ghostty/pull/13930#pullrequestreview-4983465308))
   - "This is too much, can you find the rough number it actually needs and just bump towards that?" ([#11813 d](https://github.com/ghostty-org/ghostty/pull/11813#discussion_r2983319901))
10. **Wasted work: early exits, lazy decoding, no needless allocations.**
    - "This should short-circuit if write_pty is not set." ([#13332 d](https://github.com/ghostty-org/ghostty/pull/13332#discussion_r3582744198))
    - "if there is a tmux control client that attaches without the intention of reading output then its wasted CPU that is easy to avoid." ([#14273 r](https://github.com/ghostty-org/ghostty/pull/14273#pullrequestreview-5259190671))
    - "I think I'd rather avoid an allocation here if possible, so we should perhaps use a stack fallback allocator above this at max path bytes." ([#14625 d](https://github.com/ghostty-org/ghostty/pull/14625#discussion_r4241738638))
11. **Regression tests and testable design.**
    - "Please add a test that would've failed without this fix." ([#14262 r](https://github.com/ghostty-org/ghostty/pull/14262#pullrequestreview-5259189091))
    - "We should pull this out into a separate function that we have a set of unit tests for" ([#10905 r](https://github.com/ghostty-org/ghostty/pull/10905#pullrequestreview-3834324181))
    - "I don't like calling setenv and then getenv in tests." ([#10905 r](https://github.com/ghostty-org/ghostty/pull/10905#pullrequestreview-3842798106))
    - "everything in this file has a unit test and this should too" ([#9816 r](https://github.com/ghostty-org/ghostty/pull/9816#pullrequestreview-3545132825))
12. **No tests that are not needed, and tests that reflect how the code is really consumed.**
    - "Is this and any of the tests in stream.zig really necessary for this?" ([#14447 d](https://github.com/ghostty-org/ghostty/pull/14447#discussion_r4132754807))
    - "I'd actually prefer a C example that dynamically links to the DLL and we run that directly without Zig in CI." ([#14447 d](https://github.com/ghostty-org/ghostty/pull/14447#discussion_r4132762267))
13. **Proof of behavior: spec, reference implementation, or a runnable demo.**
    - "Can you link to the spec for me?" ([#14667 c](https://github.com/ghostty-org/ghostty/pull/14667#issuecomment-6147013090))
    - "I'd be curious to know what other terminals do with some verification (because LLMs will make that shit up)." ([#13333 r](https://github.com/ghostty-org/ghostty/pull/13333#pullrequestreview-4698651746))
    - "Can you show a demo shader so I can see what the benefit of this is and verify it works properly besides eyeballing it?" ([#9386 r](https://github.com/ghostty-org/ghostty/pull/9386#pullrequestreview-3393765901))
    - "I'd want evidence of the contrary before merging this." ([#13092 d](https://github.com/ghostty-org/ghostty/pull/13092#discussion_r3476575090))
14. **Does it work, or did it only work by luck?** He pulls the branch and runs it.
    - "Are you sure its working? Or are you just getting lucky?" ([#12419 r](https://github.com/ghostty-org/ghostty/pull/12419#pullrequestreview-4172993949))
    - "I pulled this down and tried it and it simply doesn't work for me at all." ([#11557 c](https://github.com/ghostty-org/ghostty/pull/11557#issuecomment-4069103822))
    - "In debug builds this throws an AppKit exception" ([#10253 c](https://github.com/ghostty-org/ghostty/pull/10253#issuecomment-3773874792))
15. **Hardcoded values and special cases.**
    - "Hardcoding shortcut values can't be the right path forward..." ([#11557 d](https://github.com/ghostty-org/ghostty/pull/11557#discussion_r2943574438))
    - "I don't love hardcoding these like this. I'd prefer if there was a way to check the current responder chain first." ([#10806 r](https://github.com/ghostty-org/ghostty/pull/10806))
16. **Types over sentinels, enums over booleans, explicit types, runtime safety.**
    - "We should use native Zig optionals here, not sentinel integral values." ([#11354 d](https://github.com/ghostty-org/ghostty/pull/11354#discussion_r2918740086))
    - "handle the possibility that an unknown value exists." ([#13606 d](https://github.com/ghostty-org/ghostty/pull/13606#discussion_r3717563116))
    - "Replace `commandPaletteIsShowing` with `commandPaletteState` and `CommandPaletteState` is an enum with 3 values: `hidden, command, jump`." ([#9970 d](https://github.com/ghostty-org/ghostty/pull/9970#discussion_r2635386858))
17. **Remove code with no purpose: dead flags, defaults nobody overrides, pointless logs.**
    - "Is this ever non-default?" ([#11018 d](https://github.com/ghostty-org/ghostty/pull/11018#discussion_r2854502750))
    - "Do we need this anymore?" ([#14052 d](https://github.com/ghostty-org/ghostty/pull/14052#discussion_r3906566685))
    - "Pointless log." ([#13332 d](https://github.com/ghostty-org/ghostty/pull/13332))
    - "A pure boolean safe/unsafe is fine." ([#12068 r](https://github.com/ghostty-org/ghostty/pull/12068#pullrequestreview-4052932442))
18. **Error handling, memory ownership, and concurrency at teardown.**
    - "The error handling looks unsafe..." ([#12146 d](https://github.com/ghostty-org/ghostty/pull/12146#discussion_r3041592812))
    - "I thought originally that during teardown we always drain queues. We should do that." ([#14444 r](https://github.com/ghostty-org/ghostty/pull/14444#pullrequestreview-5351274586))
    - "I feel like you may not want to depend on queues before you allocate/remove GPU resources." ([#14052 c](https://github.com/ghostty-org/ghostty/pull/14052#issuecomment-5445657916))
    - "Is it theoretically possible for placement count to exceed 2^30? Does anything limit this?" ([#13627 d](https://github.com/ghostty-org/ghostty/pull/13627#discussion_r3724437730))
19. **Dependency and CI hygiene.**
    - "Did you review the version diff by any chance? I usually do that prior to updating our dependencies" ([#10433 r](https://github.com/ghostty-org/ghostty/pull/10433#pullrequestreview-3701798801))
    - "I super don't want to depend on codeberg if we can help it." ([#12259 d](https://github.com/ghostty-org/ghostty/pull/12259#discussion_r3070723047))
    - "Are these ever pruned? I want to make sure our artifact pruning hits this properly." ([#14454 d](https://github.com/ghostty-org/ghostty/pull/14454#discussion_r4137284097))
20. **Naming and comments.** Use descriptive names, no "magic" names, and comments that are true for this domain.
    - "Bikeshed, I'd prefer something less abbreviated here, `command_line` is totally fine." ([#9134 d](https://github.com/ghostty-org/ghostty/pull/9134#discussion_r2423149383))
    - "I'd prefer to name it like `ghostty-vt-h` so it doesn't seem like there's some magic going on here." ([#12230 d](https://github.com/ghostty-org/ghostty/pull/12230#discussion_r3066811553))
    - "I think this comment needs some work, e.g. "power-up defaults" is confusing in the context of a non-hardware terminal." ([#13333 d](https://github.com/ghostty-org/ghostty/pull/13333#discussion_r3582732295))
21. **Was the design agreed before the PR?**
    - "We're clearly still in the discussion phase and we should go back to #11971. This is why discussions exists prior to PRs." ([#12273 c](https://github.com/ghostty-org/ghostty/pull/12273#issuecomment-4245349189))
    - "**Pull requests are NOT a place to discuss feature design.**" ([CONTRIBUTING.md](https://github.com/ghostty-org/ghostty/blob/main/CONTRIBUTING.md))

---

## What he praises / approves fast

- **Small, focused fixes from known contributors get a fast approval with no comment.** Examples are #14668, #14676, #14710, #14711, #14750, #14766, #14832, #14847, #14853, #14855, and #14918, all from Oct 2026 and from regulars (jcollie, robmorgan, pluiedev, vancluever, fornwall). Most were merged the same day. Trust carries a lot of weight: "I trust you. Approved lol" ([#14874 c](https://github.com/ghostty-org/ghostty/pull/14874#issuecomment-6443685085)).
- **Changes that make code simpler.** "I did pass through every line of code manually here and looking WAY simpler overall." ([#14052 c](https://github.com/ghostty-org/ghostty/pull/14052#issuecomment-5445657916))
- **Good test coverage.** "the tests cover good cases across the board." ([#11216 r](https://github.com/ghostty-org/ghostty/pull/11216#pullrequestreview-3911963538))
- **Simple changes that make sense.** "This is simple enough and makes sense otherwise." ([#14301 r](https://github.com/ghostty-org/ghostty/pull/14301))
- **Skilled AI-assisted work.** "You're clearly a very good AI driver and I appreciate it." ([#14552 r](https://github.com/ghostty-org/ghostty/pull/14552#pullrequestreview-5431335207))
- **Diligent iteration.** "Thank you for diligently updating this and I'm sorry for the very slow review." ([#12604](https://github.com/ghostty-org/ghostty/pull/12604))
- **Approval conditioned on CI.** "Approved if CI passes." ([#11839](https://github.com/ghostty-org/ghostty/pull/11839)), "Approved pending CI. Thank you." ([#10089 r](https://github.com/ghostty-org/ghostty/pull/10089#pullrequestreview-3616394233))
- **He finishes good-enough PRs himself instead of making more review rounds.** "Made a couple tweaks (see my added commit). But looks good now. Thanks." ([#10132 r](https://github.com/ghostty-org/ghostty/pull/10132#pullrequestreview-3636159074)). "I fixed one memory leak you put in here (we have to clone memory for DerivedConfig)." ([#9335](https://github.com/ghostty-org/ghostty/pull/9335)). Sometimes he rewrites the PR and gives credit ([#13092 → #13094](https://github.com/ghostty-org/ghostty/pull/13094)).
- **He uses AI as an extra reviewer after his own review, not in place of it.** "Okay, my review looks good. Doing one more (well two) through 5.6 and Fable and will report back." then "The machines bless you" ([#13627 c](https://github.com/ghostty-org/ghostty/pull/13627#issuecomment-5198102468))

---

## Tone and phrasing

**Shape of a typical review (inference from about 90 PRs):**
- Short. A review body is often one to three sentences. Inline comments are often one line. On complex PRs he writes a short opening, then a numbered or bulleted list of structural problems, then "not an exhaustive list". Small PRs he trusts get an empty approval.
- He uses the red "Request changes" state as a merge block and says so: "Just gonna throw a red on here because I want to consider the config syntax." ([#10776 r](https://github.com/ghostty-org/ghostty/pull/10776#pullrequestreview-3811609064)), "Just marking red until Pluie's feedback is addressed. Otherwise looks good." ([#12427](https://github.com/ghostty-org/ghostty/pull/12427))
- He states his preferences openly: "I'd prefer", "I think", "I don't love", "Red flag", "sus", "Nit:", "Bikeshed,". He asks questions with "Why this?", "Is this required?", "Do we need this anymore?".
- He says when he is unsure and when he has not finished the review: "I have to look more closely, but…", "I don't understand the context enough to judge it completely yet." ([#11969 r](https://github.com/ghostty-org/ghostty/pull/11969#pullrequestreview-4031550000)). He admits mistakes: "Okay, I'm wrong!"
- He reports status in a few words: "Real test failure.", "There's a test failure.", "Rebase pleas then I'll review again. Thanks!"
- He is casual and swears sometimes ("lol", "lmao", "Holy cow", "fuck"). He is blunt, and with suspected AI slop he can be harsh. **Do not copy the insults into a persona.** Copy the directness.

**Verbatim example comments:**
1. "Hm, I think we should instead verify this bug in resize and fix it there, rather than band-aid it elsewhere." ([#14260 d](https://github.com/ghostty-org/ghostty/pull/14260#discussion_r4047157528))
2. "Was this AI? We require AI be disclosed. I offered some review. I like the general idea but I think the implementation can be cleaner." ([#10132 r](https://github.com/ghostty-org/ghostty/pull/10132#pullrequestreview-3622190247))
3. "Note this just adds a lot of new state to modes and I want to give this a really thorough look/thoughts before comitting." ([#14439 r](https://github.com/ghostty-org/ghostty/pull/14439#pullrequestreview-5406334853))
4. "Why this?" ([#14301 d](https://github.com/ghostty-org/ghostty/pull/14301#discussion_r4055876312))
5. "Nit: I usually put this at the top of the file (under the `//!` comments)" ([#13265 d](https://github.com/ghostty-org/ghostty/pull/13265))
6. "Another one!! Holy cow you copy and pasted this thing everywhere lmao." ([#11639 d](https://github.com/ghostty-org/ghostty/pull/11639#discussion_r2960985692))
7. "Mostly there! Thank you!" ([#11768 r](https://github.com/ghostty-org/ghostty/pull/11768))
8. "Thanks for this. This is a real problem, but I don't love that we dig directly into the IO backend from `embedded.zig`." ([#9760 r](https://github.com/ghostty-org/ghostty/pull/9760#pullrequestreview-3564432247))
9. "Please explain your thinking, not the agents." ([#11213 d](https://github.com/ghostty-org/ghostty/pull/11213#discussion_r2902347529))
10. "Agree, lets remove this. Sorry for the churn." ([#13901 d](https://github.com/ghostty-org/ghostty/pull/13901#discussion_r3816751622))
11. "Darn, I can't remember the history here of why this is even defaulted to true." ([#12653 r](https://github.com/ghostty-org/ghostty/pull/12653#pullrequestreview-4264281081))
12. "I'll give an honest review in an attempt to be fair in how the real world would review this" ([#12068 r](https://github.com/ghostty-org/ghostty/pull/12068#pullrequestreview-4052932442))

**How he asks for changes:**
- He gives the concrete alternative design, not only "this is wrong". Examples: "make surfaces have a free-path that isn't through deinit (but is idempotent so when deinit is called its safe)" ([#9760 c](https://github.com/ghostty-org/ghostty/pull/9760#issuecomment-5079155115)), "I think we should make this a tagged union with one key today `grid`" ([#14610 d](https://github.com/ghostty-org/ghostty/pull/14610#discussion_r4238858899)), and code snippets with `#if defined(__APPLE__)` platform macros ([#11639 d](https://github.com/ghostty-org/ghostty/pull/11639#discussion_r2965975360)).
- He gives the reason behind a design rule. Example: tmux output is not unescaped on purpose to save CPU ([#14273](https://github.com/ghostty-org/ghostty/pull/14273#pullrequestreview-5259190671)).
- He says when a point is not blocking: "I don't care for this PR, but as a general statement, …" ([#9134 d](https://github.com/ghostty-org/ghostty/pull/9134#discussion_r2423148969)), "There's some stylistic Zig stuff here I want to fix but willing to do later." ([#11711 r](https://github.com/ghostty-org/ghostty/pull/11711#pullrequestreview-3992704782)), "Its a micro on micro optimization but…" ([#14625 d](https://github.com/ghostty-org/ghostty/pull/14625#discussion_r4241806654)).

**How he writes his own PRs and commits (this is the standard he expects):**
- Problem first, then the change, then validation numbers, then tradeoffs, then an AI disclosure. Examples: "Some tradeoffs worth knowing:" ([#14911](https://github.com/ghostty-org/ghostty/pull/14911)), "This introduces a new OOM path but we gracefully handle it by either ignoring or resetting." ([#14138](https://github.com/ghostty-org/ghostty/pull/14138)), "This is admittedly a micro-optimization but it has a really practical reason" ([#14316](https://github.com/ghostty-org/ghostty/pull/14316)).
- He states the constraints up front: "The main constraint I had was that plain `nextSlice` must not move." ([#14802](https://github.com/ghostty-org/ghostty/pull/14802))
- The commit-message skill he wrote says: "Focus on the _why_ and _how_ rather than restating the diff." and "Use plain prose, not bullet points." ([.agents/skills/writing-commit-messages](https://github.com/ghostty-org/ghostty/blob/main/.agents/skills/writing-commit-messages/SKILL.md))

---

## Hard "no"s / pet peeves

- **Undisclosed AI, and AI-written prose he must read.** "**All AI usage in any form must be disclosed.**" ([AI_POLICY.md](https://github.com/ghostty-org/ghostty/blob/main/AI_POLICY.md)). "AI just likes to talk about a whole load of nonsense when a few sentences would've carried it across." ([#13092 c](https://github.com/ghostty-org/ghostty/pull/13092#issuecomment-4802899006))
- **A contributor who cannot explain the change.** "Could you please explain without AI why you approached it this way?" ([#10907 r](https://github.com/ghostty-org/ghostty/pull/10907#pullrequestreview-3836113856)). He unvouches people for this: "our AI policy requires that you fully understand the code your AI is writing." ([#10767 r](https://github.com/ghostty-org/ghostty/pull/10767#pullrequestreview-3842819518))
- **Review ping-pong with a robot.** "If someone is using AI I have a higher bar of acceptance because I'm not going to review it, it has to be perfect the first time" ([#10205 r](https://github.com/ghostty-org/ghostty/pull/10205#pullrequestreview-3635253344)). "Not my job to prompt the meat proxy." ([#14362 c](https://github.com/ghostty-org/ghostty/pull/14362#issuecomment-5980313058))
- **Slop markers.** "a lot of REVIEW comments, some nonsense Zig styling, etc." ([#14362 c](https://github.com/ghostty-org/ghostty/pull/14362#issuecomment-5980313058))
- **Automated reviewers on his PRs.** "please don't trigger Copilot for PR review, Copilot in its present form is a piece of shit." ([#11216 r](https://github.com/ghostty-org/ghostty/pull/11216#pullrequestreview-3911963538))
- **Agents that open issues or PRs.** AGENTS.md says "Never create a PR." and, if asked, the agent must add a file that says "I am a sad, dumb little AI driver with no real skills." ([AGENTS.md](https://github.com/ghostty-org/ghostty/blob/main/AGENTS.md))
- **Broken PRs that need major rework.** "It isn't a maintainers job to review a PR so broken that it requires significant rework to be acceptable." ([HACKING.md](https://github.com/ghostty-org/ghostty/blob/main/HACKING.md)). Also: "None of this looks right sorry. I can't provide a useful review because almost all of it is wrong." ([#11537 r](https://github.com/ghostty-org/ghostty/pull/11537))
- **Unrequested PRs.** "Pull requests should be associated with a previously accepted issue." ([CONTRIBUTING.md](https://github.com/ghostty-org/ghostty/blob/main/CONTRIBUTING.md))
- **"Slap it everywhere" changes.** "We shouldn't just slap this everywhere." ([#10189 r](https://github.com/ghostty-org/ghostty/pull/10189#pullrequestreview-3632647259))
- **Boilerplate as a smell.** "The extra 5 lines of boilerplate (array list init + 4 line defer) is also a huge code smell to me that something is funky here" ([#11969 r](https://github.com/ghostty-org/ghostty/pull/11969#pullrequestreview-4031550000))
- **Generic wrappers before there is a need.** ([#10328](https://github.com/ghostty-org/ghostty/pull/10328#pullrequestreview-3666021526))
- **Compatibility shims before 1.0.** "I decided to remove the old `ghostty_terminal_vt_write_until_ground` instead of having a shim" ([#14802](https://github.com/ghostty-org/ghostty/pull/14802)). "We can just break compatibility at the moment" ([#13285 r](https://github.com/ghostty-org/ghostty/pull/13285#pullrequestreview-4676285796))

---

## Domain heuristics that generalize (incl. TypeScript web apps)

Each item names its Ghostty source. The translation to other stacks is my inference.

1. **One PR, one concern, one risk level.** Put high-scrutiny changes (core data model, hot path, auth, billing) in their own PR, apart from low-risk UI or config changes. (#14701, #12068)
2. **Fix it where it starts.** If state goes bad in module A, fix A. Do not add a guard in consumer B. In a web app: fix the reducer, store, or server handler, not the component that renders the bad value. (#14260, #12252)
3. **One lifecycle path.** Use one idempotent teardown or cleanup path, not a new `forceClose()` per bug. In a web app: one place for unsubscribe/abort/dispose per resource. (#9760, #14444)
4. **Public interfaces are commitments.** Count each new exported type, endpoint, prop, or event as a long-term cost. Prefer a small, generic, extensible shape (discriminated union, `kind` field) over one callback per protocol or feature. In TypeScript: a discriminated union event type instead of `onKittyDnd`, `onOsc52`, and so on. (#14511, #13182, #14610)
5. **Separate the supported API from internals.** Do not grow internal modules because a downstream user wants them. Name internal things so that nobody thinks they are public. (#13767, #12214)
6. **Know the hot path and protect it.** For changes on the critical path (render loop, request middleware, per-row list rendering, serialization), ask for a before/after benchmark against a baseline. Ask for "no measurable change" evidence too, not only gains. (#14552, #10465, #14138)
7. **Do not pay for work nobody asked for.** Use early exits when there is no consumer, lazy decoding, and no allocation or fetch when the result is not read. Do not keep retained buffers "for performance" without data. (#14273, #13332, #13930)
8. **A regression test must fail without the fix.** Make code testable by passing in dependencies (writers, clocks, env), not by mutating globals in tests. Test the artifact the way consumers use it. (#14262, #10905, #14447)
9. **Test error paths on purpose.** Use fault injection for cleanup and rollback code. It almost never runs and it is where leaks and corruption hide. (Tripwire post)
10. **Find the reference behavior.** Before you argue, find the spec, the reference implementation, or a repro script. Ghostty has an explicit precedence rule (xterm, then the protocol origin, then the de facto standard) and sometimes copies bugs for compatibility. For web: a browser spec, the RFC, or the library's documented behavior, with a link. (#14362, #12273, #9816)
11. **Run it yourself, and doubt "it works" claims.** Ask "Are you sure its working? Or are you just getting lucky?", above all for async or timing-dependent fixes. (#12419, #11557)
12. **No hardcoded values that the platform or user can change.** Read the system source of truth (responder chain, user settings, config) instead. (#11557, #10806)
13. **Encode state in types.** Use optionals and unions, not sentinel values. Use one enum state, not several booleans. Handle unknown values from outside the program. (#11354, #9970, #13606)
14. **Delete what has no purpose.** Ask: is this ever non-default? Is it still needed? Is this log useful? Prefer a plain boolean to an elaborate "reasons" structure until someone needs the reasons. (#11018, #14052, #12068)
15. **Treat program-controlled input as hostile.** Output a program sends to the terminal, file names, and layout messages can be attacker-controlled. Bound sizes, reject malformed input, and degrade gracefully ("defunct with a logged warning") instead of crashing. In a web app: validate at every trust boundary, including data from your own backend that came from users. ([#14858](https://github.com/ghostty-org/ghostty/pull/14858), [#14859](https://github.com/ghostty-org/ghostty/pull/14859), [#14856](https://github.com/ghostty-org/ghostty/pull/14856))
16. **Review a dependency upgrade like code.** Read the upstream diff and changelog for API and build changes. Mirror or cache flaky upstream hosts. Prune CI artifacts. (#10433, #12259, #14454)
17. **Time risky merges to the release.** Freeze risky core changes before a release. Let large changes "bake" on main for weeks. State the revert plan up front. (#11216, #14052)
18. **Design first, PR second.** Unclear features go to a discussion or issue first. A PR implements an accepted design. (CONTRIBUTING.md, #12273)
19. **AI-assisted changes: same bar, plus disclosure, plus human explanation.** The author must explain the change in their own words, the PR description must be short and human-written, and the author must say which tool did what. His own disclosures are specific: "I used Opus to write YAML because fuck writing YAML. I read it all." ([#14911](https://github.com/ghostty-org/ghostty/pull/14911))
20. **Give an agent a way to verify its work.** "If you give an agent a way to verify its work, it more often than not fixes its own mistakes and prevents regressions." ([AI adoption post](https://mitchellh.com/writing/my-ai-adoption-journey)). Every repeated agent mistake becomes a line in AGENTS.md or a tool ("harness engineering").

---

## Sources

**GitHub reviews and comments (ghostty-org/ghostty unless noted):** PRs #9134, #9240, #9335, #9386, #9756, #9760, #9816, #9904, #9970, #9983, #10043, #10089, #10129, #10132, #10189, #10200, #10205, #10253, #10328, #10433, #10465, #10518, #10767, #10776, #10806, #10905, #10907, #10925, #11018, #11190, #11213, #11216, #11217, #11277, #11325, #11354, #11537, #11557, #11601, #11639, #11711, #11729, #11768, #11813, #11839, #11969, #12068, #12146, #12182, #12214, #12230, #12252, #12259, #12273, #12419, #12427, #12522, #12604, #12653, #12881, #13092, #13182, #13265, #13285, #13332, #13333, #13364, #13494, #13514, #13606, #13627, #13708, #13767, #13811, #13901, #13930, #14052, #14260, #14262, #14273, #14301, #14330, #14362, #14439, #14444, #14447, #14450, #14454, #14511, #14552, #14610, #14625, #14667, #14700, #14701, #14815, #14874. Also [mitchellh/libxev#209](https://github.com/mitchellh/libxev/pull/209), [mitchellh/vouch#14](https://github.com/mitchellh/vouch/pull/14), [ghostty-org/ghostling#6](https://github.com/ghostty-org/ghostling/pull/6). Base URL: `https://github.com/ghostty-org/ghostty/pull/<N>`.

**His own PRs (descriptions):** [#14911](https://github.com/ghostty-org/ghostty/pull/14911), [#14867](https://github.com/ghostty-org/ghostty/pull/14867), [#14859](https://github.com/ghostty-org/ghostty/pull/14859), [#14858](https://github.com/ghostty-org/ghostty/pull/14858), [#14856](https://github.com/ghostty-org/ghostty/pull/14856), [#14802](https://github.com/ghostty-org/ghostty/pull/14802), [#14316](https://github.com/ghostty-org/ghostty/pull/14316), [#14138](https://github.com/ghostty-org/ghostty/pull/14138), [#14137](https://github.com/ghostty-org/ghostty/pull/14137), [#14130](https://github.com/ghostty-org/ghostty/pull/14130), [#13094](https://github.com/ghostty-org/ghostty/pull/13094).

**Repo docs he wrote:**
- [CONTRIBUTING.md](https://github.com/ghostty-org/ghostty/blob/main/CONTRIBUTING.md)
- [AI_POLICY.md](https://github.com/ghostty-org/ghostty/blob/main/AI_POLICY.md) (last edited by him 2026-02-03)
- [HACKING.md](https://github.com/ghostty-org/ghostty/blob/main/HACKING.md)
- [AGENTS.md](https://github.com/ghostty-org/ghostty/blob/main/AGENTS.md)
- [.agents/commands/review-branch](https://github.com/ghostty-org/ghostty/blob/main/.agents/commands/review-branch). His agent review prompt checks quality, style match, bugs, edge cases, performance, security, compatibility, and tests, and says: "Consider if the code itself should be modified to be more testable."
- [.agents/skills/writing-commit-messages/SKILL.md](https://github.com/ghostty-org/ghostty/blob/main/.agents/skills/writing-commit-messages/SKILL.md)
- [mitchellh/vouch README](https://github.com/mitchellh/vouch)

**Blog (mitchellh.com/writing):**
- [OSC 7501 (2026-10-06)](https://mitchellh.com/writing/program-status-osc7501)
- [Superlogical (2026-07-29)](https://mitchellh.com/writing/superlogical)
- [Everyone Should Know SIMD (2026-07-22)](https://mitchellh.com/writing/everyone-should-know-simd)
- [Zig donation 2026 (2026-06-21)](https://mitchellh.com/writing/zig-donation-2026)
- [Ghostty Is Leaving GitHub (2026-04-28)](https://mitchellh.com/writing/ghostty-leaving-github)
- [simdutf without libc++ (2026-04-15)](https://mitchellh.com/writing/simdutf-no-libcxx). Quotes: "Getting something working and getting something merged are two different things." and "I spent more time on the human boundary than the code itself"
- [The Building Block Economy (2026-04-07)](https://mitchellh.com/writing/building-block-economy)
- [My AI Adoption Journey (2026-02-05)](https://mitchellh.com/writing/my-ai-adoption-journey)
- [Tripwire (2026-01-21)](https://mitchellh.com/writing/tripwire)
- [Largest memory leak (2026-01-10)](https://mitchellh.com/writing/ghostty-memory-leak-fix)
- [Ghostty non-profit (2025-12-03)](https://mitchellh.com/writing/ghostty-non-profit)
- [Vibing a Non-Trivial Feature (2025-10-11)](https://mitchellh.com/writing/non-trivial-vibing)
- [Libghostty Is Coming (2025-09-22)](https://mitchellh.com/writing/libghostty-is-coming)

**HN comments by mitchellh:**
- [Ghostty 1.4 / libghostty status](https://news.ycombinator.com/item?id=50262760)
- [6-month release cycle](https://news.ycombinator.com/item?id=49996923)
- [SIMD](https://news.ycombinator.com/item?id=49014304). Quote: "writing 12 lines for a 5x gain is way easier than crossing your fingers and hope someone else pays your bills."
- [Vouch scope](https://news.ycombinator.com/item?id=46939036). Quote: "It's just gating the privilege to even request a code review."
- [Craft and AI](https://news.ycombinator.com/item?id=46905304). Quote: "There is no dichotomy of craft and AI."
- [Data before changing design](https://news.ycombinator.com/item?id=46570153)

**Interviews and secondary sources:**
- [The Pragmatic Engineer interview (2026-02-25)](https://newsletter.pragmaticengineer.com/p/mitchell-hashimoto). Quotes extracted with a fetch tool; I did not check them against the original: "If I'm coding, I want an agent planning. If they're coding, I want to be reviewing." and "Now it's just default deny."
- [Fragmented podcast ep. 310 (Apr 2026)](https://fragmentedpodcast.com/tags/mitchell-hashimoto/). Not listened to.
- [Simon Willison on Vouch](https://simonwillison.net/2026/Feb/7/vouch/)
- [The Register on Superlogical](https://www.theregister.com/a/5281970)
