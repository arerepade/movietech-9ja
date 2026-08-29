# W1-06 — COD SOC Dashboard

First dark-mode screen. Run third, after W1-03 and W1-08.

**Short form.** Use this ONLY when `00_DESIGN_INSTRUCTIONS.md` is already loaded in the Claude Designer session — pasted at the start, or set as the project's custom instructions.

If it is not loaded, use the full self-contained version one directory up instead, or the designer will invent its own styling.

---

Design the following screen.

**Apply the design instructions already in this conversation in full** — the non-negotiables, legibility tiers, type scale, palette, spacing, layout shell, frame-safe zones, component states, region formatting and imperfection rules. They are not a starting point to improve on.

Canvas 1920 × 1080. Finish with the compliance report.

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
