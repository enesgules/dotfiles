#!/usr/bin/env node
// Measure what a repository's GitHub Actions runs cost, per workflow and per job.
//
// Usage: node measure.mjs OWNER/REPO [--days 14] [--out jobs.json]
// Needs: Node 18+ and the GitHub CLI (`gh auth login`) with read access to Actions.
//
// Billing follows GitHub's rules for standard hosted runners: each job rounds up
// to a whole minute, Windows counts twice, macOS ten times, and skipped jobs are
// free. Jobs on any other runner group (self-hosted or larger runners) are
// listed apart, because they are either free or billed at their own rate.
import { execFile } from "node:child_process";
import { writeFileSync } from "node:fs";
import { promisify } from "node:util";

const exec = promisify(execFile);
const args = process.argv.slice(2);
const option = (name, fallback) => {
  const i = args.indexOf(`--${name}`);
  return i >= 0 ? args[i + 1] : fallback;
};
const repo = args.find((a, i) => a.includes("/") && !args[i - 1]?.startsWith("--"));
if (!repo) {
  console.error("Usage: node measure.mjs OWNER/REPO [--days 14] [--out jobs.json]");
  process.exit(2);
}
const days = Number(option("days", 14));
const outFile = option("out", "");

async function api(path) {
  const { stdout } = await exec("gh", ["api", "--paginate", "--slurp", path], {
    maxBuffer: 1 << 28,
  });
  return JSON.parse(stdout);
}

async function pool(items, size, fn) {
  const results = [];
  let next = 0;
  await Promise.all(
    Array.from({ length: size }, async () => {
      while (next < items.length) {
        const i = next++;
        results[i] = await fn(items[i]);
      }
    }),
  );
  return results;
}

// One query per UTC day: a `created` filter returns at most 1,000 runs.
const dates = Array.from({ length: days }, (_, i) =>
  new Date(Date.now() - i * 864e5).toISOString().slice(0, 10),
);
const runs = (
  await pool(dates, 4, async (date) =>
    (await api(`repos/${repo}/actions/runs?per_page=100&created=${date}`)).flatMap(
      (page) => page.workflow_runs,
    ),
  )
).flat();
console.error(`${runs.length} runs in ${days} days; reading jobs...`);

let done = 0;
const jobs = (
  await pool(runs, 8, async (run) => {
    // Earlier attempts are billed too, so read every attempt of a rerun.
    const attempts = await Promise.all(
      Array.from({ length: run.run_attempt ?? 1 }, (_, a) =>
        api(`repos/${repo}/actions/runs/${run.id}/attempts/${a + 1}/jobs?per_page=100`),
      ),
    );
    if (++done % 50 === 0) console.error(`  ${done}/${runs.length} runs`);
    return attempts
      .flat()
      .flatMap((page) => page.jobs)
      .map((job) => ({
        run: run.id,
        workflow: run.name,
        event: run.event,
        branch: run.head_branch,
        job: job.name,
        conclusion: job.conclusion,
        labels: job.labels,
        runnerGroup: job.runner_group_name,
        startedAt: job.started_at,
        completedAt: job.completed_at,
      }));
  })
).flat();
if (outFile) writeFileSync(outFile, JSON.stringify(jobs));

const minutes = (j) => (new Date(j.completedAt) - new Date(j.startedAt)) / 6e4;
const ran = jobs.filter(
  (j) => j.conclusion !== "skipped" && j.startedAt && j.completedAt && minutes(j) > 0,
);
const standard = (j) => !j.runnerGroup || j.runnerGroup === "GitHub Actions";
const multiplier = (j) =>
  j.labels.some((l) => /^macos/i.test(l)) ? 10 : j.labels.some((l) => /^windows/i.test(l)) ? 2 : 1;
const billed = (j) => (standard(j) ? Math.ceil(minutes(j)) * multiplier(j) : 0);
const sum = (list, f) => list.reduce((total, j) => total + f(j), 0);
const round = (n) => Math.round(n).toLocaleString("en-US");
const pct = (n, of) => `${((100 * n) / (of || 1)).toFixed(1)}%`;

const hosted = ran.filter(standard);
const total = sum(hosted, billed);
const raw = sum(hosted, (j) => minutes(j) * multiplier(j));
const other = ran.filter((j) => !standard(j));

console.log(`# GitHub Actions usage: ${repo}, last ${days} days\n`);
console.log(`- Runs: ${runs.length}; jobs that ran: ${ran.length}`);
console.log(`- Billed minutes (standard hosted runners): **${round(total)}** (about ${round((total * 30) / days)} a month)`);
console.log(`- Rounding each job up to a whole minute adds ${round(total - raw)} (${pct(total - raw, total)})`);
console.log(`- Cancelled jobs: ${round(sum(hosted.filter((j) => j.conclusion === "cancelled"), billed))} billed minutes; failed jobs: ${round(sum(hosted.filter((j) => j.conclusion === "failure"), billed))}`);
if (other.length) {
  const groups = [...new Set(other.map((j) => j.runnerGroup))].join(", ");
  console.log(`- Other runner groups (${groups}): ${round(sum(other, minutes))} minutes, not in the total. Self-hosted minutes are free; larger runners bill at their own rate.`);
}

function table(title, key, limit) {
  const rows = new Map();
  for (const j of hosted) {
    const k = key(j);
    const row = rows.get(k) ?? { billed: 0, raw: 0, count: 0, runs: new Set() };
    row.billed += billed(j);
    row.raw += minutes(j);
    row.count++;
    row.runs.add(j.run);
    rows.set(k, row);
  }
  console.log(`\n## ${title}\n`);
  console.log("| Billed | Share | Jobs | Avg min | Name |\n|---:|---:|---:|---:|---|");
  for (const [k, r] of [...rows].sort((a, b) => b[1].billed - a[1].billed).slice(0, limit)) {
    console.log(`| ${round(r.billed)} | ${pct(r.billed, total)} | ${r.count} | ${(r.raw / r.count).toFixed(1)} | ${k} |`);
  }
}

table("By workflow and event", (j) => `${j.workflow} / ${j.event}`, 20);

// "Ran in" shows how often a job ran in its workflow's runs for that event: a
// job near 100% on pull requests has a path filter that matches almost everything.
const runsOf = new Map();
for (const r of runs) {
  const k = `${r.name} / ${r.event}`;
  runsOf.set(k, (runsOf.get(k) ?? 0) + 1);
}
const byJob = new Map();
for (const j of hosted) {
  const k = `${j.workflow} / ${j.event} :: ${j.job.replace(/\s*\(.*\)$/, " (matrix)")}`;
  const row = byJob.get(k) ?? { billed: 0, raw: 0, count: 0, runs: new Set(), of: `${j.workflow} / ${j.event}` };
  row.billed += billed(j);
  row.raw += minutes(j);
  row.count++;
  row.runs.add(j.run);
  byJob.set(k, row);
}
console.log("\n## Top jobs\n");
console.log("| Billed | Share | Jobs | Avg min | Ran in | Job |\n|---:|---:|---:|---:|---:|---|");
for (const [k, r] of [...byJob].sort((a, b) => b[1].billed - a[1].billed).slice(0, 30)) {
  console.log(`| ${round(r.billed)} | ${pct(r.billed, total)} | ${r.count} | ${(r.raw / r.count).toFixed(1)} | ${pct(r.runs.size, runsOf.get(r.of))} | ${k} |`);
}

const prRuns = new Map();
for (const r of runs.filter((r) => r.event === "pull_request")) {
  const k = `${r.name} :: ${r.head_branch}`;
  prRuns.set(k, (prRuns.get(k) ?? 0) + 1);
}
if (prRuns.size) {
  const counts = [...prRuns.values()].sort((a, b) => a - b);
  console.log(`\n## Pull request churn\n\n- Runs per branch and workflow: median ${counts[counts.length >> 1]}, max ${counts.at(-1)} (${prRuns.size} branch/workflow pairs)`);
}
