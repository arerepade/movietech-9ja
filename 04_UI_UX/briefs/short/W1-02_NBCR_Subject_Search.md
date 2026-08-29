# W1-02 — NBCR Subject Search

**Short form.** Use this ONLY when `00_DESIGN_INSTRUCTIONS.md` is already loaded in the Claude Designer session — pasted at the start, or set as the project's custom instructions.

If it is not loaded, use the full self-contained version one directory up instead, or the designer will invent its own styling.

---

Design the following screen.

**Apply the design instructions already in this conversation in full** — the non-negotiables, legibility tiers, type scale, palette, spacing, layout shell, frame-safe zones, component states, region formatting and imperfection rules. They are not a starting point to improve on.

Canvas 1920 × 1080. Finish with the compliance report.

## SCREEN BRIEF

### Identity
- **Simulation:** Police_Database
- **Fictional institution:** National Bureau of Criminal Records (NBCR)
- **Register:** police — chrome `#103866`, accent `#1B5FA8`
- **Mode:** light · **Era:** era-current · **Region:** Nigeria / West Africa

### The screen
- **Screen name:** Subject Search — Results
- **Archetype:** A5 (Search & Results)
- **Module path:** Records › Subjects › Search

### The scene
A detective works a partial surname from a witness statement. The result set narrows to one plausible match.

- **Shot:** Over-the-shoulder, tightening on the result count then the top row
- **Audience must read (Tier A — these three only):**
  1. The query string in the search bar
  2. Result count — `3 records`
  3. The top result's name
- **Actor performs:** Types a partial surname, presses Enter, hovers the first row
- **Dialogue reference:** "Three hits. That's him."

### Content
- **Search bar:** query, scope selector (All records / Subjects / Cases / Vehicles), submit
- **Result meta line:** `3 records found in 0.42s` — the elapsed time is a strong authenticity signal
- **Facet rail (left):** filters with counts — record type, status, region, date range, with active-filter chips
- **Results:** 3 rows — thumbnail, name with match highlighting, NBCR ID (mono), DOB, status pill, last updated
- **Row count:** 3

### States required
1. `default` — pre-search, empty state with search tips in institutional voice
2. `loading` — `SEARCHING…` with the facet rail dimmed, duration settable
3. `results` — the 3-row state above
4. `no-results` — `No records match the current criteria.` plus active-filter chips still showing
5. `error` — `ERR_5502 — index unavailable. Retry or contact administrator.`

### Imperfections (exactly three)
- Facet labelled `SRC_SYS` with no explanation, values `CRS` / `LGCY` / `EXT`
- Result count line reads `3 records` but the pagination footer says `Showing 1–3 of 3 results` — two different phrasings of the same thing, as real systems do
- Stale badge `3` on the Alerts nav item that never clears

### Constraints
- NBCR fictional (N1) · all names, IDs, DOBs synthetic and invalid by construction (N2) · nothing operable (N3) · no platform branding, no lorem in the empty state (N4)

**Deliver:** one artboard per state (5 total).
