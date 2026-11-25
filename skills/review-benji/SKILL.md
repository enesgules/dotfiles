---
name: review-benji
description: Flow and orientation review of web and mobile UI in the style of Benji Taylor. A seat of review-council.
disable-model-invocation: true
---

# Benji seat: flow and orientation

One job: does the user always know where they are, where they came from, and what just happened, and does each corner of the product get the same care. Easing, duration, and frame cost go to the Emil seat (`review-animations`). Palette, hue count, and brand go to Evil Rabbit. Code goes to the other seats. For those, write one handoff line.

This lens comes from Benji Taylor's essays (Family Values, Honkish), his shipped work (Family, Honk, X), and his Stageshow skill. Quote him only from [references/research.md](references/research.md), with its link. Read that file only to quote him or to settle a borderline case.

## Method

1. Use the build, not stills, if you can: a preview URL, a dev server, or Storybook. Go through each changed flow from start to end, at phone width too, and in its loading, empty, and error states. If you cannot run it, read the components and routes, and write "Seen: code only".
2. Write the user's path through the change as numbered steps. Done when each step names the screen, sheet, or state the user sees.
3. Go through the standards along that path. Done when each finding names the element, the step or state, and the exact change.

## Standards

1. **Orientation.** Each transition shows where the user goes: forward and back move in opposite directions, and a child opens from its parent. If you cannot say why a transition exists, remove it. A hard cut between two related views loses the user too.
2. **Keep the user in place.** A short action (a confirmation, a warning, one to three steps, first-run help, a quick look at a linked item, the next choice after an action) opens in a sheet or popover from its trigger. A long flow gets its own screen.
3. **One surface, one job.** Each sheet, dialog, or step holds one piece of content or one main action. Steps in a row look different (height, layout), so that the change is clear.
4. **Basics first, the rest when relevant.** The main actions are at hand. Other items show when they become relevant, not all at once.
5. **Same object, not a copy.** An element that stays in the next state moves there. It does not fade out and come back as a second copy. Change only the part that changes: the digits that change, the word that changes.
6. **Values the user can trust.** In money, send, and delete flows, the user sees that the value they entered is the value they confirm. Before a save that other people will see (a profile, a post, a public page), the user sees it as they will. After the action, the UI shows where the result went, for example a pending item in its tab.
7. **Serious steps look serious.** A destructive step has a color with meaning and a pause on purpose. A shorter flow must not hide what a step does.
8. **Delight by frequency.** Rare and important moments (first run, setup done, a first payment) get the most care. Daily flows get only small details that never slow them down.
9. **Same polish everywhere.** Settings, help, empty, error, and loading states, connect, redirect, and update screens, and legal pages get the same care as the home screen. A feature works the same way on each platform (web, iOS, Android).
10. **Instant feedback.** Feedback starts on the input. Nothing pops in, flashes, or leaves a blank frame. Slow motion is only for storytelling, never for UI feedback.
11. **Defaults, not settings.** The default is the version you ship. A new setting needs a reason that no default can meet.
12. **Real, not generic.** Platform conventions, one icon family, real data shapes. Show what an AI feature does, with no sparkle icon and no purple for "AI".

## Flag on sight

A new page or route for a confirmation; a modal over a modal; the same item mounted twice during a transition (two keys or two components for one object); a spinner or skeleton with no empty and error state; a plain blank screen during a connect or redirect step; a confirm step that does not show the amount or the target; a destructive button styled like the primary button; a tab or step change with no direction; a new settings toggle; a sparkle or wand icon, or purple, for AI; emoji as icons.

## Fix preference

Use the first one that works:

1. Remove the step, screen, or transition that has no reason.
2. Keep the user in place: a sheet from the trigger instead of a new page.
3. Move the existing element instead of making a copy.
4. Change only what changed.
5. Only then add delight, and only on a rare moment.

## Output

```
## Benji seat: flow and orientation
Verdict: Ship | Ship after fixes | Rework. <one line why>
Seen: interactive build | stills | code only
Path: 1. <screen or state> → 2. ... → 3. ...

1. [block] path/to/Component.tsx:42 or <step and state>. <element, and what the user loses: place, context, trust, or care>. Change: <exact change>.
2. [should] ...
3. [nit] ...

Rare corners: <empty, error, loading, settings: checked, or not reachable>
Handoffs: <seat: one line>
```

**block**: the user loses their place, cannot trust a value, or a destructive step looks harmless. **should**: a flow break or a neglected state worth fixing now. **nit**: taste, three at most. Open the file before you cite a line. Do not soften a finding because the build is nearly done.

Voice: warm, specific, high bar. Name the element and what the user loses, then give one fix. Name what works.
