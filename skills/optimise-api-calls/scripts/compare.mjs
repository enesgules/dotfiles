// Time two versions of the same async call against real services and check they agree.
// Usage: await compare({ before: () => oldFn(x), after: () => newFn(x), runs: 10 })
import { isDeepStrictEqual } from "node:util";

const percentile = (values, p) => {
  const sorted = [...values].sort((a, b) => a - b);
  return sorted[Math.min(sorted.length - 1, Math.floor((p / 100) * sorted.length))];
};

async function time(fn) {
  const start = performance.now();
  const result = await fn();
  return { ms: performance.now() - start, result };
}

export async function compare({ before, after, runs = 10, same = isDeepStrictEqual }) {
  // Warm-up: the first call pays for DNS, TLS and cold caches.
  const [warmBefore, warmAfter] = [await time(before), await time(after)];
  if (!same(warmBefore.result, warmAfter.result)) {
    throw new Error("before and after returned different results");
  }

  const ms = { before: [], after: [] };
  for (let i = 0; i < runs; i++) {
    // Alternate the order so network drift hits both sides equally.
    const order = i % 2 ? ["after", "before"] : ["before", "after"];
    for (const side of order) ms[side].push((await time(side === "before" ? before : after)).ms);
  }

  const row = (side) => ({
    p50: Math.round(percentile(ms[side], 50)),
    p90: Math.round(percentile(ms[side], 90)),
  });
  const summary = { before: row("before"), after: row("after"), runs };
  console.table({ before: summary.before, after: summary.after });
  console.log(`p50 speed-up: ${(summary.before.p50 / summary.after.p50).toFixed(1)}x over ${runs} runs`);
  return summary;
}
