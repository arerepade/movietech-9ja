# Component Library

| | |
|---|---|
| **Status** | Draft — inventory and contracts. Visual specs pending. |
| **Owner** | _unassigned_ |
| **Last updated** | 2026-08-29 |
| **Scope** | In-world simulation UI |
| **Related** | [Design Tokens](03_Design_Tokens.md) · [Layout](06_Layout_Principles.md) · [Interaction](11_Interaction_Principles.md) · [Screen Brief](14_Screen_Brief_Template.md) |

## Contract

Every simulation is assembled from these components (Principle 7). Institutions re-theme them; they do not replace them.

**Behaviour is fixed platform-wide. Appearance varies by institution.** A table sorts the same way in a hospital and a border post — that is what makes the catalogue learnable on set (Principle 6).

If a screen needs something not in this list, it gets added here first, generically, and then used. It does not get invented inside one simulation.

### Universal state set

Every interactive component supports all of these. A component is not done until all seven are designed.

`default` · `hover` · `focus` · `active` · `disabled` · `loading` · `error`

Plus, for data-bearing components: `empty` · `no-results` · `partial` · `stale`.

**Focus is not optional.** An actor drives this from a keyboard (Principle 4), so focus must be visible at `--border-emphasis` and legible at Tier B. This is a realism requirement before it is an accessibility one.

---

## Chrome

| Component | Anatomy | Notes |
|---|---|---|
| **Top bar** | Mark, institution name, module, search, notifications, user, clock | Fixed 56px. Clock is live and regionally formatted. |
| **Nav rail** | Grouped module list, icon + label + count badge | 260px; collapses to 56px icons. Active state uses `--brand-accent`. |
| **Status bar** | Connection, session, environment, record counts, time | Fixed 32px. Pure Tier C texture. Never omit. |
| **Breadcrumb** | Path segments, current not linked | Institutional systems bury records deep — this sells hierarchy. |
| **Module header** | Title, record count, primary actions, view switcher | Sits above content, below top bar. |

## Data display

| Component | Anatomy | States |
|---|---|---|
| **Data table** | Header (all-caps, tracked), sortable columns, zebra rows, selection, row actions, pagination footer | `empty` `loading` `no-results` `partial` `error` |
| **Record header** | Photo/avatar, subject name (Tier A), primary ID (mono), status pill, quick actions | The Tier A anchor of archetype A4. |
| **Field pair** | Label (Tier C, all-caps) over value (Tier B) | The atom of every detail panel. |
| **Detail panel** | Titled container, field-pair grid, optional actions | 2- or 3-column grid inside. |
| **Tab strip** | Tabs with counts, active underline at `--border-emphasis` | Deep tab strips are an authenticity signal. |
| **Timeline / activity log** | Timestamped entries, actor, action, optional detail | Cheapest credibility per pixel in the system. |
| **Key-value summary** | Compact stacked pairs | Rail content. |
| **Stat tile** | Label, large value (Tier A or B), delta, sparkline | Dashboard grid. See [dataviz guidance](10_Data_Display.md). |
| **Media pane** | Image/scan/feed, caption, metadata strip, zoom controls | Mugshots, biometrics, camera feeds. |
| **Map canvas** | Map, entity pins, control panel, legend, timeline scrubber | Never colour-only encoding. |
| **Document view** | Paginated serif body, letterhead, seal area, signature block | Archetype A11. |

## Input

| Component | Notes |
|---|---|
| **Text field** | Label above, not floating. Institutional systems label explicitly. |
| **Select / dropdown** | Native-feeling. One disabled option with no explanation is a good imperfection. |
| **Date field** | `DD/MM/YYYY`. Region-correct, always. |
| **Search bar** | Query, scope selector, submit. Shows result count and elapsed time after search. |
| **Filter set** | Facets with counts, clear-all, active-filter chips |
| **Checkbox / radio** | Square / round, `--radius-0` and `--radius-full` |
| **Toggle** | Use sparingly — toggles read modern. Prefer checkboxes in older institutions. |
| **Textarea** | Character counter as Tier C texture. |
| **File upload** | Drop zone, file list, progress, per-file error |

## Action

| Component | Variants |
|---|---|
| **Button** | `primary` `secondary` `tertiary` `destructive`, sizes `sm` `md` `lg` |
| **Icon button** | Always has a tooltip. Never icon-only without one. |
| **Action menu** | Overflow menu, grouped, with destructive items separated |
| **Split button** | Primary action plus dropdown |

Destructive actions require confirmation. That confirmation dialog is frequently a scene beat — design it properly.

## Feedback

| Component | Notes |
|---|---|
| **Status pill** | Colour **plus** label. Never colour alone. `--radius-full`. |
| **Badge / count** | Nav and tab counts. A stale badge is a good catalogued imperfection. |
| **Toast** | Corner, auto-dismiss, operator-cueable |
| **Inline alert** | Panel-level banner: info, warning, critical |
| **Modal** | Title, body, actions. `--elev-3`, `--z-modal`. |
| **Full-screen alert** | Archetype A10. `--z-cue`. Holds until cleared. |
| **Progress** | Determinate bar and indeterminate spinner. **Duration must be settable** (Principle 4). |
| **Skeleton / loading** | Real loading states, not spinners over everything |
| **Empty state** | Icon, one line, optional action. Written in institutional voice, slightly unhelpful. |
| **Error state** | Code plus terse message: `ERR_4417 — contact your administrator`. Never friendly, never apologetic. |

## Simulation-specific

Components with no equivalent in normal product design. These are the ones that make the platform what it is.

| Component | Purpose |
|---|---|
| **Live clock** | Regionally formatted, always running, settable by operator |
| **Session chrome** | Logged-in user, role, terminal ID, last-login timestamp |
| **Legacy panel** | Deliberately older shell using `--type-family-legacy`. Principle 5. |
| **Match result** | Biometric/record comparison with confidence score. Usually Tier A. |
| **Redaction** | Blacked-out fields, classification banners |
| **Classification banner** | Top/bottom marking strip for restricted systems |
| **Cue target** | Invisible in frame. Receives operator state changes (Principle: Operator Layer). |
| **Watermark** | Diagonal system watermark on documents and exports |

---

## Rules

1. All seven interactive states designed before a component ships.
2. Focus states are mandatory and visible at Tier B.
3. Status is never colour-only.
4. Every data component has `empty`, `loading`, and `error` designed. These appear on camera as often as the happy path.
5. Components consume semantic tokens only.
6. Nothing animates longer than `--motion-slow`; keystroke feedback is `--motion-instant`.

---

## Build order

Roughly the order in which components unblock the most screens:

**First** — top bar, nav rail, status bar, data table, field pair, detail panel, button, text field, status pill.
That set alone unblocks archetypes A3, A4, and A8, which is most of the catalogue.

**Second** — tab strip, record header, search bar, filter set, pagination, modal, inline alert, empty and error states.

**Third** — stat tile, timeline, media pane, map canvas, document view, terminal, full-screen alert.

**Fourth** — the simulation-specific set.
