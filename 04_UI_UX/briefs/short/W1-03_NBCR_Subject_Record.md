# W1-03 — NBCR Subject Record

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
