---
name: review-effect-council
description: Review an Effect (Effect-TS) diff, branch, or PR with a council of Effect seats (architecture, errors and data, Effect in a real product, web performance) that run as parallel sub-agents, then give one verified, ranked verdict. Use for "effect council", "effect review", or "what would Michael Arnaldi, Kit, Rhys, or Ethan say".
---

# Effect review council

The seats find. You chair: verify, decide, rank.

| Seat | Skill | Sits when the change touches |
|---|---|---|
| Michael | `review-arnaldi` | services, `Context` tags, Layers, `Scope`, resources, fibers, `ManagedRuntime`, `Effect.run*` |
| Kit | `review-kit` | the error channel, `catch*`, `orDie`, tagged errors, `Schema`, `Option`, `Either`, `Effect.gen` or pipe code |
| Rhys | `review-rhys` | the edge between Effect and other code (route handlers, React, SDKs, MCP, agent tools), tests, logs, spans |
| Ethan | `review-ethan` | pages, routes, data fetching, caching, prefetch, assets, or concurrency on a request path |

The seat skills are siblings of this skill: `<this skill's directory>/../<skill>/SKILL.md`. Skip a missing seat and give its install line: `npx skills add enesgules/dotfiles --skill <skill>`.

## How to run

Follow the steps of `review-council` (`<this skill's directory>/../review-council/SKILL.md`): pin the scope, seat the council, run the seats in parallel, chair, report. Use this seat table instead of its table. Title the report "# Effect review council: <scope>".

- No Effect import in the diff: stop, and run `review-council` instead.
- Seat the smallest set that covers the diff. "Full council" seats all four.
- Code outside the Effect lanes (security, public contracts, dependencies, CPU on hot paths, React, visual design) goes to the `review-council` seats. Add Daniel, Armin, antirez, Yagiz, or poteto when the diff needs them, and say why in the seats line.
- Check the Effect version in `package.json` before you verify a finding. A finding that names an API that this version does not have is dropped.
