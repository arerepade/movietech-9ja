# W1-01 — NBCR Login

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
- **Screen name:** System Sign-In
- **Archetype:** A1 (Authentication)
- **Note:** No nav rail on this archetype. Status bar and clock still present.

### The scene
Establishing shot. A detective badges in before shift at 06:12. This screen's job is to tell the audience where we are in under two seconds.

- **Shot:** Medium, monitor roughly a third of frame
- **Audience must read (Tier A — these three only):**
  1. Institution name — National Bureau of Criminal Records
  2. `RESTRICTED SYSTEM — AUTHORISED PERSONNEL ONLY` notice
  3. The username field with the officer's ID already filled
- **Actor performs:** Types a password, presses Enter

### Content
- Institution mark and full name, centred upper third
- Credential panel: username (pre-filled), password, sign-in button
- Legal notice block beneath — monitoring and unauthorised-access warning
- Footer chrome: build version, terminal ID, support extension
- Status bar: connection state, environment, clock

### States required
1. `default`
2. `loading` — `AUTHENTICATING…`, duration settable
3. `error` — `Invalid credentials. Attempt 2 of 3.`
4. **operator cue:** `ACCOUNT LOCKED` — `Account locked. Contact system administrator.` (`ERR_0031`)

### Imperfections (exactly three)
- Build string in footer: `NBCR-CRS v4.2.11 (build 20180914)` — visibly years old
- Notice reading `Password must be changed every 90 days` sitting under a field that shows no expiry
- Footer rendered in `--type-family-legacy`, one step out of alignment with the panel above

### Constraints
- NBCR fictional (N1) · officer ID synthetic and invalid (N2) · nothing operable (N3) · no platform branding (N4)

**Deliver:** one artboard per state (4 total).
