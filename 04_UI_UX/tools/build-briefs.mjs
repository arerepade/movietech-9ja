// Rebuilds every W1-*.md brief as a SELF-CONTAINED prompt by splicing
// briefs/_DESIGN_SPEC.md between each file's header and its SCREEN BRIEF.
//
// The per-screen content is never touched — only the shared spec block is
// replaced — so editing _DESIGN_SPEC.md and re-running keeps all 13 in sync.
//
// Run from 04_UI_UX/:  node tools/build-briefs.mjs
import { readdirSync, readFileSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';

const BRIEFS = 'briefs';
const SPEC = join(BRIEFS, '_DESIGN_SPEC.md');
const MARK = '## SCREEN BRIEF';
const COPY_LINE =
  '**Copy everything below the line and paste it into Claude Designer.** It is fully self-contained — no repo files are needed.';

const spec = readFileSync(SPEC, 'utf8').trim();

const files = readdirSync(BRIEFS)
  .filter((f) => /^W1-\d\d.*\.md$/.test(f))
  .sort();

if (files.length === 0) throw new Error('no W1-*.md briefs found');

let changed = 0;
for (const f of files) {
  const path = join(BRIEFS, f);
  const src = readFileSync(path, 'utf8');

  const bodyAt = src.indexOf(MARK);
  if (bodyAt < 0) throw new Error(`${f}: no "${MARK}" marker`);
  const body = src.slice(bodyAt);

  // Header = everything before the first horizontal rule on its own line.
  const head = src.slice(0, bodyAt);
  const ruleAt = head.search(/^---$/m);
  if (ruleAt < 0) throw new Error(`${f}: no leading --- rule`);

  let header = head.slice(0, ruleAt).trimEnd();

  // Normalise the copy instruction wherever it appears.
  header = header
    .split('\n')
    .filter((l) => !/^Copy everything below the line/.test(l.trim()))
    .join('\n')
    .trimEnd();
  header += `\n\n${COPY_LINE}`;

  const out = `${header}\n\n---\n\n${spec}\n\n${body.trimEnd()}\n`;

  if (out !== src) {
    writeFileSync(path, out);
    changed++;
    console.log(`rebuilt ${f}  (${out.length} bytes)`);
  } else {
    console.log(`unchanged ${f}`);
  }
}
console.log(`\n${changed}/${files.length} briefs rebuilt from ${SPEC}`);
