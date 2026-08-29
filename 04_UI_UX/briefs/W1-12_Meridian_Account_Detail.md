# W1-12 — Meridian Trust Account Detail

Third instance of archetype A4, and the first in dark mode. Compare against W1-03 and W1-08: structurally identical, visually a different institution entirely. If it drifts structurally, the theme contract needs tightening.

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
- **Simulation:** Core_Banking (fraud investigation view)
- **Fictional institution:** Meridian Trust Bank
- **Register:** financial — chrome `#1C1B18`, accent `#C9A227`
- **Mode:** dark · **Era:** era-current · **Region:** Nigeria / West Africa

### The screen
- **Screen name:** Account Detail — Transaction Review
- **Archetype:** A4 (Record / Case File)
- **Module path:** Investigations › Accounts › 30• • • • 4821

### The scene
A fraud investigator reviews an account flagged overnight. Three transfers in ninety minutes drained it.

- **Shot:** Over-the-shoulder, insert on the transaction rows
- **Audience must read (Tier A — these three only):**
  1. Closing balance — a number that should be much larger
  2. The three flagged transfer rows
  3. `UNDER REVIEW` status pill
- **Actor performs:** Sorts by amount, selects the three flagged rows
- **Dialogue reference:** "Ninety minutes. All of it."

**Currency is the star of this screen.** All amounts in `--type-family-data` with tabular figures, right-aligned, `₦` prefix, two decimals. Misaligned digits in a money column destroy credibility instantly.

### Content
- **Account header:** account holder name, masked account number (mono), account type, branch, opened date, status pill, current balance (Tier A)
- **Panel 1 — Account detail:** field pairs — BVN-style 11-digit identifier, phone `+234`, address, relationship manager, KYC status
- **Panel 2 — Transactions:** table, 10 rows — datetime, reference (mono), description, channel, debit, credit, balance. Three rows flagged.
- **Rail:** Case activity — investigator notes and system flags, timestamped
- **Row count:** 10 visible

### States required
1. `default`
2. `loading` — statement fetch, duration settable
3. `empty` — `No transactions for the selected period.`
4. `error` — `ERR_6015 — core banking link timed out`
5. **operator cue:** `ACCOUNT FROZEN` — status pill flips to `--status-critical`, a `--z-cue` banner appears, transaction actions disable

### Imperfections (exactly three)
- Channel column shows raw codes `ATM` / `POS` / `WEB` / `MOB` / `NIP` with no legend anywhere on screen
- Truncated column header `DESCRIPTIO…`
- One transaction description in all-caps while the rest are mixed case — different upstream systems, different conventions

### Constraints
- Meridian Trust Bank is fictional (N1)
- Account numbers masked and invalid; BVN-style identifier 11 digits and invalid by construction; holder name synthetic (N2)
- **No real transfer instructions, routing codes, or operable banking syntax** (N3)
- No platform branding (N4)

**Deliver:** one artboard per state (5 total).
