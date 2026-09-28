---
name: github-actions-minutes
description: Measure and cut GitHub Actions minutes and CI time for a repository. Pulls real per-job billed minutes from the GitHub API, finds where the minutes go (re-runs on main, path filters that match everything, small matrix jobs, draft pushes, Docker builds, Windows/macOS multipliers, bots), and changes the workflows without losing coverage. Use this whenever the user says CI is slow or expensive, is over their Actions quota or paying overage, asks to "reduce GitHub Actions usage/minutes/billing", "speed up CI", "why is our CI so expensive", "optimize workflows", or wants a CI cost audit — even if they only mention one slow job or one workflow file.
---

# Cut GitHub Actions minutes

Most CI waste hides in the gap between wall-clock time and billed time. A 5-way matrix that finishes in 2 minutes bills 10 or more. A job that runs for 5 seconds bills a whole minute. A merge to main can re-run every suite the pull request already passed. So measure billed minutes per job first, then cut the biggest line items, and keep the checks that protect what you ship.

## 1. Measure

Run the bundled script (in this skill's folder) against the repository:

```bash
node <skill-dir>/measure.mjs OWNER/REPO --days 14 --out jobs.json
```

It reads every run and job from the Actions API (read access is enough, no billing or admin scope needed) and prints the billed minutes: the total and a monthly estimate, the rounding overhead, cancelled minutes, a table by workflow and event, the top jobs with how often each one ran, and how many runs each PR branch starts. `jobs.json` keeps the raw rows for follow-up questions. A busy repo takes a few minutes; 14 days is usually enough to see the pattern.

For where time goes inside a job, read the step timings of one typical run:

```bash
gh api repos/OWNER/REPO/actions/runs/RUN_ID/jobs --paginate \
  -q '.jobs[] | .name, (.steps[] | select(.started_at) | "  \((.completed_at|fromdate)-(.started_at|fromdate))s \(.name)")'
```

If the user's org plan matters (included minutes, merge queue availability), `gh api orgs/ORG -q .plan.name` shows it.

## 2. Read the workflows and the rules around them

Before proposing anything, learn what the jobs protect and what depends on them:

- Every workflow's triggers, `concurrency`, path filters, and `needs:` graph.
- Required status checks: `gh api repos/OWNER/REPO/rulesets` (then each ruleset by id) and `gh api repos/OWNER/REPO/branches/main/protection`. A required check that is renamed or removed blocks every merge, so never rename one without telling the user.
- Whether "require branches to be up to date" (`strict`) is on. It decides how much a post-merge run on main still catches.
- Tests or scripts that parse the workflow files: `grep -rn "workflows/" --include='*.test.*' .` and similar. Many repos assert CI structure in unit tests; they fail the moment the layout changes.
- What deploys consume: image tags, release artifacts, a "CI passed" status. Anything a deploy relies on must still be produced and verified.

## 3. Find the waste

Rank findings by billed minutes from step 1. Check these patterns; each one comes with how to spot it in the data and the usual fix.

**Main re-runs the pull request's suites.** The top-jobs table shows the same jobs under `push` and `pull_request`. If merges come from reviewed PRs that already passed, running everything again on main mostly buys nothing. Keep a fast check (typecheck, unit tests) plus the build/publish steps on push, and drop the heavy suites. Say plainly what is lost: with `strict` off, a merge result that was never tested can break main, and the next PR will show it.

**Path filters that match almost everything.** A job that "ran in" 80–100% of PR runs has a filter that does not filter. Replay the filter over real PR file lists (`gh api repos/OWNER/REPO/pulls/N/files`) and count which pattern matches most often. Frequent culprits: a `package.json` or lockfile that every PR touches for a version bump, a broad `src/**` in a narrow job's rule, and the workflow file itself. A version-only manifest change can be detected by comparing the file at the merge base and head with the `version` fields removed.

**Many small jobs.** Each job pays setup (checkout, toolchain, dependency install, often 30–60 s) and rounds up to a whole minute. The script's rounding overhead line shows the total; 10%+ means jobs are too small. Merge matrix legs whose real work is about as long as their setup into one job with sequential steps (`if: ${{ !cancelled() }}` on each step keeps every case reporting when one fails). Leave long legs parallel, since merging them only adds wall time. Merge trivial one-step jobs into a neighbour that already checks out the code.

**Every push to a PR runs everything.** High runs-per-branch plus high cancelled minutes mean work thrown away. Make sure `concurrency` with `cancel-in-progress: true` is keyed per PR. Skip heavy suites on drafts (`if: ... && !github.event.pull_request.draft`) and add `ready_for_review` to the `pull_request` types so they run once the PR is ready. This saves nothing unless the team opens drafts; check whether it does before promising savings.

**Docker image builds.** Look for long build steps and a large `Post Set up Docker Buildx` (cache export). Check layer order (dependency install before `COPY . .`), `cache-to: mode=max` on many scopes (the repo's 10 GB cache evicts itself), and whether the PR build duplicates what main builds anyway. A good trade is to test images on PRs only when image-defining files change (Dockerfile, lockfiles, files copied by name), and to test the exact image main publishes before tagging it for release. Then no image ships untested.

**Expensive runner types.** Windows bills 2×, macOS 10×. Run them only for the code paths that are platform-specific, and not on main pushes if the PR already ran them.

**Bots and schedules.** Workflows under `dynamic` (Copilot code review, Dependabot) and `schedule` events use the same minutes. Check their cron frequency and how often reviews are re-requested.

**Self-hosted runners.** If the org has a self-hosted runner group, moving heavy Linux jobs there removes them from the bill entirely. Capacity, architecture (arm64 vs x64), and network access to package registries must be confirmed with whoever runs those machines. Suggest it; do not move jobs without that confirmation.

**Merge queue.** It runs the full suite once per merge instead of once per PR push, which is often the largest single saving. For private repositories it needs GitHub Enterprise Cloud; check the plan before recommending it.

## 4. Estimate before editing

Replay each proposed change over the measured data and turn it into minutes: jobs removed × their billed minutes, filter selection rate before and after, setup saved by merging. Present a short table (change, minutes saved, share, risk) and let the user choose. Keep estimates conservative, and label any saving that depends on team habits (drafts) as unmeasured.

## 5. Change the workflows safely

- Keep each change small and explained with a comment in the workflow saying why, so the next person does not undo it.
- Update any tests that assert workflow structure. Add a test only for real behaviour (for example: the version-only filter, drafts skipping heavy suites), not one that restates the YAML.
- Lint with `actionlint` (download a release binary if it is not installed), and run the repo's own CI tests locally.
- Push and watch the PR's CI. A workflow change usually triggers every job, so the first run is the most expensive; that is expected.

## Report

Lead with the numbers, then the plan:

```markdown
## Where the minutes go (last N days)
Total billed, monthly estimate, plan's included minutes if known.
| Area | Minutes | Share |    (by workflow/event)
| Job | Share |                (top 5 jobs)

## Why
Numbered causes, each tied to a number from the data.

## Changes
| # | Change | Saves | Risk |

## Not done
What was skipped and why (required check names, needs infra confirmation, plan limits).
```
