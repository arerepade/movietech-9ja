# W1-13 — Meridian Trust Transfer Form

The heaviest **Principle 4 (Performable)** test in Wave 1. The actor types into this on camera, so field behaviour, focus order, and keystroke feedback matter more than the visual design does.

Copy everything below the line into Claude Design.

---

Design a screen for our film/TV software simulation platform.

**Read these first and follow them exactly — they are the spec, not background:**
- `04_UI_UX/01_Design_Principles.md` · `03_Design_Tokens.md` · `04_Color_System.md` · `05_Typography.md` · `09_Layout_Principles.md` · `13_Component_Library.md`

**Canvas: 1920 × 1080.**

This is NOT a normal product UI:
- **Photographed, not used.** Tier A content stays 8% clear of every edge and out of the bottom-right quadrant.
- Assign every text element a tier. **Maximum 3 Tier A elements.** Nothing below 13px or weight 400.
- Must look like software **in service for a decade**: dense, tight spacing, 2px radii, borders not shadows.
- Semantic tokens only, never raw hex. Exactly the imperfections listed, no more.
- Data synthetic and Nigeria-correct: `DD/MM/YYYY`, `₦`, `+234`, invalid-by-construction IDs.

## SCREEN BRIEF

### Identity
- **Simulation:** Core_Banking
- **Fictional institution:** Meridian Trust Bank
- **Register:** financial — chrome `#1C1B18`, accent `#C9A227`
- **Mode:** dark · **Era:** era-current · **Region:** Nigeria / West Africa

### The screen
- **Screen name:** Funds Transfer — Instruction
- **Archetype:** A8 (Form / Data Entry)
- **Module path:** Operations › Transfers › New Instruction

### The scene
A teller under duress enters a large transfer. The system blocks it at the limit check, which is the beat the scene needs.

- **Shot:** Insert on the amount field as it is typed, then on the block message
- **Audience must read (Tier A — these three only):**
  1. The amount as typed — `₦45,000,000.00`
  2. `TRANSACTION BLOCKED`
  3. The limit that was exceeded
- **Actor performs:** **Types the beneficiary account number, tabs, types the amount, clicks Submit.** Focus order must be exactly: account number → account name (auto-filled, skipped) → amount → narration → Submit.

### Performability requirements (Principle 4 — treat as spec)
- Every field responds at `--motion-instant`. No debounce visible on typing.
- The amount field formats with thousands separators **as typed**, without moving the caret.
- Focus rings visible at `--border-emphasis` and legible at Tier B — the shot may be tight enough to see them.
- Tab order is the exact sequence above and must not change between takes.
- A mistyped character must be correctable without leaving the field or resetting state.

### Content
- **Form panel**, centre-left, in the frame-safe zone:
  - Section 1 — Source: debit account selector (masked), available balance
  - Section 2 — Beneficiary: account number, bank selector, account name (auto-filled, read-only), save-beneficiary checkbox
  - Section 3 — Instruction: amount (large, `--type-data-hero` 32/500, Tier A), narration, value date, charge-bearer selector
  - Actions: `Submit Instruction` (primary), `Save Draft` (secondary), `Cancel` (tertiary)
- **Rail:** Today's instructions by this teller — 5 rows, timestamped, with status pills
- **Step indicator** above the form: Capture › Verify › Authorise — currently on Capture
- **Status bar:** teller ID, till, branch, session timeout counter, clock

### States required
1. `default` — empty form, focus in beneficiary account number
2. `validating` — account name resolving, inline spinner, duration settable
3. `resolved` — beneficiary name auto-filled, amount entered and formatted
4. **operator cue:** `TRANSACTION BLOCKED` — inline critical alert: `ERR_9021 — instruction exceeds single-transaction limit of ₦20,000,000.00. Authorisation required.` Submit disabled.
5. `success` — `Instruction TRF-4471203 submitted for authorisation.`

### Imperfections (exactly three)
- Charge-bearer selector has a disabled option `SHA (deprecated)` with no explanation
- The narration field has a `Max 35 characters` counter — an oddly specific legacy constraint
- Section 2's heading reads `Beneficiary` while the rail column heading reads `Payee` — same thing, two words

### Constraints
- Meridian Trust Bank fictional; beneficiary bank names in the selector must also be fictional (N1)
- Account numbers, names, instruction references synthetic and invalid by construction (N2)
- **No real interbank routing codes, transfer syntax, or anything operable** (N3)
- No platform branding (N4)

**Deliver:** one artboard per state (5 total).
