# W1-05 — NBCR Access Denied

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
- **Screen name:** Access Denied — Sealed Record
- **Archetype:** A10 (Alert / Interrupt)
- **Module path:** Records › Subjects › [SEALED]

### The scene
The detective tries to open a sealed record. The system refuses, and tells them the attempt has been logged — which is the beat that matters.

- **Shot:** Insert / close-up. The screen is the subject of the shot, so it carries the whole moment.
- **Audience must read (Tier A — these three only):**
  1. `ACCESS DENIED`
  2. `This access attempt has been recorded.`
  3. The authorising officer's name required to proceed
- **Actor performs:** Nothing — they read it. Then click "Acknowledge".
- **Dialogue reference:** "They'll know I tried."

**This is the archetype A10 reference screen.** It should sit above the underlying record screen at `--z-cue`, with the blocked record visible but dimmed behind — that partial visibility is what makes it read as a real system refusing, rather than a separate page.

### Content
- Dimmed A4 record screen behind, recognisably the Subject Record from W1-03
- Interrupt panel, centred upper-middle (out of the hand zone):
  - Denial heading, restriction code `RESTR-2 (SEALED BY COURT ORDER)`
  - Body text in institutional voice — terse, unapologetic
  - Logged-attempt notice with timestamp and terminal ID
  - Authorising-officer requirement
  - Actions: `Acknowledge` (primary), `Request Access` (secondary)
- Status bar still visible, clock still running

### States required
1. `default` — the denial as described
2. **operator cue:** `LOGGED` — a confirmation line appends, `Attempt logged to audit trail at 06:41:22`
3. `request-sent` — after "Request Access": `Request submitted. Reference REQ-88214.`

### Imperfections (exactly two)
- Restriction code shown raw as `RESTR-2` with the human-readable meaning in parentheses, as though bolted on later
- The word `administrator` in the body text does not match `System Administrator` used in the footer — inconsistent capitalisation between modules

### Constraints
- NBCR fictional (N1) · officer names, terminal ID, references synthetic (N2) · nothing operable (N3) · no platform branding (N4)

**Deliver:** one artboard per state (3 total).
