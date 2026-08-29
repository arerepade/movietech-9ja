# Design Storage

Where finished designs live. Mirrors the `03_Simulations/` category structure so a screen sits next to the simulation it belongs to.

## Structure

```
designs/
  <Category>/
    <Simulation>/
      <NN>_<Screen_Name>/
        RECORD.md            <- metadata, status, artifact URL, review result
        exports/             <- PNG / PDF exports, one per state
        source/              <- .dc.html canvas files or other source
```

Example:

```
designs/Law_Enforcement/Police_Database/03_Subject_Record/
  RECORD.md
  exports/
    default.png
    loading.png
    empty.png
    error.png
    cue-flag-as-wanted.png
  source/
    subject-record.dc.html
```

## Naming

- Folder number matches the brief number (`W1-03` → `03_Subject_Record`)
- Export filenames match the state names in the brief, lowercase, hyphenated
- Operator cues prefix with `cue-`

## Workflow

1. Run the brief from [`../briefs/`](../briefs/) through Claude Design.
2. Scaffold the folder: `bash ../tools/new-design.sh <Category> <Simulation> <NN> <Screen_Name>`
3. Save the canvas source into `source/`, exports into `exports/`.
4. Fill in `RECORD.md`, including the artifact URL.
5. Run the [review checklist](../19_Screen_Brief_Template.md#review-checklist) and record the result.
6. Add the row to [`../20_Design_Registry.md`](../20_Design_Registry.md).

**A design is not done until its `RECORD.md` is filled and the registry row exists.** Otherwise you have a picture nobody can find in three months.

## RECORD.md template

```markdown
# <Screen Name>

| | |
|---|---|
| Brief        | ../../../../briefs/W1-03_NBCR_Subject_Record.md |
| Simulation   | Police_Database |
| Institution  | National Bureau of Criminal Records (NBCR) |
| Archetype    | A4 Record / Case File |
| Mode         | light |
| Era          | era-current |
| Artifact URL | <paste> |
| Status       | draft \| in-review \| approved \| needs-rework |
| Designed     | YYYY-MM-DD |
| Reviewed by  | |

## States delivered
- [ ] default
- [ ] loading
- [ ] empty
- [ ] error
- [ ] cue: <name>

## Review checklist
- [ ] Non-negotiables N1-N4 satisfied
- [ ] <= 3 Tier A elements
- [ ] Nothing below 13px / weight 400
- [ ] Tier A clear of edges and hand zone
- [ ] Semantic tokens only, no raw hex
- [ ] Status never colour-only
- [ ] Clock and status bar present
- [ ] loading / empty / error designed
- [ ] 2-3 imperfections, no more
- [ ] Dates DD/MM/YYYY, currency Naira, region-correct names
- [ ] Colour pairs measured with tools/contrast.awk
- [ ] Fills the canvas, no mockup margins

## Notes
<what changed from the brief, and why>

## Open issues
<anything blocking approval>
```

## Version control policy

**Design files stay local. They are never pushed.**

| Path | Tracked? |
|---|---|
| `RECORD.md` | **Yes** — metadata, artifact URL, review status |
| Category and simulation folders | **Yes** — structure preserved via `.gitkeep` |
| `exports/` | No — gitignored |
| `source/` | No — gitignored |
| `*.dc.html`, `*.fig`, `*.sketch`, `*.xd` anywhere | No — gitignored |

The repository carries the **index**, not the artwork: what was designed, from which brief, where it lives, and whether it passed review. The mocks themselves live on your machine.

### What this means in practice

- **Back up `exports/` yourself.** Git is not doing it. If your disk dies, the designs are gone.
- **`RECORD.md` is the only shared record of a design.** Fill in the artifact URL — without it, nobody else can find the design at all.
- `new-design.sh` creates `exports/` and `source/` locally each time; they will not appear for anyone who clones the repo, which is intended.
- Git LFS is deliberately **not** configured. It isn't needed while no binaries are tracked.
