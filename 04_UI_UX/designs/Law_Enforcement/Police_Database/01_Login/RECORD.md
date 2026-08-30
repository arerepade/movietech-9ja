# Login

| | |
|---|---|
| Brief        | ../../../../briefs/W1-01_NBCR_Login.md |
| Simulation   | Police_Database |
| Institution  | National Bureau of Criminal Records (NBCR) |
| Archetype    | A1 Authentication |
| Mode         | light |
| Era          | era-current |
| Artifact URL | — (delivered as a downloaded `.dc.html`) |
| Local source | `source/Main.dc.html` (was `NBCR Login.dc.html` in Downloads) |
| Status       | needs rework |
| Designed     | 2026-08-29 |
| Reviewed by  | Claude, 2026-08-29 |

## States delivered
- [x] default
- [x] loading — `AUTHENTICATING…` with spinner
- [x] error — `Invalid credentials. Attempt 2 of 3.`
- [x] cue: ACCOUNT LOCKED — `ERR_0031`, panel dimmed to 0.6

All four present. Delivered as **one artboard containing four stacked 1920×1080 frames**, driven by an `sc-for` over a `renderVals()` array — not as four separate artboards.

## Review checklist
- [x] Non-negotiables N1–N4 — NBCR fictional, officer ID `NBCR/LAG-08841` synthetic, nothing operable, no platform branding
- [ ] **≤ 3 Tier A elements** — only 1 of the 3 briefed Tier A elements actually reaches Tier A (see Issue 2)
- [ ] **Nothing below 13px / weight 400** — floor respected, but a 24px value sits in the Tier A/B dead band (see Issue 1)
- [x] Tier A clear of edges — 154px horizontal padding matches the 8% inset exactly
- [x] Palette from spec — every colour traces to a token; no invented colours
- [x] Status never colour-only — error and cue both pair colour with icon and label
- [x] Clock and status bar present — clock ticks live on a 1s interval, `DD/MM/YYYY HH:MM:SS`
- [x] Cue banner reserved at 44px even when empty
- [x] error state designed (loading/empty not applicable to A1)
- [x] 3 imperfections, no more
- [x] Region formatting correct
- [x] **All 13 colour pairs measured — every one passes** (`tools/contrast.awk`)
- [x] Fills the canvas

## Imperfections used — all three, as briefed
1. `NBCR-CRS v4.2.11 (build 20180914)` — a 2018 build string on a current system
2. `Password must be changed every 90 days.` under a field showing no expiry
3. Footer set in Verdana (`--type-family-legacy`), one step out of alignment

## What it got right

Better than expected on the things that are easy to miss:

- **Reserved the 44px cue banner in all four states**, including the three where it is empty. That is the rule added after W1-03 and it landed exactly.
- Live clock on a real `setInterval`, correctly formatted, in both the top bar and status bar.
- `SESSION: —` in the status bar for a not-yet-authenticated session — an unprompted, genuinely authentic detail.
- Palette discipline is total: no colour appears that is not in the spec.

## Issues — 2 to fix

**1. `24px` officer ID sits in the Tier A/B dead band.**
`source/Main.dc.html:63` — `font:500 24px/1.2 'IBM Plex Mono'`. The scale forbids 21–31px; that gap *is* the hierarchy. The brief lists the officer ID as Tier A, so it should be `--type-data-hero` at **32px/500**.

**2. The `RESTRICTED SYSTEM` notice does not reach Tier A.**
`source/Main.dc.html:54-57` — 18px/700 in a white box with a `#C6C2B8` border. That is Tier B treatment. The brief lists it as Tier A, and Tier A by treatment requires a **saturated fill**, not a neutral outline. As drawn it reads as a label rather than a warning.
Fix: fill the strip with `--status-critical` `#B3261E` and white text (6.54:1, measured), or drop it to Tier B and accept only two Tier A elements.

## Not delivered

**No compliance report.** The spec requires one with every screen — tier assignments, type range, off-palette colours, shell dimensions, density, frame-safe check, states, imperfections, deviations. Issue 1 is exactly what the `TYPE: largest __ smallest __ (nothing 21-31)` line exists to catch, so it would have been self-reported.

Ask for it on the next screen; if Claude Designer is not producing it, the instruction needs strengthening.

## Structural note

Four frames in one file works for review but means no state can be exported independently as a 1920×1080 PNG, and the canvas artboard model is unused. Decide whether that matters before W1-02: if exports per state are wanted, the brief should say "four separate artboards, one per state" explicitly.
