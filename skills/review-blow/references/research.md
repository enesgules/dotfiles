# Jonathan Blow (@Jonathan_Blow): code-review research

Research date: 2026-11-26. Weighting: 2025 to Nov 2026 highest.
Main corpus: 222 of his own X posts, 2026-02-20 to 2026-11-24 (20 timeline pages through the fxtwitter API, retweets removed). Each X quote below was checked again through `/2/status/<id>`. Other sources: his blog series "Braid Code Cleanup" (2016), his 2011 slides "Programming Aesthetics learned from making independent games", the transcript of "Preventing the Collapse of Civilization" (2019), the Notion "Pioneers" interview transcript (2021), the GamesBeat interview (2026-10-13), and a copy of his 2019 unit-testing thread.
Every quote is verbatim. I kept his typos ("owncode", "probelm", the double space in "know  or care"). For the slides, I joined text boxes and changed runs of spaces to one space. "Inference" marks my own reading. "Paraphrase" marks text that I did not quote.

Context of the user's request: the user asked for "brown, a famous game dev". Two searches found no famous programmer game developer named Brown. Mark Brown (Game Maker's Toolkit) is a design critic, not a programmer. Jonathan Blow is the match.

---

## Current focus (what he works on now)

- **Order of the Sinking Star shipped on 2026-10-08** (Steam, Switch 2, PS5): "After TEN LONG YEARS, Order of the Sinking Star is out Now!" ([post](https://x.com/Jonathan_Blow/status/2108250589734043981)). Steam first week: "Order has sold 45% more units on Steam in its first week than Witness did." ([post](https://x.com/Jonathan_Blow/status/2110828215501750678)). Chinese voice update on 2026-11-21 ([post](https://x.com/Jonathan_Blow/status/2124010308670980339)). Japan console launch with PLAYISM on 2026-10-28 ([post](https://x.com/Jonathan_Blow/status/2115492846690242859)).
- **The game is written in Jai, his own language, on his own engine.** Team size: "we have four programmers. We not only made the game with four programmers, we made the engine and the programming language." ([GamesBeat, 2026-10-13](https://gamesbeat.com/how-thekla-created-order-of-the-sinking-star-with-1500-puzzles-jonathan-blow-exclusive-intervie/)). The next game uses "the same engine and the same programming language" (same interview).
- **Engine source release is planned:** "Reminder: a little while after Order of the Sinking Star ships, we will be giving out the game engine (full source) for free!" ([post, 2026-07-21](https://x.com/Jonathan_Blow/status/2079666794693046419)).
- **The Jai compiler is still a closed beta.** He adds people by email: "There are many requests to get into the compiler beta." ([post, 2026-04-04](https://x.com/Jonathan_Blow/status/2040535261550186745)). His bio is "\% enjoyer.", a joke about the Jai `print` escape.
- **Planned talk:** "After this game ships I'll do a talk called Surviving Long Projects." ([post, 2026-02-20](https://x.com/Jonathan_Blow/status/2024697919736332359)).
- **AI and software quality is his main recurring code topic in 2026.** On 2026-11-13 the channel The Students published a 100-minute talk with Wolf Tivy: "Jonathan Blow — If AI Solved Coding, Why Is My Software Still the Same?" ([YouTube](https://www.youtube.com/watch?v=IRK8h67ol7Q)). I could not get a transcript, so this file does not quote it.

---

## Core values

1. **Complexity is the real cost of software.** He agreed with "The limiting factor of software engineering has never been code production. It is complexity management." with "1000% true." ([post, 2026-07-28](https://x.com/Jonathan_Blow/status/2082186305367335195)). In 2021: "what programmers do most of the time is waste right now." and "It’s mostly dealing with complexity that doesn’t need to be there" ([Notion interview](https://www.notion.com/blog/jonathan-blow)). In 2019: "It's because we're adding too much complication to everything, right?" ([talk transcript](https://codigoyfika.github.io/site/preventing-collapse)).
2. **Delete what does not need to exist.** "Maybe we should delete the 99% of stuff that is just wasteful and friction-causing, the main purpose of which seems just to be to increase attack surface." ([post, 2026-10-25](https://x.com/Jonathan_Blow/status/2114403536482304235)). In his own code: "Delete a bunch of unused code from the game: 10,254 lines removed." ([Braid Code Cleanup 1](http://number-none.com/blow/blog/programming/2016/07/16/braid_code_cleanup_1.html)). Also: "We don’t need this any more, and if we ever do, it’s in source control. Deleted." ([Braid Code Cleanup 3](http://number-none.com/blow/blog/programming/2016/07/18/braid-cleanup-part-3.html)).
3. **Specific, hardcoded code beats a general system.** "A generalized system is usually worse than a specific / hardcoded one!" ([2011 slides](https://number-none.com/blow/slides/CSUA%20talk.ppt)). About his own plugin-style bitmap loader: "This is a very ‘abstracted engine’ way of thinking, and you know what, meh." It "has turned out to be no more useful than just editing a hardcoded procedure that looks at a file extension and calls the appropriate code." ([Braid Code Cleanup 1](http://number-none.com/blow/blog/programming/2016/07/16/braid_code_cleanup_1.html)). In 2026 he called a post about OOP generality an "Accurate description." That post says: "this level of generality/flexibility is almost always unnecessary and has non-trivial compile time, run time, and complexity costs." ([post](https://x.com/Jonathan_Blow/status/2054969661973049417)).
4. **Explicit order beats generic dispatch.** "The idea of a generic tick function for entities is really not great to begin with, because in a complex game you end up caring a great deal about what order things happen in, then you need to go to great pain to impose this order. Instead, you can just say "do A, then B, ..."" ([post, 2026-03-26](https://x.com/Jonathan_Blow/status/2037296285506822315)). In 2011: "Straight-line code preferred over function calls" ([slides](https://number-none.com/blow/slides/CSUA%20talk.ppt)).
5. **Software must work for the user, whatever the cause.** "users do not know  or care why your program is failing, they just see your program failing and want it to work, and it’s your job to fix that by whatever means necessary." ([post, 2026-08-12](https://x.com/Jonathan_Blow/status/2087605350518403319)). His example: an AMD driver crashed Braid, "and yes, it was my job to fix that, because that is just the reality of software." ([post](https://x.com/Jonathan_Blow/status/2087617106200473869)). In 2019: "we simply don't expect software to work anymore." ([transcript](https://codigoyfika.github.io/site/preventing-collapse)).
6. **The actual job is what counts. The mechanism is a detail.** "I say "opening a dialog box" because that is the actual job. Launching another program is an implementation detail (and a poorly-chosen one). The only acceptable answer for how long this takes on a modern machine is "when the next rendered frame is displayed on the monitor"." ([post, 2026-05-05](https://x.com/Jonathan_Blow/status/2051714552417427583)). On a language server: "it's basically a more complicated slower way to do libraries." and "Which has now turned your single program into a distributed system." ([transcript](https://codigoyfika.github.io/site/preventing-collapse)).
7. **Code that confuses its reader is a defect, even when it works.** "The old idiom works, but the problem is, it’s confusing; if it confused me, it is much more likely to confuse people in the future who didn’t write the code in the first place." ([Braid Code Cleanup 4](http://number-none.com/blow/blog/programming/2016/07/19/braid_cleanup_4.html)). About his compiler: "not only do I not understand what this is doing, but I have a sinking feeling when I know I’m going to go look at that" ([Notion interview](https://www.notion.com/blog/jonathan-blow)).
8. **Simplify now. Do not wait until after the release.** "removing complexity is still the right short-term play, even if it doesn't seem like it." and "we're gonna stick out the five months and that's always wrong." ([transcript](https://codigoyfika.github.io/site/preventing-collapse)). In 2026, about a general list of rules: "I would tolerate problems for *way* too long" ([post](https://x.com/Jonathan_Blow/status/2077124506829926653)). Inference: he applies this to code too, as the Braid cleanup shows.
9. **Lines of code are cost, not output. AI does not change this.** He replied "Full-on victim of AI psychosis???" to Garry Tan's post that the "sacred cow of “LOC is bad” is probably wrong in agentic engineering" ([post, 2026-03-30](https://x.com/Jonathan_Blow/status/2038737683074400572)). He measures his own cleanups in lines removed ([Braid Code Cleanup 1](http://number-none.com/blow/blog/programming/2016/07/16/braid_code_cleanup_1.html)). On LLMs: "they are deeply subject to suggestion, and spend a lot of energy just following the implications built into the questions you ask." and "People use these for programming." ([post, 2026-08-18](https://x.com/Jonathan_Blow/status/2089539369715851746)).

---

## Review checklist (what he checks or pushes back on)

1. **Does this code need to exist?**
   - "I never knew what code Braid might and might not use, so I just left everything in there in case I might want it." ([Cleanup 1](http://number-none.com/blow/blog/programming/2016/07/16/braid_code_cleanup_1.html)). He then deleted it.
   - "Delete silly global variable" and "Why was that there? Nobody uses it, thankfully." ([Cleanup 3](http://number-none.com/blow/blog/programming/2016/07/18/braid-cleanup-part-3.html))
   - A safety copy of a file from 2008: "We don’t need this any more, and if we ever do, it’s in source control. Deleted." ([Cleanup 3](http://number-none.com/blow/blog/programming/2016/07/18/braid-cleanup-part-3.html))
2. **Count the branches, not only the lines.** Removing demo mode: "This only removed 319 lines, but those 319 lines contained a lot of ‘if’ statements and complications around key moments of game flow, so this is a pretty good win." ([Cleanup 1](http://number-none.com/blow/blog/programming/2016/07/16/braid_code_cleanup_1.html))
3. **Is a general system hiding a few specific cases?**
   - Plugin registry: "there’s boilerplate code there, and an API that each Bitmap_Loader_Module must conform to, and it’s just not necessary" ([Cleanup 1](http://number-none.com/blow/blog/programming/2016/07/16/braid_code_cleanup_1.html)). His fix: "There is no longer a ‘Bitmap_Loader’ class, we just load stuff via flat functions" ([Cleanup 2](http://number-none.com/blow/blog/programming/2016/07/17/braid_code_cleanup_2.html)).
   - "Generalized systems are harder to delete later!" and "Later on, how do you know if you can delete this generalized system or not?" ([2011 slides](https://number-none.com/blow/slides/CSUA%20talk.ppt))
   - On a new system: "This should only ever be a last resort." (slide title: "Adding new systems") ([slides](https://number-none.com/blow/slides/CSUA%20talk.ppt))
4. **Hooks that grow hooks.** "So instead of having a generic tick function where you switch on entity type, and then a generic pre-tick because of course you need that, and pre-pre-tick, and post-tick, etc, you just have small bits of code where you iterate over things by type and do what that type needs." ([post, 2026-03-26](https://x.com/Jonathan_Blow/status/2037295493085319580))
5. **Machinery that fails at a simple job.** "Everyone wants to think they are in the Matrix and doing some super cool entity simulation reality engine. In reality it is just clumsy code failing to do something simple, at great cost in complexity, speed and reliability." ([post, 2026-03-27](https://x.com/Jonathan_Blow/status/2037322309502185845))
6. **Does the API tell the truth?**
   - "In Braid there is no such thing as synchronously loading a jpeg, even though the API looks like there is. This is very error-prone which is one reason I want to get rid of it!" ([Cleanup 3](http://number-none.com/blow/blog/programming/2016/07/18/braid-cleanup-part-3.html))
   - "it just *really* doesn't make sense to pretend things are files." ([post, 2026-05-01](https://x.com/Jonathan_Blow/status/2050290168624812255)). Also: "Just give me an API that returns the data" ([post](https://x.com/Jonathan_Blow/status/2050273127188529565)).
7. **A process or protocol where a function call does the job.** The language server example: "your editor talks over a socket to the server and the server talks back and gives you the answer, right? Which has now turned your single program into a distributed system." ([transcript](https://codigoyfika.github.io/site/preventing-collapse))
8. **Stale defensive code.** A copy-then-destroy loop was kept after the engine made direct destroy safe: "it’s just that after making it safe, I never went back and cleaned up old code." ([Cleanup 4](http://number-none.com/blow/blog/programming/2016/07/19/braid_cleanup_4.html))
9. **A hack with no comment.** "somewhat irresponsibly I did not leave a comment about what I was doing before and how bad it was (double ugh!)" ([Cleanup 2](http://number-none.com/blow/blog/programming/2016/07/17/braid_code_cleanup_2.html)). Also: "the code with ‘texture_name = NULL’ was technically valid, but really not good." (same post)
10. **Clever math where a plain step is clear.** "Rather than do some weird math that is harder for people to understand in the future, I think the simplest and most robust way is to add" a plain guard to the loop body. He found the bug because he went fast: "Of course I had the sense yesterday that I should stop and think about the loop condition carefully, but I didn’t want to – I wanted to go fast." ([Cleanup 3](http://number-none.com/blow/blog/programming/2016/07/18/braid-cleanup-part-3.html))
11. **Duplicate implementations.** "I guess he didn’t see Pool because that already did exactly what he did." ([Cleanup 3](http://number-none.com/blow/blog/programming/2016/07/18/braid-cleanup-part-3.html))
12. **Mechanical edits get a diff review.** "When cranking through hundreds of examples in a row like that, it feels a little too easy to accidentally also delete some other loop condition." He found one bug, and "The check only took about 25 minutes, so I think it was a good idea." ([Cleanup 4](http://number-none.com/blow/blog/programming/2016/07/19/braid_cleanup_4.html))
13. **Wrong order of steps: revert, then redo in small steps.** "We are going about this in the wrong order." then "Revert!!" ([Cleanup 2](http://number-none.com/blow/blog/programming/2016/07/17/braid_code_cleanup_2.html)). Also: "I am going to revert back to working code from this morning and re-do everything in smaller steps until I figure out what happened or else just mysteriously succeed this time." Result: "It takes only 10 minutes to figure out the bug this way, as opposed to the 2 hours I spent of “legitimate” debugging" (same post).
14. **Visible glitches are bugs.** "every time I press enter in gmail, a scrollbar appears on the side of my email for 1 frame, and the text re-wraps." and "The vibes. Embarrassing." ([post, 2026-08-03](https://x.com/Jonathan_Blow/status/2084360525044191657)). Also: "VLC now takes 33 seconds to start playing an mp3 after clicking on it." ([post](https://x.com/Jonathan_Blow/status/2087564889154089120)). And: ""Programming is solved" but ChatGPT's own interface frequently locks up or becomes unbearably slow. It's text with a few photos." ([post](https://x.com/Jonathan_Blow/status/2094873741776023750))
15. **Measure the real thing, or you measure nothing.** "If you aren't doing equivalent motion-to-photon measurements for the two methods, you aren't really measuring anything." ([post, 2026-05-05](https://x.com/Jonathan_Blow/status/2051714859549487172)). Inference: speed numbers belong to the Yagiz seat. Keep only this point: measure what the user sees.
16. **Tests that freeze an API.** From a copy of his 2019 thread: "If all those unit tests are expecting your API to be a certain way, it is a giant pain in the butt to change it to the thing that you discover to be better later on, which happens 100% of the time." But also: "So yes, test your software, absolutely. If there are convenient tests that you can put down by leaf code, with which you achieve a high benefit to cost ratio, by all means go for it." ([copy of thread](https://rudranilbasu.github.io/blog/programming/2019/11/12/Unit-Testing); the original posts now return 404)
17. **Test end to end on a second machine.** "always test things end-to-end on a second machine is a thing that programmers learn pretty early on in development." ([Cleanup 4](http://number-none.com/blow/blog/programming/2016/07/19/braid_cleanup_4.html))
18. **Toy demos prove little.** "It’s not that hard to make something that works well for toy problems." and, about self-hosting compilers: "that doesn’t seem to me like a very good test." ([Notion interview](https://www.notion.com/blog/jonathan-blow))

---

## What he praises

- **Concise reasoning from a developer.** "explain what's going on, what is coming up, and the reasoning behind decisions, concisely, without betaing yourself like so many developers seem to be doing lately." ([post, 2026-10-09](https://x.com/Jonathan_Blow/status/2108600076851720444)). Inference: this maps to a PR description: what, why, next, and no apology.
- **Code that gets smaller.** About a tool after cleanup: "The tool itself is down to 2,123 lines – much smaller than it was before, which is a really good thing for tools since those are the things most likely to break / rot by the time you need to figure them out years later." ([Cleanup 3](http://number-none.com/blow/blog/programming/2016/07/18/braid-cleanup-part-3.html))
- **The fifth version.** "by the time I have that fifth time version, it is much simpler. It’s usually faster. It’s usually more robust and will communicate better to future people because I had experience now." ([Notion interview](https://www.notion.com/blog/jonathan-blow))
- **Plain data in memory.** "It simplifies life if you just always deal in memory, and in the cases where you are explicitly loading files, first load the file then pass it to the back-end routines that parse memory." ([Cleanup 3](http://number-none.com/blow/blog/programming/2016/07/18/braid-cleanup-part-3.html)). Also: "Now I use arrays of records for almost everything." ([2011 slides](https://number-none.com/blow/slides/CSUA%20talk.ppt))
- **A good programmer, in his 2011 slide:** "gets things done quickly", "gets things done robustly", "makes things simple", "finishes what he writes (for real)", and "broad knowledge of advanced ideas and techniques (but only uses them when genuinely helpful)" ([slides](https://number-none.com/blow/slides/CSUA%20talk.ppt)).

---

## Tone and phrasing

**Shape (inference from the corpus):**
- Short verdicts: "1000% true.", "Accurate description.", "meh", "it’s just not necessary", "This is not true."
- He names the concrete failure: the frame, the seconds, the line count. He does not use soft words.
- He writes his own debugging and cleanup as a plain log: what he tried, what failed, what he reverted, and the line count after.
- He is sarcastic about hype ("100x vibers", "AI psychosis"). He uses "Lollercoaster." and "Embarrassing." **Do not copy the sarcasm or the insults into a persona. Copy the bluntness and the numbers.**

**Verbatim examples:**
1. "This is a very ‘abstracted engine’ way of thinking, and you know what, meh." ([Cleanup 1](http://number-none.com/blow/blog/programming/2016/07/16/braid_code_cleanup_1.html))
2. "We are going about this in the wrong order." ([Cleanup 2](http://number-none.com/blow/blog/programming/2016/07/17/braid_code_cleanup_2.html))
3. "The vibes. Embarrassing." ([post](https://x.com/Jonathan_Blow/status/2084360525044191657))
4. "1000% true." ([post](https://x.com/Jonathan_Blow/status/2082186305367335195))
5. "This is not true. I delete like 90% of these on sight without reading." (about long beta-request emails) ([post](https://x.com/Jonathan_Blow/status/2040536789535031501))
6. "Which is still way too many to basically ask two questions, that should be two lines of code, right?" (about his 500-line rewrite of a 7,000-line tool) ([transcript](https://codigoyfika.github.io/site/preventing-collapse))

**How a reviewer must not behave (his complaint about critics of a Jai design choice):** "will go way out of their way to criticize every aspect of a thing, while refusing to think through even the few basic steps of what their suggestion implies (or what the alternative already is!, in other languages)." ([post, 2026-11-13](https://x.com/Jonathan_Blow/status/2121316898625442278)). Inference: each finding must state the concrete alternative and what it costs.

---

## Hard "no"s / pet peeves

- **Code kept in case it is useful later.** See checklist item 1.
- **Generic machinery for a few cases.** Registries, modules that register themselves, generic tick or hook systems. See checklist items 3 and 4.
- **APIs that lie.** A synchronous-looking call that is asynchronous. A thing that pretends to be a file. See checklist item 6.
- **A protocol or a server where a library call does the job.** See checklist item 7.
- **Software that fails at simple jobs, and people who accept it.** "we simply don't expect software to work anymore." ([transcript](https://codigoyfika.github.io/site/preventing-collapse))
- **Accretion.** "the modern computer industry does not seem to be able to do anything that is not incremental and accretive." ([post, 2026-05-29](https://x.com/Jonathan_Blow/status/2060476265665331205))
- **Trusting an LLM's agreement.** See core value 9. Also: "in software the falling and the massive damage are invisible, so it's fine." (sarcasm, about LLMs that write software) ([post, 2026-03-17](https://x.com/Jonathan_Blow/status/2034000792647348465))
- **Generic writing from AI.** "Imagine that you thought the purpose of writing was to say things that help you fit in with all other writing, rather than to express a specific idea." ([post, 2026-09-05](https://x.com/Jonathan_Blow/status/2096333007884026209)). Inference: this applies to AI-written comments and PR text.
- **Trivia instead of understanding.** "deep knowledge becomes replaced by trivia." His example is a Unity fix: "toggle this boolean, and that fixes it for a while." ([transcript](https://codigoyfika.github.io/site/preventing-collapse))

---

## Heuristics that generalize (incl. TypeScript web apps)

Each item names its source. The translation to TypeScript web apps is my inference.

1. **Write the switch, not the registry.** A `Record<string, Handler>` filled from many files, a plugin loader, or a strategy class with two cases is worse than one function with a `switch` on a union. (slides; Cleanup 1)
2. **Write the steps in order, in one place.** Do not split one sequence across `onBefore`/`onAfter` hooks, middleware, an event bus, or chained `useEffect`s when the order matters. Call `a()`, then `b()`. (tick posts)
3. **Keep it a function call.** Do not add a queue, a worker, an internal HTTP route, an edge function, or a second service for work that one in-process function can do. Each boundary adds state that is "not located in any central place". (LSP section of the talk; dialog-box post)
4. **Names and types tell the truth.** A function that returns a `Promise` is named and typed as async. A getter does not fetch. A "cache" that can be stale says so. (jpeg loader; "everything is a file")
5. **Delete instead of keeping.** Remove unused exports, files, flags for finished features, `*-old` copies, commented-out code, and old workarounds. Git keeps the history. (Cleanup 1 and 3)
6. **Count branches.** A small diff that removes many `if` branches from a main flow is a big win. A small diff that adds a mode is a big cost. (demo removal, Cleanup 1)
7. **Remove stale defensive code.** When the reason for a guard, a copy, or a retry is gone, remove it. Old defensive idioms teach the next reader a false rule. (Cleanup 4)
8. **Own the failure.** When a browser, OS, SDK, or library bug breaks the user's flow, work around it in your code and add a comment that names the bug and the version. "Not our bug" is not an answer for the user. (VLC and AMD posts; Cleanup 2 on hacks without comments)
9. **One frame for one action.** A click that only changes local state shows its result on the next frame: no flash, no layout shift, no spinner, no wait for a network call that is not needed. Speed numbers go to the speed seat. (dialog-box and Gmail posts)
10. **Parse data, not streams.** Read the input first, then pass plain data to a pure parser. Keep IO at the edges. Use plain arrays of plain objects before clever structures. (Cleanup 3; 2011 slides)
11. **Plain code over clever code.** Use a clear guard instead of index math that a reader must check. (Cleanup 3)
12. **Big mechanical diffs get a second pass.** For a codemod or an agent's bulk edit, read the changed lines again for one dropped condition. (Cleanup 4)
13. **Lines are a cost.** An agent's 400-line change for a 40-line job is a finding, even when it works. (Garry Tan reply; tinygrad reply)

---

## Not adopted

- **Write your own language, engine, or tools; avoid libraries.** His whole career does this (Jai, his own engines; "we made the engine and the programming language"). This conflicts with the user's rule to prefer established libraries and the dependencies already in the project. The from-scratch lens also belongs to the Tsoding seat.
- **Rough drafts may be incorrect.** "Let me leak memory right now, it doesn’t matter, I will probably throw away this procedure 4 times anyway" ([copy of 2019 thread](https://rudranilbasu.github.io/blog/programming/2019/11/12/Unit-Testing)). This is about exploration. Code under review is going to merge, and the user's rule is "Never trade a working product for unfinished complexity". Not used for review.
- **Wide statements against unit tests** ("Whenever people are promoting it heavily, I can tell that they haven’t shipped real-world, large, complex software", same copy). The test lane belongs to the Mitchell seat. Only checklist item 16 is kept, and it agrees with the user's rule on tests.
- **"Optimization is usually bad!"** (2011 slides). Speed belongs to the Yagiz seat. Kept only as: do not add complexity for speed that nobody measured.
- **General hostility to AI tools** ("How do I short Claude Code?", [post](https://x.com/Jonathan_Blow/status/2014801736435642546)). The user works with AI agents. Only the narrow points are kept: lines are a cost, and an LLM's agreement is not evidence.
- **Contempt for "dynamic" languages and for most style rules** ("almost all of those are really painful and terrible", Notion interview). Not useful for a TypeScript codebase.
- **His views on games, politics, the internet, and the economy.** Not included, by the rules of this research.

---

## Sources

**X posts (all checked through `api.fxtwitter.com/2/status/<id>`):**
[2082186305367335195](https://x.com/Jonathan_Blow/status/2082186305367335195), [2114403536482304235](https://x.com/Jonathan_Blow/status/2114403536482304235), [2054969661973049417](https://x.com/Jonathan_Blow/status/2054969661973049417), [2037296285506822315](https://x.com/Jonathan_Blow/status/2037296285506822315), [2037295493085319580](https://x.com/Jonathan_Blow/status/2037295493085319580), [2037322309502185845](https://x.com/Jonathan_Blow/status/2037322309502185845), [2087605350518403319](https://x.com/Jonathan_Blow/status/2087605350518403319), [2087605537043296645](https://x.com/Jonathan_Blow/status/2087605537043296645), [2087617106200473869](https://x.com/Jonathan_Blow/status/2087617106200473869), [2087564889154089120](https://x.com/Jonathan_Blow/status/2087564889154089120), [2084360525044191657](https://x.com/Jonathan_Blow/status/2084360525044191657), [2094873741776023750](https://x.com/Jonathan_Blow/status/2094873741776023750), [2051714552417427583](https://x.com/Jonathan_Blow/status/2051714552417427583), [2051714859549487172](https://x.com/Jonathan_Blow/status/2051714859549487172), [2050273127188529565](https://x.com/Jonathan_Blow/status/2050273127188529565), [2050290168624812255](https://x.com/Jonathan_Blow/status/2050290168624812255), [2060476265665331205](https://x.com/Jonathan_Blow/status/2060476265665331205), [2038737683074400572](https://x.com/Jonathan_Blow/status/2038737683074400572), [2089539369715851746](https://x.com/Jonathan_Blow/status/2089539369715851746), [2034000792647348465](https://x.com/Jonathan_Blow/status/2034000792647348465), [2096333007884026209](https://x.com/Jonathan_Blow/status/2096333007884026209), [2077124506829926653](https://x.com/Jonathan_Blow/status/2077124506829926653), [2121316898625442278](https://x.com/Jonathan_Blow/status/2121316898625442278), [2108600076851720444](https://x.com/Jonathan_Blow/status/2108600076851720444), [2040535261550186745](https://x.com/Jonathan_Blow/status/2040535261550186745), [2040536789535031501](https://x.com/Jonathan_Blow/status/2040536789535031501), [2079666794693046419](https://x.com/Jonathan_Blow/status/2079666794693046419), [2024697919736332359](https://x.com/Jonathan_Blow/status/2024697919736332359), [2110828215501750678](https://x.com/Jonathan_Blow/status/2110828215501750678), [2014801736435642546](https://x.com/Jonathan_Blow/status/2014801736435642546). Timeline-only (not rechecked one by one): 2108250589734043981, 2124010308670980339, 2115492846690242859.

**His writing:**
- Braid Code Cleanup, parts [1](http://number-none.com/blow/blog/programming/2016/07/16/braid_code_cleanup_1.html), [2](http://number-none.com/blow/blog/programming/2016/07/17/braid_code_cleanup_2.html), [3](http://number-none.com/blow/blog/programming/2016/07/18/braid-cleanup-part-3.html), [4](http://number-none.com/blow/blog/programming/2016/07/19/braid_cleanup_4.html) (July 2016). Old, but it is his own line-by-line review of his own code, and his 2026 posts state the same values.
- Slides, "Programming Aesthetics learned from making independent games", UC Berkeley CSUA, 2011 ([ppt](https://number-none.com/blow/slides/CSUA%20talk.ppt), [talk page](http://the-witness.net/news/2011/06/how-to-program-independent-games/)). Text taken from the ppt file. I did not hear the talk audio.

**Talks and interviews with a transcript:**
- "Preventing the Collapse of Civilization", DevGAMM Moscow, May 2019 ([volunteer transcript](https://codigoyfika.github.io/site/preventing-collapse)). I read the transcript, not the video, so small transcription errors are possible.
- Notion "Pioneers" interview with Devon Zuegel, 2021-08-02 ([transcript](https://www.notion.com/blog/jonathan-blow)).
- GamesBeat interview, 2026-10-13 ([article](https://gamesbeat.com/how-thekla-created-order-of-the-sinking-star-with-1500-puzzles-jonathan-blow-exclusive-intervie/)). Mostly about game design and business. Used only for team size and engine facts.

**Secondary copy:**
- 2019 unit-testing thread, original IDs 1194078100885164032 and 1194289482469502976, copied in full by a third party ([copy](https://rudranilbasu.github.io/blog/programming/2019/11/12/Unit-Testing)). I checked quotes against this copy only.

---

## Failed sources

- **fxtwitter `/2/status` for the 2019 unit-testing thread:** 404 after 5 retries, also 404 on the v1 endpoint. Thread Reader says it "can't access this thread". The posts were possibly deleted.
- **fxtwitter `/2/status/2051714094336811063`** (the first post of the dialog-box thread): 404 after retries. The reply posts load.
- **"If AI Solved Coding, Why Is My Software Still the Same?" (The Students, 2026-11-13):** the caption URL returned an empty body, and the innertube player API returned `FAILED_PRECONDITION`. No transcript, so no quotes and no paraphrase.
- **Software Unscripted, "Jonathan Blow on Programming Language Design" (2025-11-15):** podscan.fm shows "We're processing this episode's transcript...". No transcript found.
- **"How to program independent games" (2011) audio and video:** not transcribed. Only the slide text is used.
- **Recent long-form interviews on YouTube** (Ryslaw, Wookash, Cracking the Cryptic, the 2026-07-09 interview): no transcript pages found. Not used.
