# W1-08 — Marina General Patient Chart

**Run this immediately after W1-03.** Same archetype (A4), different institution. If the two come back structurally identical but visually distinct, the institution theme contract works. If they come back structurally different, the system has a hole and we fix it before designing anything else.

**Short form.** Use this ONLY when `00_DESIGN_INSTRUCTIONS.md` is already loaded in the Claude Designer session — pasted at the start, or set as the project's custom instructions.

If it is not loaded, use the full self-contained version one directory up instead, or the designer will invent its own styling.

---

Design the following screen.

**Apply the design instructions already in this conversation in full** — the non-negotiables, legibility tiers, type scale, palette, spacing, layout shell, frame-safe zones, component states, region formatting and imperfection rules. They are not a starting point to improve on.

Canvas 1920 × 1080. Finish with the compliance report.

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
