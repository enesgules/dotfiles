---
name: optimise-github-actions
description: Optimise GitHub Actions for cost and speed. Measures real billed minutes and wall-clock time per workflow and job from the GitHub API, finds the waste (main re-running PR suites, path filters that match everything, small matrix jobs, missing caches, draft pushes, Docker builds, Windows/macOS multipliers, hung jobs, bots), and changes the workflows without losing coverage. Use this whenever the user says CI is slow or expensive, is over their Actions quota or paying overage, wants to "reduce GitHub Actions minutes/usage/billing", "speed up CI", "make CI faster/cheaper", asks "why is our CI so expensive", or wants a CI audit — even if they only point at one slow job or one workflow file.
---

# Optimise GitHub Actions

Most CI waste hides in the gap between wall-clock time and billed time. A 5-way matrix that finishes in 2 minutes bills 10 or more; a 5-second job bills a whole minute; a merge to main can re-run every suite the pull request already passed. Measure first, cut the biggest line items, and keep the checks that protect what ships.

Speed and cost are related but not the same goal. Caching and removing duplicate work improve both. Splitting a long job into parallel shards makes CI faster but costs more (each shard pays setup again), and merging small jobs does the opposite. Find out which one the user cares about, or say which trade-off each change makes.

## 1. Measure

Run the bundled script from this skill's folder:

```bash
node <skill-dir>/scripts/measure.mjs OWNER/REPO --days 14 --out jobs.json
```

It needs only `gh` with read access (no billing or admin scope). It prints:
- total billed minutes, a monthly estimate, rounding overhead, cancelled and failed minutes
- tables by workflow/event and by job, with how often each job ran ("Ran in")
- median and p90 wall-clock time of successful runs
- how many runs each PR branch triggers

`jobs.json` keeps the raw rows for follow-up questions. A busy repo takes a few minutes. On a public repository, standard runners are free, so read the numbers as runner time and focus on speed.

To see where time goes inside a job, read the step timings of one typical run:

```bash
gh api repos/OWNER/REPO/actions/runs/RUN_ID/jobs --paginate \
  -q '.jobs[] | .name, (.steps[] | select(.started_at) | "  \((.completed_at|fromdate)-(.started_at|fromdate))s \(.name)")'
```

The org plan decides included minutes and merge queue access: `gh api orgs/ORG -q .plan.name`.

## 2. Learn what the jobs protect

Before proposing anything, read:

- Each workflow's triggers, `concurrency`, path filters, and `needs:` graph. The longest chain of `needs:` is the critical path; only shortening it makes CI faster.
- Required status checks: `gh api repos/OWNER/REPO/rulesets` (then each ruleset by id) and `gh api repos/OWNER/REPO/branches/main/protection`. A required check that is renamed or removed blocks every merge.
- Whether "require branches to be up to date" (`strict`) is on. It decides how much a run on main still catches after merge.
- Tests or scripts that parse the workflow files (`grep -rln "workflows/" --include='*.test.*' .`). Many repos assert CI layout in unit tests, and those break on the first change.
- What deploys consume: image tags, release artifacts, a "CI passed" status. Whatever a deploy relies on must still be built and verified.

## 3. Find the waste

Rank by the numbers from step 1. For each pattern: how to spot it, then the usual fix.

**Main re-runs the pull request's suites.** The same jobs appear under `push` and `pull_request`. If merges come from PRs that already passed, keep a fast check plus build/publish on push and drop the heavy suites. State what is lost: with `strict` off, an untested merge result can break main, and the next PR shows it.

**Path filters that match almost everything.** A job that ran in 80–100% of PR runs has a filter that does not filter. Replay the filter over real PR file lists (`gh api repos/OWNER/REPO/pulls/N/files`) and count which pattern matches most. Usual culprits: a manifest or lockfile that every PR touches for a version bump, a broad `src/**` in a narrow job's rule, the workflow file itself. A version-only manifest change can be detected by comparing the file at merge base and head with the `version` fields removed. Docs-only changes can skip CI with `paths-ignore`.

**Many small jobs.** Each job pays setup (checkout, toolchain, dependency install, often 30–60 s) and rounds up to a whole minute; rounding overhead above ~10% points here. Merge matrix legs whose work is about as long as their setup into one job with sequential steps; `if: ${{ !cancelled() }}` on each step keeps every case reporting when one fails. Leave long legs parallel. Fold one-step jobs into a neighbour that already checks out the code.

**Slow dependency installs.** Compare the install step with the rest in the step timings. Use the setup action's cache (`actions/setup-node` `cache: npm`, `setup-python` `cache: pip`, and so on) or `actions/cache` keyed on the lockfile. Install only the packages the job uses. Clone with `fetch-depth: 1` (the default) unless the job reads history.

**Every push to a PR runs everything.** High runs per branch plus high cancelled minutes mean discarded work. Key `concurrency` per PR with `cancel-in-progress: true`. Skip heavy suites on drafts (`if: ... && !github.event.pull_request.draft`) and add `ready_for_review` to the `pull_request` types. This only saves minutes if the team opens drafts, so check that before you promise savings.

**Hung or runaway jobs.** A job without `timeout-minutes` can run for 6 hours. Look for jobs whose max duration far exceeds their average, and set a timeout a little above the normal p90.

**Docker image builds.** Long build steps and a long `Post Set up Docker Buildx` (cache export) are the signs. Check layer order (install dependencies before `COPY . .`), `cache-to: mode=max` across many scopes (the 10 GB repo cache then evicts itself), and PR builds that repeat what main builds anyway. A sound trade: build images on PRs only when image-defining files change (Dockerfile, lockfiles, files copied by name), and test the exact image main publishes before tagging it for release, so nothing ships untested.

**Expensive runner types.** Windows bills 2×, macOS 10×. Run them only for platform-specific code paths, and not again on main.

**Bots and schedules.** Workflows under the `dynamic` event (Copilot code review, Dependabot) and `schedule` use the same minutes. Check cron frequency and how often reviews are re-requested.

**Self-hosted runners.** An existing self-hosted group removes jobs from the bill. Capacity, architecture (arm64 vs x64), and registry access must be confirmed with whoever runs those machines. Suggest it, but do not move jobs before that confirmation.

**Merge queue.** It runs the full suite once per merge instead of once per PR push, often the largest single saving. Private repositories need GitHub Enterprise Cloud for it; check the plan first.

## 4. Estimate before editing

Replay each proposed change over the measured data: jobs removed × their billed minutes, filter selection rate before and after, setup saved by merging, critical path before and after. Show a table (change, minutes saved, time saved, risk) and let the user choose. Keep estimates conservative, and label savings that depend on team habits (drafts) as unmeasured.

## 5. Change the workflows safely

- Keep each change small, with a workflow comment that says why, so the next person does not undo it.
- Update tests that assert workflow layout. Add tests only for real behaviour (for example the version-only filter or drafts skipping heavy suites), not ones that restate the YAML.
- Lint with `actionlint` (download a release binary if it is missing) and run the repo's CI tests locally.
- Push and watch the PR. A workflow change usually selects every job, so its first run costs the most.

## Report

Lead with the numbers, then the plan:

```markdown
## Where the minutes and time go (last N days)
Total billed, monthly estimate, included minutes if known, median/p90 run time.
| Area | Minutes | Share |    (by workflow/event)
| Job | Share |                (top 5 jobs)

## Why
Numbered causes, each tied to a number from the data.

## Changes
| # | Change | Saves (min) | Saves (time) | Risk |

## Not done
What was skipped and why (required check names, needs infra confirmation, plan limits).
```
