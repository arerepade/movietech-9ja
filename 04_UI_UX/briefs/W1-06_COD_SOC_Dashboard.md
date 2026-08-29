# W1-06 — COD SOC Dashboard

First dark-mode screen. Run third, after W1-03 and W1-08.

Copy everything below the line into Claude Design.

---

Design a screen for our film/TV software simulation platform.

**Read these first and follow them exactly — they are the spec, not background:**
- `04_UI_UX/01_Design_Principles.md` — non-negotiables N1–N4 and the ranked principles
- `04_UI_UX/03_Design_Tokens.md` — use semantic tokens ONLY, never raw hex
- `04_UI_UX/04_Color_System.md` — institution palette
- `04_UI_UX/05_Typography.md` — the three-tier legibility system
- `04_UI_UX/09_Layout_Principles.md` — shell, archetypes, frame-safe zones
- `04_UI_UX/13_Component_Library.md` — component contracts and required states

**Canvas: 1920 × 1080.**

This is NOT a normal product UI:
- It is **photographed, not used**. Keep Tier A content 8% clear of every edge and out of the bottom-right quadrant.
- Assign every text element a legibility tier. **Maximum 3 Tier A elements.** Nothing below 13px, nothing below weight 400.
- It must look like software **in service for a decade**: dense, tight spacing, 2px radii, borders rather than shadows.
- Include the live clock and the 32px status bar.
- Include exactly the imperfections listed. No more.

All data synthetic and region-correct for Nigeria: `DD/MM/YYYY`, `+234`, reserved documentation IP ranges only.

## SCREEN BRIEF

### Identity
- **Simulation:** SOC_Dashboard
- **Fictional institution:** Cyber Operations Directorate (COD)
- **Register:** cyber — chrome `#0E1116`, accent `#63A0E0`
- **Mode:** dark
- **Era:** era-current
- **Region:** Nigeria / West Africa

### The screen
- **Screen name:** Operations Overview
- **Archetype:** A2 (Dashboard / Monitor)
- **Module path:** Operations › Overview

### The scene
A night-shift analyst is half-watching the wall when the threat level escalates and an alert queue starts filling.

- **Shot:** Wide establishing on the monitor, then push to the alert queue
- **Audience must read (Tier A — these three only):**
  1. Threat level indicator (`ELEVATED` → `CRITICAL`)
  2. Active incident count
  3. The top alert row in the queue
- **Actor performs:** Clicks the top alert to open it
- **Dialogue reference:** "That just went critical."

### Content
- **Tile row:** 4 stat tiles — active incidents, assets monitored, events/sec, mean response time. Each with a sparkline.
- **Panel 1 — Alert queue:** table, 7 rows — time, severity, source, asset, status
- **Panel 2 — Event volume:** time-series chart, last 24h
- **Rail:** Analyst activity log and shift handover notes
- **Row count:** 7 visible

Charts: follow the `dataviz` guidance. Never encode by colour alone — pair with label or shape.

### States required
1. `default` — threat level `GUARDED`, quiet queue
2. `loading` — tiles skeleton, duration settable
3. `empty` — no active incidents (rare but shot as a "before" state)
4. **operator cue:** `ELEVATED` — threat indicator amber, queue fills to 7 rows
5. **operator cue:** `CRITICAL` — threat indicator `--status-critical`, top row pulses, `--z-cue` banner

### Imperfections (exactly three)
- Truncated column header `DESTINATI…` in the alert queue
- Stale badge `12` on the Reports nav item that never clears
- One stat tile whose label wraps awkwardly to two lines at the default width

### Constraints
- COD is fictional; check the acronym for collisions before production (N1)
- All IPs from reserved documentation ranges; hostnames and asset names synthetic (N2)
- **N3 applies hard here:** alert descriptions must be plausible fiction. No real CVE identifiers presented as live, no operable indicators, no working technique (N3)
- No platform branding (N4)

**Deliver:** one artboard per state listed above (5 total).
