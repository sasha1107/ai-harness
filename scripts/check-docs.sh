#!/bin/sh

set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)

require_heading() {
  file_path=$1
  heading=$2

  if ! grep -Fq "$heading" "$ROOT_DIR/$file_path"; then
    printf 'Missing heading "%s" in %s\n' "$heading" "$file_path" >&2
    exit 1
  fi
}

require_reference() {
  file_path=$1
  reference=$2

  if ! grep -Fq "$reference" "$ROOT_DIR/$file_path"; then
    printf 'Missing reference "%s" in %s\n' "$reference" "$file_path" >&2
    exit 1
  fi
}

require_heading "AGENTS.md" "## Read First"
require_heading "AGENTS.md" "## Non-Negotiable Rules"
require_heading "CLAUDE.md" "## Read First"
require_heading "CLAUDE.md" "## Non-Negotiable Rules"
require_heading "docs/agent-contract.md" "## Validation Rules"
require_heading "docs/workflow.md" "## Default Loop"
require_heading "docs/testing.md" "## Validation Slots"
require_heading "docs/adoption-guide.md" "## Step 4: Encode The Validation Loop"

require_reference "AGENTS.md" "docs/agent-contract.md"
require_reference "CLAUDE.md" "docs/agent-contract.md"
require_reference "README.md" "./scripts/validate.sh"
require_reference "docs/index.md" "docs/plans/active/"

agents_lines=$(wc -l < "$ROOT_DIR/AGENTS.md" | tr -d ' ')
claude_lines=$(wc -l < "$ROOT_DIR/CLAUDE.md" | tr -d ' ')

if [ "$agents_lines" -gt 80 ]; then
  printf 'AGENTS.md is too long (%s lines). Keep the entrypoint short.\n' "$agents_lines" >&2
  exit 1
fi

if [ "$claude_lines" -gt 80 ]; then
  printf 'CLAUDE.md is too long (%s lines). Keep the entrypoint short.\n' "$claude_lines" >&2
  exit 1
fi

printf 'Documentation checks passed.\n'
