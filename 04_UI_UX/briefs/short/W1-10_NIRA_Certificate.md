# W1-10 — NIRA Certificate of Registration

Archetype A11 carries disproportionate institutional weight in West African systems — printed and printable artefacts often read as more official than screens. Treat this as a first-class design, not a print stylesheet.

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
- **Screen name:** Certificate of Registration — Preview
- **Archetype:** A11 (Document / Printout)
- **Module path:** Registration › Records › Certificate

### The scene
An officer previews a registration certificate before printing it for a waiting applicant. Later in the story, this same certificate turns out to be void.

- **Shot:** Insert on the document, held. Also shot later as a physical print.
- **Audience must read (Tier A — these three only):**
  1. Holder's full name
  2. Registration number
  3. The `VOID` overprint (in the void state)
- **Actor performs:** Scrolls the preview, clicks Print

### Content
- **Chrome:** thin application frame — document toolbar (zoom, page, print, export), status bar, clock. The document is the content, the app is the wrapper.
- **Document body**, `--type-family-doc` serif, paginated, on a page surface floating over `--surface-sunken`:
  - Letterhead: fictional NIRA mark, full authority name, address block
  - Title: `CERTIFICATE OF REGISTRATION`
  - Holder block: full name, registration number, date of birth, sex, place of registration
  - Photograph panel with a printed border
  - Issue block: date of issue, valid-from, issuing centre, officer
  - Signature block: two signature lines with printed titles beneath
  - Seal area — **an invented device, geometric and abstract.** Never a real national coat of arms, crest, or agency seal (N1).
  - Footer: document control number, `--type-family-data`, plus a verification instruction line
- **Security texture:** fine guilloche border, subtle repeating microtext band. Keep the pattern coarse enough not to moiré under capture — see the camera-safety rules in `04_Color_System.md`.

### States required
1. `default` — clean certificate preview
2. `draft` — diagonal `DRAFT — NOT FOR ISSUE` watermark
3. **operator cue:** `VOID` — heavy diagonal `VOID` overprint in `--status-critical`, plus a banner above the document reading `This certificate was revoked on 14/03/2024.`
4. `loading` — document rendering, duration settable
5. `error` — `ERR_3340 — certificate template unavailable`

### Imperfections (exactly two)
- Document control number in the footer uses a different date format (`2024-03-14`) than the certificate body (`14/03/2024`) — two modules, two conventions
- One signature title wraps to a second line, pushing that block very slightly out of alignment with its pair

### Constraints
- **N1 governs this screen.** NIRA is fictional. The seal, mark, and letterhead are invented devices. No real coat of arms, national seal, or agency insignia — these carry legal restrictions and require production clearance. Flag for legal review regardless.
- Holder name, registration number, control number synthetic and invalid by construction (N2)
- Nothing operable (N3) · no platform branding (N4)

**Deliver:** one artboard per state (5 total).
