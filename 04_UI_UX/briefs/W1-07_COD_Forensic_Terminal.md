# W1-07 — COD Forensic Terminal

**Non-negotiable N3 applies harder to this screen than any other in the catalogue.** Everything on it is plausible fiction. Nothing typed here may work if typed into a real system. Read N3 in `01_Design_Principles.md` before starting.

**Copy everything below the line and paste it into Claude Designer.** Fully self-contained — no repo files needed.

Running several screens in one Claude Designer project? Load [`00_DESIGN_INSTRUCTIONS.md`](00_DESIGN_INSTRUCTIONS.md) once instead, then use the short form in [`short/`](short/).

---

Design a screen for a film/TV software simulation platform. This is fictional software built to be **filmed**, not used.

**Canvas: 1920 × 1080.** Deliver one artboard per state listed at the end, and finish with the compliance report.

---

## 1. WHAT THIS IS

The screen must look like real institutional software that has been in service for a decade — a police records system, a hospital EMR, a bank's back office. Not a product concept. Not a redesign of what the job *should* look like.

The audience must believe it exists. A professional in that field must not say "that's not how it works."

**Four hard rules. A design that breaks one is rejected.**

- **N1 — Everything is fictional.** No real agency names, seals, crests, logos or badge designs. Invented institutions only.
- **N2 — No real personal data.** Every name, face, address, phone, ID and account number is synthetic. Identifiers are plausible in format but **invalid by construction**.
- **N3 — Nothing operable.** Command syntax, exploit payloads, banking instructions and dispatch codes are plausible fiction that would not work if typed into a real system.
- **N4 — No platform leakage.** No build numbers of the real tool, no lorem ipsum, no "TODO", no default component-library styling.

## 2. THE RULE THAT OVERRIDES EVERYTHING ELSE

**Legibility on camera beats fidelity to reference.**

Real enterprise software is 11px, low contrast, dense. That is authentic and unusable on camera. Build a *heightened* version — same information architecture and visual grammar, scaled and contrasted for capture.

Reduce **count**, never **apparent density**: fewer table rows, but the same tight row rhythm. The impression of density survives; the mush does not.

## 3. LEGIBILITY TIERS — assign one to every text element

| Tier | Meaning | Size | Contrast |
|---|---|---|---|
| **A — story-critical** | Audience MUST read it. Survives a wide shot. | 32–48px, weight 600–700 | ≥ 7:1 |
| **B — supporting** | Read in a close-up. The bulk of the UI. | 15–20px, weight 400–600 | ≥ 4.5:1 |
| **C — texture** | Never meant to be read. Density and authenticity. | 13–14px, weight 400–500 | ≥ 3:1 |

**MAXIMUM 3 TIER A ELEMENTS PER SCREEN.** If everything is critical, nothing is. This is the most violated rule in the system.

**Hard floor: nothing below 13px, nothing below weight 400.** Sub-13px text and thin strokes shimmer and alias under capture.

**Tier A by treatment.** A status pill cannot be 32px type. An element also qualifies as Tier A by treatment: a **filled** block ≥36px tall with 18px/700 type, or a full-width banner ≥44px tall — each carrying an icon *and* a label. An outline is not a fill; a white box with a grey border is Tier B no matter how bold the text.

Fill with either a status colour **or** the institution chrome, chosen by meaning: status colours assert a state (critical = alert, breach, denied, failure). A standing notice that is merely important — a restricted-system banner, a classification strip — is not an alert. Fill those with institution chrome and keep the status palette for actual state, or the real alert has nothing left to say.

A neutral pill that is not the story beat stays Tier B: 30px tall, 15px/600, outlined not filled.

## 4. TYPE SCALE

There is a deliberate **12px dead band between 20px and 32px**. Nothing sits in it. That gap is the hierarchy.

**Tier A:** 48/1.10/700 · 36/1.15/700 · 32/1.18/700 · 32/1.20/500 (mono)
**Tier B:** 20/1.30/600 (panel headings) · 18/1.35/600 · 18/1.50/400 · 16/1.50/400 (default body) · 15/1.45/400 (mono)
**Tier C:** 14/1.40/400 · 13/1.35/500

**Families**
- UI: `"IBM Plex Sans", "Segoe UI", system-ui, sans-serif`
- Data/mono: `"IBM Plex Mono", Consolas, monospace` — all IDs, codes, timestamps, currency, tabular figures
- Documents: `"IBM Plex Serif", Georgia, serif` — certificates, warrants, printouts
- Legacy: `Verdana, Tahoma, sans-serif` — the deliberate-imperfection layer only

Weights: 400 / 500 / 600 / 700. **Never below 400.**

All-caps labels and column headers carry `letter-spacing: 0.06em`. Untracked all-caps reads as amateur.

## 5. COLOUR

Warm greys, not cool. Warm reads as accumulated and government-issue; cool reads as a 2024 startup.

**Light mode surfaces**
```
app #F7F6F3   panel #FFFFFF   sunken #EFEDE8   row-alt #F7F6F3
text-primary #1C1B18   text-secondary #45423C   text-muted #5F5B53
border-subtle #DFDCD4   border-strong #C6C2B8
neutral ramp: #FFFFFF #F7F6F3 #EFEDE8 #DFDCD4 #C6C2B8 #A5A096 #807B71 #5F5B53 #45423C #2E2C28 #1C1B18
```

**Dark mode surfaces**
```
app #0E1116   panel #161B22   raised #1F2630
text-primary #E8E6E1   text-secondary #A8B0BA   text-muted #7C8794
border-subtle #2C353F   border-strong #3D4854
```

**Status — identical in every simulation. Never re-themed.**

| Status | Light | Dark | Meaning |
|---|---|---|---|
| Critical | `#B3261E` | `#E8695A` | Alert, breach, denied, failure, wanted |
| Warning | `#96670A` | `#F0B429` | Pending, expiring, flagged |
| Success | `#06713F` | `#4CC38A` | Verified, cleared, complete |
| Info | `#164C87` | `#63A0E0` | Active, in progress |
| Neutral | `#807B71` | `#7C8794` | Inactive, archived, unknown |

White text on critical / success / info fills. Near-black `#1C1B18` on a `#C98A0E` warning fill.

**Status is never carried by colour alone** — always colour + label, or colour + icon.

**Camera-safety rules**
- No pure or near-pure red (`#FF0000`) — it smears and blooms under compression
- No pure white `#FFFFFF` as a full-screen background (clips) and no pure black `#000000` (crushes)
- No colour-only encoding in charts or maps — add shape, pattern or label
- Avoid fine red/blue adjacency; separate with a neutral

## 6. SPACING, SHAPE, MOTION

```
space:  2 4 8 12 16 20 24 32 40 48 64 80    (4px base)
radius: 2px DEFAULT. Never above 4px except pills/avatars (9999px).
border: 1px texture · 2px for anything story-critical, focus rings, active states
```

**Institutional software is tight.** Panel padding is 8–16px, not 24px. Generous whitespace reads as a startup product and breaks credibility. Large radii do the same.

**Borders, not shadows.** Shadows only for genuinely floating layers — dropdown `0 1px 2px`, popover `0 2px 8px`, modal `0 8px 24px`. Nothing else gets one.

Motion: 0ms for keystroke feedback, 80ms hover/focus, 140ms panels, 240ms modals. Nothing longer.

## 7. LAYOUT

**Standard shell — every simulation uses this skeleton.**

```
TOP BAR       56px   institution mark + name · module · search · user · LIVE CLOCK
CUE BANNER    44px   reserved; absent by default, carries operator alerts
NAV   260px | CONTENT fluid | RAIL 320px (optional)
STATUS BAR    32px   connection · terminal · session · counts · date-time
```

**Reserve the 44px cue banner even when absent.** Working content budget is **948px**, not 992px. A screen that only fits without the banner breaks the moment a cue fires.

**The live clock and status bar are non-negotiable.** A running, regionally formatted clock is the cheapest credibility signal there is, and its absence is the most common tell in bad screen work.

**Frame-safe zones — this is a filmed screen**
- Keep Tier A content **8% clear of every edge** (≈154px horizontal, ≈86px vertical)
- Keep Tier A out of the **bottom-right quadrant** — that's where the actor's hand and over-the-shoulder occlusion land
- Chrome belongs at the edges; content belongs centre-left of the upper two-thirds

**Density ceilings per screen:** ≤12 visible table rows · ≤3 simultaneous panels · ≤7 nav items without scrolling · ≤3 Tier A elements.

Row heights: 32px dense · **40px standard (default)** · 48px comfortable.

**Fill the screen.** Real institutional software has no generous empty margins. Empty space reads as an unfinished mockup.

## 8. COMPONENTS

Behaviour is fixed platform-wide; only appearance varies by institution.

**Every interactive component needs:** default, hover, focus, active, disabled, loading, error.
**Every data component needs:** empty, no-results, error — these appear on camera as often as the happy path.

**Focus states are mandatory and visible** at 2px. An actor drives this from a keyboard, so this is a realism requirement before it is an accessibility one.

Table anatomy: all-caps tracked header on `sunken`, zebra rows, 40px rows, pagination footer showing counts.
Field pair: all-caps 13px label above a 16px value. This is the atom of every detail panel.
Empty and error copy is written in institutional voice — terse, unapologetic, slightly unhelpful. `ERR_4417 — contact your administrator`, never "Oops!"

**Icons: inline SVG, stroke-based, consistent weight. Never emoji.**

## 9. REGION — Nigeria / West Africa

Dates `DD/MM/YYYY` · currency `₦1,250,000.00` · phone `+234 802 ••• ••••` · 11-digit national identifiers, invalid by construction · Nigerian personal and place names · Lagos/Abuja/Ibadan addresses.

## 10. DELIBERATE IMPERFECTION

Real software has scars; perfect software reads as fake. Include **exactly the imperfections listed in the brief below — no more.** Two or three is authentic; more reads as broken.

They are always deliberate and quiet: a cryptic field label like `CLASS_CD`, a column header truncated mid-word, one legacy panel in an older typeface, a stale badge that never clears, a disabled dropdown option with no explanation, two modules disagreeing on date format.

## 11. BEFORE YOU DELIVER — report, don't drift

These rules are not suggestions and not a starting point to improve on. **Do not substitute your own palette, type scale, spacing or corner radii.** If something here seems wrong, follow it anyway and say so in your notes — do not silently fix it.

With every screen, output a short compliance report:

```
TIER A (max 3):   1. …   2. …   3. …
TYPE:             largest __px · smallest __px  (must be 13-48, nothing 21-31)
PALETTE:          any colour used that is not in section 5? list it
SHELL:            top bar 56 · cue banner 44 reserved · nav 260 · status bar 32  [y/n each]
DENSITY:          __ table rows (max 12) · __ panels (max 3)
FRAME-SAFE:       Tier A clear of edges and bottom-right quadrant?  [y/n]
STATES:           list the artboards delivered
IMPERFECTIONS:    list them — must match the brief exactly, no extras
DEVIATIONS:       anything you changed from this spec, and why
```

If you could not follow a rule, say which and why. A stated deviation is fine. An unstated one is not.

---

## SCREEN BRIEF

### Identity
- **Simulation:** Digital_Forensics
- **Fictional institution:** Cyber Operations Directorate (COD)
- **Register:** cyber — chrome `#0E1116`, accent `#63A0E0`
- **Mode:** dark · **Era:** era-current · **Region:** Nigeria / West Africa

### The screen
- **Screen name:** Forensic Analysis Console
- **Archetype:** A9 (Terminal / Console)
- **Module path:** Analysis › Console

### The scene
An analyst runs an image analysis against a seized device. Output scrolls. The last line is the one the scene turns on.

- **Shot:** Over-the-shoulder, then insert on the final result line
- **Audience must read (Tier A — these two only):**
  1. The final result line — `MATCH FOUND: 1 artefact`
  2. The artefact identifier
- **Actor performs:** Types a command and presses Enter. **The typing must look right** — this is the screen most likely to be shot in close-up on the actor's hands, so the prompt, the echo, and the cursor all have to behave.

### Content
- Split layout: terminal pane left (roughly two-thirds), evidence metadata panel right
- **Terminal pane:** prompt line with fictional tool name, scrolling output, cursor
- **Output content:** a plausible analysis run — banner line, load steps, progress ticks, hash lines, summary. Mono throughout, `--type-data`.
- **Evidence panel:** case ref, device, acquisition date, examiner, hash, chain-of-custody entries
- **Status bar:** session, elapsed time, clock

**Fiction requirements for the output:** invent the tool name and its flags. Hashes are the right length and character set but arbitrary. No real command syntax from any real forensic or offensive tool. No real file paths from real operating systems presented as exploitable. The output should convince an analyst that it is *a* tool, not tell them *which* tool.

### States required
1. `idle` — prompt waiting, evidence panel populated
2. `running` — output scrolling, progress ticks, elapsed counter climbing, duration settable
3. `complete` — the `MATCH FOUND` result line, highlighted
4. `no-match` — `ANALYSIS COMPLETE: 0 artefacts` (alternate take)
5. `error` — `ERR_1180 — image volume unreadable at offset 0x…`

### Imperfections (exactly three)
- A deprecation warning early in the output: `WARN: --legacy-parse is deprecated and will be removed`
- One output column that misaligns because a value is one character too long
- Version banner showing a build number years out of step with the rest of the platform

### Constraints
- COD fictional; check the acronym for collisions (N1)
- Case refs, hashes, device serials synthetic (N2)
- **N3 is the governing constraint on this screen** — plausible fiction only, nothing operable, no real tool syntax
- No platform branding (N4)

**Deliver:** one artboard per state (5 total).
