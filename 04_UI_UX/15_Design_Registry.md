# Design Registry

The index of every designed screen. **A design is not done until it has a row here.**

| | |
|---|---|
| **Last updated** | 2026-08-29 |
| **Briefs** | [`briefs/`](briefs/) |
| **Storage** | [`designs/`](designs/) |
| **Review checklist** | [14_Screen_Brief_Template.md](14_Screen_Brief_Template.md#review-checklist) |

## Status values

`not started` → `designed` → `in review` → **`approved`** · or `needs rework`

Only `approved` screens may be used as reference for new work.

---

## Wave 1 — system shakedown

Thirteen screens covering all eleven archetypes, six institutions, both modes.

| # | Institution | Screen | Archetype | Mode | Status | Record |
|---|---|---|---|---|---|---|
| W1-01 | NBCR | Login | A1 Authentication | Light | **designed** | [RECORD](designs/Law_Enforcement/Police_Database/01_Login/RECORD.md) |
| W1-02 | NBCR | Subject Search | A5 Search & Results | Light | not started | — |
| W1-03 | NBCR | Subject Record | A4 Record / Case File | Light | **designed** | [RECORD](designs/Law_Enforcement/Police_Database/03_Subject_Record/RECORD.md) |
| W1-04 | NBCR | Wanted Queue | A3 List / Queue | Light | not started | — |
| W1-05 | NBCR | Access Denied | A10 Alert / Interrupt | Light | not started | — |
| W1-06 | COD | SOC Dashboard | A2 Dashboard / Monitor | Dark | not started | — |
| W1-07 | COD | Forensic Terminal | A9 Terminal / Console | Dark | not started | — |
| W1-08 | Marina General | Patient Chart | A4 Record / Case File | Light | not started | — |
| W1-09 | NIRA | Biometric Verification | A7 Detail + Media | Light | not started | — |
| W1-10 | NIRA | Certificate of Registration | A11 Document | Light | not started | — |
| W1-11 | BOC | Border Movement Map | A6 Map / Geo | Light | not started | — |
| W1-12 | Meridian Trust | Account Detail | A4 Record / Case File | Dark | not started | — |
| W1-13 | Meridian Trust | Transfer Form | A8 Form / Data Entry | Dark | not started | — |

### Run order

**File order, W1-01 → W1-13.** Numbering groups screens by institution, so each run stays in one visual world.

---

## Archetype coverage

| Archetype | Covered by | Approved |
|---|---|---|
| A1 Authentication | W1-01 | ☐ |
| A2 Dashboard / Monitor | W1-06 | ☐ |
| A3 List / Queue | W1-04 | ☐ |
| A4 Record / Case File | W1-03, W1-08, W1-12 | ☐ |
| A5 Search & Results | W1-02 | ☐ |
| A6 Map / Geo | W1-11 | ☐ |
| A7 Detail + Media | W1-09 | ☐ |
| A8 Form / Data Entry | W1-13 | ☐ |
| A9 Terminal / Console | W1-07 | ☐ |
| A10 Alert / Interrupt | W1-05 | ☐ |
| A11 Document / Printout | W1-10 | ☐ |

## Institution coverage

| Fictional institution | Register | Mode | Screens | Name cleared? |
|---|---|---|---|---|
| National Bureau of Criminal Records (NBCR) | Police | Light | W1-01…05 | ☐ |
| Cyber Operations Directorate (COD) | Cyber | Dark | W1-06, W1-07 | ☐ |
| Marina General Hospital | Health | Light | W1-08 | ☐ |
| National Identity Registry Authority (NIRA) | Civic | Light | W1-09, W1-10 | ☐ |
| Border Operations Command (BOC) | Border | Light | W1-11 | ☐ |
| Meridian Trust Bank | Financial | Dark | W1-12, W1-13 | ☐ |

**No institution name is cleared yet.** Every acronym needs a collision check against real organisations before production use — see Non-negotiable N1. NIRA and COD are the highest-risk of the six.

---

## What Wave 1 is actually testing

Wave 1 exists to find holes in the design system, not to produce final assets. Watch for these:

| Signal | What it means |
|---|---|
| W1-03, W1-08, W1-12 come back structurally different | The A4 archetype is underspecified, or the theme contract leaks |
| Tier A creep — more than 3 per screen | The typography rules aren't landing; tighten the prompt |
| Screens look clean and modern | Density and radius guidance is too weak. This is the most likely failure. |
| Imperfections read as bugs | The imperfection catalogue needs to move into `13_Simulation_Realism.md` with examples |
| Designer invents colours | Token file isn't specific enough, or the prompt isn't pointing at it hard enough |
| Empty and error states get skipped | Make them separate deliverables rather than a list item |

Record what you find in the Notes section of each `RECORD.md`. After Wave 1, fold the findings back into the token and principle files **before** starting Wave 2.

---

## Waves 2+ (not yet briefed)

Remaining catalogue from `03_Simulations/`: Trading Platform, Crypto Exchange, Fraud Investigation · SIEM Platform, Hacker Terminal, Threat Monitor · Election System, Customs System · Laboratory System, Patient Management · FBI Investigation System, Immigration System, Interpol Database, Prison Management · Command Center, Drone Control, Satellite Monitoring.

Several of these carry naming risk under N1 that needs legal input before briefing — the ones referencing real agencies most obviously.
