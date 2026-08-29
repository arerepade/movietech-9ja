# Typography

| | |
|---|---|
| **Status** | Draft — sizes provisional pending camera test |
| **Owner** | _unassigned_ |
| **Last updated** | 2026-08-29 |
| **Scope** | In-world simulation UI |
| **Related** | [Design Principles](01_Design_Principles.md) · [Design Tokens](03_Design_Tokens.md) · [Colour](04_Color_System.md) |

## The problem this file solves

Principle 2 says legibility beats authenticity. This file is where that becomes a number.

Real institutional software runs 11–13px body text at low contrast. On camera that is unreadable mush, and thin strokes shimmer as the sensor resamples them. We build a **heightened** version: the same information architecture, scaled and weighted for capture.

The mistake to avoid is scaling *everything* up. That produces a tablet app, not a workstation, and destroys the density that sells the realism. The answer is to decide, per element, **which shot it has to survive**.

---

## The three-tier legibility system

Every piece of text on every screen is assigned a tier. The tier determines size, weight, and contrast floor.

### Tier A — Story-critical

The audience **must read this** for the scene to work. A suspect's name, a match result, an alert, a countdown, a balance.

- Must survive a **wide or medium shot** where the monitor is roughly a third of frame width.
- 28–48px, weight 600–700, contrast ≥ 7:1.
- **Budget: one to three Tier A elements per screen.** If everything is critical, nothing is. This is the single most violated rule in the system.

### Tier B — Supporting

Read in an **insert or over-the-shoulder close-up** where the screen fills most of the frame. Field labels, values, row content the camera pushes in on.

- 16–24px, weight 400–600, contrast ≥ 4.5:1.
- This is the bulk of the interface.

### Tier C — Texture

**Never meant to be read.** It exists to create density and authenticity: distant table rows, sidebar metadata, log tails, footer chrome, timestamps.

- 13–16px, weight 400–500, contrast ≥ 3:1.
- Must be *typographically plausible* under freeze-frame — real words, real formats, correct region. Never lorem, never repeated filler (Non-negotiable N4).

### The hard floor

**Nothing below 13px. Ever.**

Real software goes to 10px. We do not, because sub-13px text aliases and shimmers under capture and adds nothing — at that size it is a grey smear either way, and a smear that flickers is worse than one that does not.

---

## Families

One superfamily, so weights and metrics stay consistent across UI, data, and documents. Open-licensed (SIL OFL), broad Latin coverage including the diacritics needed for West African names.

| Token | Stack | Use |
|---|---|---|
| `--type-family-ui` | `"IBM Plex Sans", "Segoe UI", system-ui, sans-serif` | All interface text |
| `--type-family-data` | `"IBM Plex Mono", "Cascadia Mono", Consolas, monospace` | IDs, codes, timestamps, currency, terminals, tabular data |
| `--type-family-doc` | `"IBM Plex Serif", Georgia, serif` | Certificates, warrants, generated reports, formal print output |
| `--type-family-legacy` | `Verdana, Tahoma, Geneva, sans-serif` | The deliberate-imperfection layer and `era-2000s` |

**Why Plex:** it reads as institutional rather than consumer — it was drawn for a technology corporation, not a lifestyle brand — and it holds up at the weights and sizes we need. Inter is the fallback choice if Plex proves too characterful for a given institution.

`--type-family-legacy` is a deliberate tool, not an accident. One legacy module in an otherwise modern system is one of the cheapest, most convincing authenticity signals available (Principle 5).

### Weights

`400` regular · `500` medium · `600` semibold · `700` bold

**Never below 400.** Thin and light weights alias badly, shimmer against the shutter, and disintegrate under compression. They are banned regardless of how good they look on a desk monitor.

---

## Scale

| Token | Size / line-height | Weight | Tier | Typical use |
|---|---|---|---|---|
| `--type-display` | 48 / 1.10 | 700 | A | Full-screen alert, breach banner, countdown |
| `--type-hero` | 36 / 1.15 | 700 | A | The one number or name the scene is about |
| `--type-title-lg` | 28 / 1.20 | 600 | A | Record subject name, case number in header |
| `--type-title` | 24 / 1.25 | 600 | B | Panel and section headings |
| `--type-subtitle` | 20 / 1.35 | 500 | B | Sub-headings, emphasised field values |
| `--type-body-lg` | 18 / 1.50 | 400 | B | Primary reading text, detail values |
| `--type-body` | 16 / 1.50 | 400 | B | Default. Table cells, form fields, labels |
| `--type-caption` | 14 / 1.40 | 400 | C | Metadata, helper text, column sub-labels |
| `--type-micro` | 13 / 1.35 | 500 | C | Status bar, log tails, dense chrome. **Floor.** |
| `--type-data` | 15 / 1.45 | 400 | B/C | Mono: IDs, codes, amounts, timestamps |
| `--type-data-lg` | 20 / 1.40 | 500 | A/B | Mono: the ID or amount the scene turns on |

Note the base: **`--type-body` is 16px, where the real-world reference would be 12px.** That single decision is Principle 2 in practice.

### Letter-spacing

| Context | Value |
|---|---|
| Tier A display and hero | `-0.01em` |
| Body and default | `0` |
| All-caps labels and column headers | `+0.06em` |
| Mono data | `0` |

All-caps is the institutional default for column headers, section eyebrows, and status pills. It must always carry the tracking — untracked all-caps reads as amateur.

---

## Rules

1. **Assign a tier to every text element before choosing a size.** The tier is a story decision, not a visual one.
2. **One to three Tier A elements per screen.** Enforced in review.
3. Never below 13px. Never below weight 400.
4. Numeric data that a viewer might compare, scan, or freeze-frame goes in `--type-family-data`. Tabular figures, always — misaligned digits in a column destroy credibility instantly.
5. Line length in reading text caps at roughly 90 characters. Institutional software runs wide, but not unreadably so.
6. Region formatting is typographic: dates as `DD/MM/YYYY`, currency as `₦1,250,000.00`, phone and ID formats per [Colour System](04_Color_System.md) and the data rules in [`../06_Data/`](../06_Data/).

---

## Provisional

These sizes are reasoned, not measured. They assume 1080p delivery and a monitor occupying a third of frame width in the widest shot the screen appears in.

**They will change after the first camera test.** Specifically, expect Tier A to grow and the 13px floor to rise. Do not treat this table as settled, and do not let a hundred screens get built on it before the test happens.
