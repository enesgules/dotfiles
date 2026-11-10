---
name: optimise-api-calls
description: Find and remove the waste in the calls a request, job or page makes to external and internal APIs (third-party HTTP APIs and SDKs, your own services, databases, caches, queues, auth providers) and prove the speed-up with numbers. Typical waste is a waterfall of independent awaits, serial pagination, an await inside a loop, the same lookup made twice, a client built per request, work the response does not need, and many small calls one batch call could replace. Use this whenever the user asks why a page, route, endpoint or job is slow or "takes this long", wants to parallelize calls, cut latency or p95, audit external or internal API calls, reduce rate-limit or quota use, or speed up a list or dashboard that loads from other services. Use it even if they point at one slow function.
---

# Optimise API calls

A request is as slow as its longest chain of calls that wait for each other: the critical path. Fast code with 8 calls in a row is slower than slow code with 2 rounds of calls. So the work is to find the _waterfall_ (awaits that wait on each other without a data reason), make it shorter, and prove the change with numbers taken before and after.

Measure first. Many slow routes are one slow call that no code change can fix, and a guess goes to the wrong place.

## 1. Measure the route

Get real numbers before you read code:

- **Production**: p50, p95 and request count per route from the platform logs (Vercel, Datadog, CloudWatch, the team's log store). The request count tells you whether a fix matters. A 5 s route that runs 10 times a month is a lower priority than a 500 ms route that runs 40,000 times a week.
- **One request**: time each outbound call. Wrap the calls in `performance.now()` spans, or read the trace if the app has one. The result is a timeline: which calls run, how long each takes, and which ones wait for which.

The timeline puts each call in one of three groups: **on the critical path**, **parallel but slow** (a fix gives nothing until the call gets faster), or **not needed for the response**. The remaining steps act on the first and third groups.

## 2. Map what each call needs

For each call on the critical path, write down the input it needs. A call can start as soon as its input exists, and not before. Draw that as a dependency graph. The depth of the graph is the shortest critical path you can get, and the current code is usually deeper.

Before you move a call, check these points. They are the reasons a serial order can be correct:

- **Writes and side effects in order.** Money paths (charge, then record), writes another call reads back (create, then attach), and anything one step gates on the result of an earlier one. Keep them serial, and say why in the report.
- **Rate limits.** Many APIs cap concurrent requests or bursts per key or token, and your own services have their own capacity. Running in parallel is safe when something bounds the concurrency: a throttle in the SDK, a `p-limit`, or a pool. Set the bound from the real limit: the provider's documented number, or the lower limit that the client, a fake or an earlier incident shows, minus headroom for other callers on the same token. A bound far under the real limit gives back the speed-up for no safety gain.
- **Connection pools.** Ten parallel queries on a database pool of size 1 still run in series, and they can starve other requests. Check the pool size. Clients that send each call as its own HTTP request have no such pool, but the server behind them still has a capacity.
- **Consistency.** Two parallel reads can see different states of the data. This matters only when the code compares or combines them in a way that a race would break.
- **Error behaviour.** `Promise.all` rejects on the first failure, but the other calls keep running. Use `Promise.allSettled` where a partial result is fine, and pass an `AbortSignal` where the other calls must stop.

## 3. Find the waste

Rank the patterns below by the time they hold on the critical path. Each one says how to spot it and how to fix it.

**Independent awaits in series.** `const a = await x(); const b = await y();` where `y` does not use `a`. Start both and await them together: `const [a, b] = await Promise.all([x(), y()])`. When the graph has two levels (calls that need only the request, then calls that need one of their results), use one `Promise.all` per level. Some calls need only one early result. Chain them on that promise (`const project = getProject(); const plan = project.then(getPlan)`), so they do not wait for the whole first level.

**An await inside a loop.** `for (const x of items) await fetch(x)` is a waterfall of length `items.length`. Map to promises and await them all. If the list is long or the API has limits, bound the concurrency with the throttle you found in step 2.

**Serial pagination.** `paginate()` helpers and `while (next)` loops read one page at a time. If the first page tells you the total (`total_count`, a `Link: rel="last"` header, a count field), read page 1, then read all the other pages at the same time. A cursor-only API cannot do this. For those, raise the page size to the maximum the API allows and request only the fields you use. Also ask whether you need every page at all: a view that shows 20 rows does not need 3,000.

**Calls the result does not need.** Look for a list fetched and then filtered down to nothing, or a lookup whose result is a subset of another call's result. For example, when one call returns every item and a second returns the user's subset, a request that shows all items does not need the second call. Skip the call for the branches that do not use it.

**The same lookup twice.** The auth user, the team or the plan is often read by middleware, by the layout and again by the route. Within one server render, wrap the reader in React `cache()`. Across requests, cache the result in Redis or the framework's cache with a short TTL. Before you add a cache across requests, decide how stale a value can be, because a cached list hides a new item until the TTL ends. Write that trade-off down.

**Work the response does not wait for.** Logging, analytics, emails, cache warming and webhook fan-out. Move them after the response: `after()` in Next.js, `waitUntil` on edge runtimes, or a queue (QStash, SQS) when the work must survive a crash or retry.

**Many small calls.** One call per item where the API has a batch form: a batch or bulk endpoint, an `expand` or `include` parameter in place of a follow-up retrieve, a GraphQL query for many records, Redis `MGET` or a pipeline, and a SQL `IN (...)` or one join. Internal services often show this as an N+1 over HTTP: one request per user or order to a neighbour service. Add a batch endpoint to that service, or read the data from where it already lives.

**A client built per request.** `new Client()` inside the handler opens a new connection (DNS, TCP, TLS) each time, which often adds 50 to 200 ms. Create clients once at module scope so the connection is reused. Do not keep per-user state in that module scope.

**Calls that start late.** A fetch whose input exists at the top of the handler but that starts after unrelated awaits. Start the promise early and await it where you use it. On the client, start the request on route entry or hover, not after a waterfall of mounts. Deduplicate the request with the data library (React Query, SWR).

**Calls with no timeout.** One hung upstream holds the function until the platform kills it. Pass `AbortSignal.timeout(ms)` set a little above the call's normal p99, and handle the abort.

**Distance.** A function in `iad1` that calls a database in `eu-central-1` pays about 90 ms for each round trip. Five serial calls cost 450 ms before any work happens. Compare the function region with the database region, especially on routes that make many serial calls.

**Conditional requests.** APIs that send `ETag` or `Last-Modified` answer `304 Not Modified` to a repeat request with `If-None-Match`. Some providers do not count a 304 against the rate limit (check the docs). This helps polling and rate limits more than latency.

The remaining time is often one slow upstream call, such as a 4 s third-party endpoint or a 900 ms query in your own service. A code change cannot make that call faster. Report it, and name the options: a cache, a different endpoint, or a question to the provider.

## 4. Prove the speed-up

Time the old and new code against the real services, with the same input:

```js
import { compare } from "<skill-dir>/scripts/compare.mjs";
await compare({ before: () => oldList(userId), after: () => newList(userId), runs: 10 });
```

`<skill-dir>` is the folder that holds this SKILL.md. `compare` runs one warm-up of each (the first call pays for DNS, TLS and cold caches), then alternates before and after so network drift hits both sides equally. It prints p50, p90 and the speed-up, and it fails if the two sides return different results. Keep a copy of the old function next to the new one for this run. Start with 5 runs, and add more only when p50 and p90 differ by more than about 10%.

TypeScript projects run the script with `npx tsx`. Two common problems:

- In a package without `"type": "module"`, `tsx` runs a `.ts` file as CommonJS, so top-level `await` fails. Name the file `.mts`.
- Modules that import `server-only`, or packages with `exports` conditions, fail outside the framework. Add `--conditions=react-server`, or `--conditions=import`.

Load the same environment the route uses. Get permission before you read production data or call production services with real user tokens, and say which account you used.

After the deploy, compare the production p50 and p95 with the numbers from step 1.

## 5. Change the code safely

- Keep the response the same, and make the before and after comparison in step 4 show that. Run the existing tests.
- Keep the product behaviour the same: poll intervals, page sizes, what a list shows, how fresh the data is, and retry policy. These are product decisions, so the change stays inside how the calls are made. When a product change would help, put it under "What is left" as an option with its cost.
- Add a test only for the behaviour that the change creates. Examples: the calls run at the same time (count the maximum number of calls in flight with fakes), a skipped call is not made for a given branch, or the dedupe keeps one copy. Do not add tests that only repeat the new `Promise.all`.
- Add a one-line comment where the order is now deliberate, in both directions. Write "these run together; the throttle bounds concurrency" or "serial on purpose: the attach call reads the record that create writes". The next reader then does not undo it.
- If the code was serial for a documented reason (an old PR or a comment), say in the PR why that reason no longer holds.

## Report

Start with the numbers.

```markdown
## Result
| Route or call | Before p50 / p90 | After p50 / p90 | Runs |
Results equal: yes (N items). Production before: p50, p95, requests per week.

## What changed
One bullet per pattern fixed, with the critical-path depth before and after (for example "7–9 serial calls → 2 rounds").

## What is left
The slow calls a code change cannot fix, with their time and the options.

## Checked and skipped
Each route or call you looked at and left, with the reason: ordered writes, low traffic, needs a cache design, already parallel.
```
