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
| Local source | `source/Main.dc.html` — Claude Designer corrected version |
| Status       | designed — fixes verified |
| Designed     | 2026-08-29 |
| Reviewed by  | Claude, 2026-08-29 |
| Patched      | Claude Designer, 2026-08-29 — all 3 fixes applied at source and verified |

## States delivered
- [x] default
- [x] loading — `AUTHENTICATING…` with spinner
- [x] error — `Invalid credentials. Attempt 2 of 3.`
- [x] cue: ACCOUNT LOCKED — `ERR_0031`, panel dimmed to 0.6

All four present. Delivered as **one artboard containing four stacked 1920×1080 frames**, driven by an `sc-for` over a `renderVals()` array — not as four separate artboards.

## Review checklist
- [x] Non-negotiables N1–N4 — NBCR fictional, officer ID `NBCR/LAG-08841` synthetic, nothing operable, no platform branding
- [x] **≤ 3 Tier A elements** — all 3 briefed elements now reach Tier A
- [x] **Nothing below 13px / weight 400, no dead-band sizes** — after patching
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

## Issues found — all 3 patched 2026-08-29

**1. `24px` officer ID sat in the Tier A/B dead band.** *(fixed)*
`Main.dc.html:63` was `font:500 24px/1.2 'IBM Plex Mono'`. The scale forbids 21–31px; that gap *is* the hierarchy. Now **32px/500** (`--type-data-hero`), which is its correct Tier A size. The field box went 44px → 52px to hold it.

**2. The `RESTRICTED SYSTEM` notice did not reach Tier A.** *(fixed)*
`Main.dc.html:54-57` was 18px/700 in a white box with a `#C6C2B8` border — an outline, not a fill, so Tier B treatment despite being briefed as Tier A. Now filled with institution chrome `#103866`, white text and icon, 48px tall (**11.80:1**, measured).

Filled with **chrome, not critical red**, deliberately: a standing restriction notice is not an alert. Red here would compete with the ACCOUNT LOCKED cue banner in the fourth state and blunt it. This refined the spec — see below.

**3. `11px` logo mark, below the 13px hard floor.** *(fixed)*
`Main.dc.html:26` — the `NB` glyph in the top-bar mark. **Missed in the first review pass**, caught by auditing every font size in the file. Now 13px (`#F7F6F3` on `#1B5FA8`, 5.98:1, measured).

**Font sizes after patching: 13, 15, 16, 18, 20, 32, 36.** No dead-band values, nothing below the floor.

## Spec change this produced

The "Tier A by treatment" rule said *saturated status fill*. Patching this screen showed that was too narrow: a standing notice needs Tier A weight without asserting a state.

Updated in [`05_Typography.md`](../../../../05_Typography.md) and `briefs/_DESIGN_SPEC.md`: the fill may be a status colour **or** the institution chrome, chosen by meaning — status colours assert state, chrome carries standing emphasis. Also spells out that an outline is not a fill, which is what this screen got wrong.

## Round 2 — fixes applied at source, verified 2026-08-29

Claude Designer applied all three fixes in its own session; that version replaced the local copy, so there is one source of truth again.

Verified on the returned file:
- Sizes: **13, 15, 16, 18, 20, 32, 36** — no sub-13px, no dead-band values
- Officer ID 32px/500 mono in a 52px field
- Restricted notice filled `#103866`, white text and icon, 48px
- Logo mark 13px
- Shell intact: 56 / 44 / 44-reserved / 32
- All four states still present; imperfections and palette untouched

It also made one improvement I had not asked for: it **dropped the `border:2px solid #103866`** from the restricted notice, which was the same colour as the fill and therefore did nothing. My patched version still carried it. Its version is the cleaner one and is what is stored.

## Still not delivered

**No compliance report, in either round.** The spec requires one with every screen. Its `TYPE: largest __ smallest __ (nothing 21-31)` line would have caught two of the three issues before they reached review.

Two rounds without one means the closing request is not working. **Make it a hard gate in `_DESIGN_SPEC.md` before W1-03** — the report should be a required deliverable alongside the artboards, not a sign-off line.

## Structural note

Four frames in one file works for review but means no state can be exported independently as a 1920×1080 PNG, and the canvas artboard model is unused. Decide whether that matters before W1-02: if exports per state are wanted, the brief should say "four separate artboards, one per state" explicitly.
