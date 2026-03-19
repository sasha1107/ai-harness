#!/bin/sh

set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)

if find "$ROOT_DIR/docs/plans/active" -type f ! -name 'README.md' | grep -q .; then
  printf 'Active plans present. Review them for current status before release.\n'
fi

if grep -R "TODO" "$ROOT_DIR/docs" "$ROOT_DIR/templates" "$ROOT_DIR/examples" >/dev/null 2>&1; then
  printf 'Found TODO markers in tracked harness docs. Resolve or move them into a plan.\n' >&2
  exit 1
fi

if grep -R "FIXME" "$ROOT_DIR/docs" "$ROOT_DIR/templates" "$ROOT_DIR/examples" >/dev/null 2>&1; then
  printf 'Found FIXME markers in tracked harness docs. Resolve or move them into a plan.\n' >&2
  exit 1
fi

if [ ! -f "$ROOT_DIR/docs/plans/tech-debt-tracker.md" ]; then
  printf 'Missing tech debt tracker.\n' >&2
  exit 1
fi

printf 'Drift checks passed.\n'
