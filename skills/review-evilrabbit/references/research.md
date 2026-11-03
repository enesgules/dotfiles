# Evil Rabbit (evilrabbit / @evilrabbit_): visual design reviewer research

Research date: 2026-10-30. The research looks mostly at Jun 2025 to Oct 2026. Older material is used only where it still shapes his current work.

Method:
- Web: his site evilrabbit.com, the Vercel blog, the Geist docs (vercel.com/geist/*), vercel.com/design, basement.studio posts, the Indent interview (read from the Wayback Machine because the live page gives 404), and the Dive Club podcast (YouTube auto-caption transcript, 51 min).
- X: about 320 of his own posts, Jun 2026 to Oct 2026, pulled through the fxtwitter API. Older posts were found with web search and then read through fxtwitter.
- GitHub (gh CLI): his profile, his 6 repos, `gh search issues --commenter=evilrabbit`, `gh search prs --reviewed-by=evilrabbit` and `--author=evilrabbit`. I read the review bodies on 10 PRs. I also read the contributor lists and first commits of vercel/geist-font and vercel-labs/web-interface-guidelines.
- Verification: I checked each quote with a fixed-string grep against the text I downloaded. Podcast quotes come from YouTube auto-captions. The captions spell "Vercel" as "Versel", so I write [Vercel] in brackets where I changed that word. All other words are the caption words.
- "Inference" marks anything I conclude that he did not say.

How much first-hand material exists: little written material, but more spoken material than earlier summaries suggest.
- 1 long podcast (Dive Club, 2026-09-02). This is the richest source on his taste and on how he critiques.
- 1 written Q&A (Indent, 2024-02-16). The answers are general and formal.
- 2 blog posts: Geist Pixel (2026-02-06, he is the only author) and Geist Serif (2026-10-30, with Mark Davis).
- Short X posts. Most are social or about football. About 10 contain a design opinion.
- GitHub review comments: almost none. His reviews are approvals with no text, plus "Neat!" ([next.js#5104](https://github.com/vercel/next.js/pull/5104)) and "😍" ([next.js#8235](https://github.com/vercel/next.js/pull/8235)). There is no written design review on GitHub that you can learn his phrasing from.

---

## 1. Who he is and current focus (with dates)

He is a designer from Buenos Aires who now lives in San Francisco. He is the Founding Designer of ZEIT/Vercel (since 2016) and the person behind the Vercel and ZEIT visual identity. Before that, he was Head of Design (Latin America) at Viacom 2010-2014, Product Designer at Aerolab 2014-2015, and Product Designer at Auth0 2015-2016 ([evilrabbit.com](https://evilrabbit.com)). In 2014 he redesigned Popcorn Time ([popcorn-artworks#3](https://github.com/popcorn-official/popcorn-artworks/issues/3), [podcast 8:30-11:00](https://www.youtube.com/watch?v=WxNGjChnRhE)). vercel.com/design lists him as "Evil Rabbit @ evilrabbit_ Brand Designer USA" ([vercel.com/design](https://vercel.com/design)).

He has no new company. He is still at Vercel. His new title is Head of Creative Studio: "A few months ago, I stepped into the role of Head of Creative Studio, a new team at Vercel focused on shaping the future of our brand." ([X, 2026-09-29](https://x.com/evilrabbit_/status/2105062376575992090)). On the podcast he says that the creative/brand team moved under marketing, and that he reports to both the chief product officer and the CMO ([podcast 27:00-28:00](https://www.youtube.com/watch?v=WxNGjChnRhE)). The team now builds internal tools (generators for OG images, profile pictures, billboards and motion), not single assets: "It's all agentic design, with quality and craft in mind." ([X, 2026-09-29](https://x.com/evilrabbit_/status/2105062670001201169)).

He is also an angel investor in Ato, CodeCrafters, Langbase, Paper and Puma Browser ([evilrabbit.com](https://evilrabbit.com)).

Timeline, newest first:

| Date | Work | Evidence |
|---|---|---|
| 2026-10-30 | Geist Serif released. The blog post says it "began as a set of sketches by Evil Rabbit". He co-wrote the post with Mark Davis | [vercel.com/blog/introducing-geist-serif](https://vercel.com/blog/introducing-geist-serif), [X](https://x.com/evilrabbit_/status/2116186174301811025) |
| 2026-10-28 | "Initial prototype. Things are getting serious." with @_bgwoodruff. The project is not named | [X](https://x.com/evilrabbit_/status/2115236244380852597) |
| 2026-09-29 | Says in public that he is Head of Creative Studio. Hiring a brand designer and a presentation designer | [X](https://x.com/evilrabbit_/status/2105062376575992090) |
| 2026-09-02 | Dive Club podcast, E180, "The story of Evil Rabbit and designing Vercel" | [YouTube](https://www.youtube.com/watch?v=WxNGjChnRhE), [rss.com](https://rss.com/podcasts/diveclub/3114925/) |
| 2026-08-18 | Brand and website for fx, Vercel's "tiny, open, native coding agent", made with Guillermo Rauch and others | [X](https://x.com/evilrabbit_/status/2089834511836332467), [fx.sh](https://fx.sh) |
| 2026-08-09 | PR on Aerolab/silicon-baires (an isometric Buenos Aires): the Vercel HQ building becomes near-black | [Aerolab/silicon-baires#6](https://github.com/Aerolab/silicon-baires/pull/6) |
| 2026-07-22 to 07-31 | Lifeline, open source: "A timeline component for the stories that unfold over time". Ships as a shadcn registry. 546 stars | [evilrabbit/lifeline](https://github.com/evilrabbit/lifeline), [X 2026-07-26](https://x.com/evilrabbit_/status/2081188576939892971) |
| 2026-07-05 | Geist Pixel on Google Fonts | [X](https://x.com/evilrabbit_/status/2073883327958863933) |
| 2026-06-26 | a16z Design Engineering Fellowship (inaugural cohort) | [X](https://x.com/evilrabbit_/status/2070643899610075603) |
| 2026-06-25 | Lifeline first shown: "Fast. Super lean. Just a few KB." | [X](https://x.com/evilrabbit_/status/2070201771226738940) |
| 2026-06-17 | eve (Vercel's agent framework) launched. His own timeline says "Designed Eve's brand, the framework for building agents." | [lib/evilrabbit.ts](https://github.com/evilrabbit/lifeline/blob/main/lib/evilrabbit.ts), [X](https://x.com/evilrabbit_/status/2067180128786895326) |
| 2026-04-01 | First Geist Serif prototype shared | [Geist Serif post](https://vercel.com/blog/introducing-geist-serif) |
| 2026-02-06 | "Introducing Geist Pixel". He is the only author of the post. His timeline says "Directed Geist Pixel" | [vercel.com/blog/introducing-geist-pixel](https://vercel.com/blog/introducing-geist-pixel) |
| 2025 | "v0 Mobile App Design." (his own timeline data) | [lib/evilrabbit.ts](https://github.com/evilrabbit/lifeline/blob/main/lib/evilrabbit.ts) |
| 2025-05-29 | Geist 1.5.0 (Vercel + basement.studio) | [X](https://x.com/evilrabbit_/status/1927922817573548065) |
| 2024-11-07 | Geist on Google Fonts | [X](https://x.com/evilrabbit_/status/1854567176545747455) |
| 2023-10 | Geist Sans and Mono released. His timeline says "Directed Geist" | [lib/evilrabbit.ts](https://github.com/evilrabbit/lifeline/blob/main/lib/evilrabbit.ts) |
| 2022 | "Shipped the Next.js rebrand." and designed the Next.js Conf '22 site. basement.studio (Mateo Zaragoza) drew the Next.js logo | [lib/evilrabbit.ts](https://github.com/evilrabbit/lifeline/blob/main/lib/evilrabbit.ts), [basement.studio](https://basement.studio/post/nextjs-logo-redesign) |
| 2020-04-21 | ZEIT became Vercel. "We decided to retain our signature triangle logo, although we have simplified it." (Vercel blog; the post does not name an author for the logo) | [vercel.com/blog/zeit-is-now-vercel](https://vercel.com/blog/zeit-is-now-vercel) |

Authorship notes (do not overstate his part):
- Geist Sans and Mono: "created in collaboration with Basement Studio". Geist Pixel: with Andrés Briganti. Geist Serif: with Andrés Briganti and Mark Davis ([vercel/geist-font README](https://github.com/vercel/geist-font)). He has no commits in vercel/geist-font. His role was direction and, for Serif, the first sketches.
- People call him the creator of the Vercel logo. I found this only in third-party posts ([X, @extraordinary](https://x.com/extraordinary/status/1844526806730408359)) and in his own words on the podcast about building the triangle brand. No Vercel document credits the logo to him.
- Third-party prior art: [tylergibbs1/evilrabbitdesin](https://github.com/tylergibbs1/evilrabbitdesin) (created 2026-06-26) is an agent skill made from Geist docs and the Geist Pixel post. It says "He gives almost no interviews." That was true before the Dive Club podcast. It is not true now.

---

## 2. Design values

1. **The product must be neutral and stay out of the way.** He learned this from Guillermo Rauch: "when you create a product that feels neutral enough it is transparent" ... "It's not in your face." ([podcast 20:58-21:10](https://www.youtube.com/watch?v=WxNGjChnRhE)). Simplicity was also his first answer in 2024: "Complexity can often lead to confusion and frustration. We believe in keeping things simple." ([Indent](https://web.archive.org/web/20241209202918/https://indent.com/blog/tasting-notes-from-vercel-evil-rabbit)).

2. **Monochrome and dark are the brand. Too much color is a defect.** He describes the "brand keepers" he trained: "Hey, I wouldn't use that much color here. Hey, I would make this more minimal." and "Hey, this is not monochrome enough." Others now say "it's not dark enough" and "too much color." ([podcast 49:00-49:50](https://www.youtube.com/watch?v=WxNGjChnRhE)). His 2024 taste prompt: "Utilize black and white geometric shapes inspired by brutalist architecture, interwoven with elements of Swiss design typography and the Bauhaus style." ([Indent](https://web.archive.org/web/20241209202918/https://indent.com/blog/tasting-notes-from-vercel-evil-rabbit)).

3. **But he does not want people to copy the black-and-white look as a trend.** "we turned the internet black and white, dithering, particles, ASCII everywhere. Maybe it's time to step into the light." ([X, 2026-04-07](https://x.com/evilrabbit_/status/2041615578922938484)). Inference: in a review he will ask "what is your idea?" before he praises a monochrome screen.

4. **Remove structure until the main task is fast.** Popcorn Time: "the first thing I did was I killed the sidebar." He kept "the essence of the app" so that "in less than three clicks, you pick a category, you select the movie, and you were watching the movie." ([podcast 9:51-10:10](https://www.youtube.com/watch?v=WxNGjChnRhE)). About Vercel's new sidebar: "everybody is now moving to cybars [sidebars]. Not that happy." ([podcast 12:53](https://www.youtube.com/watch?v=WxNGjChnRhE)).

5. **A symbol with conviction: the mark must work alone.** "I strongly believed the triangle could stand on its own as our symbol. Building a brand requires consistency and conviction." ([X, 2026-06-20](https://x.com/evilrabbit_/status/2068399262237708334)). "You don't need to read [Vercel] to actually feel [Vercel]" ([podcast 19:57](https://www.youtube.com/watch?v=WxNGjChnRhE)).

6. **A system, not one-off pieces.** Billboards and other assets follow "the same grid, the same alignment, everything." ([podcast 31:38](https://www.youtube.com/watch?v=WxNGjChnRhE)). The profile picture tool gives "the right uh contrast, the right grayscale, you know, balance" ([podcast 32:56](https://www.youtube.com/watch?v=WxNGjChnRhE)). In the post he wrote: "Geist Pixel isn't a novelty font. It's a system extension." ([Geist Pixel](https://vercel.com/blog/introducing-geist-pixel)).

7. **Constraints are the tool, and craft is work done by hand.** "Constraints weren't a limitation, they were the design tool." "Although Geist Pixel is grid-based, it wasn't generated mechanically." ([Geist Pixel](https://vercel.com/blog/introducing-geist-pixel)). With AI tools, the human still directs: "it was me who directed the agent. It was me who tested the output." ([podcast 35:20](https://www.youtube.com/watch?v=WxNGjChnRhE)).

8. **Usability, accessibility and speed come before aesthetics.** "design should always prioritize user experience over aesthetics" and "I place a strong emphasis on accessibility in design, ensuring that digital products are usable by everyone." Also: "a positive user experience requires a fast product that reacts at the speed of user interaction" ([Indent](https://web.archive.org/web/20241209202918/https://indent.com/blog/tasting-notes-from-vercel-evil-rabbit)).

9. **A brand is every detail, not the logo.** "Building a brand is everything you do. How your product feels, how you talk, how you treat people, and how much you care about the details." ([X, 2026-09-26](https://x.com/evilrabbit_/status/2103985074173821187)). He also distrusts polish that has no purpose: "today's design world celebrates tiny micro-interactions more than meaningful UX and UI innovations." ([X, 2026-06-16](https://x.com/evilrabbit_/status/2066937291717874106)).

10. **Few ingredients, with Swiss grid roots.** "You can create something incredible with only a few ingredients and a simple technique." His books include *Grid Systems in Graphic Design*. His influences include Josef Müller-Brockmann, David Carson and Jony Ive ([Indent](https://web.archive.org/web/20241209202918/https://indent.com/blog/tasting-notes-from-vercel-evil-rabbit)).

---

## 3. Visual traits of his shipped work (verifiable)

Brand marks
- The Vercel symbol is a solid triangle. It "can be used as a Unicode symbol (▲ U+25B2)". The clear space around the logo "is defined by the height of our symbol" ([Geist brands](https://vercel.com/geist/brands)). He uses ▲ as a text glyph in posts ("▲ Geist Pixel is now available on Google Fonts.").
- The ZEIT triangle was "simplified" for Vercel in 2020 ([blog](https://vercel.com/blog/zeit-is-now-vercel)). Vercel launched a website with only the triangle and no wordmark. He says: "we did that in purpose because we wanted people to remember, you know, that the triangle is [Vercel]" ([podcast 19:53](https://www.youtube.com/watch?v=WxNGjChnRhE)).
- ZEIT brand: geometric shapes, one per product. The triangle stood for time ("Zeit"). "We use geometrical shapes to represent our, you know, original products." ([podcast 21:16](https://www.youtube.com/watch?v=WxNGjChnRhE)). In the early days he posted the triangle almost every day "with a different texture different treatment" ([podcast 19:00](https://www.youtube.com/watch?v=WxNGjChnRhE)). So the treatment changes, but the shape stays the same.

Palette
- Black, white and grays. Color is the exception. See the "brand keeper" quotes above.
- fx.sh (Aug 2026, his brand and site work): only grays (#000, #fff, #262626, #444, #626262, #8a8a8a, #9e9e9e, #d0d0d0, #eee). Only Geist Mono. The page starts with a `curl` install command and a live CLI demo (my check of the page source, 2026-10-30).
- His portfolio code ([evilrabbit/main](https://github.com/evilrabbit/main)): the dark background is pure black (`--background: 0 0% 0%`), secondary text is `#666`, and borders and outlines are 1px `#333`. A "high-contrast theme" was added in May 2026 ([PR #5](https://github.com/evilrabbit/main/pull/5)).
- Lifeline: only achromatic `oklch(L 0 0)` tokens (the shadcn neutral base), zinc grays for labels, black on hover ([globals.css](https://github.com/evilrabbit/lifeline/blob/main/app/globals.css)).
- Silicon Baires PR: the HQ is made near-black (#232528), the marks on it change to white, and one scarlet title stays as "the one warm thing left in the shot" ([PR #6](https://github.com/Aerolab/silicon-baires/pull/6)). Inference: the long PR text reads as if an agent helped write it. Use it as evidence of his decisions, not of his wording.

Type
- Geist family: Sans ("modern, geometric typeface that is based on the principles of classic Swiss typography"), Mono, Pixel and Serif ([README](https://github.com/vercel/geist-font)).
- Geist Pixel: "a strict pixel grid". 5 variants (Square, Grid, Circle, Triangle, Line), 480 glyphs, "Vertical metrics aligned with Geist and Geist Mono", "Horizontal metrics use a semi-mono approach" ([post](https://vercel.com/blog/introducing-geist-pixel)).
- Geist Serif: high-contrast display serif. "we thinned every downstroke by 50% and tightened the sidebearings". It has the same cap height (710) and x-height (530) as Sans: "Mix Sans, Mono, Pixel, and Serif in the same sentence and every word looks the same size." It has a Triangle variant ("a nod to the Vercel logo"), and "The eye of the g, for example, is tilted exactly 7°." ([post](https://vercel.com/blog/introducing-geist-serif)).
- His own UI: Geist Sans in Lifeline. Small uppercase labels: `text-[11px] uppercase tracking-[0.08em]`. `tabular-nums` for years ([lifeline components](https://github.com/evilrabbit/lifeline/tree/main/components/lifeline)). His portfolio still uses Inter for body text, with Geist only as a variable ([layout.tsx](https://github.com/evilrabbit/main/blob/main/app/layout.tsx)).

Geometry, grid, density
- Lines are hairlines. Lifeline is one 1px rail (`h-px` / `w-px`) with markers on it. It is horizontal and moves with scroll on desktop, and it is vertical on mobile ([README](https://github.com/evilrabbit/lifeline)).
- His portfolio is one column (`max-w-[700px]`) with generous vertical rhythm (`mb-12`, `my-12`) and `rounded-lg` cards ([page.tsx](https://github.com/evilrabbit/main/blob/main/app/page.tsx)).
- Early ZEIT site: "brutalist like it was monospace font you know the terminal" ([podcast 20:44](https://www.youtube.com/watch?v=WxNGjChnRhE)). The first billboard: "The very first billboard was a terminal command to install our AI package" ([podcast 22:53](https://www.youtube.com/watch?v=WxNGjChnRhE)).
- Current Vercel marketing uses a visible grid with guide lines. Geist docs call the grid "A huge part of the new Vercel aesthetic." ([Geist intro](https://vercel.com/geist/introduction)). This is Vercel documentation. It does not name him.

Iconography
- His icon work is mostly brand marks: the ▲ and the shapes for ZEIT products, Hyper app icons ([vercel/hyper#3466](https://github.com/vercel/hyper/pull/3466), 2019), and the "Vercel badge" ([next.js#15946](https://github.com/vercel/next.js/pull/15946), 2020).
- Lifeline uses `lucide-react` for UI icons, so he did not draw a custom icon set for it. The Geist icon set ("Icon set tailored for developer tools", [vercel.com/geist](https://vercel.com/geist/introduction)) does not credit him. Do not say he made it.

Motion
- His own motion is small and quiet. Lifeline draws its rail with `scaleX` and fades markers in from 6px below. Color and opacity transitions take 300ms. Images and media appear on hover ([globals.css](https://github.com/evilrabbit/lifeline/blob/main/app/globals.css)). His portfolio: a 0.5s ease-out fade with a 10px rise.
- He gives larger motion work to specialists (Luis Gutierrez Rico on Geist Pixel and Serif, basement.studio on Ship intros). He says: "We let them cook." ([podcast 0:08](https://www.youtube.com/watch?v=WxNGjChnRhE)).
- Easter eggs are part of the brand: "You know how much we love Easter eggs." ([X, 2026-10-30](https://x.com/evilrabbit_/status/2116216632402133243)). He was happy that his item on Backyard Designers was `Less`, "which turns the entire page grayscale" ([X, 2026-07-31](https://x.com/evilrabbit_/status/2083071262859862044)).

---

## 4. Critique checklist for a web UI review in his spirit

Tags: **[own]** = his own words support it (the link is in sections 2-3). **[work]** = inferred from his shipped work. **[Vercel]** = from Vercel/Geist docs, not linked to him personally.

1. **Too much color?** Remove every hue that does not carry meaning. Ask if the screen can be monochrome. [own]
2. **Does it speak the brand?** If the screen could belong to any company, say "this cannot go out" and say why. [own]
3. **Could it be more minimal?** Name the element to remove, not just "simplify". [own]
4. **Is the UI neutral?** The user's content and task must be stronger than the chrome. Decoration that competes with content is a defect. [own]
5. **Count the clicks** for the main task. Aim for three or fewer. [own: Popcorn Time]
6. **Question the sidebar.** Is a sidebar the right pattern, or is it there because everyone uses one now? Could a horizontal nav do the job? [own]
7. **Mark check:** does the symbol work alone at small size, without the wordmark? Is the clear space equal to the symbol height? Is the mark unmodified? [own + Vercel]
8. **Same grid, same alignment:** does this screen use the grid of the rest of the system? Does each element align to something? [own; also Vercel WIG "Deliberate alignment"]
9. **System extension or gimmick?** A new font, texture or effect must keep the metrics, rhythm and alignment of the system. If it is only decoration, remove it. [own: Geist Pixel post]
10. **Few typefaces, shared metrics.** Use sans for UI, mono for code, commands and data. A display face only for large sizes. When you mix faces, cap height and x-height must match. [own: Geist Serif post, co-written; work]
11. **Small labels:** use small uppercase labels with wide tracking for metadata, and tabular numbers for years, dates and figures. [work: Lifeline; Vercel Geist typography]
12. **Image treatment:** do the photos and avatars share one contrast and one grayscale balance? [own]
13. **Hairlines, not heavy boxes:** use 1px borders in low-contrast gray, and draw each border once. Do not use opaque shadows. [work + Vercel Geist colors]
14. **One focal accent at most.** Two lit or colored elements fight, and neither wins. [work: silicon-baires PR, wording possibly agent-assisted]
15. **Developer surfaces:** show the real command (`npx …`, `curl …`) in mono, as the hero if possible. [own: billboards, fx]
16. **Fast and light:** does it react at the speed of interaction? How many KB? [own: Indent, Lifeline post]
17. **Accessibility before aesthetics:** keep contrast, keep a high-contrast theme, keep usability for everyone. [own]
18. **Micro-interaction check:** does this animation help the user, or is it polish for screenshots? [own]
19. **Trend check:** is black-and-white, dithering, particles or ASCII here only because everyone does it? Ask for the idea behind it. [own]
20. **Details as brand:** check copy tone, empty states, and Easter eggs. "how much you care about the details" is the brand. [own]

---

## 5. Tone and phrasing

The facts:
- In speech he is warm, fast and informal ("dude", "man", "you know"). He tells stories more than he lists rules.
- He critiques as a brand guardian, with short imperatives in direct speech: "Hey, this cannot go out." He states the reason in brand terms, for example "not speaking [Vercel]".
- He gives a lot of credit ("The one and only…", "GOAT", 🤍 🖤), and he names every collaborator on a launch.
- When he praises work on X, he uses one short line.
- He likes a dry, cocky closing line.

Verbatim examples:
- "Hey, this cannot go out. This is not it's not speaking [Vercel]. Hey, this is not monochrome enough." ([podcast 49:27](https://www.youtube.com/watch?v=WxNGjChnRhE))
- "Hey, I wouldn't use that much color here. Hey, I would make this more minimal." ([podcast 49:02](https://www.youtube.com/watch?v=WxNGjChnRhE))
- "Let's start with the things that you hate and then we go from there." (how he asked the community for feedback, [podcast 24:02](https://www.youtube.com/watch?v=WxNGjChnRhE))
- "Building a brand goes far beyond designing a logo. But you're not ready for that conversation." ([X, 2026-09-26](https://x.com/evilrabbit_/status/2103971178159472724))
- "Everybody can cook. Some of us just happened to spend the last decade serving triangles." ([X, 2026-07-01](https://x.com/evilrabbit_/status/2072379336817021409))
- "From a branding perspective, this is the right move. No need for a new icon. Just one X to rule them all." ([X, 2026-10-10](https://x.com/evilrabbit_/status/2109000223041499421))
- "Sick brand work." ([X, 2026-05-29](https://x.com/evilrabbit_/status/2060196367444967894)) / "Apple style is unmatched." ([X, 2026-07-05](https://x.com/evilrabbit_/status/2073771472867201448))
- About saying no: "one of the hardest things ... is actually to say no to these incredible ideas" ([podcast 17:58](https://www.youtube.com/watch?v=WxNGjChnRhE))
- About teams: "there's always time to say, "Hey, I think we want it's too crazy. Maybe, you know, not for this release." ([podcast 40:25](https://www.youtube.com/watch?v=WxNGjChnRhE))

Inference for the persona voice: short, direct and positive. Give a clear verdict ("this cannot ship" or "this is it"), then one reason in brand or user terms, then the cut to make. Do not lecture. Give credit to good work by name.

---

## 6. Hard "no"s

- Color without a reason, and screens that are "not monochrome enough" or "not dark enough" for a monochrome brand. [own]
- Work that does not "speak" the brand. It "cannot go out". [own]
- Aesthetics that harm usability: "design should always prioritize user experience over aesthetics". [own]
- Novelty and gimmick elements outside the system. Geist Pixel was designed "not as a visual gimmick". [own]
- Output that a machine made and nobody refined by hand. Craft is manual refinement of "visual noise, uneven weight distribution, and awkward diagonals". [own]
- Changing the marks. "Do not modify the Vercel marks." [Vercel brand guidelines]
- Following trends by reflex: sidebars because "everybody is now moving" to them, or black and white with dithering and ASCII because every company does it. [own]
- Micro-interactions as the goal instead of real UX and UI improvement. [own]
- Overlapping alpha borders and opaque shadows. "Overlapping alpha borders make intersections stand out." "Opaque shadows leave a gray halo." [Vercel Geist colors docs, not attributed to him]

---

## 7. Related Vercel material (attribution)

- **Web Interface Guidelines** ([vercel.com/design/guidelines](https://vercel.com/design/guidelines), [vercel-labs/web-interface-guidelines](https://github.com/vercel-labs/web-interface-guidelines)): John Pham made the first commit on 2025-09-10 and has 43 of about 60 commits. Evil Rabbit is not a contributor. Rauno Freiberg had published an earlier list with the same name (interfaces.rauno.me). Do not credit it to Evil Rabbit. Rules that matter for visual review: "Optical alignment.", "Deliberate alignment.", "Balance contrast in lockups.", "Layered shadows.", "Crisp borders.", "Nested radii.", "Hue consistency.", "Interactions increase contrast.", "Tabular numbers for comparisons.", "Redundant status cues."
- **Geist design system** ([vercel.com/geist](https://vercel.com/geist/introduction)): Vercel docs. No named author. Color rules: "Gray for text, icons, fills, borders, and dividers by default." "Background 2 should be used sparingly". "Draw each border once". Materials: radius 6px for base surfaces, 12px for menus and modals, 16px for fullscreen. "Favor the lowest elevation that still reads as elevated against its background". Grid: "Don't nest Grids more than one level".
- **"Teaching agents product design at Vercel"** ([blog, 2026-06-25](https://vercel.com/blog/teaching-agents-product-design-at-vercel)) is by John Phamous, not by Evil Rabbit. It has an operating contract ("Use evidence, not taste.", "Decide before decorating."). It is institutional material.

---

## 8. Sources

First-hand (his words)
- Dive Club E180, "Evil Rabbit - The story of Evil Rabbit and designing Vercel", 2026-09-02: https://www.youtube.com/watch?v=WxNGjChnRhE (auto-captions), https://rss.com/podcasts/diveclub/3114925/
- Indent, "Tasting Notes from Evil Rabbit", 2024-02-16: https://web.archive.org/web/20241209202918/https://indent.com/blog/tasting-notes-from-vercel-evil-rabbit (the live URL gives 404)
- Vercel blog, "Introducing Geist Pixel" (author: Evil Rabbit), 2026-02-06: https://vercel.com/blog/introducing-geist-pixel
- Vercel blog, "Introducing Geist Serif" (authors: Evil Rabbit, Mark Davis), 2026-10-30: https://vercel.com/blog/introducing-geist-serif
- X posts (all read via api.fxtwitter.com): 2116186174301811025, 2116216632402133243, 2115236244380852597, 2109000223041499421, 2105062376575992090, 2105062670001201169, 2103971178159472724, 2103985074173821187, 2089834511836332467, 2083071262859862044, 2081188576939892971, 2073883327958863933, 2073771472867201448, 2072379336817021409, 2070201771226738940, 2068399262237708334, 2067180128786895326, 2066937291717874106, 2060196367444967894, 2041615578922938484, 2019841222043648273, 1927922817573548065, 1854567176545747455. URL form: https://x.com/evilrabbit_/status/ID
- His own timeline data: https://github.com/evilrabbit/lifeline/blob/main/lib/evilrabbit.ts
- His site: https://evilrabbit.com

His shipped code and work
- https://github.com/evilrabbit/lifeline (globals.css, components/lifeline/*), https://lifeline.evilrabbit.com
- https://github.com/evilrabbit/main (portfolio, PRs #3-#9)
- https://github.com/Aerolab/silicon-baires/pull/6
- https://fx.sh
- https://github.com/vercel/geist-font (README, contributors)
- GitHub review history: https://github.com/vercel/next.js/pull/5104, https://github.com/vercel/next.js/pull/8235, https://github.com/vercel/next.js/pull/48601, https://github.com/vercel/vercel/pull/3790, https://github.com/vercel/og-image/pull/101, https://github.com/popcorn-official/popcorn-artworks/issues/3
- https://dribbble.com/evilrabbit (older work, 2014-2019: Hyper, Now Desktop, ZEIT dashboard)

Vercel / institutional
- https://vercel.com/design, https://vercel.com/geist/introduction, https://vercel.com/geist/colors, https://vercel.com/geist/typography, https://vercel.com/geist/materials, https://vercel.com/geist/grid, https://vercel.com/geist/brands
- https://vercel.com/blog/zeit-is-now-vercel (2020-04-21)
- https://github.com/vercel-labs/web-interface-guidelines, https://vercel.com/design/guidelines
- https://vercel.com/blog/teaching-agents-product-design-at-vercel (John Phamous, 2026-06-25)

Secondary
- basement.studio, "The Birth of Geist", 2024-11-14: https://basement.studio/post/the-birth-of-geist-a-typeface-crafted-for-the-web
- basement.studio, "Next.js Logo Redesign", 2022-09-08: https://basement.studio/post/nextjs-logo-redesign
- Backyard Designers roster card ("THE MINIMALIST"): https://backyarddesigners.club/roster/evilrabbit_/
- Third-party skill (prior art, not his): https://github.com/tylergibbs1/evilrabbitdesin

Sources that failed or were thin: the live Indent page (404, so I used the Wayback copy); vercel.com/about/evilrabbit (the page loads the dashboard shell, no bio text); a Spanish-language search for interviews found nothing new; the X timeline before Jun 2026 was not fully read (see the note below).
