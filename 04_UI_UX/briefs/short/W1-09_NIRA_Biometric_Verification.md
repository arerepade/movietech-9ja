# W1-09 — NIRA Biometric Verification

**Short form.** Use this ONLY when `00_DESIGN_INSTRUCTIONS.md` is already loaded in the Claude Designer session — pasted at the start, or set as the project's custom instructions.

If it is not loaded, use the full self-contained version one directory up instead, or the designer will invent its own styling.

---

Design the following screen.

**Apply the design instructions already in this conversation in full** — the non-negotiables, legibility tiers, type scale, palette, spacing, layout shell, frame-safe zones, component states, region formatting and imperfection rules. They are not a starting point to improve on.

Canvas 1920 × 1080. Finish with the compliance report.

## SCREEN BRIEF

### Identity
- **Simulation:** National_ID
- **Fictional institution:** National Identity Registry Authority (NIRA)
- **Register:** civic — chrome `#06713F`, accent `#0B8A4E`
- **Mode:** light · **Era:** era-current · **Region:** Nigeria / West Africa

### The screen
- **Screen name:** Biometric Verification — Result
- **Archetype:** A7 (Detail + Media)
- **Module path:** Verification › Biometric › Session

### The scene
A registration officer runs a fingerprint against the register. The match returns against a different name than the one on the applicant's form.

- **Shot:** Insert on the match result, then pull back to two-shot
- **Audience must read (Tier A — these three only):**
  1. `MATCH` result banner
  2. Confidence score
  3. The returned name — which differs from the submitted name
- **Actor performs:** Presses "Verify", waits, reacts
- **Dialogue reference:** "That's not the name on the form."

### Content
- **Left — media pane:** captured fingerprint image with minutiae overlay markers, capture quality indicator, retry control. Beside it, the register's stored image for comparison — a two-pane comparison layout.
- **Right — metadata panel:**
  - Submitted identity: name, NIN-style 11-digit number, DOB, enrolment centre
  - Returned identity: name, NIN-style number, DOB, enrolment date, status pill
  - Match block: `MATCH` / confidence percentage / algorithm version / elapsed time
- **Rail:** Verification session log — each attempt timestamped
- **Status bar:** operator, terminal, centre code, clock

**Do not encode the match result by colour alone** — banner carries an icon and a word.

### States required
1. `scanning` — capture in progress, live-ish capture pane, duration settable
2. `match` — the state described above, confidence high
3. `no-match` — `NO MATCH — no register record found`, empty comparison pane
4. `low-quality` — `CAPTURE QUALITY INSUFFICIENT — retry`, quality indicator amber
5. `error` — `ERR_7702 — register unreachable`

### Imperfections (exactly three)
- Algorithm version label reads `MINUT-v2.3 (legacy)` — a system running a version it calls legacy
- Field label `CTR_CD` for enrolment centre, unexplained
- The comparison pane's two images are captioned inconsistently — `Captured` vs `On File (register)`

### Constraints
- NIRA is fictional — **check this acronym carefully for collisions with real identity agencies before production use** (N1)
- Fingerprint imagery must be synthetic or generated, never a real person's biometric (N2)
- All identity numbers 11-digit format, invalid by construction (N2)
- No operable content (N3) · no platform branding (N4)

**Deliver:** one artboard per state (5 total).
