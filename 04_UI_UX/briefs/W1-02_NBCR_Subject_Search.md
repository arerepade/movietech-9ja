# W1-02 — NBCR Subject Search

Copy everything below the line into Claude Design.

---

Design a screen for our film/TV software simulation platform.

**Read these first and follow them exactly — they are the spec, not background:**
- `04_UI_UX/01_Design_Principles.md` · `03_Design_Tokens.md` · `04_Color_System.md` · `05_Typography.md` · `09_Layout_Principles.md` · `13_Component_Library.md`

**Canvas: 1920 × 1080.**

This is NOT a normal product UI:
- **Photographed, not used.** Tier A content stays 8% clear of every edge and out of the bottom-right quadrant.
- Assign every text element a tier. **Maximum 3 Tier A elements.** Nothing below 13px or weight 400.
- Must look like software **in service for a decade**: dense, tight spacing, 2px radii, warm greys, borders not shadows.
- Semantic tokens only, never raw hex. Exactly the imperfections listed, no more.
- Data synthetic and Nigeria-correct: `DD/MM/YYYY`, `₦`, `+234`, invalid-by-construction IDs.

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
