# Screen Brief Template

| | |
|---|---|
| **Status** | Active — use this for every screen |
| **Owner** | _unassigned_ |
| **Last updated** | 2026-08-29 |
| **Purpose** | The standard input for designing one simulation screen |
| **Related** | [Principles](01_Design_Principles.md) · [Tokens](03_Design_Tokens.md) · [Colour](04_Color_System.md) · [Typography](05_Typography.md) · [Layout](06_Layout_Principles.md) · [Components](09_Component_Library.md) |

## How to use this

One brief per screen. Fill every field — a blank field is a decision the designer will make for you, probably wrong.

The brief is deliberately shaped around the things that make *this* product different: which shot the screen appears in, what the audience must read, what the actor does, and what the operator can trigger. Conventional design briefs cover none of that.

Then paste the **Ready-to-use prompt** at the bottom, with your filled brief, to the design tool.

---

## The template

```markdown
## SCREEN BRIEF

### Identity
- Simulation:            [e.g. Police_Database]
- Fictional institution: [full name + acronym]
- Institution register:  [police | civic | border | health | corrections | military | financial | cyber]
- Mode:                  [light | dark]
- Era:                   [era-current | era-2010s | era-2000s | era-1990s]
- Region:                [default: Nigeria / West Africa]

### The screen
- Screen name:           [e.g. Subject Record — Detail]
- Archetype:             [A1-A11, see 06_Layout_Principles.md]
- Module path:           [e.g. Records > Subjects > Detail]

### The scene
- What happens:          [1-2 sentences of story context]
- Shot type:             [wide | medium | insert/close-up | over-the-shoulder]
- Audience must read:    [1-3 items ONLY - these become Tier A]
- Actor performs:        [what they type, click, or scroll on camera]
- Dialogue references:   [anything spoken that must appear on screen]

### Content
- Primary record/data:   [what is displayed]
- Supporting panels:     [2-3 max]
- Rail content:          [activity log | related records | alerts | none]
- Approximate row count: [<= 12 visible]

### States required
- [ ] default
- [ ] loading
- [ ] empty / no-results
- [ ] error
- [ ] operator cue: [e.g. ACCESS DENIED, system failure, match found]

### Imperfections (pick 2-3, see Principle 5)
- [ ] legacy panel using --type-family-legacy
- [ ] truncated column header
- [ ] cryptic field label (e.g. MISC_CD_2)
- [ ] terse error code
- [ ] disabled dropdown option, unexplained
- [ ] stale notification badge
- [ ] stray scrollbar

### Constraints check
- [ ] Institution and all names are fictional (N1)
- [ ] All data synthetic, identifiers plausible-but-invalid (N2)
- [ ] No operable commands or real technique (N3)
- [ ] No platform branding, no lorem, no TODO (N4)
```

---

## Worked example

```markdown
## SCREEN BRIEF

### Identity
- Simulation:            Police_Database
- Fictional institution: National Bureau of Criminal Records (NBCR)
- Institution register:  police
- Mode:                  light
- Era:                   era-current
- Region:                Nigeria / West Africa

### The screen
- Screen name:           Subject Record — Detail
- Archetype:             A4 (Record / Case File)
- Module path:           Records > Subjects > ADEYEMI, C.

### The scene
- What happens:          A detective pulls up a suspect's record mid-interview
                         and finds a prior conviction the suspect has just denied.
- Shot type:             Over-the-shoulder, pushing to insert on the conviction row
- Audience must read:    (1) Subject name  (2) Status: WANTED  (3) The prior conviction row
- Actor performs:        Clicks the "History" tab, scrolls two rows
- Dialogue references:   "You told me you'd never been arrested."

### Content
- Primary record:        Subject header - photo, name, NBCR ID, DOB, status pill
- Supporting panels:     Biographic detail; Case history table
- Rail content:          Activity log (who accessed this record, when)
- Approximate row count: 8 case history rows

### States required
- [x] default
- [x] loading (record fetch, ~1.2s, settable)
- [x] empty (no prior cases - alternate take)
- [x] error (ERR_4417 - record service unavailable)
- [x] operator cue: FLAG AS WANTED - status pill flips to critical

### Imperfections
- [x] cryptic field label - "CLASS_CD" in biographic panel
- [x] truncated column header - "DISPOSITI..." in case history
- [x] stale notification badge - "3" on Alerts nav item, never clears

### Constraints check
- [x] NBCR is fictional; needs collision check before production
- [x] Name, NBCR ID, DOB synthetic; ID checksum deliberately invalid
- [x] No operable content on this screen
- [x] No platform branding
```

---

## Ready-to-use prompt

Paste this, with your filled brief substituted, into the design tool.

```
Design a screen for our film/TV software simulation platform.

Read these first and follow them exactly:
- 04_UI_UX/01_Design_Principles.md   (non-negotiables + ranked principles)
- 04_UI_UX/03_Design_Tokens.md       (use semantic tokens ONLY, never raw hex)
- 04_UI_UX/04_Color_System.md        (institution palette)
- 04_UI_UX/05_Typography.md          (three-tier legibility system)
- 04_UI_UX/06_Layout_Principles.md   (shell + archetype + frame-safe zones)
- 04_UI_UX/09_Component_Library.md   (component contracts + states)

Canvas: 1920x1080.

This is NOT a normal product UI. Critical differences:
1. It is photographed, not used. Keep Tier A content 8% clear of all edges and
   out of the bottom-right quadrant.
2. Assign every text element a legibility tier (A/B/C). MAXIMUM 3 Tier A elements.
3. It must look like software that has been in service for a decade - dense,
   tight spacing, small radii, warm greys, borders not shadows. Generous
   whitespace and large radii read as a startup product and break credibility.
4. Include 2-3 deliberate imperfections from the brief.
5. Include the live clock and status bar. Never omit them.

[PASTE FILLED BRIEF HERE]

Deliver artboards for every state listed under "States required".
```

---

## Review checklist

Before a screen is accepted:

| Check | Source |
|---|---|
| All four non-negotiables satisfied | [Principles](01_Design_Principles.md) |
| ≤ 3 Tier A elements | [Typography](05_Typography.md) |
| Nothing below 13px, nothing below weight 400 | [Typography](05_Typography.md) |
| Tier A clear of edges and hand zone | [Layout](06_Layout_Principles.md) |
| Semantic tokens only, no raw hex | [Tokens](03_Design_Tokens.md) |
| Status carries label or icon, never colour alone | [Colour](04_Color_System.md) |
| Clock and status bar present | [Layout](06_Layout_Principles.md) |
| Loading, empty, and error states designed | [Components](09_Component_Library.md) |
| 2–3 imperfections, no more | [Principles](01_Design_Principles.md) |
| Dates `DD/MM/YYYY`, currency `₦`, region-correct names | [Typography](05_Typography.md) |
| Every colour pair measured | [`tools/contrast.awk`](tools/README.md) |
| Screen fills the canvas — no mockup margins | [Layout](06_Layout_Principles.md) |
