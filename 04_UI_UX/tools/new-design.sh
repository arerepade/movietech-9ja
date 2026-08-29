#!/usr/bin/env bash
# Scaffold a design folder and its RECORD.md.
#
# Usage:
#   bash tools/new-design.sh <Category> <Simulation> <NN> <Screen_Name> [brief-file]
#
# Example:
#   bash tools/new-design.sh Law_Enforcement Police_Database 03 Subject_Record \
#        W1-03_NBCR_Subject_Record.md

set -euo pipefail

if [ "$#" -lt 4 ]; then
  echo "usage: new-design.sh <Category> <Simulation> <NN> <Screen_Name> [brief-file]" >&2
  exit 2
fi

CATEGORY="$1"
SIMULATION="$2"
NUM="$3"
SCREEN="$4"
BRIEF="${5:-TODO-set-brief-filename.md}"

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIR="$ROOT/designs/$CATEGORY/$SIMULATION/${NUM}_${SCREEN}"

if [ -e "$DIR/RECORD.md" ]; then
  echo "refusing to overwrite existing record: $DIR/RECORD.md" >&2
  exit 1
fi

mkdir -p "$DIR/exports" "$DIR/source"

TITLE="$(echo "$SCREEN" | tr '_' ' ')"
TODAY="$(date +%Y-%m-%d)"

{
  echo "# $TITLE"
  echo
  echo "| | |"
  echo "|---|---|"
  echo "| Brief        | ../../../../briefs/$BRIEF |"
  echo "| Simulation   | $SIMULATION |"
  echo "| Institution  | TODO |"
  echo "| Archetype    | TODO |"
  echo "| Mode         | TODO |"
  echo "| Era          | era-current |"
  echo "| Artifact URL | TODO |"
  echo "| Status       | draft |"
  echo "| Designed     | $TODAY |"
  echo "| Reviewed by  | |"
  echo
  echo "## States delivered"
  echo "- [ ] default"
  echo "- [ ] loading"
  echo "- [ ] empty"
  echo "- [ ] error"
  echo "- [ ] cue: TODO"
  echo
  echo "## Review checklist"
  echo "- [ ] Non-negotiables N1-N4 satisfied"
  echo "- [ ] <= 3 Tier A elements"
  echo "- [ ] Nothing below 13px / weight 400"
  echo "- [ ] Tier A clear of edges and hand zone"
  echo "- [ ] Semantic tokens only, no raw hex"
  echo "- [ ] Status never colour-only"
  echo "- [ ] Clock and status bar present"
  echo "- [ ] loading / empty / error designed"
  echo "- [ ] 2-3 imperfections, no more"
  echo "- [ ] Dates DD/MM/YYYY, currency Naira, region-correct names"
  echo "- [ ] Colour pairs measured with tools/contrast.awk"
  echo "- [ ] Fills the canvas, no mockup margins"
  echo
  echo "## Notes"
  echo
  echo "## Open issues"
} > "$DIR/RECORD.md"

echo "created $DIR"
echo "  RECORD.md"
echo "  exports/"
echo "  source/"
echo
echo "next: fill RECORD.md, then add the row to 20_Design_Registry.md"
