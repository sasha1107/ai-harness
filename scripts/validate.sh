#!/bin/sh

set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)

run_stage() {
  stage_name=$1
  script_path=$2

  printf '==> %s\n' "$stage_name"
  "$script_path"
}

run_stage "structure" "$ROOT_DIR/scripts/check-structure.sh"
run_stage "docs" "$ROOT_DIR/scripts/check-docs.sh"
run_stage "drift" "$ROOT_DIR/scripts/check-drift.sh"

printf 'Validation passed.\n'
