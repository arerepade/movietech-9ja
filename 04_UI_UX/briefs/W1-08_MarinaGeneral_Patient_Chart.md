# W1-08 — Marina General Patient Chart

**Run this immediately after W1-03.** Same archetype (A4), different institution. If the two come back structurally identical but visually distinct, the institution theme contract works. If they come back structurally different, the system has a hole and we fix it before designing anything else.

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
- It must look like software **in service for a decade**: dense, tight spacing, 2px radii, warm greys, borders rather than shadows.
- Include the live clock and the 32px status bar.
- Include exactly the imperfections listed. No more.

All data synthetic and region-correct for Nigeria: names, `DD/MM/YYYY` dates, `₦`, `+234` numbers, invalid-by-construction identifiers.

## SCREEN BRIEF

### Identity
- **Simulation:** Hospital_EMR
- **Fictional institution:** Marina General Hospital
- **Register:** health — chrome `#0B6062`, accent `#10797C`
- **Mode:** light
- **Era:** era-current
- **Region:** Nigeria / West Africa

### The screen
- **Screen name:** Patient Chart — Summary
- **Archetype:** A4 (Record / Case File) — deliberately the same as W1-03
- **Module path:** Patients › Active › OKONKWO, N.

### The scene
A doctor opens a patient chart to prescribe, and the allergy flag stops them mid-sentence.

- **Shot:** Insert / close-up on the allergy banner, then pull back to medium
- **Audience must read (Tier A — these three only):**
  1. Patient name
  2. `ALLERGY: PENICILLIN` banner
  3. Current medication row that conflicts
- **Actor performs:** Opens the "Medications" tab, hovers the conflicting row
- **Dialogue reference:** "Stop — check her allergies again."

### Content
- **Patient header:** photo, name, hospital number (mono), age/sex, ward, admission date, allergy banner
- **Panel 1 — Vitals:** field pairs with latest readings and timestamps
- **Panel 2 — Medications:** table, 6 rows — drug, dose, route, frequency, prescriber
- **Rail:** Care activity log — entries by nurse and doctor, timestamped
- **Row count:** 6 visible

### States required
1. `default`
2. `loading` — chart fetch, duration settable
3. `empty` — no current medications
4. `error` — `ERR_2210 — pharmacy service unreachable`
5. **operator cue:** `CRITICAL ALLERGY` — banner escalates to `--status-critical`, full-width

### Imperfections (exactly these three)
- Legacy panel: the Vitals panel uses `--type-family-legacy` and flat `--radius-0`, visibly older than the rest of the screen
- Cryptic field label `ADM_SRC_2` in the header block
- Disabled dropdown option in the ward selector with no explanation

### Constraints
- Marina General Hospital is fictional (N1)
- Patient name, hospital number, and all clinical data synthetic (N2)
- Drug names may be real generic names; **doses must not be clinically actionable** (N3)
- No platform branding (N4)

**Deliver:** one artboard per state listed above (5 total).
