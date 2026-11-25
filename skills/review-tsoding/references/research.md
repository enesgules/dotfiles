# Tsoding (Alexey Kutepov): code-review research

Research date: 2026-11-26. Weighting: 2025 to Nov 2026 highest.
Main corpus: 305 of his GitHub comments and reviews on `tsoding/*` repos since 2025-01-01 (most on nob.h), 306 comments on `bext-lang/b` (the B compiler, May to Aug 2025), all pulled with `gh api`. Also his READMEs, the nob.h header and CONTRIBUTING.md, his commit messages, and 269 of his own X posts from the fxtwitter API (almost all from 2026-02-07 to 2026-11-25, plus 10 older posts that the API also returned).
Every quote below is verbatim. I kept his typos ("you project", "way to many", "complaint", "slowing", "then they actually solve"). A script checked each quote against the fetched text. Inline links point to the exact comment, post, or file line. "Inference" marks my own reading. "Irony" marks a joke. A joke is never a rule here.

Handles: GitHub user `rexim` (his comments use this login; 14,993 followers). GitHub org `tsoding` (15,125 followers, 312 repos). X `@tsoding` (121,553 followers, 7,974 posts, active: he posted on 14 days in Nov 2026, last on 2026-11-25). The X account `@rexim` is a different person. Mastodon `@tsoding@mastodon.social`. YouTube "Tsoding Daily" (about 215K subscribers, third-party count, Aug 2026) and "Tsoding". Twitch `tsoding` (about 84K followers, third-party count).

Link key: `c` = conversation comment (`#issuecomment-ID`), `d` = inline diff comment (`#discussion_rID`), `r` = review (`#pullrequestreview-ID`). `nob.h#N` = `tsoding/nob.h`, `b#N` = `bext-lang/b`.

---

## Current focus (what he works on now)

- **tatr, a task tracker in C (Sep to Nov 2026).** Tasks live as `tasks/<HUID>/TASK.md` files in the repo. His commits now start with a task ID ("20261123-005647: the `-edit` flag"). The README says why he made it: "I needed something more powerful than just plane TODOs in the Source Code of my projects, yet I didn't want to install a full blown Issue Tracker System." ([tatr README L11](https://github.com/tsoding/tatr/blob/ff3c1c7e99b7bbd34afd0f76bbd442e339669fda/README.md?plain=1#L11)). He closed both a web UI and a TUI as "Outside of the scope of this project." ([tatr ff67843](https://github.com/tsoding/tatr/commit/ff6784356800c64cbe17a2465c70aa544bb3ce72), 2026-10-16).
- **nob.h releases.** Version 3.0.0 (2026-01-13) to 3.10.1 (2026-10-28). Version 2.0.0 removed the bundled `minirent.h`. Most 2026 releases add small string-view and dynamic-array helpers and fix compiler warnings.
- **Jai on stream.** "Why am I programming in Jai on my streams lately?" ([X, 2026-06-11](https://x.com/tsoding/status/2065075543066730781)). Repos: `jaison`, `jai-ctags`, `rexim/focus`.
- **Small tools for his stream.** Sowon (the pre-stream timer) moved from SDL2 to RGFW, then he removed SDL entirely ([sowon 7c6f5cf](https://github.com/tsoding/sowon/commit/7c6f5cf316223c10281ec24c0559469586448bce), 2025-12-03). Gatekeeper (his Go chat bot) got PostgreSQL backups (Nov 2026). He also did audio programming (Aug 2026) and smooth-snake in C and WebAssembly (Oct 2026).
- **The B compiler (bext-lang/b), mid 2025.** A B compiler in Rust with Crust rules. He moved codegens to separate repos ("thirdparty codegens"). His last comment there is from Aug 2025.
- **Triage load.** "I'm drowning in a constant stream of random PRs and Issues submit to the @tsoding organization repos. I need to triage them quickly." ([nob.h#187 c](https://github.com/tsoding/nob.h/issues/187#issuecomment-3801758258), 2026-01-26). A lot of this load is LLM output: "I receive a lot of spam Issues and PRs lately, especially from the LLM users" ([nob.h#107 c](https://github.com/tsoding/nob.h/issues/107#issuecomment-3214513345), 2025-08-22).

---

## Core values

Each value has 2 or more sources, or one very clear statement.

1. **Few dependencies. Each one is a cost.** "If your project has a lot of dependencies - cut them down, you are opening yourself to supply chain attacks." ([nob.h#64 c](https://github.com/tsoding/nob.h/pull/64#issuecomment-2847943799), 2025-05-02). On a PR that added Python to the build: "We already depend on Rust, C, and Make. This introduces Python. Even though Python is widely available and is a pretty common build dependency, it is the reason for much of the build bloat that I regularly fight in my projects." ([b#46 c](https://github.com/bext-lang/b/pull/46#issuecomment-2922987987), 2025-05-30). On a good PR that he did not merge: "It's extremely cool, but depends on too much of exotic stuff. It either has to become more self-contained" ([b#175 c](https://github.com/bext-lang/b/pull/175#issuecomment-3063139953), 2025-07-11).
2. **One language for the project and its tools.** "If your project requires calling npm that means you don't need nob.h. Your project already depends on a programming language from which you can do everything. It's called JavaScript. Just do everything in JavaScript. Introducing nob.h adds an unnecessary dependency on a C compiler." ([nob.h#121 c](https://github.com/tsoding/nob.h/issues/121#issuecomment-3237023434), 2025-08-29). The nob.h README: "The idea is that you should not need anything but a C compiler to build a C project. No make, no cmake, no shell, no cmd, no PowerShell etc." ([nob.h README L9](https://github.com/tsoding/nob.h/blob/746f47daa5776a4c93fade3ead8c82cd469670ec/README.md?plain=1#L9)).
3. **Complexity must pay for itself.** "So yeah, my general policy towards nob is to not add complexity if you can live without it." ([nob.h#21 c](https://github.com/tsoding/nob.h/pull/21#issuecomment-2650205056), 2025-02-11). "My problem with this approach is that the ratio of complexity/usefulness is too high for me to maintain. Compare it to nob_return_defer() macro. It might be less powerful [...] but it's also basically one line and it's cross-compiler by its nature." ([nob.h#49 c](https://github.com/tsoding/nob.h/pull/49#issuecomment-2808917290), 2025-04-16).
4. **A real problem first.** "Has it already caused actual issues for you?" ([arena#18 c](https://github.com/tsoding/arena/issues/18#issuecomment-3443929597), 2025-10-24). "Without specific uses cases I don't see any point to add more such features." ([b#114 c](https://github.com/bext-lang/b/issues/114#issuecomment-2952391127), 2025-06-07). "I don't think anybody actually cares and this solves no actual problems" ([b#161 c](https://github.com/bext-lang/b/issues/161#issuecomment-3013523102), 2025-06-27).
5. **Shared code holds widely used tools only. Specialized code stays with its user.** "In nob I'm trying to collect widely applicable tools. Anything specialized users are expected to implement themselves." ([nob.h#36 c](https://github.com/tsoding/nob.h/pull/36#issuecomment-2749743680), 2025-03-25). "we should be restrained from adding every possible niche backend under the Sun to this repo." ([b#61 c](https://github.com/bext-lang/b/issues/61#issuecomment-2924572326), 2025-05-31).
6. **Simple, visible build steps. Rebuild from scratch, do not trust caches.** "Incremental builds are extremely error prone. I really dislike them. Something is cached weirdly or you forgot some dependencies, and you end up with your project only partly rebuilt and wondering why your changes are not applied." ([nob.h#64 c](https://github.com/tsoding/nob.h/pull/64#issuecomment-2847943799)). The nob.h header says "the whole idea of NoBuild is to keep the process of bootstrapping as simple as possible and doing all of the actual work inside of ./nob" ([nob.h L891-893](https://github.com/tsoding/nob.h/blob/746f47daa5776a4c93fade3ead8c82cd469670ec/nob.h#L891-L893)).
7. **No code shuffling.** A refactor must fix a named problem. "I don't see a single problem being solved. Just shuffling code around." ([Crust#7 c](https://github.com/tsoding/Crust/pull/7#issuecomment-2856827732), 2025-05-07). "No improvement has been observed. Only purposeless code shuffling." ([b#188 c](https://github.com/bext-lang/b/pull/188#issuecomment-3036901438), 2025-07-04). "Too much irrelevant code shuffling" ([button#22 c](https://github.com/tsoding/button/pull/22#issuecomment-3319175728), 2025-09-22).
8. **Write less code.** "What I like about not using LLM-based tools is writing code is so tedious you are looking for solutions to write less code or no code at all and you usually find them. Which improves your project dramatically in a longer run." ([X, 2026-09-30](https://x.com/tsoding/status/2105262325464699302)). Also: "A lot of shit we are dealing with in the modern computer systems is an adversarial complexity that serves no purpose except making things harder for the benefit of the system's owners. The main problem is that lot of people believe this complexity is necessary." ([X, 2026-10-17](https://x.com/tsoding/status/2111246915186651334)).
9. **Proof that it works on a real machine.** He builds and runs PRs himself. "Your changes don't even compile. If you gonna Vibe Slop contributions at least check that they work." ([nob.h#47 c](https://github.com/tsoding/nob.h/pull/47#issuecomment-2808948671), 2025-04-16). "Could you please provide more detailed instructions to reproduce the problem? I want to verify that the fix works on my side." ([nob.h#144 c](https://github.com/tsoding/nob.h/pull/144#issuecomment-3694789307), 2025-12-28).

---

## Review checklist (what he checks or pushes back on)

1. **Which dependency, language, or tool does this add?**
   - "I see what you are going for, but I'm not a particular fan of introducing yet another language into our mix." ([b#46 c](https://github.com/bext-lang/b/pull/46#issuecomment-2922987987))
   - "It would be nice to try to go dependency-less similar to Uxn." ([b#105 c](https://github.com/bext-lang/b/issues/105#issuecomment-2948649522), 2025-06-06)
   - On his own old choice: "I think it is safe to say that bundling that minirent.h library was an incredibly stupid idea of mine." ([nob.h#74 c](https://github.com/tsoding/nob.h/pull/74#issuecomment-3174260538), 2025-08-11). Version 2.0.0 removed it.
   - On SDL: "We are slowing moving away from SDL entirely. See #45. So there is no need to upgrade to SDL3." ([sowon#44 c](https://github.com/tsoding/sowon/pull/44#issuecomment-3417722812), 2025-10-18). Then: "Once this one is figured out, SDL2 version can be pretty much removed." ([sowon#53 c](https://github.com/tsoding/sowon/issues/53#issuecomment-3563295840), 2025-11-21).
   - When a heavy dependency is necessary, he owns its source: "I personally would like to go with an approach of literally vendoring the source code of raylib and building it from scratch like we do in https://github.com/tsoding/musializer" ([Murayact#9 c](https://github.com/tsoding/Murayact/pull/9#issuecomment-3224011563), 2025-08-26).
2. **Is the tool needed at all, or is it used for its own sake?**
   - "Using nob.h for the sake of using nob.h where it's not needed is not only pointless but actively harmful for your project." ([nob.h#121 c](https://github.com/tsoding/nob.h/issues/121#issuecomment-3237023434))
   - "The goal of nob.h is not to recreate a crappier version of Make. If you need Make just use Make." ([nob.h#64 c](https://github.com/tsoding/nob.h/pull/64#issuecomment-2847943799))
3. **Does the build stay one plain step?**
   - "If your build system requires a complicated bootstrapping, do not use GO_REBUILD_URSELF. It was not designed for that. Use Two Stage Build" ([nob.h#208 c](https://github.com/tsoding/nob.h/issues/208#issuecomment-3797379248), 2026-01-25)
   - On a PR that wrapped the bootstrap: "I don't like it. First it tries to hide what's actually going on. Second it's POSIX specific. We also support Windows." ([nob.h#39 c](https://github.com/tsoding/nob.h/pull/39#issuecomment-2727306921), 2025-03-16)
   - He grows the existing build program instead of adding a new layer: "My idea was to keep extending `bgen.rs` until it just does 90% of the build, since it wants to go in that direction anyway." ([b#283 c](https://github.com/bext-lang/b/pull/283#issuecomment-3158413957), 2025-08-06)
4. **Caches and incremental steps.** He prefers a full rebuild. He adds a targeted check only for a part that is slow and changes rarely: "You yourself as a competent Software Engineer identify the parts that change infrequently and build slowly, and you prop them up with `if (needs_rebuild())`." ([nob.h#64 c](https://github.com/tsoding/nob.h/pull/64#issuecomment-2847943799))
5. **Files for other ecosystems stay out of the repo.**
   - On a `clib.json` PR: "It's the same problem as with build.zig and the like. My project is not a billboard for build tools and package managers." ([nob.h#52 c](https://github.com/tsoding/nob.h/pull/52#issuecomment-2804089567), 2025-04-15)
   - "Regarding the `debian.control` we do not accept such file into the repo. I'm totally fine with Debian people making a package out of this library. Just keep all the paperwork outside of this repo." ([nob.h#122 c](https://github.com/tsoding/nob.h/pull/122#issuecomment-3237060805), 2025-08-29)
   - "Sure, I do not mind any Nix stuff using this project as long as it's kept outside of this repo." ([b#14 c](https://github.com/bext-lang/b/issues/14#issuecomment-2903484733), 2025-05-23). Same for a Nix flake: "Feel free to put it anywhere outside of this repo." ([musializer#138 c](https://github.com/tsoding/musializer/pull/138#issuecomment-3170621855), 2025-08-09)
6. **Is this in the scope of the shared library?**
   - "Outside of the scope of the project. Feel free to implement such functionality in you project yourself on top of nob.h" ([nob.h#180 c](https://github.com/tsoding/nob.h/issues/180#issuecomment-3714362366), 2026-01-06)
   - "This feature looks interesting, but I feel like it is too much outside of the scope of nob.h is trying to be, sorry." ([nob.h#45 c](https://github.com/tsoding/nob.h/pull/45#issuecomment-3174346171), 2025-08-11)
   - Plug-in point instead of a feature: "What would be better instead, in my opinion, is to introduce a mechanism to customize the logging, so if you as the user want to have colorful logs, you can just plug a custom logger that adds them." ([nob.h#77 c](https://github.com/tsoding/nob.h/pull/77#issuecomment-3174192112), 2025-08-11)
   - "I'm generally of an opinion that a library should not tell you how to use it too much." ([nob.h#96 c](https://github.com/tsoding/nob.h/pull/96#issuecomment-3203689237), 2025-08-20)
7. **Which real problem does it fix? Show me.**
   - "If you see any actual problem with the actual behavior of the program, report it or submit a PR." ([spline-notes#2 c](https://github.com/tsoding/spline-notes/issues/2#issuecomment-3436714217), 2025-10-23)
   - "Could you also please provide a minimal example that reproduces the problem you are having." ([nob.h#246 c](https://github.com/tsoding/nob.h/pull/246#issuecomment-4976936321), 2026-07-15)
   - "What was the error exactly? Please always provide the context." ([nob.h#161 c](https://github.com/tsoding/nob.h/pull/161#issuecomment-3494871167), 2025-11-06)
   - "Compiled on both GCC and Clang with `-Wall -Wextra -Wunused-result -O3`. Couldn't reproduce." ([nob.h#247 c](https://github.com/tsoding/nob.h/pull/247#issuecomment-4976922511), 2026-07-15)
   - "do you personally have any specific use case for this in the context of the B compiler or are you just mindlessly copying GCC/Clang?" ([b#136 c](https://github.com/bext-lang/b/pull/136#issuecomment-2967963232), 2025-06-12)
8. **Fewer variants of one thing.**
   - "I don't think we need that many integer type flags. I think having just the biggest one is enough. You can always truncate it if needed." ([flag.h#5 c](https://github.com/tsoding/flag.h/pull/5#issuecomment-2867084362), 2025-05-09)
   - "Do we really need both float and double for a flag parsing library? Maybe double would be enough?" ([flag.h#10 c](https://github.com/tsoding/flag.h/pull/10#issuecomment-3316360470), 2025-09-22)
   - On a web UI and a TUI for tatr: "TUI is certainly easier to implement. Maintaining both may require too much effort." Both closed as out of scope ([tatr ff67843](https://github.com/tsoding/tatr/commit/ff6784356800c64cbe17a2465c70aa544bb3ce72)).
9. **The smallest change that fixes it.**
   - On a JavaScript fix: "Wouldn't be enough to just remove the slash `/` in here? Is the `window.location.pathname` really necessary?" ([thumbnail#2 d](https://github.com/tsoding/thumbnail/pull/2#discussion_r2300857236), 2025-08-26)
   - "Can we do this instead of all that `nob__*printf` disaster? Sounds like a good way to cut down on the changes." ([nob.h#210 c](https://github.com/tsoding/nob.h/pull/210#issuecomment-3821141642), 2026-01-30)
   - "Looks more complicated than whatever we already have" ([button#16 c](https://github.com/tsoding/button/pull/16#issuecomment-3319137530), 2025-09-22)
   - Use what the platform already tells you before a new switch: "Can we make the code standard compatible without introducing a NOB macro? Like can we check some other expected C macros provided by the compiler to see what features are supported?" ([nob.h#19 d](https://github.com/tsoding/nob.h/pull/19#discussion_r1940544586), 2025-02-04)
10. **Code shuffling and reasonless refactors.**
    - "I don't understand the point of shuffling this code around. If you have fixes for specifics problems please describe what exactly you are fixing at least." ([nob.h#28 c](https://github.com/tsoding/nob.h/pull/28#issuecomment-2651270566), 2025-02-11)
    - "No value contribution has been observed in this PR so far, sorry." ([nob.h#39 c](https://github.com/tsoding/nob.h/pull/39#issuecomment-2756287667), 2025-03-27)
11. **Public names are a liability.**
    - "Any new public function like these are an additional liability for me." ([nob.h#187 c](https://github.com/tsoding/nob.h/issues/187#issuecomment-3798537493), 2026-01-26)
    - "I don't understand the point of polluting the namespace with a name that you use internally and only one time." ([nob.h#25 d](https://github.com/tsoding/nob.h/pull/25#discussion_r1951119242), 2025-02-11)
    - "We just polluted the namespace with more names without any perceived benefits..." ([nob.h#17 c](https://github.com/tsoding/nob.h/pull/17#issuecomment-2632943620), 2025-02-04)
    - CONTRIBUTING.md: "PRs that change and/or extend the public API of the library are not accepted." ([nob.h CONTRIBUTING L3](https://github.com/tsoding/nob.h/blob/746f47daa5776a4c93fade3ead8c82cd469670ec/CONTRIBUTING.md?plain=1#L3))
12. **Fit the existing API and style.**
    - "This behavior is highly inconsistent with the rest of the API" ([nob.h#94 c](https://github.com/tsoding/nob.h/issues/94#issuecomment-3210552551), 2025-08-21)
    - "Maybe `.recursively` and `.wildcard` should be optional parameters like in `nob_cmd_run()`?" ([nob.h#114 c](https://github.com/tsoding/nob.h/pull/114#issuecomment-3218063267), 2025-08-24)
    - "This library uses spaces, not tabs" ([nob.h#25 d](https://github.com/tsoding/nob.h/pull/25#discussion_r1951115742))
13. **One home for repeated code, and a clear owner for each job.**
    - "Use `nob_return_defer()` to not duplicate the exit cleanup all over the place." ([nob.h#103 d](https://github.com/tsoding/nob.h/pull/103#discussion_r2296644760), 2025-08-24)
    - "It probably makes sense to implement `arena_sprintf` in terms of `arena_vsprintf` to reduce the duplicate code." ([arena#10 d](https://github.com/tsoding/arena/pull/10#discussion_r2051779203), 2025-04-20)
    - "I don't think it should be the responsibility of this function to control the log level." ([nob.h#103 d](https://github.com/tsoding/nob.h/pull/103#discussion_r2296644538))
14. **Data structures that say what they mean.**
    - "I wanted them to be structs with two fields `read` and `write` so it's clear which end is which" ([nob.h#25 d](https://github.com/tsoding/nob.h/pull/25#discussion_r1951121648))
    - "The whole point of dynamic array is that capacity never decreases, it always grows up, so the allocated memory could be reused." ([nob.h#22 d](https://github.com/tsoding/nob.h/pull/22#discussion_r1940531993), 2025-02-04)
    - "One problem I see with this approach is that reminders do not survive the bot restart. We should store the reminders in the database." ([Gatekeeper#1 d](https://github.com/tsoding/Gatekeeper/pull/1#discussion_r2573039959), 2025-11-29)
15. **Claims need a reference.**
    - "Could you please reference the official documentation that confirms that? I couldn't find it." ([nob.h#56 c](https://github.com/tsoding/nob.h/pull/56#issuecomment-2833361649), 2025-04-27)
    - "Could you please provide a reference for that?" ([coroutines#3 c](https://github.com/tsoding/coroutines/issues/3#issuecomment-2614158362), 2025-01-26)
    - "Where did you get all of these definition from? Is this from some online documentation or some public code?" ([b#255 d](https://github.com/bext-lang/b/pull/255#discussion_r2241783593), 2025-07-30)
16. **Does it build, run, and pass the tests? Does it do what the description says?**
    - "Please test your code before submitting" ([button#24 c](https://github.com/tsoding/button/pull/24#issuecomment-3319200015), 2025-09-22)
    - "Your changes break `divmod` and `switch` cases that more or less work in `main`." ([b#173 c](https://github.com/bext-lang/b/pull/173#issuecomment-3031002131), 2025-07-03)
    - "You claim that this supports redirection. Where is it implemented? I don't see it." and "This is not even used anywhere." ([nob.h#92 c](https://github.com/tsoding/nob.h/pull/92#issuecomment-3203710579), [d](https://github.com/tsoding/nob.h/pull/92#discussion_r2286737444), 2025-08-20)
    - "It would be nice if the 6502 PRs targeted specific examples or tests enabling them to work so the progress is a bit more clear." ([b#137 c](https://github.com/bext-lang/b/pull/137#issuecomment-2974796957), 2025-06-16)
    - "Only button-counter? I think we should check all the examples." ([Murayact#10 d](https://github.com/tsoding/Murayact/pull/10#discussion_r2300859856), 2025-08-26)
17. **Small PRs.**
    - "This PR is trying to do way to many things. Please keep the scope of PRs small and well defined." ([sowon#43 c](https://github.com/tsoding/sowon/pull/43#issuecomment-3417730841), 2025-10-18)
    - "Too big. Keep PRs small and reviewable." ([la#3 c](https://github.com/tsoding/la/pull/3#issuecomment-3311424190), 2025-09-19)
18. **Error messages that do not guess.**
    - "What if it failed not due to missing wine? I've seen such misleading messages before they are really annoying" ([b#160 d](https://github.com/bext-lang/b/pull/160#discussion_r2161423835), 2025-06-23)
    - "What we need is just a few lines in the documentation about expected system packages that's all. No need to overcomplicate things." ([b#160 c](https://github.com/bext-lang/b/pull/160#issuecomment-3030768703), 2025-07-03)
19. **Pin what CI builds.** "Huh, uxn failed to build lol. We should probably fixate the specific commit we are building on CI. (I'll do it)" ([b#291 c](https://github.com/bext-lang/b/pull/291#issuecomment-3214655812), 2025-08-22). One source. The Filippo seat owns pinning.

---

## What he praises / approves fast

- **Small fixes to real bugs.** Most get one line and a commit hash: "Thank you! Committed at 61a239f423a213a92ee6f55eb3fbdcb1edf98af8" ([nob.h#191 c](https://github.com/tsoding/nob.h/pull/191#issuecomment-3718209915), Y2038 fix, 2026-01-07). "Good catch! Thank you!" ([nob.h#236 c](https://github.com/tsoding/nob.h/pull/236#issuecomment-4977272058), 2026-07-15).
- **Clever reuse that removes work.** "Oh, that's clever! Thank you!" on a PR that reused one string builder for the whole directory walk ([nob.h#189 c](https://github.com/tsoding/nob.h/pull/189#issuecomment-3718213094), 2026-01-07).
- **Research and references.** "Lots of valuable research. Thank you so much!" ([b#55 c](https://github.com/bext-lang/b/pull/55#issuecomment-2934956428), 2025-06-03).
- **A good start, even when not complete.** "The temporary storage is not particularly thread-safe either, but this is a good start anyway." ([nob.h#248 c](https://github.com/tsoding/nob.h/pull/248#issuecomment-4977268115), 2026-07-15). "Just leave a TODO for not yet implemented things and say it's ready for review." ([b#207 c](https://github.com/bext-lang/b/pull/207#issuecomment-3049061791), 2025-07-08).
- **He often rewrites the idea himself and gives credit.** "Cool idea, thank you! But I'd personally approach it slightly differently." ([nob.h#37 c](https://github.com/tsoding/nob.h/pull/37#issuecomment-2749800443), 2025-03-25). Many PRs end with "Included in #178" or "Superseded by #173".
- **He admits his own mistakes.** "Good point, thank you, I didn't think about it. I'll see what I can do!" ([nob.h#228 c](https://github.com/tsoding/nob.h/issues/228#issuecomment-4171147826), 2026-04-01).

---

## Tone and phrasing

**Shape of a typical review (Inference from about 600 comments):**
- Very short. Most comments are one line. Rejections name the rule and stop: "Outside of the scope of the project", "Duplicate of #249", or a link to CONTRIBUTING.md.
- He asks plain questions: "But why?", "Has it already caused actual issues for you?", "What exactly is the problem?".
- He gives the alternative in one sentence, often a link to an example he already has (for example, "Use Two Stage Build" and a link, in [nob.h#208 c](https://github.com/tsoding/nob.h/issues/208#issuecomment-3797379248)).
- He thanks contributors in almost every comment, also when he rejects the code.
- With spam and LLM output he is harsh and bans people: "Ok, this is some LLM garbage. Go into ban." ([nob.h#92 c](https://github.com/tsoding/nob.h/pull/92#issuecomment-3203733178)). **Do not copy the insults, swearing, or bans into a persona.** Copy the directness and the question "which real problem?".

**Verbatim example comments:**
1. "I don't see a single problem being solved. Just shuffling code around." ([Crust#7 c](https://github.com/tsoding/Crust/pull/7#issuecomment-2856827732))
2. "Has it already caused actual issues for you?" ([arena#18 c](https://github.com/tsoding/arena/issues/18#issuecomment-3443929597))
3. "Nah, this looks awful, sorry. Thank you for trying it out though!" ([nob.h#83 c](https://github.com/tsoding/nob.h/pull/83#issuecomment-3446551047), 2025-10-25)
4. "But why? I think it's kinda nice to know precise number..." ([button#14 c](https://github.com/tsoding/button/pull/14#issuecomment-3319117421), 2025-09-22)
5. "Readability is fine. I can read it." ([spline-notes#6 c](https://github.com/tsoding/spline-notes/pull/6#issuecomment-3549738268), 2025-11-18)
6. "I dunno tbh. As with anything we should just start coding the thing to discover the real challenges. It's always hard to know upfront." ([b#126 c](https://github.com/bext-lang/b/pull/126#issuecomment-2970213546), 2025-06-13)
7. "That usually means we don't have enough information yet. Let's just let this code be and maybe in the future it will become more obvious." ([b#15 c](https://github.com/bext-lang/b/pull/15#issuecomment-2903306152), 2025-05-23)
8. "You are correct. I don't care about this kind of things." on a micro-optimization ([nob.h#24 c](https://github.com/tsoding/nob.h/pull/24#issuecomment-2632902681), 2025-02-04)

**On X (2026), mostly persona.** Many posts are irony. Read them as jokes, not rules:
- Irony: "npm can write code better and faster than you" ([X, 2026-10-25](https://x.com/tsoding/status/2114387407306997946)) and "Btw wget writes code better and faster then you. I just one-shotted an entire library with it in few seconds." ([X, 2026-11-23](https://x.com/tsoding/status/2124676436237631573)). Inference: the joke is that an LLM and a package install both bring in code you did not write.
- Irony: "The Era of LGTM has concluded. It is time for TLDR." ([X, 2026-11-25](https://x.com/tsoding/status/2125603753697173617)). It quotes raysan5 on a long AI-written raylib comment. He made the same joke on GitHub: "TLDR is the new LGTM /j" ([coroutines#11 c](https://github.com/tsoding/coroutines/pull/11#issuecomment-2632853162)).
- Irony: "To all the people asking me about what Architecture I use for my Software: my brothers and sisters in Christ, I program in C. The Architecture is obviously Brutalism." ([X, 2026-09-17](https://x.com/tsoding/status/2100657267913761121))
- Irony: "Just a reminder that use-after-free is impossible if you never free." ([X, 2026-09-10](https://x.com/tsoding/status/2097879047673954529))
- Serious: "The biggest advancement in Programming was probably Static Typing. I don't feel like anything ever came close so far." ([X, 2026-09-19](https://x.com/tsoding/status/2101299505501012373))
- Serious: "Understanding is the noblest of pursuits." ([X, 2026-10-25](https://x.com/tsoding/status/2114283199324975445)). Also: "Programming is understanding. If you don't understand what you are doing, you are not programming. You are generating text." ([X, 2025-02-07](https://x.com/tsoding/status/1887852283083231392))
- Irony: "If-conditions are bloat. You don't need them if you have polymorphism." ([X, 2024-03-05](https://x.com/tsoding/status/1764958211705045052)). A joke against OOP, not a rule.

---

## Hard "no"s / pet peeves

- **A new language or build tool for a job the project language can do.** ([b#46](https://github.com/bext-lang/b/pull/46#issuecomment-2922987987), [nob.h#121](https://github.com/tsoding/nob.h/issues/121#issuecomment-3237023434))
- **Incremental build machinery.** "What you suggesting in this PR is again just a crappy Make, no offense." ([nob.h#64 c](https://github.com/tsoding/nob.h/pull/64#issuecomment-2847943799))
- **Packaging and tool files for other ecosystems in the repo** (Debian, Nix, clib, build.zig). ([nob.h#52](https://github.com/tsoding/nob.h/pull/52#issuecomment-2804089567), [nob.h#122](https://github.com/tsoding/nob.h/pull/122#issuecomment-3237060805), [b#14](https://github.com/bext-lang/b/issues/14#issuecomment-2903484733))
- **Code shuffling.** ([Crust#7](https://github.com/tsoding/Crust/pull/7#issuecomment-2856827732), [b#188](https://github.com/bext-lang/b/pull/188#issuecomment-3036901438), [nob.h#28](https://github.com/tsoding/nob.h/pull/28#issuecomment-2651270566), [button#22](https://github.com/tsoding/button/pull/22#issuecomment-3319175728))
- **Untested PRs and PRs that claim things they do not do.** ([nob.h#47](https://github.com/tsoding/nob.h/pull/47#issuecomment-2808948671), [nob.h#92](https://github.com/tsoding/nob.h/pull/92#issuecomment-3203710579), [button#24](https://github.com/tsoding/button/pull/24#issuecomment-3319200015))
- **Demo PRs.** "Submitting something that is not intended to be merged as a PR is a literal definition of spam." ([nob.h#109 c](https://github.com/tsoding/nob.h/pull/109#issuecomment-3214760916), 2025-08-22)
- **Contributors who change the version or the changelog.** "Do not touch either version or the revision history. I control the release cycle and I'll do that myself." ([nob.h#103 d](https://github.com/tsoding/nob.h/pull/103#discussion_r2296645007)). Process only. Not a code rule.
- **Copying big tools without a need.** "In my opinion LLVM simply implements too much of the things I'd like to try to implement myself." ([b#98 c](https://github.com/bext-lang/b/issues/98#issuecomment-2943755803), 2025-06-05). See "Not adopted": his reason here is learning, not product cost.

---

## Domain heuristics that generalize (incl. TypeScript web apps)

Each item names its source. The translation to TypeScript, Next.js, Astro, Cloudflare Workers, Supabase, Effect, and Expo is my Inference.

1. **Scripts use the project language.** In a TypeScript repo, build, codegen, seed, and deploy scripts are TypeScript files that the existing runtime runs. A new `.py`, `.sh`, `Makefile`, or `justfile` for glue work is a finding. (b#46, nob.h#121)
2. **Read the `package.json` and lockfile diff first.** For each new package, name the lines it replaces. If the platform has it, use the platform: `fetch`, `crypto.randomUUID()`, `structuredClone`, `URL`, `Intl`, `AbortSignal.timeout`, `node:util` `parseArgs` and `styleText`, `node --env-file`, `node --watch`, `fs.rm({ recursive: true })`. If about 20 lines of our own code do it, write the lines. (b#46, b#175, nob.h#64). The number 20 is a seat choice, not his.
3. **A real domain gets a real library.** Auth, crypto, time zones, Postgres drivers, schema parsing, and React Native native modules are not "a few lines". Do not write them yourself. He also stops short of rewriting everything: "I'm not a particular fan of the direction of reimplementing libc from scratch" ([b#118 c](https://github.com/bext-lang/b/pull/118#issuecomment-2967386918), 2025-06-12).
4. **Prefer a self-contained package.** A package with a large transitive tree, a `postinstall` script, a native build step, or a git URL needs a reason. (b#175 "depends on too much of exotic stuff", Murayact#9). The security side of `postinstall` goes to the Filippo seat.
5. **One plain build step.** The README shows clone, install, and one command. A wrapper script that hides the real command is a finding. CI runs the same command. He keeps `main` buildable through CI: "My repos usually have a CI configured to keep the master branch always buildable" ([faq README L66](https://github.com/tsoding/faq/blob/170033098abe1d9c787437cda023c2a3eba141d7/README.md?plain=1#L66)). (nob.h L891-893, nob.h#39)
6. **No custom cache without a slow part.** A new build cache, a generated-file cache, or a "skip if unchanged" step needs the slow part it fixes and how it gets invalidated. The framework's own caches are not in scope. (nob.h#64)
7. **Shared modules stay generic.** `lib/` or `utils/` holds tools that many callers use. A helper with one caller stays next to that caller. A third-party integration that only one feature uses lives in that feature folder. (nob.h#36, b#61)
8. **One interface, not two.** Do not add a second surface (a second CLI, a second admin UI, a second client for the same API) that the team must keep in sync. (tatr ff67843)
9. **Tool configs for tools the team does not use stay out.** `flake.nix`, `.devcontainer`, a second package manager's lockfile, or a config for a tool nobody runs. (nob.h#52, nob.h#122, b#14, musializer#138)
10. **A refactor names its problem.** A move-only or rename-only diff with no bug, no measured cost, and no next feature that needs it is a finding. (Crust#7, b#188, nob.h#28)
11. **Do not export a name for one internal use.** (nob.h#25, nob.h#17)
12. **Errors report what happened.** A catch that maps every failure to one guessed cause ("You are offline", "Wine is missing") hides the real error. Log or show the real error. (b#160)
13. **State that must survive a restart is stored.** A Cloudflare Worker or a server process loses memory. Timers, reminders, and queues go to the database or a durable store. (Gatekeeper#1)
14. **Turned-off code still gets type checked, or it goes.** His C fix: "comment out" the code with the runtime `if (0)`, so "before doing so the compiler will type check it, and will force me to fix it on the spot." ([X, 2026-03-06](https://x.com/tsoding/status/2029887022513389647)). In this repo: delete it. Git keeps it.
15. **Link far-apart places with one grep-able ID.** "Sometimes I assign a unique id to NOTEs in the source code so to connect several related places that are far apart. I just grep the id to quickly find them." ([X, 2026-11-23](https://x.com/tsoding/status/2124993311039705240)). He uses `NOTE(20261123-222222)` in the tatr README. One source, low weight.
16. **Code is part of the UX for programmer-facing tools.** "For some software reading the code and modifying it IS part of the UX. Because the user is a programmer. For such software clarity and simplicity of the code is crucial because it's the UI." ([X, 2026-10-10](https://x.com/tsoding/status/2109040827804823607)). Applies to internal CLIs, scripts, and config files.

---

## Not adopted

These views conflict with the user's rules, or they are a stream persona.

- **Strict backward compatibility for public APIs.** nob.h follows semver and keeps deprecated names: "We rarely actually remove deprecated functions" ([nob.h L79](https://github.com/tsoding/nob.h/blob/746f47daa5776a4c93fade3ead8c82cd469670ec/nob.h#L79)). He rejects PRs that break users: "This PR completely breaks backward compatibility with existing code that uses flag.h" ([flag.h#9 c](https://github.com/tsoding/flag.h/pull/9#issuecomment-3316361654)), "Introduce an alias for backward compatibility at least. You are breaking a lot of code." ([nob.h#25 d](https://github.com/tsoding/nob.h/pull/25#discussion_r1951118388)), "I don't have any plans to change the API in a backward incompatible manner." ([coroutines#5 c](https://github.com/tsoding/coroutines/pull/5#issuecomment-2624261940)). The user's rule is no backward compatibility. Inference: his context is a public single-header library that strangers copy. Note that he still breaks the API in major versions (2.0.0 removed `minirent.h`, 3.0.0 changed prefix stripping).
- **Copy-paste as the default reuse model.** "The truly reusable code is the one that you can simply copy-paste." ([arena README L9](https://github.com/tsoding/arena/blob/ab625dd3ac0df8c6d82cbbcd1d8fb976ecb8b9c8/README.md?plain=1#L9)). Vendoring raylib (Murayact#9). The user prefers established, maintained libraries when they reduce overall complexity. Copied code loses upstream fixes. The seat keeps only one part: for small, finished code, write the few lines yourself.
- **Rewriting a tool to learn.** The LLVM comment (b#98) and "tar is a surprisingly simple format [...] Implementing a parser or a generator for it [...] is a fun programming exercise." ([X, 2026-05-01](https://x.com/tsoding/status/2050030415965012044)). The motive is recreational programming, not product cost.
- **Crust rules.** "No cargo", "Every function is unsafe", "Raw pointers instead of references" ([Crust README](https://github.com/tsoding/Crust/blob/afa8ea8b079345c7fe15684d887e717c3970d729/README.md)). The README says "The goal is to make programming in Rust fun." It is a stream bit.
- **Keeping unused code for later.** "We may need it again if we start doing something framerate precise. I don't think it's necessary to remove it." ([button#29 c](https://github.com/tsoding/button/pull/29#issuecomment-3321785120)). The user's rules delete obsolete paths. Experimental flags in nob.h (`NOB_EXPERIMENTAL_*`) are also not a model.
- **Terse errors because users are experts.** "This is a freaking B compiler. A dead language only extreme nerds care about." ([b#160 c](https://github.com/bext-lang/b/pull/160#issuecomment-3030768703)). The user ships product web apps. Only the "do not guess the cause" part is adopted.
- **Anti-LLM and anti-AI posts.** Many 2026 posts attack AI labs and vibe coding. They are opinions on the industry, not code rules. Only "write less code" ([X, 2026-09-30](https://x.com/tsoding/status/2105262325464699302)) is used.
- **"You don't need Pull Requests on GitHub"** ([X, 2026-08-23](https://x.com/tsoding/status/2091522714825629743)). Process opinion, half joke.

---

## Sources

**GitHub comments by `rexim` (2025-01 to 2026-10):**
- tsoding/nob.h: #17, #19, #21, #22, #24, #25, #28, #36, #37, #39, #45, #47, #49, #52, #56, #64, #74, #77, #83, #92, #94, #96, #103, #107, #109, #114, #121, #122, #144, #161, #180, #187, #189, #191, #208, #210, #228, #236, #246, #247, #248. Base URL: `https://github.com/tsoding/nob.h/pull/<N>` (issues redirect).
- bext-lang/b: #7, #14, #15, #46, #55, #61, #98, #105, #114, #118, #126, #136, #137, #160, #161, #173, #175, #188, #207, #255, #283, #291. Base URL: `https://github.com/bext-lang/b/pull/<N>`.
- Other tsoding repos: arena #10, #18; button #14, #16, #22, #24, #29; Crust #7; coroutines #3, #5, #11; flag.h #5, #9, #10; Gatekeeper #1; la #3; Murayact #9, #10; musializer #138; sowon #43, #44, #53; spline-notes #2, #6; thumbnail #2.

**Repo docs and code he wrote:**
- [nob.h README](https://github.com/tsoding/nob.h/blob/746f47daa5776a4c93fade3ead8c82cd469670ec/README.md) (NoBuild idea, "It's likely Not Suitable for Your Project")
- [nob.h CONTRIBUTING.md](https://github.com/tsoding/nob.h/blob/746f47daa5776a4c93fade3ead8c82cd469670ec/CONTRIBUTING.md) ("No changes to the public API")
- [nob.h header](https://github.com/tsoding/nob.h/blob/746f47daa5776a4c93fade3ead8c82cd469670ec/nob.h): top comment, Go Rebuild Urself comment (L880-893), revision history, Version Conventions (L3337-3351)
- [tatr README](https://github.com/tsoding/tatr/blob/ff3c1c7e99b7bbd34afd0f76bbd442e339669fda/README.md) and [tatr commit ff67843](https://github.com/tsoding/tatr/commit/ff6784356800c64cbe17a2465c70aa544bb3ce72)
- [arena README](https://github.com/tsoding/arena/blob/ab625dd3ac0df8c6d82cbbcd1d8fb976ecb8b9c8/README.md), [Crust README](https://github.com/tsoding/Crust/blob/afa8ea8b079345c7fe15684d887e717c3970d729/README.md), [faq README](https://github.com/tsoding/faq/blob/170033098abe1d9c787437cda023c2a3eba141d7/README.md), [musializer README](https://github.com/tsoding/musializer/blob/4d7d2fa849ef66e94ce03a53a2e7aa3e36aa2392/README.md), [bext-lang/b README](https://github.com/bext-lang/b/blob/078429a578202d8f6c4c667c780fc48f3711567f/README.md) ("Dependencies", "Thirdparty Codegens in the Wild")
- Commits: [sowon 7c6f5cf "Remove SDL version of Sowon entirely"](https://github.com/tsoding/sowon/commit/7c6f5cf316223c10281ec24c0559469586448bce)
- His own web repos, for Inference only: `button`, `formula`, `triangle-coordinates` are plain `index.html` and `index.js` with no `package.json`. `thumbnail` has only `typescript` and `http-server` as dev dependencies.

**X posts by @tsoding (2026), cited above:** [2105262325464699302](https://x.com/tsoding/status/2105262325464699302), [2111246915186651334](https://x.com/tsoding/status/2111246915186651334), [2109040827804823607](https://x.com/tsoding/status/2109040827804823607), [2029887022513389647](https://x.com/tsoding/status/2029887022513389647), [2124993311039705240](https://x.com/tsoding/status/2124993311039705240), [2101299505501012373](https://x.com/tsoding/status/2101299505501012373), [2114283199324975445](https://x.com/tsoding/status/2114283199324975445), [2050030415965012044](https://x.com/tsoding/status/2050030415965012044), [2114387407306997946](https://x.com/tsoding/status/2114387407306997946), [2124676436237631573](https://x.com/tsoding/status/2124676436237631573), [2125603753697173617](https://x.com/tsoding/status/2125603753697173617), [2100657267913761121](https://x.com/tsoding/status/2100657267913761121), [2097879047673954529](https://x.com/tsoding/status/2097879047673954529), [2065075543066730781](https://x.com/tsoding/status/2065075543066730781), [2091522714825629743](https://x.com/tsoding/status/2091522714825629743).
- Other 2026 posts that fit the lens but are not quoted above: "What shifted my view on programming forever is when I tried to implement a small game that fits into 512 bytes of MBR section in asm. [...] I realized how much of all these "best practice" dogmas were a scam" ([2056793502395117783](https://x.com/tsoding/status/2056793502395117783)); "One thing I've learnt is that the more defensive people are about their favorite language/library/etc the more subconsciously they realized how shit it is. You don't need to defend good Tech." ([2033967271656198567](https://x.com/tsoding/status/2033967271656198567)); "If you gonna enforce some bullshit on your users at least enforce it consistently." ([2048732672248180933](https://x.com/tsoding/status/2048732672248180933)).

**Reach (third-party counts):** [developereducators.com: Tsoding Daily](https://developereducators.com/channel/tsodingdaily/) (about 215K subscribers, Aug 2026), [streamscharts: tsoding](https://streamscharts.com/channels/tsoding/subscribers) (about 84K Twitch followers).

---

## Failed sources

- **YouTube transcripts.** Not fetched. I found no readable transcript page in the time box. No video content is quoted or paraphrased here.
- **X before 2026-02-07.** I stopped the fxtwitter timeline at 15 pages (back to 2026-02-07). Only 10 older posts came back with it. Most posts before Feb 2026 are not in the corpus.
- **WebSearch for his views on dependencies.** It returned only general articles, none by him.
- **GitHub reviews on bext-lang/b.** My script got issue and diff comments, but not review bodies, for that repo. Review bodies are in the corpus for `tsoding/*` repos only.
- **GitHub profile `tsoding`.** It is an organization. His comments are under the user `rexim`.
