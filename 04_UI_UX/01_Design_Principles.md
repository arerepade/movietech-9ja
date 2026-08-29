# Design Principles

| | |
|---|---|
| **Status** | Draft — foundational |
| **Owner** | _unassigned_ |
| **Last updated** | 2026-08-09 |
| **Applies to** | Every simulation, screen, component, and interaction on the platform |
| **Related** | [Simulation Realism](18_Simulation_Realism.md) · [Design Tokens](03_Design_Tokens.md) · [Accessibility](17_Accessibility.md) · [Data](../06_Data/) · [Legal](../09_Legal/) |

## Purpose

This document exists to **settle arguments**. When two people disagree about a screen, this is what they consult.

It is deliberately opinionated. Every principle below either rules something out or resolves a conflict — if a statement here would be equally true of a banking app, an airline booking site, and a note-taking tool, it does not belong in this document.

## How to use it

1. **Check the non-negotiables.** These are gates, not trade-offs. A design that violates one is rejected regardless of how good it looks.
2. **Apply the ranked principles.** They are numbered by priority. When two conflict, **the lower number wins.** No exceptions without a written decision in [`04_Decision_Log.md`](../00_Project_Management/04_Decision_Log.md).
3. **Consult the named tensions.** The hard cases are already decided below. Don't re-litigate them per screen.

---

## Vision

We build the world's most convincing interactive software simulations for film, television, advertising, education, and creative production.

We are not building business software. We are building software that **looks, feels, and behaves like real software** while remaining safe, fictional, and optimised for storytelling.

Whether the simulation is a police department, a hospital, a security operations centre, an airline, a bank, or an intelligence agency, every screen must read as though it was built for daily use by people with a job to do.

**Guiding principle: design for credibility first. Everything else is secondary.**

---

## Non-negotiable constraints

These are not weighed against other goals. A design that breaks one does not ship.

### N1 — Everything is fictional

No real agency names, seals, crests, logos, wordmarks, or badge designs. No real institution's branded interface reproduced closely enough to be mistaken for it.

Every organisation in a simulation is invented and internally consistent: it has its own name, mark, colour, and typographic voice, designed by us. Real-world agencies are **reference material for the visual language, never source assets.**

> Real seals, service marks, and agency names carry legal restrictions in most jurisdictions and generally require production-level clearance. Our default is fictional, always. If a client has cleared real marks for a specific production, that is a per-engagement exception documented in [`09_Legal`](../09_Legal/) — not a design decision.

### N2 — No real personal data, ever

Every name, face, address, phone number, national ID, account number, licence plate, medical record, and IP address is synthetic.

Identifiers must be **plausible in format but provably invalid**: reserved documentation IP ranges, phone numbers from reserved fiction blocks, checksum-failing ID numbers. A viewer must not be able to pause the frame and dial a real number or look up a real person.

Photographs are licensed or generated. No scraped faces.

### N3 — Nothing operable is real

Command syntax, exploit payloads, protocol handshakes, banking instructions, and dispatch codes are **plausible fiction**. They read correctly to a knowledgeable viewer and do nothing if typed into a real system.

This applies most sharply to the cybersecurity catalogue. A terminal that shows working technique is a different — and unacceptable — product from one that shows convincing technique.

### N4 — The simulation cannot leak the platform

No product branding, no build numbers, no debug output, no placeholder lorem, no "TODO", no default component-library styling visible in frame. Inside a simulation, our platform does not exist.

---

## The ranked principles

### 1. Credibility first

A professional in the depicted field should look at the screen and recognise it as software their world would produce.

That means inheriting real conventions: the density, the terminology, the odd information architecture that comes from a system built over fifteen years by six teams. Not a clean-slate redesign of what the job *should* look like.

**Rules out:** invented terminology where a real term exists; org charts and workflows that no institution would actually adopt; screens designed around what looks good rather than what the work requires.

**Test:** would a practitioner say "that's not how it works"? If yes, we failed.

### 2. Legible in frame

**When authenticity and on-camera legibility conflict, legibility wins.**

This is the single most important trade-off in the product, so it is decided here once. Real enterprise software is 11px, low contrast, and dense. That is authentic and it is unusable on camera. We build a *heightened* version: the same information architecture and visual grammar, scaled and contrasted for capture.

Practically:
- Type sizes scaled up from the real-world reference. Body text should survive a wide shot, not just a screen insert.
- Contrast well above the reference. Grey-on-grey enterprise chrome flattens to mush under camera compression.
- Weights kept off hairline. Thin strokes alias, shimmer, and break up at capture.
- Element counts reduced where the reduction is invisible — fewer rows, fewer toolbar icons, fewer simultaneous panels than the real thing, while keeping the *impression* of density.
- The one thing the scene needs must be findable in about two seconds by someone who has never seen the screen.

> Specific numbers — minimum type size by capture resolution, contrast floors, safe weight ranges — belong in [`05_Typography.md`](05_Typography.md) and [`04_Color_System.md`](04_Color_System.md), and must be **validated by a real camera test**, not chosen at a desk. Treat any figure written before that test as provisional.

### 3. Serves the scene

The screen is a supporting actor. It exists to advance a story, not to serve a user.

This inverts a rule from conventional product design. Normally, function precedes appearance. Here, **appearance in frame is a function.** A chart that reads instantly as a chart in a two-second cutaway beats a chart that communicates its data accurately over thirty seconds of study.

Every screen should answer: what does the audience need to understand, and how fast? Then it should carry that meaning without dialogue explaining it.

**Rules out:** decoration that carries no story or credibility weight; information hierarchies optimised for a hypothetical daily operator when the screen only ever appears for four seconds.

### 4. Performable

An actor has to drive this convincingly, repeatably, under pressure, while acting.

- **Keyboard-first.** Typing must produce immediate, correct-feeling response. An actor typing a search while delivering a line cannot be fighting a focus bug. Keyboard navigation here is a *realism* requirement, not an accessibility checkbox.
- **Repeatable.** Take 7 must look identical to take 1. No random data, no clock drift between takes, no state that can't be reset in a second.
- **Forgiving.** A mistyped character must not derail the take. Paths back to a known state must be instant and invisible.
- **Cueable.** State changes must be triggerable on a director's call, not only by a correct sequence of user actions.
- **Predictable timing.** Anything on a timer must be settable. "Loading" that takes an unpredictable time is unusable.

### 5. Deliberately imperfect

Real software has scars. Perfect software reads as fake.

A complete feature set is not imperfection. These are:
- Date formats that disagree between two modules
- One legacy screen that never got the redesign
- A column header truncated mid-word
- A field labelled `MISC_CD_2` that nobody remembers the purpose of
- An error that reads `ERR_4417 — contact your administrator`
- A dropdown with an option greyed out and no explanation
- A stray scrollbar; a panel two pixels out of alignment
- A stale notification badge counting something no longer relevant
- An empty state that was clearly written by an engineer

Imperfection must be **deliberate, catalogued, and consistent** — a designed layer, not sloppiness. It is a component library of its own. See [`18_Simulation_Realism.md`](18_Simulation_Realism.md).

Alongside it, the credibility furniture every real system has: loading indicators, timestamps, activity logs, search history, session and user chrome, status indicators, recently-viewed lists, pagination, empty states.

### 6. One grammar across the catalogue

An operator or actor who has worked with one simulation should be immediately competent in the next.

Shared behaviour is mandatory for: navigation structure, buttons and affordance language, forms and validation, tables and sorting, search, filters, dialogs, notifications, status indicators, and every reset/cue control.

Shared *behaviour* — not shared appearance. A hospital EMR and a military command centre must feel like different institutions built them while responding to input identically.

**This is why consistency matters here:** not tidiness, but so nothing on set has to be re-learned under time pressure.

### 7. Assembled, not authored

Every simulation is composed from the shared component library. New simulations inherit the design language; they do not invent one.

The target is hundreds of simulations without redesign. Anything solved once — a data table, a case file, a map panel, an alert queue — is solved in the library and themed per institution.

**Test:** if a new simulation needs a new primitive, that primitive belongs in the library, not in the simulation.

### 8. Efficient

Simulations must stay responsive with large datasets, because large datasets are part of what makes them credible.

Animation serves comprehension and realism — a real interface's response — never spectacle. Nothing may delay an actor's input. Frame rate stability matters more than peak smoothness: dropped frames are visible on camera in a way that a slightly slower transition is not.

---

## Named tensions, already decided

| Tension | Resolution |
|---|---|
| Authentic density vs. camera legibility | Legibility wins. Heighten the reference; keep its grammar. (P2) |
| Realistic clutter vs. audience comprehension | The story-critical element is always findable in ~2s. Clutter surrounds it; it never buries it. (P2, P3) |
| Authentic dark ops aesthetic vs. contrast standards | Contrast floor is hard. Achieve the mood within it — dark palettes are fine, muddy ones are not. (P2) |
| Realism vs. deliberate imperfection | Imperfection is designed and catalogued, never improvised per screen. (P5) |
| Institutional distinctiveness vs. one grammar | Appearance varies by institution; behaviour never does. (P6) |
| Faithful workflow vs. performability | Compress steps the camera won't see. Never compress a step the actor performs. (P4) |
| Credibility vs. the non-negotiables | The non-negotiables always win. Invent a convincing fiction instead. (N1–N4) |

---

## Camera and frame

Screens are photographed, not used. This shapes design in ways no conventional design system addresses.

- **Capture legibility.** Type, contrast, and stroke weight are chosen for the delivery resolution and the widest shot the screen appears in — not for a viewer sitting at the monitor.
- **Angle tolerance.** Screens are frequently shot off-axis. Layouts must survive perspective: avoid meaning carried by fine alignment or by elements at the far edge.
- **Composition in frame.** Assume the screen is partly occluded — an actor's hand, an over-shoulder framing, a shallow depth of field. Story-critical content sits away from edges and away from where a hand naturally rests.
- **Capture artefacts.** Avoid patterns that moiré, saturated reds that smear under compression, and fine repeating textures. Account for shutter/refresh interaction; prefer designs that survive it.
- **Motion under capture.** Anything animating during a take must be stable at the shooting frame rate.
- **Multiple aspect ratios and resolutions.** A screen may appear on a 16:9 monitor, a phone insert, or a wall display. Layouts adapt without redesign. See [`10_Responsive_Design.md`](10_Responsive_Design.md).

These are requirements, not suggestions, and they are the ones most likely to be discovered too late. **Every simulation should pass a camera test before it ships.**

---

## The operator layer

There is a second interface: the one used to drive the simulation during a take. It is invisible on camera and it needs its own design discipline.

Principles for it:
- **Never visible in frame.** No overlays, cursors, or chrome that can be captured.
- **Instant and silent.** Cues fire without visible latency and without a visible trigger.
- **Learnable in five minutes.** The person operating it may have been handed the job that morning.
- **Reset is one action.** Return to a known start state must be immediate and unmistakable.
- **Safe under pressure.** Destructive or scene-breaking actions must be hard to hit by accident.

Design it as a real product with a real user — the operator — because unlike the simulation itself, it *is* one.

---

## Failure as a story beat

Simulations must be able to break on cue. Scripted failure is a feature, not an error path.

Design first-class states for: system unavailable, connection lost, access denied, account locked, data corrupted, alert escalation, and forced logout. Each must be triggerable on a director's call, hold indefinitely, and clear cleanly.

Failure states carry the same credibility burden as success states — including the specific, unhelpful, slightly bureaucratic tone real systems use when something goes wrong.

---

## Regional authenticity

Authenticity is regional. A national ID system, a police database, and a bank all look, read, and name things differently depending on where they were built.

Every simulation must declare its setting, and that setting drives: institution naming conventions, personal and place name banks, address and phone formats, national identifier formats, currency symbol and numeric formatting, date and time conventions, language and honorifics, and the visual and typographic conventions of that region's public and corporate software.

> **Decided 2026-08-29: the default region is Nigeria / West Africa.** Nigerian institutional conventions are the reference setting for the catalogue, not a localisation layer applied afterwards. Other regions are variants built on the same system. This drives the palette in [`04_Color_System.md`](04_Color_System.md), the formatting rules in [`05_Typography.md`](05_Typography.md), and the data rules in [`../06_Data/`](../06_Data/).
>
> **Still outstanding:** the regional colour and convention notes in the colour system are drawn from general knowledge, not research. A reference audit of actual Nigerian institutional interfaces is required before those sections leave draft.

Regional data generation rules live in [`../06_Data/`](../06_Data/) and must satisfy N2 in every locale.

---

## Period and era

A production set in 2004 needs 2004 software. A platform serving hundreds of productions will get period requests.

Design the system so era is a **layer, not a rebuild**: token sets and component variants that shift typography, chrome, density, colour, and interaction idiom across eras while the underlying structure holds. Note the target era in every simulation's specification.

---

## Accessibility

Accessibility applies to three distinct users, and conflating them produces vague requirements.

1. **The operator** — a real person doing a real job under time pressure. Full accessibility standards apply to the operator layer without exception. This is real software.
2. **The audience** — the accessibility question is legibility at distance and under compression, which is already governed by P2. Contrast and type-size floors are hard requirements here.
3. **The actor** — needs reliable keyboard operation, clear focus states, and unambiguous feedback. Covered by P4.

For the simulation surface itself, the standards that survive the realism trade-off are: contrast floors, readable type, visible focus, unambiguous labelling, and consistent interaction patterns. These are not in tension with realism — they are what makes it legible. Details in [`17_Accessibility.md`](17_Accessibility.md).

---

## What we avoid

- Flashy without purpose; visual spectacle over believability
- Overly futuristic, unless the brief is explicitly future-set
- Gaming aesthetics, unless the simulation depicts a game
- Cartoonish, noisy, or distracting treatments
- Inconsistent behaviour between simulations
- Interfaces that look designed rather than accumulated
- Anything that reads as a movie prop rather than a working system

---

## Success criteria

A simulation succeeds when a viewer believes:

- This software could exist.
- Someone could genuinely use it every day.
- The actor is operating a real system.
- The interface supported the story without explaining itself.

And when a practitioner in the field watches without objecting.

**When the audience stops noticing the interface, the design has done its job.**

---

## Open questions

These block downstream documents and should be resolved before the design system is specified.

1. ~~**Primary market and default region**~~ — **Decided 2026-08-29: Nigeria / West Africa.** Remaining task: a reference audit of real Nigerian institutional interfaces to validate the colour and convention notes in [`04_Color_System.md`](04_Color_System.md).
2. **Delivery resolution targets** — what capture resolutions and shot types are we designing for? Blocks all typography and contrast figures.
3. **Camera test** — who runs it, and when? Every number in P2 is provisional until it happens.
4. **Operator layer scope** — is the operator tooling in the MVP? It is currently undocumented in [`02_Features`](../02_Features/).
5. **Cybersecurity fiction boundary** — N3 sets the principle; the catalogue needs a concrete standard for how far plausible syntax may go. Needs legal sign-off.
6. **Period support in MVP** — layered era support is much cheaper designed in than retrofitted.