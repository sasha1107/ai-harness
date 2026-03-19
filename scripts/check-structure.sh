#!/bin/sh

set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)

required_dirs="
docs
docs/architecture
docs/plans
docs/plans/active
docs/plans/completed
docs/references
docs/generated
docs/specs
templates
examples
scripts
"

required_files="
AGENTS.md
CLAUDE.md
docs/index.md
docs/agent-contract.md
docs/workflow.md
docs/testing.md
docs/adoption-guide.md
docs/quality-score.md
scripts/validate.sh
scripts/check-structure.sh
scripts/check-docs.sh
scripts/check-drift.sh
"

for dir_path in $required_dirs; do
  if [ ! -d "$ROOT_DIR/$dir_path" ]; then
    printf 'Missing required directory: %s\n' "$dir_path" >&2
    exit 1
  fi
done

for file_path in $required_files; do
  if [ ! -f "$ROOT_DIR/$file_path" ]; then
    printf 'Missing required file: %s\n' "$file_path" >&2
    exit 1
  fi
done

printf 'Structure checks passed.\n'
