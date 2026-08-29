# W1-03 — NBCR Subject Record

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
- It is **photographed, not used**. Keep Tier A content 8% clear of every edge and out of the bottom-right quadrant (actor's hand, over-the-shoulder occlusion).
- Assign every text element a legibility tier. **Maximum 3 Tier A elements.** Nothing below 13px, nothing below weight 400.
- It must look like software **in service for a decade**: dense, tight spacing, 2px radii, warm greys, borders rather than shadows. Generous whitespace and rounded corners read as a startup product and destroy credibility.
- Include the live clock and the 32px status bar. Never omit them.
- Include exactly the imperfections listed. No more.

All data synthetic and region-correct for Nigeria: names, `DD/MM/YYYY` dates, `₦`, `+234` numbers, 11-digit ID formats that are invalid by construction.

## SCREEN BRIEF

### Identity
- **Simulation:** Police_Database
- **Fictional institution:** National Bureau of Criminal Records (NBCR)
- **Register:** police — chrome `#103866`, accent `#1B5FA8`
- **Mode:** light
- **Era:** era-current
- **Region:** Nigeria / West Africa

### The screen
- **Screen name:** Subject Record — Detail
- **Archetype:** A4 (Record / Case File)
- **Module path:** Records › Subjects › ADEYEMI, C.

### The scene
A detective pulls up a suspect's record mid-interview and finds a prior conviction the suspect has just denied.

- **Shot:** Over-the-shoulder, pushing in to an insert on the conviction row
- **Audience must read (Tier A — these three only):**
  1. Subject name
  2. Status pill: `WANTED`
  3. The prior conviction row in case history
- **Actor performs:** Clicks the "History" tab, scrolls two rows
- **Dialogue reference:** "You told me you'd never been arrested."

### Content
- **Subject header:** photograph, name, NBCR ID (mono), date of birth, status pill, quick actions
- **Panel 1 — Biographic:** field pairs, two columns
- **Panel 2 — Case history:** table, 8 rows, columns for date, case ref, offence, disposition
- **Rail:** Activity log — who accessed this record and when
- **Row count:** 8 visible

### States required
1. `default`
2. `loading` — record fetch, ~1.2s, duration settable by operator
3. `empty` — no prior cases (alternate take)
4. `error` — `ERR_4417 — record service unavailable`
5. **operator cue:** `FLAG AS WANTED` — status pill flips from neutral to critical

### Imperfections (exactly these three)
- Cryptic field label `CLASS_CD` in the biographic panel
- Truncated column header `DISPOSITI…` in case history
- Stale notification badge `3` on the Alerts nav item that never clears

### Constraints
- NBCR and all names are fictional (N1)
- NBCR ID is 11 digits, deliberately invalid by construction (N2)
- No operable content on this screen (N3)
- No platform branding, no lorem, no TODO (N4)

**Deliver:** one artboard per state listed above (5 total).
