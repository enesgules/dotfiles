# Andrew Gallant (@BurntSushi): code-review research

Research date: 2026-11-26 (refreshed the same day with his last-year ty, uv, and rust-lang reviews). Weighting: 2025 to Nov 2026 highest.
Main corpus: 1,567 of his GitHub comments in his own repositories, 2025-01-01 to 2026-11-26 (`BurntSushi/jiff` 727, `BurntSushi/ripgrep` 498, `rust-lang/regex` 167, then `memchr`, `bstr`, `rust-csv`, `aho-corasick`, `walkdir`, `same-file`, `biff`). They come from the repository comment lists (`issues/comments` and `pulls/comments` with `since=2025-01-01`), filtered on `user.login`. 262 of them are inline review comments. I also read 241 of his review bodies and comments on 60 `astral-sh/ruff` PRs (ty, 2025-12-15 to 2026-07-17), then (refresh, 2026-11-26) all 708 of his comments from 2025-11-26 to 2026-11-24 in 239 threads outside his own repositories (`commenter:BurntSushi` and `reviewed-by:BurntSushi`, 938 threads, filtered on `user.login`): `astral-sh/ruff` 330, `astral-sh/ty` 106, `rust-lang/rust` 95, `astral-sh/uv` 51, `astral-sh/ty-vscode` 25, `rust-lang/libs-team` 18, and others. 394 of all fetched rows are inline review comments and 55 are review bodies. I also read his committed code comments in `regex-automata` (`util/int.rs`, `util/pool.rs`) for the two baseline checks, 347 HN comments (user `burntsushi`, 2025-01-01 to 2026-11-17), 4 blog posts (Jiff 1.0, unwrap, FOSS, a 2026 health post), his policy docs (Jiff README dependency and MSRV policy, `AI_POLICY.md`), 168 of his X posts, and 389 of his Bluesky posts.
Every quote is verbatim. A script checked each quote against the fetched text. "Inference" marks my own reading. "Paraphrase" marks text that I did not quote.

**Agent-written comments:** I found none in his own voice (the 2026-11-26 refresh found none either). He uses LLMs for code and says so in the PR ("I wrote this PR with an LLM, so this still needs careful review."). He does not use them to write comments, and his AI policy forbids that for contributors.

**How he reviews:** many short inline comments, each one a question or one exact change. On larger PRs he often takes over: "I'm going to take over this PR if you don't mind." He then simplifies the patch, adds tests, and merges. He closes PRs that do not show a bug with an example.

---

## Current focus (what he works on now)

- **Jiff 1.0**, released 2026-11-15. "Unless some significant defect is found in Jiff’s API, my plan is to commit to Jiff 1.0 indefinitely." ([Jiff blog](https://burntsushi.net/jiff/)). Also `jiff-core`, a smaller crate that works in `const` and core-only contexts.
- **ripgrep 16** (2026-11-22), with `--in` and `-G/--glob-not` ([X post](https://x.com/burntsushi5/status/2124640840161116575)), and the incremental matcher in the `ignore` crate that ty uses.
- **regex 1.13** added a `regex!` macro (NOT compile time) ([X post](https://x.com/burntsushi5/status/2075189965739204814)).
- **ty at Astral**: LSP and file-walk work in `astral-sh/ruff`. He is on the Rust libs-api team ([HN](https://news.ycombinator.com/item?id=46061184)).
- He took a long health break in 2026 and was back at work in July 2026 (his own [post](https://burntsushi.net/encephalitis/)). Not used for the lens.

---

## Core values

1. **A panic is a bug, not error handling.** "Panicking should not be used for error handling in either applications or libraries." and "If a Rust program panics, then it signals a bug in the program. That is, correct Rust programs don’t panic." ([unwrap post](https://burntsushi.net/unwrap/)).
2. **`unwrap()` is an assertion, and assertions are fine.** "It is absolutely okay to use unwrap(). It's just an assertion. Assertions appear in critical code all the time, including the standard library. Just like it's okay to use `slice[i]`." ([HN](https://news.ycombinator.com/item?id=46061184)). "Basically an unwrap here is no different than `slice[i]`." ([jiff#581](https://github.com/BurntSushi/jiff/pull/581#discussion_r3398129647)).
3. **Error for bad input, panic for broken invariant.** "In the case of a precondition violation, one may return to the caller when it is violated. (For example, by returning an error.) However, this should never be used in the case of an internal invariant violation because it leaks implementation details." ([unwrap post](https://burntsushi.net/unwrap/)). "I don't mind these panicking for a static string literal because that is always a bug in a programmer's code, but these can accept user input and panicking in that scenario is bad juju." ([jiff#585](https://github.com/BurntSushi/jiff/issues/585#issuecomment-4736886146)).
4. **Semver is a promise to the ecosystem.** "This makes Jiff an attractive public dependency, which means semver incompatible releases are likely to cause significant pain in the ecosystem. They will not be made lightly." ([Jiff blog](https://burntsushi.net/jiff/)).
5. **Very few dependencies, and fewer public ones.** "I am quite conservative with dependencies, and _especially_ so with public dependencies. With a public dependency, I can't increase its version without making a semver incompatible release myself." ([jiff#729](https://github.com/BurntSushi/jiff/issues/729#issuecomment-7182029155)).
6. **`unsafe` only with a reason and a proof.** "IDK how willing I am to break out `unsafe` for this. I try to be very judicious in when I use it." ([jiff#373](https://github.com/BurntSushi/jiff/issues/373#issuecomment-2889083124)). "All `unsafe` blocks need a `SAFETY` comment explaining why they are safe." ([jiff#506](https://github.com/BurntSushi/jiff/pull/506#discussion_r2783669272)).
7. **Do not push complexity onto callers.** "Basically, any time you have a `#[cfg(feature = "...")]` around a public API, you're passing the buck of dealing with that to other downstream libraries." ([regex#1371](https://github.com/rust-lang/regex/pull/1371#discussion_r3519609390)).
8. **A human owns the work.** "I don't mind code changes being done with an LLM, but please don't use LLMs to communicate with humans." ([regex#1368](https://github.com/rust-lang/regex/pull/1368#issuecomment-4836313646)).

---

## Review checklist (what he checks or pushes back on)

1. **Can this code panic on input it does not control?**
   - "Note that in your code, I'd suggest using `Span::new().try_seconds(seconds)`, especially since you're already returning an error. Your current routine will panic when `seconds` is out of bounds." ([jiff#712](https://github.com/BurntSushi/jiff/issues/712#issuecomment-7051238947)).
   - He separates a library panic from an error: "This isn't a panic. It's an error. The panic comes from your `unwrap()`. This is an important distinction because a panic from inside of Jiff is a different beast than it reporting an error." ([jiff#533](https://github.com/BurntSushi/jiff/issues/533#issuecomment-4760407346)).
2. **Is each panic documented, with a fallible twin?**
   - "Getting a panic from a function that is consistent with the documented conditions in which that function can panic is not a bug." ([aho-corasick#158](https://github.com/BurntSushi/aho-corasick/issues/158#issuecomment-2833514872)).
   - On `from_secs_f64`: "It is [documented to panic](https://docs.rs/jiff/latest/jiff/struct.SignedDuration.html#panics-3)" ... "The intent is to use [`SignedDuration::try_from_secs_f64`]" ([jiff#324](https://github.com/BurntSushi/jiff/issues/324#issuecomment-2800131302)). Paraphrase: the panicking form is a convenience, and the `try_` form is the real API.
   - In ty: "Should the docs here be updated to say when callers ought to return `None`? It's somewhat odd that in some cases it will panic (e.g., via `expect_single_definition`) but in others it will return `None`." ([ruff#23708](https://github.com/astral-sh/ruff/pull/23708#discussion_r2884335583)).
   - Follow `core`: "if you want or need to avoid the possibility of panics, then you don't use the arithmetic (or indexing) operators and instead stick to explicit checked methods." ([jiff#145](https://github.com/BurntSushi/jiff/issues/145#issuecomment-3058443933)).
3. **Does an error get swallowed?**
   - "This should have an unwrap or an expect. We don't want to silently swallow an error here." ([jiff#581](https://github.com/BurntSushi/jiff/pull/581#discussion_r3397635339)).
   - "We should be very careful about whether we use `?` in these system integration points because we swallow errors. I like to have at least a `trace!` whenever something goes wrong" ([jiff#506](https://github.com/BurntSushi/jiff/pull/506#issuecomment-3878405513)).
4. **Is the error type right for a library or a binary?**
   - In the ripgrep binary: "Also, `anyhow::bail!` should be used here. And anywhere else you're building an `io::Error` like this." ([ripgrep#3462](https://github.com/BurntSushi/ripgrep/pull/3462#discussion_r3540827087)).
   - In a library: "It's very rare that `pub enum Error { ... }` is something I'd put into the public API of a library. epage is absolutely correct that it is an extensibility hazard. But having a sub-ordinate "kind" error enum is totally fine (assuming you mark it `#[non_exhaustive]`)." ([HN](https://news.ycombinator.com/item?id=46415060)).
   - His own regret: "`ignore::Error` was awfully designed. It can't be expanded at all without a semver incompatible release." ([ripgrep#3453](https://github.com/BurntSushi/ripgrep/issues/3453#issuecomment-4837840437)).
   - Jiff uses one chained error: "For Jiff proper, I think it's just too convenient to have one god error type for everything with chaining." ([jiff#517](https://github.com/BurntSushi/jiff/issues/517#issuecomment-5160620439)). "I'm not really a fan of adding one specific error type for these routines without a stronger motivating reason." ([jiff#439](https://github.com/BurntSushi/jiff/issues/439#issuecomment-5179007618)).
   - Messages say why: "It's too easy to just say, "did not parse" instead of saying _why_ it didn't parse." ([bstr#214](https://github.com/BurntSushi/bstr/issues/214#issuecomment-3236842314)).
5. **Does `unsafe` have a SAFETY comment, a reason, and a small home?**
   - "All `unsafe` blocks need a `SAFETY` comment explaining why they are safe." ([jiff#506](https://github.com/BurntSushi/jiff/pull/506#discussion_r2783669272)).
   - Ownership of FFI memory: "What is the lifetime of the `*char` returned by `emscripten_run_script_string`? Who is responsible for freeing it?" ([jiff#506](https://github.com/BurntSushi/jiff/pull/506#discussion_r2783696728)).
   - Measure first: "I'd prefer not to use `unsafe` until someone comes and tells me that they can observe the alloc hurting perf in a real workload." ([jiff#241](https://github.com/BurntSushi/jiff/pull/241#discussion_r1950811494)).
   - Keep it in one module: "I'm also able to so far encapsulate the `unsafe` bits entirely within one module, which makes me happy." ([jiff#373](https://github.com/BurntSushi/jiff/issues/373#issuecomment-3691521880)).
   - Soundness counts even when not observable: "I also love bug reports for [unsound APIs](https://docs.rs/dtolnay/latest/dtolnay/macro._03__soundness_bugs.html) even if undefined behavior cannot be observed from a public API." ([memchr#225](https://github.com/BurntSushi/memchr/issues/225#issuecomment-4686737598)).
6. **Bytes or UTF-8: does the code assume what it cannot know?**
   - "This is definitely intended behavior because ripgrep can't know whether the haystack is valid UTF-8 or not. So there is no notion of codepoint boundary." ([ripgrep#3120](https://github.com/BurntSushi/ripgrep/issues/3120#issuecomment-3155577780)).
   - "Doing a UTF-8 check just to see if the path is empty doesn't make sense." ([ripgrep#3163](https://github.com/BurntSushi/ripgrep/pull/3163#discussion_r2402662112)).
   - "The cheapest way to do UTF-8 validation is to avoid doing it at all." ([rust-csv#410](https://github.com/BurntSushi/rust-csv/issues/410#issuecomment-3418470901)).
   - Paths as bytes: "This entire routine can almost be simplified to just [`ByteSlice::to_path`]" ([ripgrep#3462](https://github.com/BurntSushi/ripgrep/pull/3462#discussion_r3540804843)). "This is a `OsStr`, so there is only `as_encoded_bytes()`." ([ripgrep#3472](https://github.com/BurntSushi/ripgrep/pull/3472#discussion_r3598204597)).
7. **Is this a semver break, and is it a major one?**
   - "We can't add lifetime/type parameters to types in semver compatible releases." ([jiff#494](https://github.com/BurntSushi/jiff/pull/494#issuecomment-3843337335)).
   - Direction matters: "going from panicking to non-panicking is semver compatible. The other direction is not." ([jiff#585](https://github.com/BurntSushi/jiff/issues/585#issuecomment-4736886146)). Same for errors: "So _removing_ the error case would likely be treated as a breaking change." ([jiff#323](https://github.com/BurntSushi/jiff/issues/323#issuecomment-5012503679)).
   - Internals stay private: "it exposes the internal representation of Jiff types. And I can't really abide that because I will always reserve the right to make changes to internal representations in semver compatible releases." ([jiff#537](https://github.com/BurntSushi/jiff/issues/537#issuecomment-4350891670)).
   - Leave it out if unsure: "Also, this can be added back later without breaking changes." ([regex#1371](https://github.com/rust-lang/regex/pull/1371#discussion_r3520002991)).
8. **Does the new API encode too many assumptions?**
   - "I ended up re-working this a bit to make the API a little less convenient, but in exchange, it should hopefully be easier to evolve in semver compatible ways if necessary. That is, the revised API doesn't encode as many assumptions." ([ripgrep#3103](https://github.com/BurntSushi/ripgrep/pull/3103#issuecomment-3262154762)).
   - "Do these fields need to be `pub`? If not, I'd remove it." ([jiff#247](https://github.com/BurntSushi/jiff/pull/247#discussion_r1949558423)).
   - New public trait methods for one case: "Otherwise having a new public method on a public trait for just this case is not what I would want." ([jiff#581](https://github.com/BurntSushi/jiff/pull/581#discussion_r3397699652)).
   - Nameable types: "it becomes difficult to name the type returned by the macro. I _hate_ it when libraries do this" ([regex#1371](https://github.com/rust-lang/regex/pull/1371#discussion_r3520026775)).
   - Match std: "std only has the `T` and `&T` impls for primitive integers. Could you drop the `&mut T` impl here?" ([jiff#282](https://github.com/BurntSushi/jiff/pull/282#discussion_r1975337810)).
9. **Is a feature gate on a public API needed?** "I prefer keeping APIs available unless they can't be (e.g., using types that can't be available in the API signature). It avoids callers needing to write feature specific code." ([jiff#533](https://github.com/BurntSushi/jiff/issues/533#issuecomment-4760413275)).
10. **Dependencies (the cost, not the decision).**
    - The policy: "1. When a dependency is _practically_ required in order to interact with a platform." and "2. When a dependency is necessary for interoperability." ([Jiff README](https://github.com/BurntSushi/jiff#dependencies)).
    - The bar for a public dependency: "I think a crate basically needs to be an ecosystem standard and _at least_ as stable as Jiff for me to pull it in as a dependency." ([jiff#520](https://github.com/BurntSushi/jiff/issues/520#issuecomment-3937589512)).
    - Weight: "It's a non-starter because of the dependency tree it brings in. It's too much for a crate like `walkdir`." ([walkdir#213](https://github.com/BurntSushi/walkdir/issues/213#issuecomment-4773620195)).
    - Audit for `unsafe`: "For a dependency that uses a lot of `unsafe`, I would need to do a pretty thorough review of the project before I was willing to depend on it." ([rust-csv#410](https://github.com/BurntSushi/rust-csv/issues/410#issuecomment-3418470901)).
    - No drive-by updates: "please don't make spurious updates to dependencies. PRs should be as small as possible. There's no reason to include a `cargo update` in the patch." ([ripgrep#2880](https://github.com/BurntSushi/ripgrep/pull/2880#issuecomment-3122028627)).
    - Version floors: "Is this version constraint accurate? I'd rather start with what we know works." ([jiff#546](https://github.com/BurntSushi/jiff/pull/546#discussion_r3299924235)).
11. **MSRV.** "Bumping MSRV is not a semver breaking change." ([ripgrep#3473](https://github.com/BurntSushi/ripgrep/issues/3473#issuecomment-5025249557)). He does bumps only in minor releases: "I was doing a minor version bump (which is when I do msrv bumps)." ([bstr#228](https://github.com/BurntSushi/bstr/pull/228#issuecomment-4800687964)). `rust-version` must match the code: "But that should be set to an appropriate Rust version compatible with the current code." ([ripgrep#3473](https://github.com/BurntSushi/ripgrep/issues/3473#issuecomment-5025249557)).
12. **Docs: semantics, examples with imports, links.**
    - "I don't like that we discuss the implementation here. I think we should talk about semantics and not how it's achieved." ([regex#1371](https://github.com/rust-lang/regex/pull/1371#discussion_r3519584998)).
    - "I don't like it when examples leave out stuff like this. I know std does it and... I'm not a huge fan. I would rather show users how the thing is being imported." ([regex#1371](https://github.com/rust-lang/regex/pull/1371#discussion_r3519453809)).
    - "It's bad juju to document items that appear in an overview page (types and modules mostly) with a Markdown paragraph of more than ~1 line." ([aho-corasick#153](https://github.com/BurntSushi/aho-corasick/pull/153#issuecomment-2637228267)).
    - A new feature is documented in `lib.rs` too: "I think this feature should be added and documented in `src/lib.rs` as well." ([jiff#546](https://github.com/BurntSushi/jiff/pull/546#discussion_r3299923089)).
13. **Tests: a regression test that fails before the fix.**
    - "There is no failing test before or after this change, which makes me suspicious of test coverage. Could you please add a regression test first? Thanks." ([memchr#220](https://github.com/BurntSushi/memchr/pull/220#issuecomment-4529647057)).
    - "Also, for changes like this, it is customary to include a regression test." ([ripgrep#3019](https://github.com/BurntSushi/ripgrep/pull/3019#issuecomment-3194662303)).
    - The test must test the claim: "This test doesn't check what is written in the comments. Memory maps aren't used here." ([ripgrep#3002](https://github.com/BurntSushi/ripgrep/pull/3002#discussion_r2281009031)). "I think this test would be more effective if it also included a pattern that matched after the NUL byte." ([ripgrep#3002](https://github.com/BurntSushi/ripgrep/pull/3002#discussion_r2281007949)).
    - Edge mixes: "Can you add tests that mingle `--in`, `--in0` and other positional paths?" ([ripgrep#3462](https://github.com/BurntSushi/ripgrep/pull/3462#discussion_r3540776873)).
    - No brittle asserts: "I'm not a huge fan of asserting these escapes in this fashion." ([ripgrep#3630](https://github.com/BurntSushi/ripgrep/pull/3630#discussion_r4671831811)).
14. **Allocation on a hot path.** "This is doing an alloc and a copy just to make the types unify. And this is called for _every_ match. Absolutely cannot do that." ([ripgrep#3163](https://github.com/BurntSushi/ripgrep/pull/3163#discussion_r2402660307)). "This is introducing an allocation in the common case where previously none existed. Maybe a `Cow<Path>` would help here?" ([ripgrep#2842](https://github.com/BurntSushi/ripgrep/pull/2842#discussion_r2019797282)). (Speed numbers go to Charlie. The alloc on a per-item path is a code finding.)

---

## Last-year refresh: ty, uv, and rust-lang reviews (2025-11-26 to 2026-11-26)

In `astral-sh/ruff` (ty) he reviews application code in an unpublished workspace, not a library. There his comments are mostly about tests, contracts, and simpler code. Semver does not apply there.

1. **Tests cover each case, and a test that accepts a known gap says so.**
   - "Do the tests here cover every case in `is_expecting_expression`? I know it's probably a pain, but I think it's probably worth doing." ([ruff#22002](https://github.com/astral-sh/ruff/pull/22002#discussion_r2627325509)).
   - "Could you add a test that involves multiple function signatures?" ([ruff#21796](https://github.com/astral-sh/ruff/pull/21796#discussion_r2590787701)). The same comment lists more cases: several keyword arguments, arguments that are already set, and the cursor between two arguments.
   - "(It's fine if we don't do this today. But if the test is asserting a sub-optimal output, I think we should have a comment saying as much.)" ([ruff#23012](https://github.com/astral-sh/ruff/pull/23012#discussion_r2769412572)).
   - "Can you add a test for this and attach a TODO to it to fix in the future?" ([ruff#22002](https://github.com/astral-sh/ruff/pull/22002#discussion_r2627318892)).
   - "Should we add a test that covers the "missing features" case?" ([uv#23382](https://github.com/astral-sh/uv/pull/23382#discussion_r4684232765)).
2. **A function that is not obvious gets a contract.**
   - "Also, please add a contract to this function." and "It took me a minute to figure out why this was needed, so saying more about that would help too." ([ruff#22154](https://github.com/astral-sh/ruff/pull/22154#discussion_r2682612567)).
   - "A comment on this function would be helpful. e.g., Mentioning the various heuristics used to try to limit false positives." ([ruff#23012](https://github.com/astral-sh/ruff/pull/23012#discussion_r2769571252)).
   - "Hmmm this loop is unfortunate. Can you add a comment here explaining why it's needed? An example would be helpful." ([ruff#23012](https://github.com/astral-sh/ruff/pull/23012#discussion_r2769614497)).
   - "This should be a `///` comment." ([ruff#21796](https://github.com/astral-sh/ruff/pull/21796#discussion_r2599720649)).
   - Docs say why a design exists: "I might add here that we previously did this at runtime with a simple enum, but that we kept playing whack-a-mole since every call site needed to check the enum." ([ruff#22056](https://github.com/astral-sh/ruff/pull/22056#discussion_r2635393694)).
3. **Remove a redundant check, a duplicate, or an own copy of something that exists.**
   - "But the _only_ call to `string_literal()` is guarded by the condition that `cursor.is_in_string()` is `true`. I think there should be a simplification here?" ([ruff#22154](https://github.com/astral-sh/ruff/pull/22154#discussion_r2682499942)).
   - "Is this word boundary check actually needed?" ([ruff#23012](https://github.com/astral-sh/ruff/pull/23012#discussion_r2769598339)).
   - "The duplication here seems somewhat unfortunate, particularly given they are somewhat subtle. Is there any way to share code here?" ([ruff#23012](https://github.com/astral-sh/ruff/pull/23012#discussion_r2769611658)).
   - "Finally, are we sure a routine like this doesn't already exist?" ([ruff#22154](https://github.com/astral-sh/ruff/pull/22154#discussion_r2682612567)).
   - Use the std type: "I think you can just use `std::convert::Infallible` here instead." ([ruff#22056](https://github.com/astral-sh/ruff/pull/22056#discussion_r2635352196)).
   - Return the type the caller needs: "If we're just going to create a `Box<str>` anyway, then why have `escape_for_quote` return a `Cow`?" ([ruff#22154](https://github.com/astral-sh/ruff/pull/22154#discussion_r2682597031)).
   - "Why collect this into a `Vec` if it's just going to be passed as an iterator below?" ([ruff#23305](https://github.com/astral-sh/ruff/pull/23305#discussion_r2859750902)).
   - "Could this be split out into a separate function? There's already a lot going on here." ([ruff#21796](https://github.com/astral-sh/ruff/pull/21796#discussion_r2590790487)).
   - Quadratic membership: "I think this should return a `FxHashSet` so that membership testing is constant time. Otherwise the loop in the caller is quadratic." ([ruff#21796](https://github.com/astral-sh/ruff/pull/21796#discussion_r2599725208)).
4. **Overflow on input, and debug-only checks.**
   - "Note that your multiplications here for days and weeks can overflow and panic depending on how the binary is built. Previously you would return an error." ([tough#948](https://github.com/awslabs/tough/pull/948#discussion_r3368614971)).
   - "I guess this routine actually uses `debug_assert_eq!`, so it wouldn't panic in release builds if there's more than one definition." ([ruff#23141](https://github.com/astral-sh/ruff/pull/23141#discussion_r2782619551)).
   - `checked_*().unwrap()` is the operator, spelled long: "You should just be able to do `Timestamp::now() + days(13)` here. (And for other places too.) I'd only suggest it where you're already doing `timestamp.checked_add(...).unwrap()`." ([tough#948](https://github.com/awslabs/tough/pull/948#discussion_r3368607743)).
5. **Panics: documented or a bug, and not a CVE.**
   - "A good rule of thumb here is that if you see Jiff panic, and that panic is not covered by a documented precondition somewhere, then it's a bug in Jiff that should be fixed." ([coreutils#10751](https://github.com/uutils/coreutils/pull/10751#issuecomment-3856034936)).
   - "But these definitely aren't vulnerabilities or CVEs. These are likely best addressed by documenting panicking preconditions." ([advisory-db#2684](https://github.com/rustsec/advisory-db/pull/2684#issuecomment-3973228588)).
   - Document the edge: "the saturating arithmetic methods should be explicitly documented such that the boundaries at which arithmetic saturates depend on the `MIN` and `MAX` constants, and thus are platform dependent." ([libs-team#718](https://github.com/rust-lang/libs-team/issues/718#issuecomment-3702270908)).
6. **Semver is for published APIs only.** In ty, on a wider `pub` in a workspace crate: "Yeah it's fine. It's practically a meme at this point how often the LSP functionality causes use to export more stuff from `ty_python_semantic`. :-)" ([ruff#21796](https://github.com/astral-sh/ruff/pull/21796#discussion_r2590766558)). For a published crate he stays strict: "So probably not a candidate for a public API unfortunately." ([ruff#22243](https://github.com/astral-sh/ruff/pull/22243#discussion_r2665637480)).
7. **An interop feature for a pre-1.0 dependency names its version.** "Please scope the feature name to the Jiff version. e.g., `jiff-0_2`." and "If you include the version in the feature name, then a `jiff` feature can be added for 1.0 in a semver compatible release (while keeping the `jiff-0_2` feature)." ([icu4x#7617](https://github.com/unicode-org/icu4x/pull/7617#discussion_r2788987885)).
8. **Version floors and MSRV.**
   - "If you put `some-crate = "1"` in a `Cargo.toml`, then you need to ensure that your code actually works with `1.0.0` of `some-crate` and doesn't rely on, e.g., anything introduce in `some-crate 1.1.0`." ([defmt#1062](https://github.com/knurling-rs/defmt/issues/1062#issuecomment-4550662031)).
   - The written policy: "Jiff itself, and any dependencies of Jiff within this repository, will never use a Rust version that requires a Rust compiler released in the previous 1 year." ([Jiff README](https://github.com/BurntSushi/jiff#minimum-rust-version-policy)).
   - Missing `rust-version` is his own gap, not a rule he enforces on others: "There's no listed MSRV in the `ignore/Cargo.toml` mostly because I just never put one there. :P" ([ripgrep#3472](https://github.com/BurntSushi/ripgrep/pull/3472#discussion_r3598191578)).
9. **Names.** "I'd avoid `safe` personally, given its confusability with Rust notions of safety." ([ruff#22056](https://github.com/astral-sh/ruff/pull/22056#discussion_r2635415628)).

Changed mind: none found. Narrowed: the semver standards (public items, semver class, `cfg` on public API) apply to published crates only. ruff#21796 shows he does not object to a wider `pub` inside an unpublished workspace.

### Sources for the two baseline checks (his committed code, not review comments)

- **`as` casts.** `regex-automata/src/util/int.rs` module doc: "The driving design principle of this module is to attempt to centralize as many `as` casts as possible here." and "In this case, we very specifically do not want to overflow, and so the methods defined here will panic if the `as` cast would be lossy in debug mode." and "we still use things like `u64::from` where possible, or even `usize::try_from()` for when we do explicitly want to panic or when we want to return an error for overflow." ([int.rs](https://github.com/rust-lang/regex/blob/fde4946d4a3cb367338a21493ec91ec7106a12b4/regex-automata/src/util/int.rs)).
- **`unsafe impl Sync`.** Each manual impl in `regex-automata/src/util/pool.rs` has its own proof: "SAFETY: Since a Mutex guarantees exclusive access, as long as we can send it across threads, it must also be Sync." and, for `Pool`, "The key is to guarantee that 'owner_val' can only ever be accessed from one thread." ([pool.rs](https://github.com/rust-lang/regex/blob/fde4946d4a3cb367338a21493ec91ec7106a12b4/regex-automata/src/util/pool.rs)).

### Replay test (2026-11-26)

Blind runs of the seat on 5 of his reviews from the last year. Hits / his findings.
- Training: ruff#23012 1/6, tough#948 1/3, ruff#22056 1/6. The misses were tests for each case, comments on tests that accept a gap, `///` contracts, redundant checks, `std` types, and names. Noise: `pub` in unpublished workspace crates treated as semver.
- Held out, before the edit: jiff#628 3/3, ruff#21796 0.5/3. After: jiff#628 3/3, ruff#21796 1.5/3.

---

## What he praises

- A good regression test: "Thank you for the nice regression test!" ([ripgrep#3139](https://github.com/BurntSushi/ripgrep/issues/3139#issuecomment-3316159665)). "Thanks! The unit tests were quite helpful. But I was able to simplify the patch a bit." ([ripgrep#3602](https://github.com/BurntSushi/ripgrep/pull/3602#issuecomment-7027646247)).
- A crate that is done: "Shoutout to the `lexopt` crate as a great example of a Rust library that is effectively done." ([X](https://x.com/burntsushi5/status/2061873669761061141)).
- A correct bug report, even with AI help: "Also, this bug report was exactly correct. The quotes from AI were spot-on." ([memchr#225](https://github.com/BurntSushi/memchr/issues/225#issuecomment-4686748676)).
- Being taught: "This comment was _extremely_ edifying for me. I had never put together that signed division would be so much more expensive than unsigned." ([jiff#518](https://github.com/BurntSushi/jiff/pull/518#discussion_r2819791257)).

---

## Tone and phrasing

- Direct and specific, often a question: "Why is this conditioned on `wtr.supports_hyperlinks()`?" ([ripgrep#3630](https://github.com/BurntSushi/ripgrep/pull/3630#discussion_r4671813070)). "Do these fields need to be `pub`?"
- Gives the exact replacement: "I think this can just be `if ranges_to_use.is_empty()`" ([ripgrep#3546](https://github.com/BurntSushi/ripgrep/pull/3546#discussion_r4392552150)).
- States his own uncertainty: "I may still be wrong. But you'll need to demonstrate that through actual examples." ([ripgrep#2880](https://github.com/BurntSushi/ripgrep/pull/2880#issuecomment-3122028627)).
- Admits mistakes fast: "Oh whoops, that's my bad. You aren't stupid. Thanks for pushing back." ([ripgrep#3462](https://github.com/BurntSushi/ripgrep/pull/3462#discussion_r3564959682)).
- Strong words for a clear no: "Absolutely cannot do that." ([ripgrep#3163](https://github.com/BurntSushi/ripgrep/pull/3163#discussion_r2402660307)). "This is FUBAR." ([ripgrep#3107](https://github.com/BurntSushi/ripgrep/pull/3107#discussion_r2286768359)).
- Uses `:-)` and "bad juju". Wraps comments to 79 columns and asks others to do the same.

---

## Hard "no"s / pet peeves

- A library that panics on user input, or a panic that is not documented.
- A swallowed error (`?` that drops an error in system code with no log, or a discarded `Result`).
- `unsafe` with no `SAFETY` comment, or `unsafe` for a speed-up that no one measured.
- A public dependency that is not 1.0-stable, or a heavy dependency tree in a small crate.
- A breaking change in a semver-compatible release. Exposing internal representation.
- `#[cfg(feature)]` on a public API when a runtime error would do.
- Unrelated changes in a PR: "It seems like there are a bunch of unrelated changes in this PR. Please back those out so that I can evaluate the actual change here." ([ripgrep#3340](https://github.com/BurntSushi/ripgrep/pull/3340#issuecomment-4925384260)).
- A fix with no failing test. A test that does not test what its comment says.
- LLM-written comments, PR bodies, and commit messages: "I really do need PR bodies and commit messages to be written by a human in your own words." ([walkdir#217](https://github.com/BurntSushi/walkdir/pull/217#issuecomment-4910602234)).
- Defensive code that an agent made up. On his own Codex PR: "I removed it. It looks like a hallucination from Codex. It seems like it was just being defensive" ([ruff#26771](https://github.com/astral-sh/ruff/pull/26771#discussion_r3579340701)).

---

## Heuristics that generalize

1. Assign blame for each panic: the caller (documented precondition) or the callee (internal invariant). If neither, it is an input error and must be a `Result`. (Inference from the unwrap post.)
2. Every panicking convenience has a `try_`/`checked_` twin, and its docs have a `# Panics` section. (Inference from jiff#324 and aho-corasick#158.)
3. Library: own error type, opaque or `#[non_exhaustive]` kind. Binary: `anyhow` with context. (ripgrep#3462, HN 46415060.)
4. Before you add a public item, ask: can we remove it later? If not, leave it out now. (regex#1371, jiff#537.)
5. A public dependency's semver becomes your semver. (jiff#729.)
6. Treat input as bytes until you must know it is UTF-8. (ripgrep#3120, rust-csv#410.)
7. A bug fix starts with a test that fails on `master`. (memchr#220.)

---

## Lane fit (for the seat)

This seat owns Rust code correctness and library API: panics vs errors, error types, `unsafe`, bytes vs UTF-8, semver and public surface, docs with examples, MSRV, and edge-case tests.
- Measured speed claims and user-facing CLI behavior go to Charlie (`review-charlie`). He benchmarks a lot (rebar, hyperfine), but numbers are not this lane.
- The decision to add a dependency goes to antirez. This seat states the cost (public or private, tree size, `unsafe`, stability).
- General contract design and failure loudness go to Armin. This seat keeps the Rust-specific parts.
- Security goes to Daniel. A soundness bug with a security effect goes to Daniel too.
- Regressions, PR size, and commit hygiene go to Linus.

---

## Not adopted

- Long threads where he defends `unwrap()` against people on HN. The position is adopted. The arguments are not review checks.
- Domain detail from Jiff (DST, leap seconds, calendar units) and ty (Python module resolution). Too specific.
- Comment wrap at 79 columns. It is his house style, not a general rule.
- Benchmarks and speed tuning (rebar, signed vs unsigned division, `memchr` SIMD). Charlie's lane.
- ripgrep flag design (`--vimgrep`, `--in`, glob negation). CLI behavior is Charlie's lane.
- Politics, family, pets, health, ISP complaints on X and Bluesky.
- "You should probably use a smarter AI." ([ripgrep#3138](https://github.com/BurntSushi/ripgrep/issues/3138#issuecomment-3250227873)). A joke.

---

## Sources

**GitHub comments** (fetched with `gh api`, checked by `user.login`; links go to the exact comment): jiff [#712](https://github.com/BurntSushi/jiff/issues/712#issuecomment-7051238947), [#729](https://github.com/BurntSushi/jiff/issues/729#issuecomment-7182029155), [#585](https://github.com/BurntSushi/jiff/issues/585#issuecomment-4736886146), [#581](https://github.com/BurntSushi/jiff/pull/581#discussion_r3397635339), [#533](https://github.com/BurntSushi/jiff/issues/533#issuecomment-4760413275), [#506](https://github.com/BurntSushi/jiff/pull/506#discussion_r2783669272), [#373](https://github.com/BurntSushi/jiff/issues/373#issuecomment-2889083124), [#145](https://github.com/BurntSushi/jiff/issues/145#issuecomment-3058443933), [#324](https://github.com/BurntSushi/jiff/issues/324#issuecomment-2800131302), [#494](https://github.com/BurntSushi/jiff/pull/494#issuecomment-3843337335), [#537](https://github.com/BurntSushi/jiff/issues/537#issuecomment-4350891670), [#520](https://github.com/BurntSushi/jiff/issues/520#issuecomment-3937589512), [#546](https://github.com/BurntSushi/jiff/pull/546#discussion_r3299924235); ripgrep [#3462](https://github.com/BurntSushi/ripgrep/pull/3462#discussion_r3540827087), [#3163](https://github.com/BurntSushi/ripgrep/pull/3163#discussion_r2402660307), [#3103](https://github.com/BurntSushi/ripgrep/pull/3103#issuecomment-3262154762), [#3120](https://github.com/BurntSushi/ripgrep/issues/3120#issuecomment-3155577780), [#2880](https://github.com/BurntSushi/ripgrep/pull/2880#issuecomment-3122028627), [#3002](https://github.com/BurntSushi/ripgrep/pull/3002#discussion_r2281009031), [#3473](https://github.com/BurntSushi/ripgrep/issues/3473#issuecomment-5025249557); regex [#1371](https://github.com/rust-lang/regex/pull/1371#discussion_r3519609390), [#1368](https://github.com/rust-lang/regex/pull/1368#issuecomment-4836313646); memchr [#220](https://github.com/BurntSushi/memchr/pull/220#issuecomment-4529647057), [#225](https://github.com/BurntSushi/memchr/issues/225#issuecomment-4686737598); rust-csv [#410](https://github.com/BurntSushi/rust-csv/issues/410#issuecomment-3418470901); walkdir [#213](https://github.com/BurntSushi/walkdir/issues/213#issuecomment-4773620195), [#217](https://github.com/BurntSushi/walkdir/pull/217#issuecomment-4910602234); aho-corasick [#158](https://github.com/BurntSushi/aho-corasick/issues/158#issuecomment-2833514872); ruff [#23708](https://github.com/astral-sh/ruff/pull/23708#discussion_r2884335583), [#26771](https://github.com/astral-sh/ruff/pull/26771#discussion_r3579340701).

**Blog:** [A datetime library for Rust (Jiff 1.0)](https://burntsushi.net/jiff/) (2026-11-15), [Using unwrap() in Rust is Okay](https://burntsushi.net/unwrap/) (2022-08-08, he links it in 2025 and 2026 replies, so it is current), [FOSS](https://burntsushi.net/foss/) (2020, read, not quoted).

**Policy docs:** [Jiff README: Dependencies and MSRV](https://github.com/BurntSushi/jiff#dependencies), [Jiff AI_POLICY.md](https://github.com/BurntSushi/jiff/blob/master/AI_POLICY.md) (same text in ripgrep, adapted from uv).

**HN** (`burntsushi`, Algolia API): [46061184](https://news.ycombinator.com/item?id=46061184), [46415060](https://news.ycombinator.com/item?id=46415060), [46420584](https://news.ycombinator.com/item?id=46420584), [43917054](https://news.ycombinator.com/item?id=43917054), [45269118](https://news.ycombinator.com/item?id=45269118).

**X** (`burntsushi5`, fxtwitter timeline): [2124640840161116575](https://x.com/burntsushi5/status/2124640840161116575), [2075189965739204814](https://x.com/burntsushi5/status/2075189965739204814), [2061873669761061141](https://x.com/burntsushi5/status/2061873669761061141).

**Reach (2026-11-26):** X @burntsushi5 10,986 followers, posts a few times a month. Bluesky @burntsushi.net 2,609 followers (same posts as X). GitHub 13,748 followers. HN karma 15,566. Blog: 2 posts in 2026.

---

## Failed sources

- **GitHub search API:** a secondary rate limit (HTTP 403) on the second call. I used the repository comment lists instead, which need no search.
- **astral-sh/ruff, ty, uv, rust-lang:** filled on 2026-11-26. All 239 threads with his comments in the last year were read. Older ruff threads (before 2025-11-26) beyond the first 60 PRs were not read.
- **HN after 2026-11-17:** the Algolia call returned a non-JSON reply. Not retried.
- **fxtwitter:** one false 404 on a cursor page. A retry worked. The timeline stops at 2024-03-28 (227 items, 168 his own).
- **Mastodon:** no `burntsushi` account on hachyderm.io, mastodon.social, or fosstodon.org.
- **regex CONTRIBUTING.md:** 404. ripgrep and Jiff CONTRIBUTING.md only point to the AI policy.
- **Talks:** no recent talk with a transcript found.
