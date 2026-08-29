# W1-04 — NBCR Wanted Queue

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
- **Screen name:** Active Wanted — Queue
- **Archetype:** A3 (List / Queue)
- **Module path:** Operations › Wanted › Active

### The scene
Morning briefing. An officer scrolls the active wanted list on the room's main display while a sergeant talks over it.

- **Shot:** Wide — this screen is background for most of the scene, so it must read as texture and still deliver one number
- **Audience must read (Tier A — these two only):**
  1. Active wanted count in the module header
  2. The top row's subject name
- **Actor performs:** Sorts by "Date added", scrolls

**Note:** this is the densest screen in Wave 1. It is a test of whether density survives Principle 2. Push the row count to the ceiling of 12 and no further.

### Content
- **Module header:** `Active Wanted` title, count, primary actions (Export, Print briefing sheet), view switcher (Table / Cards)
- **Toolbar:** sort control, quick filters (region, offence class, date added), bulk-select
- **Table:** 12 rows — thumbnail, name, NBCR ID (mono), offence class, region, date added, status pill
- **Pagination footer:** `Showing 1–12 of 47`
- **Rail:** none — this screen is full-width table

### States required
1. `default` — 12 rows
2. `loading` — skeleton rows, duration settable
3. `empty` — `No active wanted subjects for the selected filters.`
4. `error` — `ERR_4417 — record service unavailable`

### Imperfections (exactly three)
- Truncated column header `OFFENCE CL…`
- One row where the region value is blank with a single `—` and no explanation
- Zebra striping that resets incorrectly after row 8, so two adjacent rows share a background

### Constraints
- NBCR fictional (N1) · all names, IDs, offence records synthetic (N2) · nothing operable (N3) · no platform branding (N4)

**Deliver:** one artboard per state (4 total).
