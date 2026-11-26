# Ethan Niser (@ethanniser): code-review research

Research date: 2026-11-26 (second pass, same day: last-year refresh). Weighting: 2025 to Nov 2026 highest.
Main corpus: 741 of his own X posts (2024-10-21 to 2026-11-23, 43 timeline pages, retweets removed by `author.screen_name`; 238 are from the last year), the 8 posts of the NextFaster launch thread (2024-10-21), 13 blog posts on ethanniser.dev (2024-08 to 2026-11), 6 YouTube transcripts (auto-captions), the NextFaster repo (README, 100 of his commits, its source, and 9 commits and 4 PRs from 2025-12 to 2026-09), his `hydration-test` skill (2026-02), his Effect workshop code, 190 of his GitHub comments in 85 threads (found with `commenter:ethanniser`, filtered by `user.login`; 20 threads updated in the last year), and the 36 PRs from `reviewed-by:ethanniser` (3 updated in the last year).
Every quote is verbatim. I kept his typos ("reccomend", "seperately", "knits", "analtics"). A script checked each quote against the fetched text (2026-11-26, second pass: 122 quotes in this file and 2 in SKILL.md, 0 mismatches; 1 auto-caption quote matches with caption punctuation only). "Inference" marks my own reading. "(auto-caption)" marks a quote from YouTube auto-captions: the words are from the caption file, but the punctuation is the caption tool's.

**Important: his GitHub corpus has little web-performance review.** Most 2025 to 2026 comments are in `effect-atom`, `x402`, `x402-mcp`, `s2-sdk-typescript`, and his own `next-typesafe-url`. They are about API shape, Effect, and payments specs. His web-performance views come from NextFaster (thread, README, code, commits), his clock and sign-in-flash posts, and his X posts. No agent-written comments were found (one self-label: "agreed- my bad on the slop", [workflow-examples#4](https://github.com/vercel/workflow-examples/pull/4#discussion_r2478954264)).

---

## Current focus (what he works on now)

- **Left Vercel in June 2026.** "This week was my last week at Vercel" and "I helped build the fastest domains search in the world and finally shipped websocket support to Vercel functions" ([X, 2026-06-26](https://x.com/ethanniser/status/2070391889770254779)). His X bio is now "mainquesting, prev: @vercel".
- **Vercel Domains rebuild (Sep 2025).** "lightning fast searches", "e2e typesafety and error handling with Effect", and "and of course zero layout shift :)" ([X, 2025-09-25](https://x.com/ethanniser/status/1971286986905563200)).
- **WebSockets on Vercel (Jun 2026).** "Really proud to have been a major part of getting this shipped" ([X](https://x.com/ethanniser/status/2069113587017392429)).
- **Effect and AI agents (2026).** Video "Effect finally won" (2026-09-12): AI makes Effect's verbosity and learning cost matter less ([video](https://www.youtube.com/watch?v=fcNqEWr449E)). Effect v4 stream benchmarks ([X, 2026-02-18](https://x.com/ethanniser/status/2024215022239707210)).
- **effect-atom (formerly effect-rx), 2025.** He added SSR hydration, streaming hydration, refetch on window focus, and optimistic updates ([X, 2025-07-23](https://x.com/ethanniser/status/1947910291922292874), [X, 2025-07-31](https://x.com/ethanniser/status/1950720965979304284)).
- **Blog in late 2026** is mostly personal (SF, college, phones). The latest technical posts are from 2025.

---

## Last year (2025-11-26 to 2026-11-26): what is new

The last year has little new web-performance material. His public code reviews in that time are about payments specs, Effect APIs, and config formats. The new in-lane evidence:

- **He turned PPR back on after a teammate turned it off.** Rhys's commit "fix" (2025-12-06) set `ppr: false,` during a Next.js upgrade. Ethan's commit "Re-enable PPR" (2025-12-17) reverts it: "This reverts commit cbaceb5b7e90faa6be89e32af4e433b8a761bc0f." ([2cb3a61](https://github.com/ethanniser/NextFaster/commit/2cb3a61)). Inference: a static shell is worth more to him than a quick fix that makes pages dynamic.
- **Build on demand, not all pages at build time (2026-02).** In his open "cache components" PR, his commit "use placeholder pattern" ([89d943f](https://github.com/ethanniser/NextFaster/commit/89d943f), [NextFaster#103](https://github.com/ethanniser/NextFaster/pull/103)) replaces a database query in `generateStaticParams` with one dummy param, `collection: "__placeholder__",`, and the page returns `notFound()` for it: `if (collection === "__placeholder__") {`. Inference: same as checklist 10. Real pages render on first request and are then cached.
- **Hydration that wipes input became a committed rule.** The day after the post "if the input on http://chatgpt.com wipes my prompt on hydration one more time dude" and "how many people use that input and it has that problem...." ([X, 2026-02-02](https://x.com/ethanniser/status/2018437319947149368)), he committed a skill to [hydration-test](https://github.com/ethanniser/hydration-test/blob/main/skills/hydration-safe-inputs/SKILL.md) (commit "add skill", 2026-02-03). **Agent-written (inference from its template shape).** He committed it, so it states his rule: "If a user types into an input during this window, React's hydration will wipe their input because React initializes state to the default value (usually empty string)." It covers text inputs, checkboxes, selects, and textareas, and gives a test: "Add artificial hydration delay (slow network or blocking script)" and "Type into the input before hydration completes".
- **Jank is still his main complaint about products.** "the frontend is jank af. flickers, stale state, just does not feel very premium" (Devin, [X, 2026-09-02](https://x.com/ethanniser/status/2095254743669162444)). "just significantly less jank, much faster idk how else to explain" (Capy, [X, 2026-11-10](https://x.com/ethanniser/status/2120077844290400727)).
- **No changed mind found.** Nothing in the last year goes against a standard in this file.

**Older sources that now fill gaps** (not new, but not quoted before):

- **INP (input blocked by long work).** "if we just call a synchronous function it will completely block the main thread what we really want away is to kind of split that work into chunks" and "you would click and you'd expect something to happen but react was finishing a big synchronous render and so the click event wouldn't actually go through until a little bit later" (auto-caption, [The secret to why React feels so fast, 2024-11-02](https://www.youtube.com/watch?v=vtotu8p9DWw)).
- **Bounded concurrency.** "all functions that run multiple effects have arguments to allow for unbounded or bounded concurrency and handle spawning and joining fibers for you as well as automatically interrupting remaining fibers if one fails" (auto-caption, [What is Concurrency?, 2024-07-23](https://www.youtube.com/watch?v=ibxUIL_-LlA)).
- **Fonts (team code, weak).** The NextFaster root layout loads fonts with `import { GeistSans } from "geist/font/sans";` (a `next/font` package) and sets them as CSS variables ([layout.tsx](https://github.com/ethanniser/NextFaster/blob/main/src/app/layout.tsx)). No post by him on fonts.
- **Third-party scripts (team code, weak).** NextFaster renders `<Analytics scriptSrc="/insights/events.js" endpoint="/hfi/events" />` at the end of `<body>` ([layout.tsx](https://github.com/ethanniser/NextFaster/blob/main/src/app/layout.tsx)), and serves the vendor scripts from its own domain through rewrites. Ethan approved the PR with "thank you" ([NextFaster#29](https://github.com/ethanniser/NextFaster/pull/29#pullrequestreview-2381080740)) and merged it as "properly proxy analtics (#30) thank you @tobiaslins" ([03d9c0b](https://github.com/ethanniser/NextFaster/commit/03d9c0b)). Inference: the proxy may be for ad blockers, not speed. Do not quote him on third-party script timing.

---

## Core values

1. **The user sees the right thing on first paint, with no flash.** "Fast, static pages + no weird hydration flickers is ideal, but easy to get wrong in practice" ([X, 2025-08-17](https://x.com/ethanniser/status/1956983527569805407)). "I want my CDN cached TTFB and I need that perfect first paint with no flickers." ([A Clock That Doesn't Snap, 2025-08-17](https://ethanniser.dev/blog/a-clock-that-doesnt-snap/)). "problem: static page + dynamic state (url / time based) = a ugly flash on load" ([X, 2025-08-08](https://x.com/ethanniser/status/1953682315412222064)).
2. **Static first. Serve from the CDN, and do not block the page on request-time work.** "The thing is we really want to statically generate pages! Serving from a CDN is way faster and makes a really big difference for TTFB and FCP." ([Clock post](https://ethanniser.dev/blog/a-clock-that-doesnt-snap/)). "serving a static asset from a CDN is like you know 20 to 30 milliseconds at most um doing SSR where you're blocking on like a database request to check authentication is like two to 300 millconds" (auto-caption, [video, 2025-08-19](https://www.youtube.com/watch?v=wski7bnpW8Y)). "if you spend lots of time in request mode, then when the user like enters your URL, they're literally staring at nothing" (auto-caption, same video).
3. **Static shell, dynamic parts streamed in (PPR).** "The site heavily uses Partial Prerendering, where the static 'shell' of a dynamic page is prerendered at build time and served immediately on request, with the dynamic parts streamed in." ([NextFaster thread](https://x.com/ethanniser/status/1848442722388218284)). README: "Partial Prerendering is used to precompute the shells of pages" and "Dynamic data (such as cart information) is then streamed in" ([NextFaster README](https://github.com/ethanniser/NextFaster)).
4. **Fetch on the server, not after hydration.** "The original has a flash of the 'default' content, and waits to fetch the data from the client" and "Ours has no flash, starts the fetch on the server and streams it to the client as soon as its ready" ([NextFaster thread](https://x.com/ethanniser/status/1848442726359892364)).
5. **No loading spinners where a shell or cache can show real content.** "Our site also avoids loading spinners entirely- something the original actually has quite a lot of" ([NextFaster thread](https://x.com/ethanniser/status/1848442722388218284)). On Obsidian: "Why can’t it just show what it has locally and update any updates in place idk" ([X, 2025-04-08](https://x.com/ethanniser/status/1909500716886245727)).
6. **Prefetch what the next page needs, including images.** "Images are everything for sites like this. We spent a ton of time on image optimization—mostly around loading strategies." and "we don't just prefetch HTML content, but we also prefetch the images of pages." ([NextFaster thread](https://x.com/ethanniser/status/1848442728931344494)). "we made things feel even faster by triggering links `onMouseDown`, as opposed to the default: `onMouseUp`." ([NextFaster thread](https://x.com/ethanniser/status/1848442731653116322)).
7. **Zero layout shift.** "I live for zero layout shift" ([X, 2025-09-25](https://x.com/ethanniser/status/1971016608295579960)).
8. **JS shipped to the client costs load time.** "We can only ship so much JavaScript or we can ship more and things kind of take longer to load." (auto-caption, [video, 2025-08-04](https://www.youtube.com/watch?v=NGBijq6cdfc)). On the server: "bundle size doesn't matter, right? Because you're still on the server." (auto-caption, [video](https://www.youtube.com/watch?v=wski7bnpW8Y)).
9. **Run independent work concurrently, and bound it.** Effect workshop: `Effect.all` with no option is named "runsSequentially", and `{ concurrency: "unbounded" }` runs the same effects concurrently. "Q: Unbounded concurrency is too much?" and "Just set a number limit!" ([effect-workshop snippet](https://github.com/ethanniser/effect-workshop/blob/main/src/part4-whatsnext/snippets/1-concurrency-and-fibers.ts)). Blog: "Concurrency limits are easy to set, concurrent task lifetimes are managed, and interruption propagation and resource management happen automatically." ([The difficulty of complexity, 2025-08-29](https://ethanniser.dev/blog/the-difficulty-of-complexity/)).

---

## Review checklist (what he checks or pushes back on)

1. **Does a static or prerendered page flash on load?** He names two causes: a statically or partially prerendered page, and "A UI component that depends on “request-time” information" ([Clock post](https://ethanniser.dev/blog/a-clock-that-doesnt-snap/)). His fix: an inline script that sets the DOM before paint. "The script tag runs before first paint, so the user never sees the broken initial state from the prerendered page." (same post). He limits it: "this is definitely not the kind of code you want to be writing all over your app" (auto-caption, [video](https://www.youtube.com/watch?v=wski7bnpW8Y)).
2. **Does hydration wipe user input?** "if the input on https://t.co/2vuiC9CUyk wipes my prompt on hydration one more time dude" ([X, 2026-02-02](https://x.com/ethanniser/status/2018437319947149368)). Fix from the post: "initializing the state with the value from the DOM." ([Clock post](https://ethanniser.dev/blog/a-clock-that-doesnt-snap/)).
3. **Does SSR block first paint on auth or a database read?** See core value 2. For the signed-in avatar he keeps the page static and reads a public metadata cookie before paint: "I made the second metadata cookie uh which is not encrypted and not HTTP only" and "you would only ever put like public information in this this cookie" (auto-caption, [video](https://www.youtube.com/watch?v=wski7bnpW8Y)).
4. **Is a client fetch doing what the server could do?** See core value 4. Inference: a `useEffect` fetch for first-screen data is a waterfall finding.
5. **Is the cache window right for the data?** NextFaster commit "change cache from 10 mins to 2 hours;" ([b27ebdf](https://github.com/ethanniser/NextFaster/commit/b27ebdf)), and `revalidate: 60 * 60 * 2, // two hours,` on each catalog query ([queries.ts](https://github.com/ethanniser/NextFaster/blob/main/src/lib/queries.ts)). Commit "move search to queries and cache it" ([eeca27f](https://github.com/ethanniser/NextFaster/commit/eeca27f)).
6. **Does the same image URL hit the cache?** Commit "used pdp image in cart as it should be cached" ([7e47c3e](https://github.com/ethanniser/NextFaster/commit/7e47c3e)). README: "images are unique by url (and caching) although not unique in their content" ([README](https://github.com/ethanniser/NextFaster)).
7. **Are above-the-fold images eager, and the rest lazy?** NextFaster product page: the main image has `loading="eager"` and `decoding="sync"`; related products get `loading="lazy"` ([product page.tsx](https://github.com/ethanniser/NextFaster/blob/main/src/app/(category-sidebar)/products/%5Bcategory%5D/%5Bsubcategory%5D/%5Bproduct%5D/page.tsx)). Prefetched images use `img.fetchPriority = "low";` and skip lazy ones: `if (image.loading === "lazy" || seen.has(image.srcset)) {` ([link.tsx](https://github.com/ethanniser/NextFaster/blob/main/src/components/ui/link.tsx)).
8. **Is prefetch bounded and cheap?** His `Link` prefetches only after a link is visible for 300 ms, and unobserves it after: `observer.unobserve(entry.target);` with `}, 300);` ([link.tsx](https://github.com/ethanniser/NextFaster/blob/main/src/components/ui/link.tsx)). The image-list fetch uses `priority: "low",` and the route is cached with `"Cache-Control": "public, max-age=3600",` ([prefetch-images route](https://github.com/ethanniser/NextFaster/blob/main/src/app/api/prefetch-images/%5B...rest%5D/route.ts)).
9. **Is each dynamic hole in its own Suspense boundary?** NextFaster `order/page.tsx` wraps `<CartItems />`, `<TotalCost />`, and `<PlaceOrderAuth />` each in its own `<Suspense>` ([order page](https://github.com/ethanniser/NextFaster/blob/main/src/app/order/page.tsx)). "react suspense is literally magic and the best thing ever" and "dealing with the `isLoading` and `isError` states is a pain in the ass you dont want to think about in the component where you just want to freaking use the data" ([X, 2025-07-23](https://x.com/ethanniser/status/1948163773090668621)).
10. **Is the number of prerendered pages right?** Commits "static params" then "less static routes" ([3d4ee24](https://github.com/ethanniser/NextFaster/commit/3d4ee24)). The product page keeps `generateStaticParams` commented out and builds on demand ([product page.tsx](https://github.com/ethanniser/NextFaster/blob/main/src/app/(category-sidebar)/products/%5Bcategory%5D/%5Bsubcategory%5D/%5Bproduct%5D/page.tsx)). Inference: with 1 million products, ISR on first visit beats a build that prerenders all of them.
11. **What is dehydrated to the client?** In effect-atom: "I updated this part to be inline with what react query does by default (only dehydrate queries in the success state)" ([effect-atom#241](https://github.com/tim-smart/effect-atom/pull/241#discussion_r2229870125)).
12. **Does client state work fight rendering?** "TIL effect-rx uses the react scheduler as to not take priority over rendering" ([X, 2025-08-01](https://x.com/ethanniser/status/1951412226843353135)). In the video: "able to schedule effect tasks as low priority um so that they don't block rendering" (auto-caption, [video](https://www.youtube.com/watch?v=NGBijq6cdfc)).
13. **Can repeated requests share one call?** "effect request resolvers are magic" and "just make the request where you need it and automatically get caching + batching through a data loader" ([X, 2025-07-31](https://x.com/ethanniser/status/1950733349791650221)).
14. **Does a dynamic import pay for itself?** On an SDK PR: "why all of these dynamic imports? you can import them at the top of the file with `import type {} `" ([s2-sdk#41](https://github.com/s2-streamstore/s2-sdk-typescript/pull/41#discussion_r2525641615)) and "if there is a cyclic import (I think there is) then we should fix that seperately..." ([s2-sdk#41](https://github.com/s2-streamstore/s2-sdk-typescript/pull/41#discussion_r2525647080)).
15. **Is the speed proven with real-user data?** NextFaster README links a "PageSpeed Report" and lists "Function Invocations", "ISR Writes", and "Image Optimization" costs ([README](https://github.com/ethanniser/NextFaster)). The repo proxies Vercel Speed Insights: `source: "/insights/vitals.js",` ([next.config.mjs](https://github.com/ethanniser/NextFaster/blob/main/next.config.mjs)).

---

## What he praises

- **Instant navigation with no spinner.** "(video is not sped up)" ([NextFaster thread](https://x.com/ethanniser/status/1848442717925171658)). "man imagine if some super cracked developer wrote the frontend for both of these and they were super fast and felt great to use" (about grep.app and vercel.domains, [X, 2025-09-26](https://x.com/ethanniser/status/1971456090450821402)).
- **Strong framework defaults over hand-written tricks.** "where the McMaster devs hand wrote these with jquery, Next.js automates a lot of this for you with strong defaults." ([NextFaster thread](https://x.com/ethanniser/status/1848442722388218284)).
- **Fast streaming and SSR primitives in React.** "holy shit TIL react can serialize async iterables just like it can promises" ([X, 2025-07-17](https://x.com/ethanniser/status/1945754408123585018)).
- **Fast, simple tools.** "capy web app is def better than devin web app" and "just significantly less jank, much faster idk how else to explain" ([X, 2026-11-10](https://x.com/ethanniser/status/2120077844290400727)).
- **Measured performance.** "did some benchmarking - and found effect v4 streams to be mostly on par with node streams, and in some cases faster depending on the workload" ([X, 2026-02-18](https://x.com/ethanniser/status/2024215022239707210)).

---

## Tone and phrasing

**Shape (inference from the corpus):**
- Short, lower case, and direct. Code-review comments are one line, often a question: "why change these specificers?" ([x402-mcp#2](https://github.com/ethanniser/x402-mcp/pull/2#discussion_r2417601981)), "why not construct this after this block instead of reassigning it?" ([x402-mcp#2](https://github.com/ethanniser/x402-mcp/pull/2#discussion_r2417627644)).
- He asks for proof: "could you please provide links to prove that these are the true addresses of usdc on each of these networks?" ([x402-mcp#2](https://github.com/ethanniser/x402-mcp/pull/2#discussion_r2417604157)).
- He names risk plainly: "same stuff here these casts scare me" ([x402-mcp#2](https://github.com/ethanniser/x402-mcp/pull/2#discussion_r2417642681)), "seems very easy to shoot yourself in the foot with this" ([effect-atom#289](https://github.com/tim-smart/effect-atom/issues/289#issuecomment-3163009983)).
- He gives a fair summary: "a couple knits and some changes requested around how the session types are done but this looks good" ([s2-sdk#41](https://github.com/s2-streamstore/s2-sdk-typescript/pull/41#pullrequestreview-3462615800)).
- He swears on X. **Do not copy the swearing. Copy the short question and the proof request.**

---

## Hard "no"s / pet peeves

- **A flash of default or stale content on load.** See core value 1 and checklist 1.
- **Hydration that wipes input.** See checklist 2.
- **Slow first load for data that is already local.** "7.5 seconds?! To show some text that’s already stored locally on my device?" ([X, 2025-04-08](https://x.com/ethanniser/status/1909500716886245727)).
- **Janky, flickering frontends.** "the frontend is jank af. flickers, stale state, just does not feel very premium" ([X, 2026-09-02](https://x.com/ethanniser/status/2095254743669162444)). "the worlds slowest, jankiest web app imaginable for a dead simple product" ([X, 2026-01-09](https://x.com/ethanniser/status/2009652112784056443)).
- **A big blocking loading page.** "you could get around it by having this like huge blocking loading page like Twitter or Instagram does, but obviously that's not great." (auto-caption, [video](https://www.youtube.com/watch?v=wski7bnpW8Y)).

---

## Heuristics that generalize (incl. TypeScript web apps)

Each item names its source. The translation to review checks is my inference.

1. **Static shell first.** A page that can be static, ISR, or a PPR shell must not become fully dynamic because one small part reads cookies or headers. Move that part into a Suspense hole. (NextFaster thread; README; Clock post)
2. **No request-time block before paint.** An auth check or database read in a layout or page that blocks the whole HTML is a finding. Stream it, or read a public cookie before paint. (sign-in flash video)
3. **No client waterfall for first-screen data.** Data that the first screen needs is fetched on the server and streamed. A `useEffect` fetch for it is a finding. (NextFaster thread)
4. **One Suspense boundary per independent dynamic part.** (order page)
5. **Every cached read has a stated window.** A `revalidate`, `cacheLife`, or `Cache-Control` value with a reason. The window fits how often the data changes. (commit b27ebdf; queries.ts)
6. **Prefetch the next page, bounded.** Prefetch on visible plus delay, or on hover. Prefetch images at low priority. Skip lazy images. Navigate on `mousedown` for primary clicks only. (link.tsx; thread)
7. **The LCP image is eager. The rest are lazy and sized.** (product page.tsx)
8. **Reuse one image URL so the cache hits.** (commit 7e47c3e)
9. **No layout shift.** Reserve space for each streamed or late part. (X, zero layout shift)
10. **Hydration-safe state.** First client state matches the server HTML. A value that the server cannot know is set before paint or read from the DOM. (Clock post)
11. **Dehydrate only success data.** (effect-atom#241)
12. **Client JS has a cost per route.** A big library in a client component needs a reason. (react-query video)
13. **Independent Effects on a request path run concurrently, with a limit.** `Effect.all` with `{ concurrency: n }` or `"unbounded"` for a small fixed set. Unbounded on user-sized input is a finding. (effect-workshop)
14. **Batch and cache repeated lookups.** Use a request resolver or a data loader. (X, request resolvers)

---

## Lane fit (for the seat)

- **Proposed lane:** what the user waits for in the browser: rendering strategy (static, ISR, streaming, PPR, RSC), caching and revalidation, prefetch, client and server waterfalls, images and fonts, JS per route, Core Web Vitals, and concurrency of independent work on request paths in Effect code.
- **Yagiz overlap:** Yagiz owns per-call CPU and memory cost on hot paths (allocations, parses, the event loop, N+1 queries) and the proof standard for a speed claim. The Yagiz seat (checked 2026-11-26) sends page load to this seat: "Page load (rendering mode, caching, prefetch, client-server waterfalls, images, fonts, Core Web Vitals) goes to Ethan." Ethan's Effect v4 stream benchmark is a Yagiz-style claim and is not a seat standard.
- **poteto overlap:** hydration fixes touch the Rules of React. The hydration-test issue asks whether a `useState` initializer that reads the DOM follows them. His answer: "I am pretty sure the use of the initializer function as I show does follow the rules of react but it is a good point to consider" ([hydration-test#1](https://github.com/ethanniser/hydration-test/issues/1#issuecomment-3263954551)). Give React correctness to poteto.
- **Daniel overlap:** the public metadata cookie. Its content and safety go to Daniel.
- **Handoffs:** Effect services and Layers to Michael (`review-arnaldi`), errors and Schema to Kit (`review-kit`), app boundaries to Rhys (`review-rhys`), visual polish to Evil Rabbit.

---

## Not adopted

- **Effect error and Schema advice** ("I would reccomend basically all of your error types should have a cause: unknown field for this reason.", [Effect Best Practices](https://ethanniser.dev/blog/effect-best-practices/)). Correct, but it belongs to the Kit seat.
- **`ManagedRuntime` and Layer sharing** (same post). Belongs to the Michael seat.
- **Effect adoption arguments** ("Effect is a language.", [The truth about Effect](https://ethanniser.dev/blog/the-truth-about-effect/); "Effect finally won" video). Advocacy, not a review check.
- **"JavaScript does not need threads"** ([X, 2025-03-12](https://x.com/ethanniser/status/1899820617228021769)). A language opinion, not a check.
- **API-shape comments** in x402, x402-mcp, s2-sdk ("reassigning arguments seems bad", "these casts scare me"). Out of lane. They go to Dax, poteto, or Armin.
- **Cost of hosting.** "It is likely possible to optimize these costs further if that is your goal, however that wasn't a priority for this project." ([README](https://github.com/ethanniser/NextFaster)). Cost is not this seat's lane.
- **`typescript: { ignoreBuildErrors: true }`** in NextFaster's `next.config.mjs`. A demo shortcut. Not adopted.
- **Jokes and shitposts** ("JavaScript is too slow so I rewrote React in C++"), personal posts, AI-stock and college posts. Not included.

---

## Sources

**X posts** (`api.fxtwitter.com/2/profile/ethanniser/statuses`, 43 pages; thread posts with `/2/status/<id>`): [1848442717925171658](https://x.com/ethanniser/status/1848442717925171658), [1848442722388218284](https://x.com/ethanniser/status/1848442722388218284), [1848442726359892364](https://x.com/ethanniser/status/1848442726359892364), [1848442728931344494](https://x.com/ethanniser/status/1848442728931344494), [1848442731653116322](https://x.com/ethanniser/status/1848442731653116322), [2070391889770254779](https://x.com/ethanniser/status/2070391889770254779), [1971286986905563200](https://x.com/ethanniser/status/1971286986905563200), [2069113587017392429](https://x.com/ethanniser/status/2069113587017392429), [2024215022239707210](https://x.com/ethanniser/status/2024215022239707210), [1947910291922292874](https://x.com/ethanniser/status/1947910291922292874), [1950720965979304284](https://x.com/ethanniser/status/1950720965979304284), [1956983527569805407](https://x.com/ethanniser/status/1956983527569805407), [1953682315412222064](https://x.com/ethanniser/status/1953682315412222064), [1909500716886245727](https://x.com/ethanniser/status/1909500716886245727), [1971016608295579960](https://x.com/ethanniser/status/1971016608295579960), [2018437319947149368](https://x.com/ethanniser/status/2018437319947149368), [1948163773090668621](https://x.com/ethanniser/status/1948163773090668621), [1951412226843353135](https://x.com/ethanniser/status/1951412226843353135), [1950733349791650221](https://x.com/ethanniser/status/1950733349791650221), [1971456090450821402](https://x.com/ethanniser/status/1971456090450821402), [1945754408123585018](https://x.com/ethanniser/status/1945754408123585018), [2120077844290400727](https://x.com/ethanniser/status/2120077844290400727), [2095254743669162444](https://x.com/ethanniser/status/2095254743669162444), [2009652112784056443](https://x.com/ethanniser/status/2009652112784056443), [1899820617228021769](https://x.com/ethanniser/status/1899820617228021769).

**Blog posts:** [A Clock That Doesn't Snap](https://ethanniser.dev/blog/a-clock-that-doesnt-snap/) (2025-08-17), [The difficulty of complexity](https://ethanniser.dev/blog/the-difficulty-of-complexity/) (2025-08-29), [Effect Best Practices](https://ethanniser.dev/blog/effect-best-practices/) (2024-08, living document), [The truth about Effect](https://ethanniser.dev/blog/the-truth-about-effect/) (2025-02-17). Read but not quoted: Profiling Node.js Applications, Error Categories in Effect, Not Holding Back the Ocean, End Things on Time, and 9 personal posts.

**Videos** (YouTube auto-captions, through the innertube player API): [Every website has this problem](https://www.youtube.com/watch?v=wski7bnpW8Y) (2025-08-19), [Why I stopped using react query](https://www.youtube.com/watch?v=NGBijq6cdfc) (2025-08-04), [Effect finally won](https://www.youtube.com/watch?v=fcNqEWr449E) (2026-09-12). Read but not quoted: [The secret to why React feels so fast](https://www.youtube.com/watch?v=vtotu8p9DWw) (2024-11-02, fibers and concurrent rendering).

**NextFaster** (`gh api`): [README](https://github.com/ethanniser/NextFaster), [link.tsx](https://github.com/ethanniser/NextFaster/blob/main/src/components/ui/link.tsx), [prefetch-images route](https://github.com/ethanniser/NextFaster/blob/main/src/app/api/prefetch-images/%5B...rest%5D/route.ts), [queries.ts](https://github.com/ethanniser/NextFaster/blob/main/src/lib/queries.ts), [product page](https://github.com/ethanniser/NextFaster/blob/main/src/app/(category-sidebar)/products/%5Bcategory%5D/%5Bsubcategory%5D/%5Bproduct%5D/page.tsx), [order page](https://github.com/ethanniser/NextFaster/blob/main/src/app/order/page.tsx), [next.config.mjs](https://github.com/ethanniser/NextFaster/blob/main/next.config.mjs), commits [b27ebdf](https://github.com/ethanniser/NextFaster/commit/b27ebdf), [eeca27f](https://github.com/ethanniser/NextFaster/commit/eeca27f), [7e47c3e](https://github.com/ethanniser/NextFaster/commit/7e47c3e), [3d4ee24](https://github.com/ethanniser/NextFaster/commit/3d4ee24). The source is the work of three people (Ethan, Rhys Sullivan, Arman). Inference: the code shows the team's choices, and the thread shows that Ethan stands behind them.

**Last-year refresh (2026-11-26):** NextFaster commits [2cb3a61](https://github.com/ethanniser/NextFaster/commit/2cb3a61) (2025-12-17), [89d943f](https://github.com/ethanniser/NextFaster/commit/89d943f) (2026-02-13), PR [#103](https://github.com/ethanniser/NextFaster/pull/103) (open), [layout.tsx](https://github.com/ethanniser/NextFaster/blob/main/src/app/layout.tsx), [03d9c0b](https://github.com/ethanniser/NextFaster/commit/03d9c0b), [#29 review](https://github.com/ethanniser/NextFaster/pull/29#pullrequestreview-2381080740); [hydration-safe-inputs skill](https://github.com/ethanniser/hydration-test/blob/main/skills/hydration-safe-inputs/SKILL.md) (2026-02-03); videos [vtotu8p9DWw](https://www.youtube.com/watch?v=vtotu8p9DWw) and [ibxUIL_-LlA](https://www.youtube.com/watch?v=ibxUIL_-LlA) (captions through the Android innertube client). Read but not used: [vercel/vercel#14679](https://github.com/vercel/vercel/pull/14679) (config format, out of lane), [x402#446](https://github.com/x402-foundation/x402/pull/446) review (payments spec), [effect-distributed-lock](https://github.com/ethanniser/effect-distributed-lock) issues, [dreamscroll](https://github.com/ethanniser/dreamscroll) commits (a browser extension, no page-load rules).

**Effect workshop:** [1-concurrency-and-fibers.ts](https://github.com/ethanniser/effect-workshop/blob/main/src/part4-whatsnext/snippets/1-concurrency-and-fibers.ts) (from his Effect Days 2024 workshop).

**GitHub comments:** [effect-atom#241](https://github.com/tim-smart/effect-atom/pull/241#discussion_r2229870125), [effect-atom#289](https://github.com/tim-smart/effect-atom/issues/289#issuecomment-3163009983), [s2-sdk#41 a](https://github.com/s2-streamstore/s2-sdk-typescript/pull/41#discussion_r2525641615), [s2-sdk#41 b](https://github.com/s2-streamstore/s2-sdk-typescript/pull/41#discussion_r2525647080), [s2-sdk#41 review](https://github.com/s2-streamstore/s2-sdk-typescript/pull/41#pullrequestreview-3462615800), [x402-mcp#2 a](https://github.com/ethanniser/x402-mcp/pull/2#discussion_r2417601981), [x402-mcp#2 b](https://github.com/ethanniser/x402-mcp/pull/2#discussion_r2417627644), [x402-mcp#2 c](https://github.com/ethanniser/x402-mcp/pull/2#discussion_r2417604157), [x402-mcp#2 d](https://github.com/ethanniser/x402-mcp/pull/2#discussion_r2417642681), [hydration-test#1](https://github.com/ethanniser/hydration-test/issues/1#issuecomment-3263954551), [workflow-examples#4](https://github.com/vercel/workflow-examples/pull/4#discussion_r2478954264).

**Reach (2026-11-26):** X @ethanniser 8,984 followers. GitHub 1,147 followers, 109 public repos; NextFaster 4,878 stars. Bluesky @ethanniser.dev 296 followers, 3 posts (inactive). HN: 2 comments (2025-07), out of lane.

---

## Failed sources

- **GitHub `reviewed-by:ethanniser` search:** worked on the second pass (36 PRs). Only 3 are from the last year (`vercel/sqs-consumer#3`, a dismissed empty review; a typo fix; the x402 v2 spec). His NextFaster reviews (#29, #38, #40, #41, 2024-10) are approvals with no text or "thank you". **Result: no public code review by him on web performance, in any year.** PR reviews on private Vercel repos (Domains, WebSockets) are not public.
- **Replay of real reviews (2026-11-26): skipped.** It needs at least 3 cases where he reviewed a change with 2 or more substantive comments. In the last year there are 0 web-performance code reviews, and 0 public critiques of one page or one diff with 2 or more points and code that a seat can read (the Devin post names "flickers, stale state" but the app is behind a sign-in; the chatgpt.com post names one point). Older critiques (NextFaster thread, Clock post, sign-in flash video) are the sources of SKILL.md, so a replay on them is circular.
- **X replies:** the fxtwitter timeline has no replies, `with_replies` gives 404, and fxtwitter search gives 503. His replies on X are not in this corpus.
- **Vercel Domains engineering post:** a web search found the changelog, but no post by him about how the search is fast. Not used.
- **Talks:** no conference talk with a transcript found (web search, 2026-11-26). His YouTube channel has no new upload after "Effect finally won" (2026-09-12). His Effect Days 2025 talk (title on the [speaker page](https://effect.website/events/effect-days/speakers/ethan-niser): Rebuilding Redis for great Effect) has no recording found.
- **YouTube "What is Concurrency?" (ibxUIL_-LlA):** fixed on the second pass (Android innertube client).
- **HN:** the Algolia API gave a non-JSON reply on the second pass. The first pass found 2 comments (2025-07), out of lane.
- **fxtwitter:** false 404 on some timeline pages; a retry worked each time. The timeline stopped at 2024-10-21 (page 43).
- **Bluesky:** 3 posts (latest 2024-11-18), none in lane.
