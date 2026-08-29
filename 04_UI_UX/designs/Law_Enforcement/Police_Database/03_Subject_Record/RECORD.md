# Subject Record

| | |
|---|---|
| Brief        | ../../../../briefs/W1-03_NBCR_Subject_Record.md |
| Simulation   | Police_Database |
| Institution  | National Bureau of Criminal Records (NBCR) |
| Archetype    | A4 Record / Case File |
| Mode         | light |
| Era          | era-current |
| Artifact URL | not published — publish blocked by permission classifier |
| Local canvas | `source/nbcr-subject-record.html` (open in a browser) |
| Status       | draft |
| Designed     | 2026-08-29 |
| Reviewed by  | |

## States delivered
- [x] default — `source/Main.dc.html`
- [x] loading — `source/Loading.dc.html`
- [x] empty — `source/Empty.dc.html`
- [x] error — `source/Error.dc.html`
- [x] cue: FLAG AS WANTED — `source/Cue.dc.html`

All five at 1920×1080. `source/build-states.mjs` regenerates the four variants from `Main.dc.html`, so the shared shell cannot drift between artboards — edit `Main.dc.html`, re-run the script, re-seed.

## Review checklist
- [x] Non-negotiables N1-N4 satisfied — fictional NBCR, synthetic invalid ID `99004418272`, no operable content, no platform branding
- [x] <= 3 Tier A elements — subject name, status pill, 2019 conviction row
- [x] Nothing below 13px / weight 400
- [x] Tier A clear of edges and hand zone — name at x≈284/y≈150; conviction row spans x 300–900, left of the bottom-right quadrant
- [x] Semantic tokens only, no raw hex — token *values* used literally (`.dc.html` has no token layer); every colour traces to a token
- [x] Status never colour-only — every pill and disposition pairs colour with icon and label
- [x] Clock and status bar present — live clock top right, 32px status bar
- [x] loading / empty / error designed
- [x] 2-3 imperfections, no more — exactly 3
- [x] Dates DD/MM/YYYY, currency Naira, region-correct names
- [x] Colour pairs measured — reuses pairs already measured in `03_Design_Tokens.md`
- [x] Fills the canvas, no mockup margins

## Imperfections used
1. `CLASS_CD` — cryptic field label in Biographic detail
2. `DISPOSITI…` — truncated column header in Case history
3. Stale badge `3` on the Alerts nav item

## Notes

Subject name at 36px (`--type-hero`), panel headings at 20px (`--type-title`). Default status pill reads `SUBJECT OF INTEREST` (neutral, Tier B treatment); the operator cue flips it to `WANTED` in `--status-critical` at 36px tall / 18px-700 and drops a 44px `--z-cue` banner below the top bar.

## Design-system defects found — both now fixed upstream

**1. Tier A / Tier B type step was too narrow.** `--type-title-lg` (28) and `--type-title` (24) sat 4px apart, so a Tier A subject name and a Tier B panel heading read as almost the same size — the hierarchy collapsed at distance, which is exactly what Principle 2 exists to prevent.

*Fixed 2026-08-29 in [`05_Typography.md`](../../../../05_Typography.md):* the scale now has a deliberate 12px dead band — Tier A floors at 32, Tier B ceilings at 20. Added `--type-data-hero` (32/500) for Tier A monospace, and a **"Tier A by treatment"** rule so status pills and banners can qualify by fill and size rather than by type size alone. This screen's values are now compliant as built.

**2. Cue banners were not in the vertical budget.** A `--z-cue` banner on a fixed 1080 canvas steals height from content. At 52px the last case-history row clipped; it took a 44px banner plus a reclaimed 14px spacer to fit.

*Fixed 2026-08-29 in [`06_Layout_Principles.md`](../../../../06_Layout_Principles.md):* the cue banner is now reserved shell space at 44px, and the working content budget is stated as 948px rather than 992px.

## Open issues

**Not validated on camera or in a browser.** Sizes come from the provisional scale, and no render was inspected. This remains true of every screen until the camera test happens.
