# W1-11 — BOC Border Movement Map

**Short form.** Use this ONLY when `00_DESIGN_INSTRUCTIONS.md` is already loaded in the Claude Designer session — pasted at the start, or set as the project's custom instructions.

If it is not loaded, use the full self-contained version one directory up instead, or the designer will invent its own styling.

---

Design the following screen.

**Apply the design instructions already in this conversation in full** — the non-negotiables, legibility tiers, type scale, palette, spacing, layout shell, frame-safe zones, component states, region formatting and imperfection rules. They are not a starting point to improve on.

Canvas 1920 × 1080. Finish with the compliance report.

## SCREEN BRIEF

### Identity
- **Simulation:** Border_Control
- **Fictional institution:** Border Operations Command (BOC)
- **Register:** border — chrome `#7A4A08`, accent `#96670A`
- **Mode:** light · **Era:** era-current · **Region:** Nigeria / West Africa

### The screen
- **Screen name:** Movement History — Geospatial
- **Archetype:** A6 (Map / Geo)
- **Module path:** Intelligence › Movements › Subject Trace

### The scene
An analyst traces a flagged traveller's crossings over six months. The pattern shows a crossing that should not exist.

- **Shot:** Medium on the map, then insert on the flagged crossing card
- **Audience must read (Tier A — these three only):**
  1. The flagged crossing marker and its label
  2. The crossing date
  3. `FLAGGED` status on the subject
- **Actor performs:** Scrubs the timeline, clicks the flagged marker
- **Dialogue reference:** "He was never supposed to be there."

### Content
- **Map canvas**, full-bleed under the chrome: regional map with border lines, crossing points as markers, the subject's route as a connected path with direction. Markers sized by dwell time, **shape-coded as well as colour-coded** — never colour alone.
- **Floating control panel** (upper-left, out of the hand zone): layer toggles (crossings, flights, alerts, jurisdictions), date range, subject selector
- **Entity rail (right):** movement list — 9 rows, each with date, crossing point, direction, document used, status
- **Timeline scrubber** along the bottom above the status bar: six-month span, event ticks, draggable playhead
- **Selected-marker card:** floats near the flagged marker — crossing point, timestamp, document, officer, `FLAGGED` pill
- **Status bar:** data currency (`Last sync 14/03/2024 06:12`), record count, clock

Data-currency indicators like "last sync" are among the strongest authenticity signals available on a map screen. Do not omit.

### States required
1. `default` — full six-month trace, nothing selected
2. `selected` — flagged marker selected, card open, matching rail row highlighted
3. `loading` — map tiles and route resolving, duration settable
4. `empty` — `No recorded movements for the selected period.`
5. **operator cue:** `INTERCEPTION ALERT` — `--z-cue` banner across the top, flagged marker escalates to `--status-critical`

### Imperfections (exactly three)
- Layer toggle labelled `JURIS_OVL` with no expansion
- One rail row with a blank document field showing `—` and no explanation
- The timeline's month labels use three-letter abbreviations while the rail uses full `DD/MM/YYYY` — inconsistent between components

### Constraints
- BOC is fictional; check the acronym for collisions (N1)
- **Do not depict real disputed borders or make territorial claims.** Keep the map schematic and regionally generic rather than a precise political rendering (N1, and a production-risk issue)
- Subject name, document numbers, crossing records synthetic and invalid by construction (N2)
- Nothing operable (N3) · no platform branding (N4)

**Deliver:** one artboard per state (5 total).
