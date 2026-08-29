# W1-05 — NBCR Access Denied

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
