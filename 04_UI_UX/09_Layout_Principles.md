# Layout Principles

| | |
|---|---|
| **Status** | Draft |
| **Owner** | _unassigned_ |
| **Last updated** | 2026-08-29 |
| **Scope** | In-world simulation UI |
| **Related** | [Design Principles](01_Design_Principles.md) · [Grid](08_Grid_System.md) · [Components](13_Component_Library.md) · [Screen Brief](19_Screen_Brief_Template.md) |

## Canvas

Design at **1920 × 1080**. It is the delivery reference, the most common monitor in frame, and it maps cleanly to 4K capture.

Other targets — phone inserts, wall displays, 4:3 legacy monitors — are variants of the archetypes below, not separate designs. See [Responsive Design](10_Responsive_Design.md).

## Frame-safe zones

Screens are photographed, not used. Two rules follow, and they override normal layout instinct.

| Zone | Rule |
|---|---|
| **Edge inset** | Keep Tier A content **8% clear of every edge** (≈154px horizontal, ≈86px vertical). Edges get cropped, curve away on off-axis shots, and catch monitor bezel glare. |
| **Hand zone** | Avoid the **bottom-right quadrant** for story-critical content. That is where an actor's hand rests on a mouse, and where an over-the-shoulder frame is most often occluded. |

The centre-left of the upper two-thirds is the most reliable real estate in the frame. Put the thing the scene is about there.

Chrome — nav, status bars, toolbars — should live at the edges. That is what it is for: it reads as texture, so occlusion costs nothing.

---

## The standard shell

Every simulation uses the same skeleton. Institutions differ in colour, mark, and labelling — never in structure (Principle 6).

```
+--------------------------------------------------------------+
|  TOP BAR                                              56px   |  <- brand chrome
|  [mark] Institution · Module        search   user  clock     |
+--------------------------------------------------------------+
|  CUE BANNER (reserved, absent by default)             44px   |  <- --z-cue
+---------+----------------------------------------------------+
|         |                                                    |
|  NAV    |   CONTENT                                          |
|  260px  |                                                    |
|         |   +-------------------------+  +----------------+  |
|         |   |  primary                |  |  rail 320px    |  |
|         |   |                         |  |  (optional)    |  |
|         |   +-------------------------+  +----------------+  |
|         |                                                    |
+---------+----------------------------------------------------+
|  STATUS BAR   connection · user · session · env      32px    |
+--------------------------------------------------------------+
```

| Region | Size | Contains |
|---|---|---|
| Top bar | 56px | Institution mark and name, active module, global search, user, live clock |
| **Cue banner** | **44px** | **Reserved. Empty in normal states; carries operator-triggered alerts.** |
| Nav | 260px | Module list, grouped, with counts. Collapsible to 56px icon rail |
| Content | fluid | The screen archetype |
| Rail | 320px | Context: activity log, related records, alerts. Optional |
| Status bar | 32px | Connection state, session, environment, record counts |

### The cue banner is reserved space, not extra space

Every archetype must **budget 44px below the top bar for a cue banner**, even though it is absent in the default state. An operator-triggered alert (`--z-cue`) appears there when a director calls for it.

This is easy to get wrong and expensive to fix late. On a fixed 1920×1080 canvas the height is finite: if the default state fills all 992px between the top and status bars, then firing a cue pushes the last table row off the screen. The screen breaks precisely at the dramatic moment it exists for.

So the working content budget is **948px, not 992px** — assume the banner is always there. A screen that only fits without it is not finished.

*Found the hard way on W1-03: a 52px banner clipped the last case-history row, and it took a 44px banner plus a reclaimed spacer to fit.*

**The status bar and clock are non-negotiable.** A live, correct, regionally formatted clock is the single cheapest credibility signal in the system, and its absence is the most common tell in bad screen work.

---

## Screen archetypes

Eleven shapes cover essentially the entire catalogue. Every screen brief names one.

### A1 — Authentication
Institution mark, credential fields, system notice, build/version string in the corner. Frequently the establishing shot of a sequence. Design the failure state as carefully as the success state.

### A2 — Dashboard / Monitor
Tile grid, 12 columns. Counters, small charts, alert queue, map inset. The default landing screen. Tier A budget is the whole point here: one hero metric, everything else texture.

### A3 — List / Queue
Dense table, toolbar above, filter rail left or inline. Pagination and result counts always visible. The most common working screen in institutional software.

### A4 — Record / Case File
**The most important archetype in the catalogue.** Subject header (name, ID, photo, status), tab strip, detail panels below, activity rail right. Police records, patient charts, customer accounts, case files are all this shape.

### A5 — Search & Results
Prominent query bar, facet rail, result rows with match highlighting, result count and timing. Design the empty state and the no-results state — both appear on camera constantly.

### A6 — Map / Geo
Full-bleed map canvas, floating control panel, entity list rail, timeline scrubber along the bottom.

### A7 — Detail + Media
Large media pane (photograph, scan, biometric, camera feed) with a metadata panel beside it. Comparison variants show two panes side by side.

### A8 — Form / Data Entry
Multi-section capture, progress or step indicator, validation states, save and submit affordances. Where an actor types, so keyboard behaviour is critical.

### A9 — Terminal / Console
Mono, dark, scrolling output, prompt line. **Non-negotiable N3 applies hardest here** — plausible fiction, never operable technique.

### A10 — Alert / Interrupt
Full-screen or modal state change: breach, denial, lockout, system failure. Triggered by an operator cue, holds indefinitely, clears cleanly. Uses `--z-cue`.

### A11 — Document / Printout
Serif, paginated, seal or letterhead, signature block. Warrants, certificates, discharge summaries, statements. Carries disproportionate institutional weight in West African systems — treat as first-class.

---

## Density

Institutional software is dense. Density is credibility (Principle 1), but it is bounded by Principle 2, which wins.

| Context | Row height | Padding |
|---|---|---|
| Dense table (texture) | 32px | `--space-3` |
| Standard table | 40px | `--space-4` |
| Comfortable / touch | 48px | `--space-5` |
| Panel interior | — | `--space-4` to `--space-5` |
| Section gap | — | `--space-7` |

Default to **standard, 40px**. Use dense only where the rows are Tier C texture and the camera will not push in.

### The reduction rule

Real screens hold more rows and more chrome than ours should. Reduce **count**, never **apparent density**: fewer table rows but the same tight row rhythm; fewer toolbar icons but the same crowded toolbar feel. The impression of density survives; the mush does not.

Practical ceilings per screen: **≤ 12 visible table rows**, **≤ 3 simultaneous panels**, **≤ 7 nav items visible without scrolling**, **≤ 3 Tier A elements**.

---

## Composition

1. **One focal point.** The scene is about one thing. Everything else supports it.
2. **Reading order is top-left to bottom-right.** Story-critical content sits early in that path.
3. **Align to the grid.** Misalignment reads as amateur — except where it is a deliberate, catalogued imperfection (Principle 5).
4. **Chrome to the edges, content to the centre.**
5. **Fill the screen.** Real institutional software has no generous empty margins. Empty space reads as an unfinished mockup.

---

## Deliberate imperfection in layout

Per Principle 5, each simulation should carry **two or three** layout imperfections — deliberate, catalogued, never more:

- One legacy module that keeps the old shell proportions and `--type-family-legacy`
- A panel whose header wraps awkwardly at the default width
- One column header truncated mid-word
- A stray scrollbar on a panel that barely overflows
- A section whose spacing is one step off the scale

Two or three. More than that stops reading as a real system and starts reading as a broken one.
