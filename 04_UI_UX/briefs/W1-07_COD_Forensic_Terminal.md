# W1-07 — COD Forensic Terminal

**Non-negotiable N3 applies harder to this screen than any other in the catalogue.** Everything on it is plausible fiction. Nothing typed here may work if typed into a real system. Read N3 in `01_Design_Principles.md` before starting.

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
- Data synthetic and Nigeria-correct: `DD/MM/YYYY`, `+234`, reserved documentation IP ranges only.

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
