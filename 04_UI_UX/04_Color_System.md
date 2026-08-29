# Colour System

| | |
|---|---|
| **Status** | Draft — palettes need a regional reference audit |
| **Owner** | _unassigned_ |
| **Last updated** | 2026-08-29 |
| **Scope** | In-world simulation UI |
| **Default region** | Nigeria / West Africa |
| **Related** | [Design Tokens](03_Design_Tokens.md) · [Typography](05_Typography.md) · [Themes](11_Themes.md) · [Legal](../09_Legal/) |

## Principles that govern colour here

1. **Colour identifies the institution, never the state.** Status colours are fixed platform-wide (Principle 6). Institutions differ in chrome and accent only.
2. **Camera-safe before screen-pretty.** Saturated colour smears under video compression. Everything here is deliberately desaturated relative to what looks good on a desk monitor.
3. **Measured, not eyeballed.** Every pair below was run through [`tools/contrast.awk`](tools/README.md). Ratios shown are actual output.
4. **Never colour alone.** Every status pairs colour with a label or icon.

---

## Camera-safety rules

These are the ones that get discovered too late.

| Rule | Reason |
|---|---|
| No pure or near-pure red (`#FF0000`, `#E01B24`) | Red smears and blooms hardest under chroma subsampling. Our critical red is `#B3261E`. |
| No fully saturated hue at large fill sizes | Large saturated areas band and posterise. Cap fills at the 600-level values. |
| Avoid pure white `#FFFFFF` as a full-screen background | Clips highlights and blooms. Use `--surface-app` (`#F7F6F3`). White is fine for panels. |
| Avoid pure black `#000000` as a background | Crushes to noise. Our darkest is `#0E1116`. |
| No colour-only differentiation in charts or maps | Add pattern, label, or shape. |
| No fine red/blue adjacency | Chroma edges fringe badly. Separate with a neutral. |

---

## Neutrals

Two families, chosen deliberately.

**Warm grey** (`--p-n-*`) is the default. It reads as accumulated, government-issue, slightly aged — software that has been in service for a decade. Cool grey reads as a 2024 startup and quietly undermines credibility.

**Cool ink** (`--p-ink-*`) is for operations centres, monitoring walls, terminals, and anything shot in a darkened room.

Values in [Design Tokens](03_Design_Tokens.md).

---

## Status palette

Fixed. Not overridable by any institution or era.

| Status | Light surface | Dark surface | Meaning |
|---|---|---|---|
| Critical | `#B3261E` — 6.54:1 | `#E8695A` — 5.94:1 | Alert, breach, denied, failure, wanted |
| Warning | `#96670A` — 4.95:1 | `#F0B429` — 10.15:1 | Pending, expiring, flagged, unverified |
| Success | `#06713F` — 6.10:1 | `#4CC38A` — 8.54:1 | Verified, cleared, granted, complete |
| Info | `#164C87` — 8.69:1 | `#63A0E0` — 6.88:1 | Active, in progress, informational |
| Neutral | `#807B71` | `#7C8794` | Inactive, archived, unknown, no data |

Ratios are foreground-on-surface, measured against `#FFFFFF` and `#0E1116` respectively.

**Fills:** white text on critical (6.54:1), success (6.10:1), and info (8.69:1). Warning fills use the lighter `#C98A0E` with near-black text (5.84:1) — a dark-on-amber pill, which is also how most real systems render it.

---

## Institution palettes

Each fictional institution gets a **chrome colour** (top bar, nav, headers) and one **accent**. Everything else comes from the shared neutrals and status set.

All chrome pairs below are measured with white chrome text.

| Register | Chrome | Ratio | Accent | Fits |
|---|---|---|---|---|
| Police / investigation | `#103866` | 11.80:1 | `#1B5FA8` | Criminal records, case management |
| Civic / registry | `#06713F` | 6.10:1 | `#0B8A4E` | National ID, elections, licensing |
| Border / customs | `#7A4A08` | 7.47:1 | `#96670A` | Immigration, customs, transport |
| Health | `#0B6062` | 7.33:1 | `#10797C` | Hospital, laboratory, patient records |
| Corrections / judiciary | `#5E2222` | 12.15:1 | `#7A2E2E` | Prisons, courts, warrants |
| Military / command | `#2E3A2A` | 11.97:1 | `#4A5A42` | Command centres, drone, satellite |
| Financial | `#1C1B18` | 17.22:1 | `#C9A227` (7.12:1 on chrome) | Core banking, trading, fraud |
| Cyber / SOC | `#0E1116` | 15.16:1 | `#63A0E0` (6.88:1 on chrome) | SIEM, threat monitor, forensics |

Green anchors the civic register because it is the dominant institutional colour across Nigerian public-sector identity. Financial and cyber run dark by default; the rest run light.

### Example institution themes

Illustrative fictional institutions, to show the shape. **All names are invented** and must clear legal review before production use (Non-negotiable N1).

| Fictional institution | Register | Chrome | Accent | Mode |
|---|---|---|---|---|
| National Bureau of Criminal Records (NBCR) | Police | `#103866` | `#1B5FA8` | Light |
| National Identity Registry Authority (NIRA) | Civic | `#06713F` | `#0B8A4E` | Light |
| Border Operations Command (BOC) | Border | `#7A4A08` | `#96670A` | Light |
| Marina General Hospital | Health | `#0B6062` | `#10797C` | Light |
| Meridian Trust Bank | Financial | `#1C1B18` | `#C9A227` | Dark |
| Cyber Operations Directorate (COD) | Cyber | `#0E1116` | `#63A0E0` | Dark |

> **Naming check:** every fictional acronym must be tested against real organisations before use. Several obvious candidates collide with real Nigerian agencies and are unusable. This is a legal review task, not a design one.

---

## Regional colour notes

**This section needs a reference audit before it is trusted.**

Working observations for Nigerian and West African institutional software:

- **Green carries civic and national weight** and is the natural default for registry, identity, and public-service systems.
- **Banking is strongly brand-coloured**, with saturated, confident corporate identities — a much bolder palette than public-sector systems.
- **Public-sector web systems skew dated**, often to a framework-default aesthetic several generations behind current practice. That is an authenticity asset, not a problem to fix: it is exactly the accumulated look Principle 1 and Principle 5 ask for.
- **Documents matter.** Certificate, receipt, and printout aesthetics — seals, guilloche borders, stamped approvals — carry more institutional weight in these systems than screen chrome does. Design them as first-class artefacts.

**Do not treat the above as settled.** It is general knowledge, not research. Before this file leaves draft, someone should assemble a reference board of actual Nigerian institutional interfaces — banking apps, government portals, hospital systems, airport and border kiosks — and correct this section against it. **Reference for the visual language only; never source assets** (N1).

---

## Dark and light

Mode is an institution property, not a user preference. A hospital EMR is light because hospital software is light. A SOC is dark because SOCs are dark rooms.

The mode is declared in the institution theme and does not toggle. There is no dark-mode switch in a simulation, because real institutional software of this kind rarely has one — and a toggle is one more thing to hit by accident during a take.

---

## Open

1. **Regional reference audit** — the section above is unvalidated.
2. **Fictional name clearance** — every institution name needs a collision check.
3. **Camera test** — desaturation levels are reasoned, not measured against actual footage. Expect to pull saturation down further, not up.
