# Design Tokens

| | |
|---|---|
| **Status** | Draft — provisional pending camera test |
| **Owner** | _unassigned_ |
| **Last updated** | 2026-08-29 |
| **Scope** | In-world simulation UI (the fictional software). Platform SaaS UI is out of scope. |
| **Default region** | Nigeria / West Africa |
| **Related** | [Design Principles](01_Design_Principles.md) · [Colour](04_Color_System.md) · [Typography](05_Typography.md) · [Components](13_Component_Library.md) |

## Why this file exists

A design agent cannot act on adjectives. This file is the machine-readable half of the design system: every value a screen may use, and nothing else. If a value is not here, it is not available.

**Rule: screens consume semantic tokens only.** Primitives exist to build semantics. A screen that references `--p-green-600` directly is wrong; it should reference `--status-success`.

---

## The four layers

```
1. PRIMITIVE      raw values, no meaning        --p-green-600: #06713F
        |
2. SEMANTIC       role in the interface         --status-success: var(--p-green-600)
        |
3. INSTITUTION    per-fictional-org override    --brand-primary: var(--p-blue-600)
        |
4. CAPTURE / ERA  shot- and period-specific     --type-scale: capture-wide | period-2004
```

Layers 3 and 4 override a **fixed, small list** of layer-2 tokens. They may not introduce new tokens. This is what lets hundreds of simulations inherit one system (Principle 7) while still looking like different institutions (Principle 6).

### Naming

```
--p-*         primitive
--surface-*   backgrounds
--text-*      foreground text
--border-*    lines and dividers
--brand-*     institution identity
--status-*    semantic state
--space-*     spacing
--type-*      typography
--radius-*    corner radii
--motion-*    duration and easing
--z-*         stacking
```

---

## Primitives

### Neutral — warm grey (institutional workhorse)

Warm rather than cool: it reads as older, accumulated, government-issue. Cool greys read as modern consumer software.

| Token | Value |
|---|---|
| `--p-n-0` | `#FFFFFF` |
| `--p-n-50` | `#F7F6F3` |
| `--p-n-100` | `#EFEDE8` |
| `--p-n-200` | `#DFDCD4` |
| `--p-n-300` | `#C6C2B8` |
| `--p-n-400` | `#A5A096` |
| `--p-n-500` | `#807B71` |
| `--p-n-600` | `#5F5B53` |
| `--p-n-700` | `#45423C` |
| `--p-n-800` | `#2E2C28` |
| `--p-n-900` | `#1C1B18` |

### Ink — cool dark (ops centres, terminals, monitoring)

| Token | Value |
|---|---|
| `--p-ink-500` | `#3D4854` |
| `--p-ink-600` | `#2C353F` |
| `--p-ink-700` | `#1F2630` |
| `--p-ink-800` | `#161B22` |
| `--p-ink-900` | `#0E1116` |
| `--p-ink-text` | `#E8E6E1` |
| `--p-ink-text-2` | `#A8B0BA` |
| `--p-ink-text-3` | `#7C8794` |

### Institutional hues

Full ramps and rationale in [Colour System](04_Color_System.md). Anchors only here.

| Token | Value | Institutional register |
|---|---|---|
| `--p-green-600` | `#06713F` | Civic, registry, national |
| `--p-green-500` | `#0B8A4E` | |
| `--p-blue-600` | `#164C87` | Police, security, intelligence |
| `--p-blue-500` | `#1B5FA8` | |
| `--p-ox-600` | `#7A2E2E` | Judiciary, corrections, formal |
| `--p-amber-600` | `#96670A` | Customs, borders, transport |
| `--p-teal-600` | `#0B6062` | Health, laboratory |
| `--p-red-600` | `#B3261E` | Critical state |

Dark-surface variants:

| Token | Value |
|---|---|
| `--p-red-on-dark` | `#E8695A` |
| `--p-amber-on-dark` | `#F0B429` |
| `--p-green-on-dark` | `#4CC38A` |
| `--p-blue-on-dark` | `#63A0E0` |

### Spacing — 4px base

`--space-0: 0` · `--space-1: 2px` · `--space-2: 4px` · `--space-3: 8px` · `--space-4: 12px` · `--space-5: 16px` · `--space-6: 20px` · `--space-7: 24px` · `--space-8: 32px` · `--space-9: 40px` · `--space-10: 48px` · `--space-12: 64px` · `--space-14: 80px`

Institutional software is **tight**. Default padding inside a data-dense panel is `--space-3` to `--space-4`, not `--space-7`. Generous whitespace reads as a modern startup product and breaks credibility.

### Radius

`--radius-0: 0` · `--radius-1: 2px` · `--radius-2: 3px` · `--radius-3: 4px` · `--radius-4: 6px` · `--radius-full: 9999px`

**Default is `--radius-1`.** Anything above `--radius-3` reads as consumer software. `--radius-full` is for status pills and avatars only.

### Border

| Token | Value | Use |
|---|---|---|
| `--border-hairline` | `1px` | Texture: table rules, minor dividers |
| `--border-standard` | `1px` | Panel and input outlines |
| `--border-emphasis` | `2px` | Anything story-critical, focus rings, active states |

A 1px line can shimmer or drop out under capture. **Any border carrying meaning the audience must perceive uses `--border-emphasis`.**

### Elevation

Institutional software uses **borders, not shadows**. Shadows are reserved for genuinely floating layers.

| Token | Value |
|---|---|
| `--elev-0` | `none` |
| `--elev-1` | `0 1px 2px rgba(28,27,24,0.12)` |
| `--elev-2` | `0 2px 8px rgba(28,27,24,0.16)` |
| `--elev-3` | `0 8px 24px rgba(28,27,24,0.24)` |

`--elev-1` for dropdowns, `--elev-2` for popovers, `--elev-3` for modals. Nothing else gets a shadow.

### Motion

| Token | Value | Use |
|---|---|---|
| `--motion-instant` | `0ms` | Actor input feedback. Never delayed. |
| `--motion-fast` | `80ms` | Hover, focus, press |
| `--motion-base` | `140ms` | Panel and tab transitions |
| `--motion-slow` | `240ms` | Modals, drawers |
| `--motion-ease` | `cubic-bezier(0.2, 0, 0.2, 1)` | Standard |
| `--motion-linear` | `linear` | Progress, spinners, telemetry |

**Anything responding to actor keystrokes uses `--motion-instant`** (Principle 4). Nothing may animate longer than `--motion-slow` — a director will not wait for it.

### Stacking

`--z-base: 0` · `--z-sticky: 100` · `--z-dropdown: 200` · `--z-popover: 300` · `--z-modal: 400` · `--z-alert: 500` · `--z-cue: 900`

`--z-cue` is reserved for operator-triggered scene states (system failure, red alert) which must cover everything.

---

## Semantic tokens

These are what screens use. Contrast ratios below are **measured**, not estimated.

### Light institution theme

| Token | Value | Measured contrast |
|---|---|---|
| `--surface-app` | `--p-n-50` | — |
| `--surface-panel` | `--p-n-0` | — |
| `--surface-raised` | `--p-n-0` | — |
| `--surface-sunken` | `--p-n-100` | — |
| `--surface-row-alt` | `--p-n-50` | — |
| `--text-primary` | `--p-n-900` | 15.94:1 on app · 17.22:1 on panel |
| `--text-secondary` | `--p-n-700` | 9.26:1 on app |
| `--text-muted` | `--p-n-600` | 6.76:1 on panel |
| `--border-subtle` | `--p-n-200` | — |
| `--border-strong` | `--p-n-300` | — |

### Dark institution theme

| Token | Value | Measured contrast |
|---|---|---|
| `--surface-app` | `--p-ink-900` | — |
| `--surface-panel` | `--p-ink-800` | — |
| `--surface-raised` | `--p-ink-700` | — |
| `--surface-sunken` | `--p-ink-900` | — |
| `--text-primary` | `--p-ink-text` | 15.16:1 on app |
| `--text-secondary` | `--p-ink-text-2` | 8.63:1 on app |
| `--text-muted` | `--p-ink-text-3` | 4.74:1 on panel |
| `--border-subtle` | `--p-ink-600` | — |
| `--border-strong` | `--p-ink-500` | — |

### Status — identical meaning in every simulation (Principle 6)

| Token | Light | Dark | Meaning |
|---|---|---|---|
| `--status-critical` | `#B3261E` (6.54:1) | `#E8695A` (5.94:1) | Alert, breach, denied, failure |
| `--status-warning` | `#96670A` (4.95:1) | `#F0B429` (10.15:1) | Pending, expiring, flagged |
| `--status-success` | `#06713F` (6.10:1) | `#4CC38A` (8.54:1) | Verified, cleared, complete |
| `--status-info` | `#164C87` (8.69:1) | `#63A0E0` (6.88:1) | Active, in progress, informational |
| `--status-neutral` | `--p-n-500` | `--p-ink-text-3` | Inactive, archived, unknown |

Text placed **on** a status fill: `--text-on-critical: #FFFFFF` (6.54:1) · `--text-on-success: #FFFFFF` (6.10:1) · `--text-on-info: #FFFFFF` (8.69:1) · `--text-on-warning: #1C1B18` (5.84:1 on the lighter `#C98A0E` fill).

**Status must never be carried by colour alone** — every status pairs colour with a label, an icon, or both. This is both an accessibility floor and a capture requirement, since saturated colour degrades under compression.

---

## The institution theme contract

A fictional institution may override **only these tokens**. Nothing else. This is the boundary that keeps hundreds of simulations coherent.

```
--brand-primary          --brand-on-primary       --brand-accent
--brand-chrome-bg        --brand-chrome-text      --brand-mark
--surface-app            --surface-panel          --surface-sunken
--text-primary           --text-secondary         --text-muted
--border-subtle          --border-strong
--type-family-ui         --type-family-data
--radius-default
```

Status tokens, spacing, motion, and elevation are **never** overridden. A red alert looks the same in a hospital and a border post — that is what makes the catalogue learnable on set.

---

## The era layer

Period is a token set, not a rebuild.

| Era set | Shifts |
|---|---|
| `era-current` | Default. Everything above. |
| `era-2010s` | Flatter, `--radius-0`, heavier borders, denser type |
| `era-2000s` | Bevelled surfaces, gradient chrome, Verdana/Tahoma UI stack, `--radius-0`, system-blue selection |
| `era-1990s` | Fixed 8px grid, mono-heavy, 16-colour palette, no antialiasing cues |

Era overrides the institution list plus `--elev-*` and `--border-*`. Declare the era in every screen brief.

---

## Rules

1. Screens reference **semantic tokens only**. Never primitives, never raw hex.
2. If a screen needs a value that does not exist, it goes in this file first — it does not get hardcoded.
3. Institution themes and era sets override only their contracted lists.
4. Status colour is never the sole carrier of meaning.
5. Every new colour pair is **measured** before it ships, not eyeballed.

---

## Provisional

Every numeric value here is a considered starting point, not a validated one. The type scale, contrast floors, and border weights must be confirmed by a **camera test** before this file loses its provisional status. Expect sizes to go up and hairlines to go away.
