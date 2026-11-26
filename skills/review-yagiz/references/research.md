# Yagiz Nizipli (anonrig): performance reviewer research

Research date: 2026-10-30, refreshed 2026-11-26 (see the last section). Window: weighted to Nov 2025 to Nov 2026. Older items are used only where they still drive his current reviews, and they are dated.

Method:
- GitHub (gh CLI, REST and GraphQL): about 600 PRs that he reviewed (search `reviewed-by:anonrig`, Sep 2025 to Oct 2026), across nodejs/node, cloudflare/workerd, ada-url/*, simdutf, nodejs/merve, nodejs/ncrypto, pnpm, astro, cloudflare/agents, workers-sdk, workers-rs, denoland, anonrig/router and others. I filtered every review body, inline comment and issue comment by `anonrig`. About 200 PRs had a non-empty comment from him (about 450 comments). Many approvals have no text.
- His own PRs: about 100 recent PRs (Sep to Oct 2026). I read 10 PR bodies in full for how he presents numbers.
- Blog: 15 posts from yagiz.co (markdown versions), including the 5 posts from Jul to Oct 2026.
- Bluesky: public API, last 100 posts. X was not reachable in the first pass. The 2026-11-03 and 2026-11-26 updates read X through the fxtwitter API.
- Podcast: Syntax.fm #716 (Jan 2024) transcript. The transcript is auto-generated and has errors, so I paraphrase it and do not quote it.
- Verification: each quote below is checked with a fixed-string search against the fetched API output, blog markdown, or PR body. Quotes are verbatim, including his typos. Curly apostrophes come from the source.
- "Inference" marks anything that I conclude and he did not say.

Important note on authorship (inference): Since mid-2026 many of his own PR bodies and some long reviews are written with AI agents. Evidence: Cursor agent markers in PR bodies ([ada#1271](https://github.com/ada-url/ada/pull/1271)), "AI assistance" sections ([node#66120](https://github.com/nodejs/node/pull/66120), [node#65273](https://github.com/nodejs/node/pull/65273)), and his own remark “AI "babysit" mode might be the root cause” ([node#63861](https://github.com/nodejs/node/pull/63861#discussion_r3409492785)). His short comments (one or two sentences, lowercase, direct) are his own voice. Use the short comments for tone. Use the long structured reviews for content (what he checks), because he posted them under his name and they match his short comments.

---

## 1. Current focus (what he works on now)

He left Cloudflare on 2026-04-03: “This is my last day at Cloudflare.” ([Bluesky](https://bsky.app/profile/yagiznizipli.com/post/3mim7otdjj22d)). His GitHub profile now says “principal engineer at SpaceXAI” ([github.com/anonrig](https://github.com/anonrig), read 2026-10-30). His blog changed its job title to Principal Engineer on 2026-10-18 ([yagiz.co#233](https://github.com/anonrig/yagiz.co/pull/233)). He is still a Node.js TSC member and calls himself a V8 committer ([about](https://www.yagiz.co/about)).

Inference: the move to SpaceXAI is real (profile text), and his Node PRs since Aug 2026 say “This change was developed with assistance from Grok.” ([node#65273](https://github.com/nodejs/node/pull/65273)). I found no public announcement post.

Active work, newest first:

| Date | Work | Evidence |
|---|---|---|
| 2026-10-29 | `crypto: avoid repeated OpenSSL lookups` (open) | [node#67109](https://github.com/nodejs/node/pull/67109) |
| 2026-10-19 | zlib sync convenience calls skip the Transform stream, reuse a scratch buffer (merged). Two sibling async PRs closed | [node#66864](https://github.com/nodejs/node/pull/66864), [#66854](https://github.com/nodejs/node/pull/66854), [#66863](https://github.com/nodejs/node/pull/66863) |
| 2026-10-03 to 10-29 | Ada: a wave of micro-perf PRs measured in Callgrind `Ir` (instruction count), plus hardening of the C API, URLPattern, IDNA (Unicode 18 tables) | [ada#1261](https://github.com/ada-url/ada/pull/1261) to [#1329](https://github.com/ada-url/ada/pull/1329), [idna#102](https://github.com/ada-url/idna/pull/102) |
| 2026-08-22 to 10-17 | Blog series on SWAR/SIMD in Ada: branch removal, IPv4, percent-encode with `pshufb`, eight bytes in one register | [yagiz.co](https://www.yagiz.co/) |
| 2026-09-19 to 09-22 | Node core hot paths: HTTP server without `toLowerCase`, querystring parse, `net.BlockList.check`, IPv6 regex skip, hex decode, `path`/`url` skip normalize, OpenSSL arch headers, V8 pool size, compressed ICU/builtins/snapshot | [node#66120](https://github.com/nodejs/node/pull/66120), [#66175](https://github.com/nodejs/node/pull/66175), [#66166](https://github.com/nodejs/node/pull/66166), [#66148](https://github.com/nodejs/node/pull/66148), [#66186](https://github.com/nodejs/node/pull/66186) |
| 2026-09-29 | JS tooling build speed: Storybook monorepo compile (-26% prod, -56% dev). Also oxc linter rules, rolldown, pnpm pacquet `--env-file` | [storybook#36505](https://github.com/storybookjs/storybook/pull/36505), [oxc#26657](https://github.com/oxc-project/oxc/pull/26657), [pnpm#16570](https://github.com/pnpm/pnpm/pull/16570) |
| 2026-08-15 onward | `speedy-router`: “The TanStack Router API. Rebuilt for the hot path.” A React 19.2 router with TanStack's public API | [anonrig/router](https://github.com/anonrig/router) |
| 2026-07-27 | Ada v4.0.0: faster common path, smaller binary, max-length limits | [release-of-ada-v4](https://www.yagiz.co/release-of-ada-v4) |
| 2026-06 to 07 | Node HTTP: per-message outgoing overhead, native single-shot response builder, compile cache with zstd (all still open) | [node#64346](https://github.com/nodejs/node/pull/64346), [#64393](https://github.com/nodejs/node/pull/64393), [#63861](https://github.com/nodejs/node/pull/63861) |
| 2026-06-18 | `node --run` without a subshell (exec directly), 1.39x faster | [node#63978](https://github.com/nodejs/node/pull/63978) |
| 2026-02 to 03 | `nodejs/merve` (C++ CJS lexer that replaces cjs-module-lexer), plus a Rust crate. `module.clearCache` for CJS and ESM | [deno_ast#328](https://github.com/denoland/deno_ast/pull/328#discussion_r2849658299), [node#61767](https://github.com/nodejs/node/pull/61767) |
| Until 2026-04 | Cloudflare workerd: Node.js compat, Rust JSG, containers client, WPT updates. Last workerd PR on 2026-03-24, last workerd review on 2026-07-03 | [workerd#6405](https://github.com/cloudflare/workerd/pull/6405), [workerd#6847](https://github.com/cloudflare/workerd/pull/6847) |
| 2025-12-09 | "State of URL parsing performance in 2025", a reply to cURL's author with reproducible benchmarks | [state-of-url-parsing-2025](https://www.yagiz.co/state-of-url-parsing-2025) |

As a reviewer in Oct 2026 he approves perf PRs from ronag, mcollina, lemire, kdy1, nigrosimone, avivkeller and codebytere in Node and Ada (AbortSignal, TLS record coalescing, web streams, TextEncoder, fs readdir, MakeCallback). Examples: [node#66789](https://github.com/nodejs/node/pull/66789), [node#66698](https://github.com/nodejs/node/pull/66698), [node#66831](https://github.com/nodejs/node/pull/66831), [ada#1334](https://github.com/ada-url/ada/pull/1334).

---

## 2. Core values

1. **Optimize the common path, keep a correct fallback.** He tunes for the happy path and the hot path. He keeps the slow general path for everything else. Blog: “Always keep the fallback.” ([IPv4 post](https://www.yagiz.co/simd-is-the-wrong-way-to-parse-ipv4)). His Node PRs keep “the existing path” for calls with options ([node#66864](https://github.com/nodejs/node/pull/66864)). On Syntax.fm he says to optimize the happy path, not the error path ([Syntax #716](https://syntax.fm/show/716/js-perf-wins-and-new-node-js-features-with-yagiz-nizipli/transcript), paraphrase).
2. **Every speedup needs a measurement, and losses are reported too.** “Measure the version you are about to delete.” ([branches post](https://www.yagiz.co/eliminating-branches-in-cpp-loops)). His post summary says “A string of spaces gets slower.” ([pshufb post](https://www.yagiz.co/a-space-is-a-bit-in-a-32-byte-table)).
3. **Stop when it is off the profile.** “If that is already off the profile, stop.” ([branches post](https://www.yagiz.co/eliminating-branches-in-cpp-loops)). He does not add SIMD for short inputs: “192.168.1.1 is too short for SIMD” ([IPv4 post](https://www.yagiz.co/simd-is-the-wrong-way-to-parse-ipv4)).
4. **Allocations, copies and serialization across the JS/native boundary are the real cost.** “we can just return enums from here, and avoid this serialization cost, if possible” ([node#62924](https://github.com/nodejs/node/pull/62924#discussion_r3142040726)). “This has a potentially performance impact due to JS-C++ bridge.” ([node#62095](https://github.com/nodejs/node/pull/62095#discussion_r2890764184)).
5. **Zero or minimal dependencies.** “we shouldn't have any dependency at all” ([ada-url/rust#119](https://github.com/ada-url/rust/pull/119#discussion_r3670424050)). He prefers a shared, owned, fast core library (Ada, simdutf, merve, nbytes, ncrypto) over a pile of small packages.
6. **Spec compliance is not optional, and the spec text lives in the code.** “They're taken from the spec and it helps us keep track of the changes.” ([ada#1139](https://github.com/ada-url/ada/pull/1139#discussion_r3219272830)). Bluesky: “Another day, another URL library claims they are spec compliant.” (2025-03-01, [Bluesky](https://bsky.app/profile/yagiznizipli.com/post/3ljdjdwsvts2b)).
7. **Readability still wins over clever code.** “Yes you're reducing code duplication but at what cost? reducing readability.” ([node#63667](https://github.com/nodejs/node/pull/63667#discussion_r3329598934)). He asks for comments on every magic number and threshold.
8. **Tests protect every change, perf changes too.** “This can't land without a single test.” ([node#62067](https://github.com/nodejs/node/pull/62067#pullrequestreview-3873610864)).
9. **Small surface, no unused code.** “Don’t add code we don’t use.” ([ada#1234](https://github.com/ada-url/ada/pull/1234#pullrequestreview-5047393783)). “I'm -1. This is just additional complexity with an extremely narrow use case.” ([node#63197](https://github.com/nodejs/node/pull/63197#pullrequestreview-4260226555)).
10. **AI is fine with a human in the loop.** “I think it's fine to use AI in any sense if there is a human in the loop” ([ada-url/rust#84](https://github.com/ada-url/rust/pull/84#issuecomment-3992970644)). But he wants a human to talk to: “Can we stop the AI responses and just talk for a second...” ([ada#1234](https://github.com/ada-url/ada/pull/1234#issuecomment-5429881323)).

---

## 3. Review checklist (what he checks or pushes back on)

1. **Benchmark CI for the change, and no regressions.** He asks for the Node benchmark CI and blocks on red rows. “@ChALkeR can you run benchmark CI that applies to this pull-request?” ([node#61549](https://github.com/nodejs/node/pull/61549#issuecomment-3807356095)). Then, with a -21.55% row pasted: “Can we find a middle ground and avoid regressions like this with this pull-request?” ([node#61549](https://github.com/nodejs/node/pull/61549#issuecomment-3812108164)).
2. **Explain every threshold and magic number.** “This needs a comment explaining the reasoning behind 32.” ([node#66831](https://github.com/nodejs/node/pull/66831#discussion_r4315266610)). “why this magical number? can you add a comment” ([node#62924](https://github.com/nodejs/node/pull/62924#discussion_r3142032401)). “Why did you add 16? Can you add a comment” ([ada#1203](https://github.com/ada-url/ada/pull/1203#discussion_r3696221457)).
3. **No throw-and-catch on a normal path.** “Creating, throwing and catching errors is extremely costly.” ([node#61870](https://github.com/nodejs/node/pull/61870#discussion_r2824142193)). On `new URL()` in try/catch, he suggests `URL.parse` and writes “Avoid throwing error please” ([node#64876](https://github.com/nodejs/node/pull/64876#discussion_r3692024598)).
4. **Numbers, not strings, for types and states.** “can we avoid strings and just use enums” ([node#62924](https://github.com/nodejs/node/pull/62924#discussion_r3142038184)). “We shouldn't return string from this. This would be extremely slow.” ([node#61855](https://github.com/nodejs/node/pull/61855#discussion_r2818625593)). On Astro's render path: “if they're enums, comparing numbers to numbers would be a lot faster” ([astro#15123](https://github.com/withastro/astro/pull/15123#discussion_r2669830178)).
5. **Count the crossings of the JS/native boundary.** “Can we avoid triggering a new C++ method here?” ([node#62095](https://github.com/nodejs/node/pull/62095#discussion_r2890764184)). In the other direction he asks to move error work to C++: “can we throw this from C++?” ([node#62499](https://github.com/nodejs/node/pull/62499#discussion_r3011826361)).
6. **Hoist and precompute what is on the hot path.** “this can be precomputed and reused if it's on hot path” ([node#62924](https://github.com/nodejs/node/pull/62924#discussion_r3142041575)). “Should we just create them on the root scope?” ([node#62218](https://github.com/nodejs/node/pull/62218#discussion_r2927354674)).
7. **Move, do not copy.** “Can't you just move the value? Rather than copying.” ([workerd#6377](https://github.com/cloudflare/workerd/pull/6377#discussion_r2970136184)). On a range-for: “I'm not sure if this avoids a copy or not...” ([workerd#5801](https://github.com/cloudflare/workerd/pull/5801#discussion_r2653581350)).
8. **Use the fast library that already exists.** “you can just use simdutf::validate_ascii() method.” ([workerd#6420](https://github.com/cloudflare/workerd/pull/6420#discussion_r2991089439)). “did you look at simdutf scalar solution? it might be faster than this.” ([merve#29](https://github.com/nodejs/merve/pull/29#discussion_r2862046968)). “We already have this method” for a duplicated helper ([node#61233](https://github.com/nodejs/node/pull/61233#discussion_r2824497087)).
9. **Per-character checks should be constexpr or table-driven.** “please move this to a separate method which is constexpr. this is extremely slow.” ([workerd#6420](https://github.com/cloudflare/workerd/pull/6420#discussion_r2991086108)). He then posts a full bitmap lookup as a suggestion.
10. **No new dependency for small things.** “please don't use a dependency for this” ([ada-url/rust#119](https://github.com/ada-url/rust/pull/119#discussion_r3670424744)). “Why do we have a new dependency?” ([ada-python#121](https://github.com/ada-url/ada-python/pull/121#discussion_r2687415946)). “ada doesn't have any dependencies. we should keep the same.” ([ada-url/rust#119](https://github.com/ada-url/rust/pull/119#discussion_r3670619817)).
11. **Remove dead fields and dead parameters from hot data structures.** “Don’t keep fields the hot path never touches.” and “Dead out-parameter.” ([ada#1234](https://github.com/ada-url/ada/pull/1234#discussion_r3877421648), [r3877422063](https://github.com/ada-url/ada/pull/1234#discussion_r3877422063)).
12. **Size the optimization to the real input.** “Typical pathnames are 20–40 bytes with 2–4 slashes. NEON setup + a `ctz` loop is for long inputs.” and “Keep NEON only if a 1k+ pathname benchmark says so.” ([ada#1234](https://github.com/ada-url/ada/pull/1234#discussion_r3877441864)).
13. **Measure both valid and invalid inputs.** “What's the performance characteristics of the following code in incorrect and correct utf16 inputs?” ([simdutf#851](https://github.com/simdutf/simdutf/pull/851#issuecomment-3535166053)).
14. **Old perf folklore must be re-checked.** “Question: Is (const x of y) iteration still slower than this today?” ([node#64974](https://github.com/nodejs/node/pull/64974#discussion_r3704883501)). On primordials (2024): “This hasn't been a problem for a really long time. Why are we adding more primordials to this?” ([node#54489](https://github.com/nodejs/node/pull/54489#pullrequestreview-2253095409)).
15. **Brand checks and object shape choices that cost cycles.** “We explicitly avoided doing this because of performance in the past.” ([node#63601](https://github.com/nodejs/node/pull/63601#discussion_r3331163662)). “can we use builtin brand validation via this.#privateAttr?” ([node#65910](https://github.com/nodejs/node/pull/65910#discussion_r3968902586)). “Can we have null prototype for this object?” ([node#61869](https://github.com/nodejs/node/pull/61869#discussion_r2818958031)). “Why don't you use kInternalized here and in line 66?” ([node#61954](https://github.com/nodejs/node/pull/61954#discussion_r2848222887)). Note: in his own PR he later removed interned header names, because “unique attacker-controlled names would pin interned strings for the isolate lifetime” ([node#66120](https://github.com/nodejs/node/pull/66120)).
16. **Spec text, spec steps, and Node.js parity.** “This path should also check for `and c is U+0023 (#)`” ([ada#1186](https://github.com/ada-url/ada/pull/1186#discussion_r3599258775)). “How does the spec handles this?” ([workerd#5784](https://github.com/cloudflare/workerd/pull/5784#discussion_r2662102722)). For workerd's Node compat: “If we diverge from Node.js, finding bugs & keep the code in sync would be a lot harder then it really is.” ([workerd#6007](https://github.com/cloudflare/workerd/pull/6007#discussion_r2759782844)).
17. **Platform behavior, not one runtime's behavior.** On a hardcoded abort message: “Hardcoding the Node/jsdom message means this is **not** the platform default in browsers.” ([anonrig/router#177](https://github.com/anonrig/router/pull/177#discussion_r3825738174)).
18. **Tests, with edge values.** “Prefer a test that accepts max acceptable payload, and rejects minimum unacceptable payload” ([workerd#6141](https://github.com/cloudflare/workerd/pull/6141#pullrequestreview-3855954358)). “is there a test that verifies this, so we don't regress?” ([workerd#5483](https://github.com/cloudflare/workerd/pull/5483#pullrequestreview-3438456535)). For fast paths in C++ he also wants fuzzing: “fuzzed (there is no fuzzer change in this PR)” ([ada#1234](https://github.com/ada-url/ada/pull/1234#issuecomment-5428949363)).
19. **Bounds and overflow checks next to clever code.** “You need to have an assert somewhere making sure that src has size at least 8.” ([node#62183](https://github.com/nodejs/node/pull/62183#discussion_r2912362780)). “This can overflow since length and bufferSize is size_t.” ([workerd#5579](https://github.com/cloudflare/workerd/pull/5579#discussion_r2557343456)). “can we avoid having memcpy? it's unsafe.” ([workerd#5763](https://github.com/cloudflare/workerd/pull/5763#discussion_r2644539081)).
20. **Small diff, no unrelated changes, typings updated.** “please keep the change at minimum and avoid unnecessary changes.” ([node#64735](https://github.com/nodejs/node/pull/64735#discussion_r3653712467)). “Why does this PR includes changes like this? They seem unrelated.” ([node#62603](https://github.com/nodejs/node/pull/62603#discussion_r3163272510)). “Changes to typings folder is missing from this PR” ([node#64974](https://github.com/nodejs/node/pull/64974#discussion_r3704896394)).

---

## 4. How he wants performance claims proven

What he asks from others:
- **The project's own benchmark harness, against main.** In Node he asks for benchmark CI and reads the `compare.js` confidence stars (see item 1 above). In Ada he wants CodSpeed to compare main to the branch, so he asks to land the new benchmark first: “open another pr for the newly added benchmark so that we can land it to main and let codspeed compare main with this branch.” ([ada#1044](https://github.com/ada-url/ada/pull/1044#issuecomment-3698056589)).
- **A correct harness.** Release mode and a fixed minimum time: “is this using release mode? also can you make sure we pass google benchmark cli flag for running it at least 1 second?” ([ada#1031](https://github.com/ada-url/ada/pull/1031#discussion_r2586156473)). No manual inner loop: “the benchmark will run 1second regardless of this for loop.” ([workerd#5583](https://github.com/cloudflare/workerd/pull/5583#discussion_r2558107954)). No coarse clock: “this seems to be a not good path. can we use rdtsc?” about `Date::now()` ([workers-rs#867](https://github.com/cloudflare/workers-rs/pull/867#discussion_r2540131105)).
- **The benchmark must call the real code.** A copied implementation in a bench file gets this: “If in the future we update/change the implementation, this benchmark can become useless.” ([ada#1089](https://github.com/ada-url/ada/pull/1089#discussion_r2955825121)).
- **Noise is named, not hidden.** He knows benchmark CI is flaky: “the benchmarks seems to be unstable enough to show differences in untriggered paths” ([node#61601](https://github.com/nodejs/node/pull/61601#issuecomment-3832633985)). When the PR changes, the description and benchmark must change too: “I think the PR description (and the benchmark) needs to be updated since you added a minimum threshold.” ([node#61601](https://github.com/nodejs/node/pull/61601#issuecomment-3974433701)).

How he presents his own numbers (PR bodies and blog, 2025-12 to 2026-10):
- **Setup first.** Machine, OS, compiler, build flags, commit hash, dataset, run count. Example: “five Google Benchmark repetitions (means). Same machine, same flags, same datasets” ([Ada v4](https://www.yagiz.co/release-of-ada-v4)). The 2025 URL post gives the exact commit and the commands to reproduce, with hardware counters (instructions/URL, cycles/URL, instructions/cycle) ([state-of-url-parsing-2025](https://www.yagiz.co/state-of-url-parsing-2025)).
- **Tables with before, after, and delta.** Units are ns/URL, URLs/s, GB/s, req/s, ms, KiB, MB of VmSize. The delta is shown as a multiplier and a percent, for example “**1.24×** (−19%)” ([Ada v4](https://www.yagiz.co/release-of-ada-v4)). Ada PR titles carry the number: “perf: move (not copy) parsed result in set_href (-6% Ir for url)” ([ada#1271](https://github.com/ada-url/ada/pull/1271)).
- **Deterministic counters for micro work.** Callgrind `Ir` on a fixed workload, plus a check that results are equal: “Result checksums identical before/after on both workloads.” ([ada#1271](https://github.com/ada-url/ada/pull/1271)).
- **Interleaved A/B runs, medians, paired runs.** `node --run`: “interleaved A/B, 600 iters × 8 rounds” ([node#63978](https://github.com/nodejs/node/pull/63978)). Storybook: “the paired medians are the fair comparison” and he lists the per-pair change ([storybook#36505](https://github.com/storybookjs/storybook/pull/36505)). Compile cache: same binary with cache on and off, to avoid “binary-layout skew between builds” ([node#63861](https://github.com/nodejs/node/pull/63861#issuecomment-4685691919)). In one reply he reports “30 interleaved samples per binary, Welch t-test” with p-values ([node#64346](https://github.com/nodejs/node/pull/64346#discussion_r3539974813)).
- **Says when the machine was loaded.** “My machine was loaded (load average 15–30), so the intervals are wide” ([node#66864](https://github.com/nodejs/node/pull/66864)).
- **Says when there is no win.** “I am not claiming a reliable official-bench win on top of #65802.” ([node#66120](https://github.com/nodejs/node/pull/66120)). “Startup is within noise.” and then he names the real win, threads and address space ([node#66148](https://github.com/nodejs/node/pull/66148)). Stale numbers are withdrawn: “They are **not** this PR's remaining delta.” ([node#65273](https://github.com/nodejs/node/pull/65273)).
- **Memory, not only time.** `heapUsed` after warmup with `--expose-gc`, threads, VmSize, on-disk size ([node#66120](https://github.com/nodejs/node/pull/66120), [node#66148](https://github.com/nodejs/node/pull/66148), [node#63861](https://github.com/nodejs/node/pull/63861#issuecomment-4685691919)).
- **Real numbers come from real binaries, not a model.** “Benchmark numbers above are from two release binaries on the same machine, not from a model.” ([node#66120](https://github.com/nodejs/node/pull/66120)).
- **Translate to fleet cost when the claim is public.** He converts ns/URL into the share of one CPU core at 518,027 req/s, “an 86% reduction in compute resources dedicated to URL parsing” ([state-of-url-parsing-2025](https://www.yagiz.co/state-of-url-parsing-2025)).
- **Show the inputs that lose.** The pshufb post has a row where SIMD is slower (“Every byte a space”) and explains why ([pshufb post](https://www.yagiz.co/a-space-is-a-bit-in-a-32-byte-table)). The IPv4 post has a section named “A SWAR fold that loses” ([IPv4 post](https://www.yagiz.co/simd-is-the-wrong-way-to-parse-ipv4)).

---

## 5. What he praises / approves fast

What gets fast approval:
- Perf PRs from known core people (ronag, mcollina, lemire, nigrosimone, codebytere, avivkeller, kdy1) that have numbers in the description. Most of these are silent approvals. Examples: [node#66789](https://github.com/nodejs/node/pull/66789) (AbortSignal, approved the next day), [node#66698](https://github.com/nodejs/node/pull/66698), [node#64890](https://github.com/nodejs/node/pull/64890), [node#66395](https://github.com/nodejs/node/pull/66395).
- Small, surgical fixes: “Nice catch.” ([node#61725](https://github.com/nodejs/node/pull/61725#pullrequestreview-3768394301)), “Ooops, thank you for fixing this!” ([node#61984](https://github.com/nodejs/node/pull/61984#pullrequestreview-3855583699)).
- SIMD and bit tricks that are measured: “dammit this is nice!” ([ada#1118](https://github.com/ada-url/ada/pull/1118#pullrequestreview-4053790491)), “nice work!” ([ada#1195](https://github.com/ada-url/ada/pull/1195#pullrequestreview-4792589299)), “Nice work!” ([ada#1202](https://github.com/ada-url/ada/pull/1202#issuecomment-5145575618)).
- New benchmarks that show the truth, even when it hurts his code: “perfect - amazing work” and “(now we now, my code is slow!)” ([simdutf#901](https://github.com/simdutf/simdutf/pull/901#pullrequestreview-3631983393), [comment](https://github.com/simdutf/simdutf/pull/901#issuecomment-3715793586)).
- Simple designs: “Elegant.” ([node#61703](https://github.com/nodejs/node/pull/61703#pullrequestreview-3764392560)). “I think this is a far better solution than any alternatives. Thank you.” ([node#63936](https://github.com/nodejs/node/pull/63936#issuecomment-4713785245)).
- Using a platform fast path: “You are the best.” ([node#62107](https://github.com/nodejs/node/pull/62107#discussion_r2890176533)). Native base64 gets credit to simdutf: “Yes! (Courtesy of @lemire and his work on simdutf!)” ([workerd#5837](https://github.com/cloudflare/workerd/pull/5837#discussion_r2666442277)).
- He also asks to learn: “For educational purposes: How did you encounter this issue, and what problem did you see?” ([node#61718](https://github.com/nodejs/node/pull/61718#pullrequestreview-3768224718)).
- When he disagrees on a small point, he does not block: “Perf is negligible I believe, less convenient - I disagree but I won't block” ([node#65003](https://github.com/nodejs/node/pull/65003#discussion_r3720992840)).

---

## 6. Tone and phrasing

Style (inference from about 450 comments):
- Short. Most inline comments are one sentence. Often lowercase, no greeting, typos left in ("tyeps", "CAn", "Modile").
- Polite request form: "Can you ...", "Can we ...", "Would you mind ...", "please". The question form is his main tool: "Why did we remove this?", "Why 8?", "what is Miri?".
- Strong words for real perf problems: "extremely slow", "extremely costly", "a really unperformant way". He uses them without softening.
- He gives a ```suggestion block when the fix is small and clear.
- "ditto" for a repeated finding, and "Nit:" for style points.
- Small humor and smileys: ":-)", ":-))", "lol".
- A long structured review (Must fix / Should fix / What looks good, or numbered "Highest impact" lists) appears in 2026 on large perf PRs. Inference: these long reviews are AI-assisted (see the note at the top), but the points match his short comments.

Verbatim examples:
1. “This needs a comment explaining the reasoning behind 32.” ([node#66831](https://github.com/nodejs/node/pull/66831#discussion_r4315266610))
2. “This is a really unperformant way of doing this. Creating, throwing and catching errors is extremely costly.” ([node#61870](https://github.com/nodejs/node/pull/61870#discussion_r2824142193))
3. “please move this to a separate method which is constexpr. this is extremely slow.” ([workerd#6420](https://github.com/cloudflare/workerd/pull/6420#discussion_r2991086108))
4. “This is still extremely slow:” followed by a full bitmap-table suggestion ([workerd#6420](https://github.com/cloudflare/workerd/pull/6420#discussion_r2996084538))
5. “Isn't this just String.prototype.split?” ([node#64974](https://github.com/nodejs/node/pull/64974#discussion_r3704872478))
6. “opendir with async iterator would be a lot faster and more memory efficient than this” ([workers-sdk#11771](https://github.com/cloudflare/workers-sdk/pull/11771#discussion_r2659049307))
7. “Why do you need a template argument and a function for this one liner?” ([node#62822](https://github.com/nodejs/node/pull/62822#discussion_r3107224082))
8. “I don't think this is readable at all.” ([node#63667](https://github.com/nodejs/node/pull/63667#discussion_r3329598341))
9. “If you have to add `??`, then the typescript types are wrong.” ([workerd#6029](https://github.com/cloudflare/workerd/pull/6029#discussion_r2775289144))
10. “atob is not recommended to be used. we now have uint8array.frombase64 etc.” ([workerd#5837](https://github.com/cloudflare/workerd/pull/5837#discussion_r2666343620))
11. “Nit: This would be faster (not that it matters)” ([workerd#5837](https://github.com/cloudflare/workerd/pull/5837#discussion_r2666448054))
12. “`oct[4]` forces a stack frame. `_mm_cvtepi32_epi8(res)` + `bswap` is a leaf and ~15% faster here.” ([ada#1232](https://github.com/ada-url/ada/pull/1232#discussion_r3834665239))
13. “Can you add this clang tidy rule to ada as well? Or we will always regress.” ([ada#1292](https://github.com/ada-url/ada/pull/1292#pullrequestreview-5479790331))
14. “Not landing as-is.” ([anonrig/router#121](https://github.com/anonrig/router/pull/121#issuecomment-5345732189))
15. “reviewing from phone is hard...” ([simdutf#851](https://github.com/simdutf/simdutf/pull/851#discussion_r2529351763))

Example of a long 2026 perf review (structure only): on Ada's URLPatternList he posted “Performance notes on the match path.” with a numbered “Highest impact” list: stop extra work after a decisive hit, inline the matcher, compare small fan-outs directly, pack the tables in one arena, use a SWAR slash scan ([ada#1234](https://github.com/ada-url/ada/pull/1234#pullrequestreview-5047413945)).

---

## 7. Hard "no"s / pet peeves

- **Unmeasured or regressing perf work.** A red benchmark row blocks the PR until there is a "middle ground" ([node#61549](https://github.com/nodejs/node/pull/61549#issuecomment-3812108164)).
- **Throwing errors on an expected path** ([node#61870](https://github.com/nodejs/node/pull/61870#discussion_r2824142193), [node#64876](https://github.com/nodejs/node/pull/64876#discussion_r3692024598)).
- **New dependencies in a core library** ([ada-url/rust#119](https://github.com/ada-url/rust/pull/119#discussion_r3670424050), [ada-python#121](https://github.com/ada-url/ada-python/pull/121#discussion_r2687415946)).
- **Features for a narrow use case.** “I'm -1. This is just additional complexity with an extremely narrow use case.” ([node#63197](https://github.com/nodejs/node/pull/63197#pullrequestreview-4260226555)).
- **Clever abstraction that hurts reading** ([node#63667](https://github.com/nodejs/node/pull/63667#discussion_r3331166017)): “IMHO, the benefit is not worth the cognitive effort this new addition requires for just understanding it.”
- **Magic numbers without a comment** (many: [node#62924](https://github.com/nodejs/node/pull/62924#discussion_r3142032817), [workerd#6376](https://github.com/cloudflare/workerd/pull/6376#discussion_r2975453455), [workerd#6380](https://github.com/cloudflare/workerd/pull/6380#discussion_r3031156490)).
- **Unreadable names.** One-letter parameters: “Where it's extremely hard to understand and read the code” ([node#61549](https://github.com/nodejs/node/pull/61549#discussion_r2733317094)). Abbreviations: “Can we use SetTypeOfService rather than these abbreviations please?” ([node#61503](https://github.com/nodejs/node/pull/61503#discussion_r2732939554)).
- **No test.** “This can't land without a single test.” ([node#62067](https://github.com/nodejs/node/pull/62067#pullrequestreview-3873610864)), “Please add a test case” ([node#64868](https://github.com/nodejs/node/pull/64868#pullrequestreview-4829041924)).
- **Type escapes.** `any`, `!` non-null, `as unknown as`, and eslint-disable lines. “Can we eliminate the non-null ! somehow?” ([workerd#6330](https://github.com/cloudflare/workerd/pull/6330#discussion_r2946366814)). “Why does this disable line required? It's not obvious...” ([node#62293](https://github.com/nodejs/node/pull/62293#discussion_r2947560061)).
- **Edits to vendored code.** “this needs fixing on ada-url/idna repository since this is just a vendored code” ([ada#1276](https://github.com/ada-url/ada/pull/1276#pullrequestreview-5463899796)).
- **Unrelated changes and noisy diffs** ([node#62603](https://github.com/nodejs/node/pull/62603#discussion_r3163272510), [ada#1202](https://github.com/ada-url/ada/pull/1202#discussion_r3692177561): “Can you put the method to the previous place so the git diff is nicer?”).
- **Bots talking instead of people** ([ada#1234](https://github.com/ada-url/ada/pull/1234#issuecomment-5429881323)).
- **Old patterns where a modern built-in exists:** `atob`/`btoa` (use `Uint8Array.fromBase64`/`toBase64`), hand-made sleep promises (use `node:timers/promises` or `scheduler.wait`), hand-made deferreds (“you should use promise.withresolvers here”, [anonrig/router#94](https://github.com/anonrig/router/pull/94#discussion_r3814867100)), `npm run` in scripts (use `node --run`, [workers-rs#867](https://github.com/cloudflare/workers-rs/pull/867#discussion_r2540128194)), `instanceof Error` (use `Error.isError`, [workerd#5837](https://github.com/cloudflare/workerd/pull/5837#discussion_r2666351669)).

---

## 8. Perf heuristics that generalize to any JS/TS codebase

These are drawn from his reviews and posts. The mapping to Next.js/React and CLIs is inference, unless a link shows he did it there.

Node servers and request paths:
1. **Find the per-request work that most apps never use, and make it lazy.** His HTTP PR keeps `req.headers` lazy and scans `rawHeaders` without allocation ([node#66120](https://github.com/nodejs/node/pull/66120)). Same idea for any middleware: do not build a parsed object until a handler reads it.
2. **Do not allocate per call on the hot path.** No `toLowerCase()` per header, no options object per message, no fresh `AbortError`/`DOMException` per abort. On the router: “`abort()` with no reason is a hidden allocation (and stack capture) on a hot path” ([anonrig/router#177](https://github.com/anonrig/router/pull/177#pullrequestreview-4987873241)).
3. **Errors are expensive. Use return values on expected failure paths.** `URL.parse` over `new URL` in try/catch ([node#64876](https://github.com/nodejs/node/pull/64876#discussion_r3692023571)), `throwIfNoEntry: false` style APIs over catching ENOENT ([node#61870](https://github.com/nodejs/node/pull/61870#discussion_r2824142193)).
4. **Compare numbers, not strings, in switches and type tags** ([astro#15123](https://github.com/withastro/astro/pull/15123#discussion_r2669830178), [node#61855](https://github.com/nodejs/node/pull/61855#discussion_r2818625593)).
5. **Hoist constants and lookup tables to module scope** ([node#62218](https://github.com/nodejs/node/pull/62218#discussion_r2927354674)). Use a `Set` for membership checks instead of a scan (his Storybook PR: “a Set lookup instead of scanning ~300 externals”, [storybook#36505](https://github.com/storybookjs/storybook/pull/36505)).
6. **Stream or iterate instead of materializing.** `opendir` with an async iterator over `readdir` ([workers-sdk#11771](https://github.com/cloudflare/workers-sdk/pull/11771#discussion_r2659049307)).
7. **Count boundary crossings** (JS to native, worker postMessage, JSON serialize/parse). Return the few fields you need, not a whole object. His loader work moved package.json parsing to C++ and returned only needed fields ([loader post](https://www.yagiz.co/improving-nodejs-loader-performance)).

React and Next.js apps (inference from speedy-router and his Sentry/Astro work):
8. **Count work per navigation and per SSR request.** speedy-router's thesis: “less store setup, less match-object construction, less work before the first byte.” ([anonrig/router README](https://github.com/anonrig/router)). Review a router, loader or data layer by asking what it allocates per navigation.
9. **Identity matters for shared singletons.** He warns that `/* @__PURE__ */` lets a bundler duplicate a singleton and bring back the per-call allocation ([anonrig/router#177](https://github.com/anonrig/router/pull/177#discussion_r3825738174)).
10. **Barrel files and heavy imports cost startup.** His Sentry PRs were titled “perf: reduce barrel file imports” ([sentry#69452](https://github.com/getsentry/sentry/pull/69452)) and “chore: remove lodash usages” ([sentry#61593](https://github.com/getsentry/sentry/pull/61593)). (These are Dec 2023 to Apr 2024 PRs. They show up as updated in Oct 2026.)
11. **Smaller payloads are a perf fix.** “perf: change replay payload to reduce json size” ([sentry#69916](https://github.com/getsentry/sentry/pull/69916), 2024).

CLIs, build tools and startup:
12. **Load lazily. Do not import what this command does not use.** Storybook: dev builds never load the d.ts toolchain, and each package loads only its own config ([storybook#36505](https://github.com/storybookjs/storybook/pull/36505)).
13. **Do not block the event loop with sync child processes** when other work can overlap (the same PR replaced `spawnSync` for tsgo).
14. **Skip the shell and extra processes.** `node --run` exec's the command directly when there are no shell metacharacters ([node#63978](https://github.com/nodejs/node/pull/63978)). `yarn nx` without a script shell saves about 0.4 s per command ([storybook#36505](https://github.com/storybookjs/storybook/pull/36505)).
15. **Measure startup with hyperfine or interleaved runs, and measure memory and threads too** ([task runner post](https://www.yagiz.co/developing-fast-builtin-task-runner), [node#66148](https://github.com/nodejs/node/pull/66148)).

General method (any stack):
16. **Profile first. Optimize what is on the profile. Stop when it is off.** ([branches post](https://www.yagiz.co/eliminating-branches-in-cpp-loops)).
17. **Fast path plus fallback.** Check up front for the common clean input, take a short path, and fall back to the full path for the rest ([Node querystring](https://github.com/nodejs/node/pull/66175), [IPv4 post](https://www.yagiz.co/simd-is-the-wrong-way-to-parse-ipv4)).
18. **Prefer the platform built-in and the established fast library** over hand-written code: `URL.parse`, `Uint8Array.fromBase64`, `Promise.withResolvers`, `Array.fromAsync`, `node:stream/consumers`, `node --run`, simdutf, Ada.
19. **Re-test folklore on today's engine** (for-of vs index loops, primordials) before you accept it in review ([node#64974](https://github.com/nodejs/node/pull/64974#discussion_r3704883501)).
20. **Benchmark both the happy input and the bad input,** and report the case that gets slower.

---

## 9. Sources

GitHub reviews (his comments on others' PRs), newest first:
- https://github.com/nodejs/node/pull/66831 (TextEncoder threshold comment)
- https://github.com/ada-url/ada/pull/1292 (clang-tidy rule)
- https://github.com/ada-url/ada/pull/1276 (vendored code)
- https://github.com/ada-url/idna/pull/91 (enum over bool)
- https://github.com/nodejs/node/pull/65910 (private field brand check)
- https://github.com/ada-url/ada/pull/1234 (URLPatternList, long perf review)
- https://github.com/ada-url/ada/pull/1232 (AVX-512 IPv4 nits)
- https://github.com/anonrig/router/pull/177 (abort reason allocation)
- https://github.com/anonrig/router/pull/121, /94
- https://github.com/nodejs/node/pull/65003 (aligned allocations)
- https://github.com/nodejs/node/pull/64974 (BlockList)
- https://github.com/ada-url/ada/pull/1203, /1202, /1195, /1186, /1139, /1118, /1089, /1044, /1031
- https://github.com/nodejs/node/pull/64876 (URL.parse, avoid throwing)
- https://github.com/nodejs/node/pull/64868, /64735, /63667, /63601, /63197, /62924, /62822, /62603, /62499
- https://github.com/ada-url/rust/pull/119, /84
- https://github.com/ada-url/ada-python/pull/121
- https://github.com/cloudflare/workerd/pull/6420, /6406, /6377, /6376, /6380, /6330, /6141, /6029, /6007, /5837, /5801, /5784, /5763, /5725, /5583, /5579, /5483
- https://github.com/cloudflare/workers-rs/pull/867
- https://github.com/cloudflare/workers-sdk/pull/11771
- https://github.com/withastro/astro/pull/15123
- https://github.com/simdutf/simdutf/pull/851, /901
- https://github.com/nodejs/merve/pull/29, /34, /10
- https://github.com/denoland/deno_ast/pull/328
- https://github.com/nodejs/node/pull/62293, /62218, /62183, /62107, /62101, /62095, /62067, /61984, /61954, /61871, /61870, /61869, /61855, /61725, /61718, /61703, /61601, /61549, /61503, /61233
- https://github.com/nodejs/node/pull/63936
- https://github.com/nodejs/node/pull/54489 (2024, primordials)

GitHub PRs he authored (how he presents numbers):
- https://github.com/nodejs/node/pull/67109
- https://github.com/nodejs/node/pull/66864
- https://github.com/nodejs/node/pull/66175
- https://github.com/nodejs/node/pull/66148
- https://github.com/nodejs/node/pull/66120
- https://github.com/nodejs/node/pull/65273
- https://github.com/nodejs/node/pull/64393
- https://github.com/nodejs/node/pull/64346
- https://github.com/nodejs/node/pull/63978
- https://github.com/nodejs/node/pull/63861
- https://github.com/ada-url/ada/pull/1271
- https://github.com/storybookjs/storybook/pull/36505
- https://github.com/anonrig/yagiz.co/pull/233
- https://github.com/getsentry/sentry/pull/69452, /61593, /69916 (2023 to 2024)

Profile and repos:
- https://github.com/anonrig (bio: principal engineer at SpaceXAI)
- https://github.com/anonrig/router (speedy-router README)

Blog (yagiz.co):
- https://www.yagiz.co/eight-bytes-in-one-register (2026-10-17)
- https://www.yagiz.co/a-space-is-a-bit-in-a-32-byte-table (2026-09-27)
- https://www.yagiz.co/simd-is-the-wrong-way-to-parse-ipv4 (2026-08-24)
- https://www.yagiz.co/eliminating-branches-in-cpp-loops (2026-08-22)
- https://www.yagiz.co/release-of-ada-v4 (2026-07-27)
- https://www.yagiz.co/state-of-url-parsing-2025 (2025-12-09)
- https://www.yagiz.co/developing-fast-builtin-task-runner (2024-06-17)
- https://www.yagiz.co/improving-nodejs-loader-performance (2023-12-12)
- https://www.yagiz.co/reducing-the-cost-of-string-serialization-in-nodejs-core (2023-04-25)
- https://www.yagiz.co/using-v8-fast-api-in-node-js-core (2023-01-13)
- https://www.yagiz.co/about

Social and talks:
- https://bsky.app/profile/yagiznizipli.com/post/3mim7otdjj22d (last day at Cloudflare, 2026-04-03)
- https://bsky.app/profile/yagiznizipli.com/post/3ljdjdwsvts2b (spec compliance claims, 2025-03-01)
- https://syntax.fm/show/716/js-perf-wins-and-new-node-js-features-with-yagiz-nizipli/transcript (Jan 2024, paraphrased only)

Sources that failed: X (x.com/yagiznizipli) was not reachable through search or fetch. Web search found no press item about his move to SpaceXAI.

---

## Update 2026-11-03: recent posts

Source: 146 of his own X posts, 2026-08-01 to 2026-11-03, read through the fxtwitter timeline API. Quotes are verbatim.

- Role. Bio: "leading @X web at @spacexsi". He leads the X web rewrite (https://x.com/yagiznizipli/status/2088663891727270251), and speedy-router is for it: "continuing to add in more as we build out X." (https://x.com/yagiznizipli/status/2088811729807462591)
- Bytes (3 posts): "Just found a way to reduce javascript size by 51% on the new rewrite of X." (https://x.com/yagiznizipli/status/2114180433571176711)
- Field data (2 posts): "For the first time ever, more of our URLs pass Core Web Vitals as Good than fall into Need Improvement or Poor." (https://x.com/yagiznizipli/status/2097720915840688430)
- Streams (3 posts): "3x to 13x improvement on web streams pipelines." (https://x.com/yagiznizipli/status/2090475848746864986). The linked Node.js PR handles large zlib input "in slices with an event-loop turn in between, so a huge chunk cannot block the loop for its full duration" (https://github.com/nodejs/node/pull/65437).
- AI: "All of my investigations are done with Grok 4.7." (https://x.com/yagiznizipli/status/2115440750733439368). Also: "keep reading code folks. AI isn’t there yet." (https://x.com/yagiznizipli/status/2093137269322330297)

---

## Update 2026-11-26: last-year refresh and replay

Sources added:
- GitHub: search `commenter:anonrig updated:>=2026-10-29` (124 threads). 29 threads had a comment from him. 15 comments in 12 threads are new since 2026-10-29. I also read again all his comments in 10 older threads of the last year (42 comments) for the replay. All comments are filtered on `user.login == anonrig`.
- X: 23 of his own posts, 2026-11-03 to 2026-11-26 (fxtwitter timeline, retweets removed).
- Bluesky: 19 posts from 2025-12-09 to 2026-04-03. He has not posted there since he left Cloudflare.
- HN: 0 comments for `anonrig` and for `yagiznizipli` since 2025-11-26.
- Blog: no new yagiz.co post since 2026-10-17.
- Failed: the X engineering post on the web rewrite (blog.x.com) returns a bot challenge (403) to curl and to a reader proxy. Its topic (page load) is the Ethan seat's lane. The commit that he reviewed on node#61549 is no longer on GitHub, so that case is not in the replay.
- Quote check: a script fetched the source of every quote in this file (comment by id, PR body, blog markdown, Bluesky post, X post) and compared the text. Two links pointed at the wrong comment on node#62924, and one quote in the Streams item had no link to its PR. All three are fixed.

New review evidence (his own short voice unless marked):

1. **Strings as type tags cost time, in a switch and across the native boundary.** On a render path: “Also this method has a huge switch/case statement comparing strings, if they're enums, comparing numbers to numbers would be a lot faster (referring to instruction.type)” ([astro#15123](https://github.com/withastro/astro/pull/15123#discussion_r2669830178)). On C++ that returns strings to JS: “can we avoid strings and just use enums” ([node#62924](https://github.com/nodejs/node/pull/62924#discussion_r3142038184)) and “we can just return enums from here, and avoid this serialization cost, if possible” ([node#62924](https://github.com/nodejs/node/pull/62924#discussion_r3142040726)). On a switch that maps a value to a value: “can you just create a map with key of this and value of returning value and avoid this switch” ([node#62924](https://github.com/nodejs/node/pull/62924#discussion_r3142033562)).
2. **One pass, one type, no redundant work.** On the same Astro PR: “Rather than checking if next is string, why don't we just store a separate array for string values and just check that in general? This would simplify this implementation and we don't have to store string | buffer in this array.” ([astro#15123](https://github.com/withastro/astro/pull/15123#discussion_r2669822825)), “We can also construct this offset in the previous for loop, can't we ?” ([r2669825291](https://github.com/withastro/astro/pull/15123#discussion_r2669825291)), and “stringifyChunk already returns string, toString() seems redundant” ([r2669827969](https://github.com/withastro/astro/pull/15123#discussion_r2669827969)).
3. **Slow per-character code is a finding even on a cold path.** The workerd label check runs once per container start, and he still blocked it: “please move this to a separate method which is constexpr. this is extremely slow.” ([workerd#6420](https://github.com/cloudflare/workerd/pull/6420#discussion_r2991086108)) and “You can have a function that gets kj::StringPtr and returns bool (is_ascii) or you can just use simdutf::validate_ascii() method.” ([workerd#6420](https://github.com/cloudflare/workerd/pull/6420#discussion_r2991089439)). Inference: when the cheap fix is a table, a constexpr function, or a helper that the project already ships, he asks for it without a profile.
4. **Reuse what the project already has.** “We already have debug assertions that validates this behavior if i remember correctly it is ADA_DEVELOPMENT_CHECKs” ([ada#1053](https://github.com/ada-url/ada/pull/1053#discussion_r2659207627)).
5. **Hand-written code where the language has it, and old loop folklore.** On net.BlockList: “Isn't this just String.prototype.split?” ([node#64974](https://github.com/nodejs/node/pull/64974#discussion_r3704872478)), “Question: Is (const x of y) iteration still slower than this today?” ([node#64974](https://github.com/nodejs/node/pull/64974#discussion_r3704883501)), and “Can this just be an object { ipv4: 32, ipv6: 128 } and it would be a lot more readable?” ([node#64974](https://github.com/nodejs/node/pull/64974#discussion_r3704891056)).
6. **A swap of a core dependency needs a benchmark in the PR description.** On replacing acorn with amaro: “is there a performance impact of replacing this? can you ensure we don't regress via benchmarks? if we don't please resolve this comment.” ([node#66902](https://github.com/nodejs/node/pull/66902#discussion_r4445944625)) and “Can you attach it to pr description” ([node#66902](https://github.com/nodejs/node/pull/66902#discussion_r4446013959)). In the same PR he replaced `npm run` lines in a README: “We don't need npm to run certain things...” ([node#66902](https://github.com/nodejs/node/pull/66902#discussion_r4445951789)).
7. **Each new check on a fast path must earn its cost.** “I don't think we should land this. The more checks we have, the more performance impact it would create. Do you have any examples out there that is impacted by this?” ([node#64341](https://github.com/nodejs/node/pull/64341#issuecomment-4907887359)).
8. **Readable call sites.** On a bare boolean parameter: “Since you didn't use options like an object, it is now extremely hard to trace this method.” ([node#61870](https://github.com/nodejs/node/pull/61870#discussion_r2829890953)). Typings, again: “these changes require updates to typings folder as well...” ([node#67179](https://github.com/nodejs/node/pull/67179#discussion_r4445964631)).
9. **Agent PRs.** He drives Copilot on ada with one-line orders (“@copilot use simd usage similar to existing ada url aggregator. add benchmarks.”, [ada#1093](https://github.com/ada-url/ada/pull/1093#issuecomment-4106714959)), and later closes the PR: “Closing: this is not a landable change.” ([ada#1093](https://github.com/ada-url/ada/pull/1093#issuecomment-7015971094)). Inference: the long closing text reads as agent-assisted (structured, formal); only the first sentence is quoted.

Proof standard, from Bluesky (Dec 2025, the reply to cURL's author):
- Hardware matters: “it depends on your cpu architecture. we leverage simd. what’s your cpu architecture based on?” ([Bluesky](https://bsky.app/profile/yagiznizipli.com/post/3m7m2ll3ct22k)). “I haven't run with Linux. Someone else did and saw 5.2x performance difference.” ([Bluesky](https://bsky.app/profile/yagiznizipli.com/post/3m7nigdzmg22q)).
- Release build: he asks the other side to rebuild with `-DCMAKE_BUILD_TYPE=Release` ([Bluesky](https://bsky.app/profile/yagiznizipli.com/post/3m7lmrnpl2k2u)).
- A unit only as a reference: “it’s just for using a real world example. just used req/second as a reference” ([Bluesky](https://bsky.app/profile/yagiznizipli.com/post/3m7nkbl3ihc23)).
- Regressions get a test: “only regression. this is actually a highly tested feature… with a really simple lack of test coverage lol” ([Bluesky](https://bsky.app/profile/yagiznizipli.com/post/3m7ogepjwos2z)).

X, 2026-11-03 to 11-26:
- Ada v4.1.0 thread. He names where each gain comes from, and the per-call cost that went away: “no rollback snapshot when the length limit can't be hit”, “no allocations when input is clean”, and “set_search: 72 ns to 25 ns” ([post](https://x.com/yagiznizipli/status/2123493617134109095)). The first post lists “can_parse: up to 4.2x faster” ([post](https://x.com/yagiznizipli/status/2123493610691706948)).
- Memory is a cost too: “Let me rephrase: Microsoft announced that they've been wasting 860MB of memory from it's own Windows apps until now.” ([post](https://x.com/yagiznizipli/status/2125777773998354522)).
- Current work: “I’m actively working on improving the performance and reducing the latency of search and for you algorithms.” ([post](https://x.com/yagiznizipli/status/2122491899160494269)). The X web rewrite: “On a slow connection, the old X web took more than 22 seconds to show the first post on a profile. The new X web does it in 2.7 seconds.” ([post](https://x.com/yagiznizipli/status/2118048136270672058)). This is page load, so it is the Ethan seat's lane.

Changes of mind: none found. Nothing in the last year contradicts the earlier sections. One seat rule was wrong, not his view: SKILL.md stopped on a cold path, but workerd#6420 shows that he flags slow per-character code and a missing fast helper on a cold path too.

Replay (blind runs of the seat on 5 PRs that he reviewed; his comments were the ground truth):

| Case | His issues | Before edit: hits / misses / extra | After edit: hits / misses / extra |
|---|---|---|---|
| node#62924 (train) | 7 | 1 / 6 / 2 (second `KeyObjectHandle` per key, his precompute comment r3142041575) | 1 / 6 / 3 |
| withastro/astro#15123 (train) | 4 | 0 / 4 / 3 | 1 / 3 / 3 (mixed `string \| Uint8Array` array with `typeof` per item) |
| cloudflare/workerd#6420 (train) | 2 | 0 / 2 / 0 (called it cold and stopped) | 2 partial / 0 / 0 (project lookup-table helper, but as a nit, not a block) |
| node#64974 (held out) | 7 (3 in lane: `split`, `for...of` folklore, `switch` to object) | 0 / 7 / 5 | 0 / 7 / 6 |
| node#66902 (held out) | 2 | 1 / 1 / 3 | 1 / 1 / 4 |

Notes on the replay:
- The held-out cases did not move. On node#64974 his in-lane points are readability nits on cold JS (`parseCIDR`, `addAddresses`, the prefix `switch`), and both runs spent their words on the C++ trie and the benchmark instead. Those extra findings are valid. On node#66902 both runs found his benchmark point. Neither run flagged the `npm run` lines in the vendored README.
- Misses that stay out of the seat's lane on purpose: JSDoc, docs, the typings folder, and sort order (Dax and poteto). The magic-number misses on node#62924 are `* 8` and `/ 8` (bits per byte) in a 2,150-line diff. The seat has the standard, but did not use it there.
- Valid extra findings that he did not raise: a throw-and-catch brand check on a hot crypto path (node#62924), a benchmark whose "hit" rows measure misses (node#64974), and binary size with `--without-amaro` (node#66902).
