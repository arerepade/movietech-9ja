# Screen Briefs

Paste-ready prompts for Claude Designer. One file per screen.

**Each file is fully self-contained.** The complete design system — palette, type scale, layout shell, component rules, region formatting — is written into every prompt. Nothing references a repo file, so they work in the browser where Claude Designer cannot read this repository.

Open a file, copy everything below the horizontal rule, paste it. That's the whole workflow.

## Two ways to run these

**A — Project mode (recommended for a run of screens).** Load `00_DESIGN_INSTRUCTIONS.md` **once** — paste it at the start of the Claude Designer session, or set it as the project's custom instructions. Then send screens from `short/` (~2.8KB each). The design system stays in context and governs everything you design in that session.

**B — One-off mode.** Send a `W1-*.md` from this directory (~12KB each). Fully self-contained, spec included. Use this for a single screen or a fresh session.

Do not use `short/` without loading the instruction first — the designer will have no styling to follow and will invent its own.

## How these are built

| File | Role |
|---|---|
| `_DESIGN_SPEC.md` | The design system. **Single source of truth — edit this one.** |
| `00_DESIGN_INSTRUCTIONS.md` | Generated. The standing instruction for project mode. |
| `W1-*.md` | Generated. Header + full spec + that screen's brief. |
| `short/W1-*.md` | Generated. Header + that screen's brief only. |
| `../tools/build-briefs.mjs` | Rebuilds all of the above |

## Staying aligned

`_DESIGN_SPEC.md` ends with a **compliance report** the designer must output with every screen: Tier A elements used, largest and smallest type size, any colour outside the palette, shell dimensions, row and panel counts, frame-safe check, states delivered, imperfections used, and any deviations.

That is the alignment mechanism. A stated deviation is fine and useful; an unstated one is the thing to catch. Check the report before accepting a screen.

**Do not hand-edit the spec block inside a `W1-*.md` file** — it will be overwritten. Edit `_DESIGN_SPEC.md` and re-run:

```bash
node tools/build-briefs.mjs     # from 04_UI_UX/
```

The per-screen half (everything from `## SCREEN BRIEF` down) is safe to edit directly; the script never touches it.

When the design system changes in `03_Design_Tokens.md`, `05_Typography.md`, `04_Color_System.md`, `06_Layout_Principles.md` or `09_Component_Library.md`, mirror the change into `_DESIGN_SPEC.md` and rebuild — otherwise the prompts drift from the system they are supposed to enforce.

## Naming

```
W<wave>-<nn>_<INSTITUTION>_<Screen>.md
```

## Wave 1 — system shakedown

Thirteen screens chosen to exercise **all eleven archetypes**, **six institutions**, and **both modes**. If the design system holds across these, it holds.

| # | Institution | Screen | Archetype | Mode |
|---|---|---|---|---|
| W1-01 | NBCR | Login | A1 Authentication | Light |
| W1-02 | NBCR | Subject Search | A5 Search & Results | Light |
| W1-03 | NBCR | Subject Record | A4 Record / Case File | Light |
| W1-04 | NBCR | Wanted Queue | A3 List / Queue | Light |
| W1-05 | NBCR | Access Denied | A10 Alert / Interrupt | Light |
| W1-06 | COD | SOC Dashboard | A2 Dashboard / Monitor | Dark |
| W1-07 | COD | Forensic Terminal | A9 Terminal / Console | Dark |
| W1-08 | Marina General | Patient Chart | A4 Record / Case File | Light |
| W1-09 | NIRA | Biometric Verification | A7 Detail + Media | Light |
| W1-10 | NIRA | Certificate of Registration | A11 Document | Light |
| W1-11 | BOC | Border Movement Map | A6 Map / Geo | Light |
| W1-12 | Meridian Trust | Account Detail | A4 Record / Case File | Dark |
| W1-13 | Meridian Trust | Transfer Form | A8 Form / Data Entry | Dark |

**W1-03 and W1-08 are the same archetype in different institutions.** Run both early — if they come back structurally identical and visually distinct, the institution theme contract works. If they come back structurally different, the system has a hole.

## Suggested order

1. **W1-03** first. A4 is the most common archetype in the catalogue and the densest test of the tokens.
2. **W1-08** second, to validate re-theming.
3. **W1-06** third — first dark-mode screen.
4. Then the rest in any order.

## After each design

1. Run the [review checklist](../14_Screen_Brief_Template.md#review-checklist).
2. Store it per [`designs/README.md`](../designs/README.md).
3. Update [`15_Design_Registry.md`](../15_Design_Registry.md).

## Adding a brief

Create `W1-14_<INSTITUTION>_<Screen>.md` with just a title header, a `---` rule, and a `## SCREEN BRIEF` section following the template in [`14_Screen_Brief_Template.md`](../14_Screen_Brief_Template.md). Then run `node tools/build-briefs.mjs` — it splices the spec block in for you.
