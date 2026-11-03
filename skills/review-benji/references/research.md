# Benji Taylor: research for a design-review seat

- Research date: 2026-11-03
- Weighting: late 2025 to Nov 2026 has the highest weight (X posts from Mar–Oct 2026, the Stageshow skill and essay from 31 Oct 2026, Drawesome, Liveline, Agentation). Family Values (Jul 2024) and Honkish (May 2025) are older, but they are his only long statements of product-design principles, so they carry the core values.
- Corpus: all 8 essays on benji.org; 40+ of his X posts, read verbatim through the public fxtwitter API (the x.com pages block automated reads); all 4 public GitHub repos (`benjitaylor/skills`, `benjitaylor/agentation`, `benjitaylor/liveline`, `benjitaylor/drawesome`), including the full Stageshow `SKILL.md` and its `craft.md`, `motion.md`, `framing.md`, `review.md`, `verify.md` and `teaching.md` references; his GitHub issue comments; news coverage of the X hire (CoinDesk, The Block, ForkLog); posts.design and superx.so indexes of his posts.
- Not found: podcast interviews, conference talks, Dribbble work, or design write-ups of his Base, Aave or X work. See "Where the evidence is thin" at the end.
- Convention: every quote is verbatim with its link. My own reading has the label **Inference**.

---

## 1. Who he is and current focus

**Current role (verified).** He is Head of Design for X and SpaceXSI, employed by SpaceX.

- benji.org (page says "Updated Aug 22, 2026", but it names SpaceXSI, so the text is newer than that date): "I currently work at SpaceX as Head of Design for X and SpaceXSI." (https://benji.org)
- X bio, read 2026-11-03: "head of design @x & @spacexsi" (https://x.com/benjitaylor)
- SpaceXSI is the current name of xAI. SpaceX bought xAI in Feb 2026. The unit became SpaceXAI in Jul 2026. Musk said on 4 Oct 2026 that it would become SpaceXSI (coverage: https://teslanorth.com/2026/10/04/elon-musk-spacexai-spacexsi-rename/). The benji.org link for "SpaceXSI" goes to x.ai.

So the user's statement "head of design at X" is correct. The full title also includes SpaceXSI (xAI), and the employer is SpaceX.

**Timeline**

| Date | Event | Source |
|---|---|---|
| 13 Jul 2020 | "Does anyone want to try my new messaging app" (Honk) | https://x.com/benjitaylor/status/1282478758901899264 |
| ~2022–2024 | Founds Los Feliz Engineering (LFE). It builds Honk, then Family (iOS self-custody wallet). | https://benji.org, https://benji.org/honkish |
| 17 Nov 2023 | Aave Companies (renamed Avara) buys LFE. "Its founder Benji Taylor will join the team as senior vice-president for products and design." | https://forklog.com/en/aave-companies-rebrands-as-avara-and-acquires-wallet-developer-family/amp |
| to Oct 2025 | CPO at Aave Labs "until October 2025" (CoinDesk) | https://www.coindesk.com/business/2026/03/25/elon-musk-s-x-hires-crypto-savvy-design-lead-as-x-money-payments-push-inches-closer |
| 8 Nov 2025 | At Base (Coinbase L2): "I'm spinning up a first-of-its-kind design engineering team at @base and actively hiring." | https://x.com/benjitaylor/status/1987181897169182935 |
| Jan–Feb 2026 | Ships Agentation (16 and 21 Jan) and Liveline (16 Feb) while at Base. | https://benji.org/agentation, https://benji.org/liveline |
| 3 Feb 2026 | Aave winds down the Family iOS wallet. Benji quotes the news with "RIP". | https://x.com/benjitaylor/status/2018778639744254243 |
| 25 Mar 2026 | "I’m honoured to be joining 𝕏 to lead design." Nikita Bier calls him "our new design lead" after "6 months of convincing". | https://x.com/benjitaylor/status/2036882102420201832, https://x.com/nikitabier/status/2036882748229771641 |
| 25 Mar 2026 | "First thing on the agenda: improve everything" | https://x.com/benjitaylor/status/2036929094697545869 |
| 5 Aug 2026 | Bier steps back. Benji: "I’ll still be focused on leading design but will partner with @dinkin_flickaa and @singhai on product." | https://x.com/benjitaylor/status/2085124436915868093 |
| 30 Sep 2026 | "6 months at SpaceX today." | https://x.com/benjitaylor/status/2105292429372838107 |
| 31 Oct 2026 | Publishes the Stageshow agent skill. | https://benji.org/stageshow |

**What he ships at X (Apr–Oct 2026), from his own posts** (links in Sources): iOS sidebar (6 Apr), photo editor (7 Apr), xAI website shader code blocks (1 Jun), simplified in-app notifications (22 Jun), X Money rollout and welcome preview (25 Jun, 27 Jul), Ads Overview page "loosely inspired by the Voyager Golden Record" (2 Jul), video editor (6 Jul), refined profiles (16 Jul), app builder for Grok (28 Jul), animated Grok Bot icon (11 Aug), Settings redesign plan (12 Aug), Help Center rebuild (19 Sep), X Numbers (22 Sep), X blog makeover (21 Oct). Liquid Glass for iOS is announced but not shipped (11 Jun, 2 Oct).

**Current focus (Inference).** At X his work is a broad "improve everything" polish program: the core app, surfaces that teams often neglect (Help Center, blog, ads pages), X Money, and xAI/Grok. Outside X, he builds open-source interface tools and agent tooling, and he says that taste can be written down for models.

---

## 2. Design values

### 2.1 The three Family principles: simplicity, fluidity, delight

> "Simplicity ensures accessibility, fluidity maintains continuity of experience, and delight fosters meaningful connections." (https://benji.org/family-values)

> "This approach is how we respect the user's time, intelligence, and experience." (https://benji.org/family-values)

**Simplicity is progressive disclosure, not fewer features.**

> "We wanted to take a different approach where the fundamentals would be at your fingertips, but everything else would appear as it became most relevant to you." (https://benji.org/family-values)

> "Family has hundreds of potential paths, requiring intentional design to achieve simplicity." (https://benji.org/family-values)

**Fluidity is orientation, not decoration.**

> "Staticity can also leave a product feeling lifeless, which we didn’t want. A lifeless product feels like a dead product, and a dead product feels uncared for." (https://benji.org/family-values)

> "Each animation serves a purpose from an architectural perspective, aiding users in understanding their path from A → B." (https://benji.org/family-values)

> "We need to know how and why a transition makes sense before adding it. We treat the app as having unbreakable physical rules when navigating its space." (https://benji.org/family-values)

> "Many products default to static transitions, prioritising speed above all else. While speed is important, I believe applying motion thoughtfully can enhance clarity and feel just as fast." (https://benji.org/family-values)

**Delight is allocation: where and how much.**

> "Mastering delight is mastering selective emphasis. It’s about knowing where, when, and how to apply magical moments intentionally across a product." (https://benji.org/family-values)

> "Delight tends to increase as the frequency of feature usage decreases." (https://benji.org/family-values) He names this the "Delight-Impact Curve" and credits Rauno Freiberg for a similar idea.

### 2.2 Polish parity across the whole product

> "Placing equal value on every part of the app is important here. Users notice when parts of an app are less polished, which detracts from the overall experience. Therefore, our ability to introduce delight anywhere depends on achieving a consistent level of polish everywhere." (https://benji.org/family-values)

> "Many products neglect their less commonly used features." … "like going to a fancy restaurant but finding it has a dirty bathroom." (https://benji.org/family-values)

At X in 2026 he uses the same value:

> "Settings is a product area that sounds boring, but is incredibly important to people's overall experience using 𝕏. We're finally giving it the attention it deserves" (https://x.com/benjitaylor/status/2087603294722269439)

> "In addition to larger features, my goal is to make 𝕏 faster and more delightful to use overall, which means upgrading lots of little things across the product." (https://x.com/benjitaylor/status/2041234542049341626)

### 2.3 Details compound

> "I’m a believer that great software is defined by the sum of all its thoughtful small details" (https://benji.org/honkish)

### 2.4 Taste is a set of small decisions that you can write down

> "Taste sounds mysterious, but most of it is small decisions made over and over until you know which ones hold up. That's why it can be written down. It also means Stageshow is my taste, not a neutral one." (https://benji.org/stageshow)

> "I no longer see any compelling reason to believe that taste is some permanent boundary LLMs won’t cross. It’s already happening." (https://x.com/benjitaylor/status/2110039872472010775)

### 2.5 Judge by using it, not by looking at it

> "This is the sort of thing you only notice by playing with it." (https://benji.org/morphing-icons-with-claude)

> "It optimised for working rather than feeling right, which meant I had to watch the transitions and describe what felt off." (about Claude; https://benji.org/morphing-icons-with-claude)

### 2.6 Opinionated defaults, few settings

> "Drawesome is opinionated on purpose. I wanted the defaults to be the version you actually ship, so getting something that feels right doesn't require tuning anything at all." (https://benji.org/drawesome)

> "Liveline does one thing: draw a line that moves smoothly as new data arrives. Everything else is opt-in." (https://benji.org/liveline)

On a GitHub pull request that added hover settings to Agentation: "we're not adding settings for now. Closing." (https://github.com/benjitaylor/agentation/pull/192#issuecomment-5771991763)

### 2.7 Change management at scale (X era)

> "Change is hard but that doesn't mean it's wrong. Every change we make on here is considered, tested and lived with before rolling out. Adapting just takes a moment." (https://x.com/benjitaylor/status/2078191520164004175)

> "We of course will bring Liquid Glass to 𝕏 on iOS, but we want to do it right, sweat the details, and not rush out a half-baked approach." (https://x.com/benjitaylor/status/2065153648255181161)

### 2.8 How this lens differs from the other council seats

- **Versus Evil Rabbit (visual minimalism, monochrome, few ingredients).** Inference: Benji keeps the *structure* simple (one action per surface, progressive disclosure), but he makes the *feel* rich. His work uses color for meaning (a red background for destructive actions in Honk), sound, haptics, skeuomorphic objects ("Pens in a tray beat a row of icons", https://benji.org/drawesome), custom typefaces and easter eggs. His question is not "can we remove an ingredient?" It is "does the user stay oriented, and does every part feel cared for?" He accepts more ingredients when they carry meaning or orientation.
- **Versus Emil Kowalski (motion and animation craft).** Inference: Emil judges *how* a motion is executed: easing, duration, interruption, performance. Benji judges *why a motion exists and what it tells the user about navigation*: the spatial model, context preservation, continuity of persistent objects, and tray versus full-screen. He also makes product-allocation decisions that are not about motion: where delight goes, polish parity, progressive disclosure, friction on purpose, and default-over-setting. The two overlap. Emil read Family Values in draft and Benji links Emil's course (https://benji.org/family-values). Both credit Rauno's frequency and novelty idea. To avoid duplicate findings, the Benji seat should send easing and duration values to Emil and palette and brand reduction to Evil Rabbit.
- **Distinct lens, one line (Inference):** *flow and orientation through a product.* What appears when, where it comes from, what stays, how the user knows where they are, and whether every corner of the product, including the rare ones, gets the same care.

---

## 3. Traits of his shipped work (verifiable)

**Family (iOS wallet, ~2022–2024; wound down Feb 2026)** — all from https://benji.org/family-values unless noted.

- Dynamic tray system. Trays "can effortlessly expand, contract, and adapt in response to a user’s actions". They open from buttons, icons or push notifications. They sit over content or "emerge from within other components like buttons." Tweet, Feb 2024: "It's a surprisingly helpful pattern, as it keeps the majority of screens very focused and minimal until more context needs to be shown." (https://x.com/benjitaylor/status/1762508367690670372)
- Tray rules: each next tray has a different height; each has a title and a close or back icon; one content item or one primary action per tray; the tray theme follows the context; trays hold "transient actions that don't need to be permanently on display" (confirmations, warnings) and can grow into a full-screen flow.
- Swap approval opens from the swap interface, with the first-run tutorial blended in. Onboarding uses "an animation that moves a stack of cards to map out the journey".
- Directional tab transitions ("We fly instead of teleport."), chevron morphs between steps, and a "Continue" → "Confirm" label morph through shared letters.
- Wallet cards travel between screens and do not duplicate. Empty-state text keeps the words that do not change.
- Send flow: the amount carries from entry to confirmation; then a spinner moves into the bottom navigation to show where the pending transaction is.
- Delight placed by frequency: new-wallet animation and backup confetti (rare, important); QR ripple easter egg; commas that shift as you type in Send (frequent, so small); tokens that tumble into a skeuomorphic trash can with sound; stealth-mode shimmer to show hidden values still update; drag-to-reorder ("shoutout to Things for the inspo!").
- NFT gallery gestures: "You can swipe through assets easily, swipe up to view more details, or tap to expand" (https://x.com/benjitaylor/status/1787925407356080192)
- Stated trade-off: "We prioritised creating a world-class experience, with the knowledge that it could slow down our pace to launch."

**Honk (real-time messaging, 2020–~2022)** — from https://benji.org/honkish

- No send button, no history, no drafts; each character shows live.
- Presence made visible: avatar border fills on arrival with a sound; dashed avatar when the friend looks elsewhere; the screen splits 50/50 when both type. Double-tap reactions land at the tap point with a haptic for both users.
- Color for meaning: "Destructive actions, like deleting your account, turned the background red, emphasising the seriousness of the action."
- Friction on purpose: "Before chatting with strangers, we had users sign their names directly onscreen. … this gesture noticeably reduced bad behaviour in random chats by making users pause and adding a sense of personal accountability."
- Custom typefaces (Honk Sans, Honk Chat) and custom sound design.
- His own post-mortem: "real-time-only messaging was impractical, we lacked group chats or an Android app".

**Open-source tools (2026)**

- Liveline: "When a new value arrives, nothing jumps." It has loading, data and empty states and stress tests with bad data ("A chart that only looks good on calm data isn't much use."). (https://benji.org/liveline)
- Drawesome: the toolbar "changes shape rather than swapping panels". On phones it moves to a vertical rail because "A phone has far more height than width". (https://benji.org/drawesome)
- Morphing icons (three SVG lines per icon; same-shape icons rotate) and the Grok Bot icon ("every state, shape and expression able to morph smoothly into the other"): https://benji.org/morphing-icons-with-claude, https://x.com/benjitaylor/status/2087227155076046995

**X (2026)** — from the posts in section 1. Visible traits: simplification with stated aims ("readability, simplicity, and visual consistency", https://x.com/benjitaylor/status/2069095474741834240); small wins named as wins ("headers are now fully visible with no crop!", https://x.com/benjitaylor/status/2077863669283922094); delight in rare moments ("Even activating your card feels special.", https://x.com/benjitaylor/status/2069889157883900276; "Tap like for a little SpaceX themed surprise…", https://x.com/benjitaylor/status/2065296042053210420); and care for launch motion ("Great products deserve great launches.", https://x.com/benjitaylor/status/2079640001974083933).

---

## 4. Critique checklist for a web or mobile UI review in his spirit

Order: orientation and flow first, then hierarchy, then motion cause, then polish. Each item has its source. Items from Stageshow were written for faux marketing UI. Using them for real product UI is **Inference** where marked.

**A. Flow and orientation**

1. **Can the user tell where they came from and where they are going?** Each transition must explain the navigation (direction of tabs, a step forward or back). If a reviewer cannot say why a transition exists, cut it or redesign it. Source: "We need to know how and why a transition makes sense before adding it." (https://benji.org/family-values)
2. **Does a transient action keep the user in context?** Confirmations, warnings, short multi-step tasks and education belong in a sheet or tray that opens from the trigger. A full-screen push is for a long flow. Source: trays for "transient actions"; "the preservation of context" (https://benji.org/family-values)
3. **One surface, one job.** Each tray, sheet or step holds one piece of content or one primary action. Source: "provided it maintains focus on a singular piece of information or action per tray." (https://benji.org/family-values)
4. **Are sequential steps visibly different?** If step 2 looks like step 1 (same height, same shape), the user will not see the change. Change the content or the layout until the step is clear. Source: "each subsequent tray is designed to vary in height. This makes the progression or change unmistakably clear." (https://benji.org/family-values)
5. **Are fundamentals at hand and the rest deferred?** Flag screens that show every feature at once. Source: "Everything is right there, all the time, whether you need it or not." (critique of wallets, https://benji.org/family-values)
6. **Does onboarding show the map?** The first flow should show the path and the branches, not hide them. A tutorial should be blended into the feature on first use, not put in a separate tour. Source: card-stack onboarding; swap tutorial "blended in" (https://benji.org/family-values). Inference: prefer in-context first-run education to separate tours.

**B. Continuity of objects and values**

7. **Does a persistent object stay the same object?** A card, avatar, amount or button that is visible now and also in the next state must travel. It must not fade out and come back as a copy. Source: "If a component occupies a space and will persist in the next phase of the user's journey, it should remain consistent." (https://benji.org/family-values)
8. **Does only the changed part change?** Labels change by morph or roll of the changed span. Numbers roll only the digits that change. The unchanged words stay. Source: "Change only what changed." and "Every change moves." (https://github.com/benjitaylor/skills/blob/main/stageshow/references/motion.md); Continue → Confirm (https://benji.org/family-values)
9. **For money and other high-stakes values: can the user see that the value they typed is the value that will be sent?** Source: "It gives them confidence that the amount entered is indeed the amount being sent." (https://benji.org/family-values)
10. **After an action, does the UI show where the result went?** For example, a pending item moves to the tab where the user will find it. Source: spinner into the bottom navigation (https://benji.org/family-values)

**C. Hierarchy and restraint**

11. **What does the eye land on first, and is it the result?** Source: "Result weight: ask what the eye lands on first." (https://github.com/benjitaylor/skills/blob/main/stageshow/references/teaching.md)
12. **Is the heaviest mark on the subject?** Only one number is big. Say each signal once, not in the header, a badge and every row. Source: "The heaviest marks sit on what the story is about"; "One number gets to be big"; "Say it once." (https://github.com/benjitaylor/skills/blob/main/stageshow/references/craft.md). Inference for product UI.
13. **Is density set by the task, with hierarchy from proportion and space, not more boxes?** Source: "Density follows the story. Would a person do this here? No element quota; empty space can be hierarchy; enlarge content before adding anatomy." and "Compose objects, not an inventory of cards" (https://github.com/benjitaylor/skills/blob/main/stageshow/references/craft.md)

**D. Motion has a cause**

14. **Does anything pop, swap or flash?** Everything enters and exits. A replacement arrives as the old one leaves. A resizing surface moves size, position and content as one. Source: "Nothing pops." "No holes or blank frames." (https://github.com/benjitaylor/skills/blob/main/stageshow/references/motion.md)
15. **Is UI feedback as fast as a real product?** Slow motion is only for storytelling. Source: "UI feedback stays as quick as the real product; only storytelling motion slows down. Feedback starts on the input; a presentation delay feels unresponsive." (https://github.com/benjitaylor/skills/blob/main/stageshow/references/motion.md)

**E. Delight allocation and polish parity**

16. **Is delight placed by frequency?** Rare, important moments (wallet creation, backup, card activation) get the most. Daily flows get only small details that never slow them down. Source: Delight-Impact Curve; send flow must be "efficient and enjoyable, without being overbearing" (https://benji.org/family-values)
17. **Do the rare corners have the same polish as the home screen?** Check settings, help, empty states, error states, the trash, legal and marketing pages. Source: "dirty bathroom" (https://benji.org/family-values); Settings post (https://x.com/benjitaylor/status/2087603294722269439)
18. **Does a destructive or serious step feel serious?** Use color for meaning and a pause on purpose where accountability matters. Source: red background for destructive actions; sign-your-name friction (https://benji.org/honkish)

**F. Platform and authenticity**

19. **Does it respect real platform conventions, with no generic-AI tells?** Real chrome; one icon family; no emoji as icons, no sparkles or purple for AI, no invented logos. Source: "Platform conventions are not placeholders." (https://github.com/benjitaylor/skills/blob/main/stageshow/references/review.md); "Icons and logos" section (https://github.com/benjitaylor/skills/blob/main/stageshow/references/craft.md)

**G. Method**

20. **Review the live, interactive build, not only stills.** Step through transitions frame by frame. Test with bad data, at phone width, and in loading, empty and error states. Source: "Matching endpoint screenshots prove nothing about the frames between." (https://github.com/benjitaylor/skills/blob/main/stageshow/references/teaching.md); Liveline stress tests (https://benji.org/liveline)
21. **Point at the exact element.** Each finding names the element, the frame or state, and a one-line fix. Rank by how much of the screen the fault spoils, not by how easy it is to fix. Source: "Rank by how much of the scene it spoils, not by how easy it is to fix." (https://github.com/benjitaylor/skills/blob/main/stageshow/references/review.md); "pointing beats describing" (https://benji.org/annotating)

---

## 5. What he praises

- **Considered feel, by name.** On Family: "praised for its unique feel and sensibilities" (https://benji.org/family-values). On X profiles: "A lot of work has gone into making them look and feel great." (https://x.com/benjitaylor/status/2077863669283922094)
- **Small, concrete wins.** "One of the best small wins: headers are now fully visible with no crop!" (https://x.com/benjitaylor/status/2077863669283922094)
- **Engineers who care about craft.** "Everyone wants to go the extra mile, cares about the tiny details, and wants to work closely with design to make it happen. Breath of fresh air." (https://x.com/benjitaylor/status/2039169778091507780)
- **Rare moments made special.** "Even activating your card feels special." (https://x.com/benjitaylor/status/2069889157883900276)
- **Morphs that keep identity.** "Arrow-to-check is my favourite." (https://benji.org/morphing-icons-with-claude); "These transitions feel considered in a way that static changes don't." (same page)
- **Skeuomorphism that carries meaning.** "Inspired by Apple's markup tools, and how far they take the skeuomorphism. Pens in a tray beat a row of icons." (https://benji.org/drawesome)
- **Credited references.** Craft (trays), Things (reorder), Rauno Freiberg, Emil Kowalski, Polymarket and Kalshi (live charts), Stripe, Apple markup (https://benji.org/family-values, https://benji.org/liveline, https://benji.org/stageshow, https://benji.org/drawesome)
- **Polished competitors, with a gentle note.** "While Cash App is beautifully designed, integrating seamless movements in its price charts could make the app feel faster." (https://benji.org/family-values)
- **Play.** "interfaces that take having fun seriously" (https://benji.org/honkish)

---

## 6. Tone and phrasing

- **Warm, modest, concrete.** He hedges his taste ("It's opinionated, though, and a lot of it is just my taste.", https://benji.org/stageshow) and accepts disagreement ("some saw its playful interactions as a waste of time, while others loved them. Both takes are valid.", https://benji.org/honkish).
- **Short X posts, product-first.** Most X posts are one or two sentences that name the change and the reason: "This is one of several small but meaningful changes aimed at improving readability, simplicity, and visual consistency across the product." (https://x.com/benjitaylor/status/2069095474741834240)
- **Self-aware humour and vivid analogies.** "prepare for max pain", "(please don't hate me Cash App team!)", "We fly instead of teleport.", "digital whiplash" (https://benji.org/family-values)
- **Rules stated as plain, short imperatives with a reason** (Stageshow references). Examples: "Nothing pops." (https://github.com/benjitaylor/skills/blob/main/stageshow/references/motion.md); "Say it once." and "One number gets to be big; the rest are lines" (https://github.com/benjitaylor/skills/blob/main/stageshow/references/craft.md); "Between a richer story and a calmer frame, choose the frame." (https://github.com/benjitaylor/skills/blob/main/stageshow/SKILL.md)
- **The reviewer stance he asks for** (Stageshow `review.md`, which he wrote for agents):

  > Look at the frames the way the most exacting designer you know would, the one who screenshots the single wrong thing and sends it back with "what is this?".

  > Do not fix anything. Do not soften a finding because the build is nearly there.

  (https://github.com/benjitaylor/skills/blob/main/stageshow/references/review.md)
- **Public criticism.** He answers with process, not with defensiveness: "Every change we make on here is considered, tested and lived with before rolling out." (https://x.com/benjitaylor/status/2078191520164004175)

Inference for the seat voice: friendly and specific. Name the element, say what the user loses (orientation, context, trust, care), give one fix. Show no contempt for the builder. Keep the bar high.

---

## 7. Hard "no"s

Each item is his stated rejection, with source.

1. **Static, teleporting transitions that break orientation.** "The static approach feels like digital whiplash." (https://benji.org/family-values)
2. **Duplicated components during a transition.** "A pet peeve of mine is when a component already visible on the screen unnecessarily duplicates itself during an animation." (https://benji.org/family-values)
3. **Motion added for its own sake.** "We didn’t plan to add motion for the sake of it" (https://benji.org/family-values); "if the story gets clearer without it, cut it." (https://github.com/benjitaylor/skills/blob/main/stageshow/references/motion.md)
4. **Glitchy motion in trust-critical flows.** "when my banking app displays a glitchy animation while accessing my checking account, it erodes my trust." (https://benji.org/family-values)
5. **Everything-at-once screens.** "Many complex products often present all features at once, including crypto wallets." (https://benji.org/family-values)
6. **Neglected rare features.** "Many products neglect their less commonly used features." (https://benji.org/family-values)
7. **Streamlining that hides the meaning of an important step.** Wallet apps "might streamline the process, but at the cost of making it feel mundane or glossing over the implications of what is happening." (https://benji.org/family-values)
8. **Delight that slows a frequent task.** Send must be "efficient and enjoyable, without being overbearing." (https://benji.org/family-values)
9. **Crossfades where a transformation is the point.** "Not through crossfades or opacity tricks, but through actual transformation of the underlying shapes." (https://benji.org/morphing-icons-with-claude)
10. **Pops, blank frames and swaps.** "Nothing pops." "No holes or blank frames." "Content that swaps instead of moving" is a recurring fault. (https://github.com/benjitaylor/skills/blob/main/stageshow/references/motion.md, https://github.com/benjitaylor/skills/blob/main/stageshow/SKILL.md)
11. **A loop or flow that plays navigation backwards.** "A loop never plays a navigation backwards. … no product does that." (https://github.com/benjitaylor/skills/blob/main/stageshow/references/motion.md)
12. **Generic AI decoration.** "AI features get no sparkle, wand or star, and no purple as the AI color. Show what the AI does." (https://github.com/benjitaylor/skills/blob/main/stageshow/references/craft.md)
13. **Hand-drawn or mixed icons, emoji as icons, invented logos.** "A glyph drawn by hand is the first tell of generated UI"; "Emoji are content, never icons."; "No invented logo." (https://github.com/benjitaylor/skills/blob/main/stageshow/references/craft.md)
14. **Fake focus rings, translucent overlaps, redundant borders.** "The hero isn't outlined to point at it." "Nothing translucent overlaps." "No redundant tonal borders." (https://github.com/benjitaylor/skills/blob/main/stageshow/references/craft.md)
15. **Rushed adoption of a new system style.** "not rush out a half-baked approach" (Liquid Glass, https://x.com/benjitaylor/status/2065153648255181161)
16. **Settings as a substitute for good defaults.** Inference from "the defaults to be the version you actually ship" (https://benji.org/drawesome) and "we're not adding settings for now" (https://github.com/benjitaylor/agentation/pull/192#issuecomment-5771991763).

---

## 8. Agent skills and AI tooling he publishes or uses

### Published by him

| Item | Owner/repo and path | Install | Status |
|---|---|---|---|
| **Stageshow** skill: faux product UI stills, cursor demos, bento grids, phone demos, with a React kit, gold examples, teaching pairs and film/verify scripts | `benjitaylor/skills`, path `stageshow/SKILL.md` (references in `stageshow/references/`) | `npx skills add benjitaylor/skills --skill stageshow` | Verified 2026-11-03: `npx skills add benjitaylor/skills --list` found 1 skill, `stageshow`. The skill folder has an MIT LICENSE. The repo root has no licence file. Repo created 26 Oct 2026; 1,093 stars. |
| **agentation** skill: sets up the Agentation toolbar and the MCP connection in a Next.js app | `benjitaylor/agentation`, path `skills/agentation/SKILL.md` | `npx skills add benjitaylor/agentation` (his own post, https://x.com/benjitaylor/status/2022380024842850575), or add `--skill agentation` | Verified: `--list` found `agentation` and `agentation-self-driving`. |
| **agentation-self-driving** skill: an agent opens a headed browser and adds design critique annotations through Agentation | `benjitaylor/agentation`, path `skills/agentation-self-driving/SKILL.md` | `npx skills add benjitaylor/agentation --skill agentation-self-driving` | Installs from his repo, but the first commit is by contributor Steve Smith (@stevysmith, 8 Feb 2026). Its critique table ("Headline hierarchy, CTA placement…", "Reference comparable products") is **not** Benji's own voice. |
| **Agentation** npm package plus `agentation-mcp` server: click an element, write a note, paste structured markdown (selectors, positions, computed styles) into any agent | `benjitaylor/agentation`; https://agentation.com | `npm install agentation`; `claude mcp add agentation -- npx -y agentation-mcp server` (from the skill) | "~400,000 monthly installs" (13 Feb 2026, https://x.com/benjitaylor/status/2022380024842850575) |
| Liveline, Drawesome (React components) | `benjitaylor/liveline`, `benjitaylor/drawesome` | `npm install liveline`, `npm install drawesome` | Not skills. Each repo has only a README and no agent rules files. |
| cmdk | `dip/cmdk` (Dip team: Benji Taylor, Dennis Jin, Alex Vanderzon, Paco Coursey; https://dip.org) | `npm install cmdk` | Recent commits are by Paco Coursey and others, not by Benji. |

### AI tools he says he uses

- **Claude Code** (Jan 2026): "I've been experimenting more with Claude Code lately, trying to push the limits of its animation and craft skills." (https://benji.org/morphing-icons-with-claude). "Every animation on this page was built with Claude Code and Agentation." (https://benji.org/agentation)
- **Grok Build** (Jul–Oct 2026): Drawesome was "built over the weekend with Grok Build" (https://x.com/benjitaylor/status/2082539313796182268). The Grok Bot icon: "I made it with Grok Build." (https://x.com/benjitaylor/status/2087227155076046995). Stageshow lists "Grok Build, Claude Code, Codex, Gemini, etc." (https://benji.org/stageshow)
- **Grok Imagine** for Grokipedia covers (https://x.com/benjitaylor/status/2102820884931354776)

### His method for agent design work (useful for building the seat)

- "pointing beats describing." Footnote: "guidelines describe principles; feedback addresses instances." (https://benji.org/annotating)
- "Rules alone only got so far. … Shown an example that does, it gets it right." (https://benji.org/stageshow)
- He never fixes the output himself. He changes the skill and runs again: "Whenever something looked off, I resisted fixing it myself. Instead, I'd write down what was wrong, update the skill, and run the whole round again from scratch." (https://benji.org/stageshow)
- His fresh-eye reviewer gets only the frames, the checklist and the gold examples, "not the builder's plan, not its reasons" (https://github.com/benjitaylor/skills/blob/main/stageshow/references/review.md). Inference: the council seat should get the rendered UI and the diff, not the author's rationale.

No Cursor rules or Figma-to-code workflows from him were found. His repos have `AGENTS.md` and `CLAUDE.md` files (`CLAUDE.md` contains only `@AGENTS.md`). These hold repository process rules, not design rules.

---

## Where the evidence is thin

- **No interviews, podcasts or talks found.** A 2024 post says "Config next week!" (https://x.com/benjitaylor/status/1802762198193930720); no talk by him was found.
- **X-era rationale is thin.** His 2026 X posts announce changes in one or two sentences and seldom explain trade-offs. I could not verify any of his replies to critics of the notification or profile redesigns.
- **No write-ups of Base, Aave App or Lens work by him.** The Aave lesson "onboarding millions of users requires purpose-built experiences, such as savings, rather than generic, open-ended wallet experiences" is Stani Kulechov's text, not Benji's (quoted in https://x.com/benjitaylor/status/2018778639744254243). No evidence ties him to Lens.
- **Base start date conflicts** across secondary sources (2024 vs. late 2025). The primary evidence is the 8 Nov 2025 hiring post and CoinDesk's "CPO … until October 2025".
- **Stageshow is about faux marketing UI**, not product UI. Rules in sections 4 and 7 that come from it are strong evidence of his taste, but their use for product review is Inference.
- **Mobile gesture design**: evidence is moderate (Family NFT gestures, Honk double-tap and haptics, Drawesome phone rail, Stageshow phone rules). There is no essay on gestures.
- **Dribbble** (https://dribbble.com/benjitaylor) shows no usable work.

---

## Sources

**benji.org**
- https://benji.org
- https://benji.org/family-values (8 Jul 2024)
- https://benji.org/honkish (23 May 2025)
- https://benji.org/morphing-icons-with-claude (13 Jan 2026)
- https://benji.org/annotating (16 Jan 2026)
- https://benji.org/agentation (21 Jan 2026)
- https://benji.org/liveline (16 Feb 2026)
- https://benji.org/drawesome (29 Jul 2026)
- https://benji.org/stageshow (31 Oct 2026)

**GitHub**
- https://github.com/benjitaylor/skills (README, AGENTS.md)
- https://github.com/benjitaylor/skills/blob/main/stageshow/SKILL.md
- https://github.com/benjitaylor/skills/blob/main/stageshow/references/craft.md
- https://github.com/benjitaylor/skills/blob/main/stageshow/references/motion.md
- https://github.com/benjitaylor/skills/blob/main/stageshow/references/framing.md
- https://github.com/benjitaylor/skills/blob/main/stageshow/references/review.md
- https://github.com/benjitaylor/skills/blob/main/stageshow/references/verify.md
- https://github.com/benjitaylor/skills/blob/main/stageshow/references/teaching.md
- https://github.com/benjitaylor/agentation (skills/agentation, skills/agentation-self-driving, AGENTS.md)
- https://github.com/benjitaylor/agentation/pull/192#issuecomment-5771991763
- https://github.com/benjitaylor/liveline
- https://github.com/benjitaylor/drawesome
- https://github.com/dip/cmdk, https://dip.org

**X posts by @benjitaylor (date, UTC)**
- 2020-07-13 https://x.com/benjitaylor/status/1282478758901899264
- 2024-02-27 https://x.com/benjitaylor/status/1762508367690670372
- 2024-05-07 https://x.com/benjitaylor/status/1787925407356080192
- 2024-07-08 https://x.com/benjitaylor/status/1810349893116121537
- 2025-05-09 https://x.com/benjitaylor/status/1920894031904600154
- 2025-11-08 https://x.com/benjitaylor/status/1987181897169182935
- 2026-02-03 https://x.com/benjitaylor/status/2018778639744254243
- 2026-02-13 https://x.com/benjitaylor/status/2022380024842850575
- 2026-03-25 https://x.com/benjitaylor/status/2036882102420201832
- 2026-03-25 https://x.com/benjitaylor/status/2036929094697545869
- 2026-03-27 https://x.com/benjitaylor/status/2037621565320475112
- 2026-03-30 https://x.com/benjitaylor/status/2038746605550236148
- 2026-04-01 https://x.com/benjitaylor/status/2039169778091507780
- 2026-04-06 https://x.com/benjitaylor/status/2041234542049341626
- 2026-04-07 https://x.com/benjitaylor/status/2041595272040693912
- 2026-04-13 https://x.com/benjitaylor/status/2043484600232804399
- 2026-06-01 https://x.com/benjitaylor/status/2061492717176385768
- 2026-06-11 https://x.com/benjitaylor/status/2065153648255181161
- 2026-06-12 https://x.com/benjitaylor/status/2065296042053210420
- 2026-06-22 https://x.com/benjitaylor/status/2069095474741834240
- 2026-06-24 https://x.com/benjitaylor/status/2069889157883900276
- 2026-06-25 https://x.com/benjitaylor/status/2070245446749204788
- 2026-07-02 https://x.com/benjitaylor/status/2072817295668531552
- 2026-07-06 https://x.com/benjitaylor/status/2074239146009469429
- 2026-07-16 https://x.com/benjitaylor/status/2077863669283922094
- 2026-07-17 https://x.com/benjitaylor/status/2078191520164004175
- 2026-07-21 https://x.com/benjitaylor/status/2079640001974083933
- 2026-07-27 https://x.com/benjitaylor/status/2081811984081883565
- 2026-07-28 https://x.com/benjitaylor/status/2082137145507254440
- 2026-07-29 https://x.com/benjitaylor/status/2082539313796182268
- 2026-08-05 https://x.com/benjitaylor/status/2085106650416099833
- 2026-08-05 https://x.com/benjitaylor/status/2085124436915868093
- 2026-08-08 https://x.com/benjitaylor/status/2086198190580359223
- 2026-08-11 https://x.com/benjitaylor/status/2087227155076046995
- 2026-08-12 https://x.com/benjitaylor/status/2087603294722269439
- 2026-09-06 https://x.com/benjitaylor/status/2096656821591413161
- 2026-09-19 https://x.com/benjitaylor/status/2101105435046732262
- 2026-09-22 https://x.com/benjitaylor/status/2102443951898992825
- 2026-09-23 https://x.com/benjitaylor/status/2102820884931354776
- 2026-09-30 https://x.com/benjitaylor/status/2105292429372838107
- 2026-10-02 https://x.com/benjitaylor/status/2106138289304650233
- 2026-10-13 https://x.com/benjitaylor/status/2110039872472010775
- 2026-10-21 https://x.com/benjitaylor/status/2112960543397138701
- 2026-10-31 https://x.com/benjitaylor/status/2116593247854453244 (thread: 2116593631876554755, 2116593805441077506, 2116594018998202724, 2116594195096011138)

**Other people's posts and coverage**
- Nikita Bier, 2026-03-25: https://x.com/nikitabier/status/2036882748229771641
- Jesse Pollak quoting Benji, 2025-11-08: https://x.com/jessepollak/status/1987183036161794097
- CoinDesk, 2026-03-25: https://www.coindesk.com/business/2026/03/25/elon-musk-s-x-hires-crypto-savvy-design-lead-as-x-money-payments-push-inches-closer
- The Block, 2026-03-26: https://www.theblock.co/news/business/2026-03-26-elon-musk-taps-benji-taylor-395222
- ForkLog (Avara acquires LFE), 2023-11-17: https://forklog.com/en/aave-companies-rebrands-as-avara-and-acquires-wallet-developer-family/amp
- SpaceXSI rename coverage: https://teslanorth.com/2026/10/04/elon-musk-spacexai-spacexsi-rename/
- Post indexes: https://posts.design/authors/benji-taylor, https://superx.so/creators/benjitaylor
- Notification coverage: https://roboin.io/article/en/2026/06/24/x-updates-in-app-notification-design/

---

## Update 2026-11-03: recent posts

Source: 99 of his own X posts, 2026-08-01 to 2026-11-03, read through the fxtwitter timeline API. Quotes are verbatim.

- Preview before save: "see how your profile will look to others before you hit save" (https://x.com/benjitaylor/status/2116227521645588644)
- In place (2 posts): "a quick overview of an account, without interrupting your current context" (https://x.com/benjitaylor/status/2086543562758303893). Also: "Tapping now shows a tooltip with a seamless way to add to a folder." (https://x.com/benjitaylor/status/2083357235737153881)
- Parity (3 posts): "This is part of our broader push for more parity across platforms." (https://x.com/benjitaylor/status/2096305944208748890)
- Rare screens (2 posts): "a screen you see a lot when connecting your Grok Bot to other apps. No more plain black screen!" (https://x.com/benjitaylor/status/2108367328396370074)
- Motion, for the Emil handoff: he quoted "If it can be animated in code, it probably should be animated in code" and said "more pertinent than ever" (https://x.com/benjitaylor/status/2103647152174162226).
- Tone: "The reward for making something good is a longer list of things you now know are wrong with it" (https://x.com/benjitaylor/status/2095911324777893999)
