#!/bin/bash
set -euo pipefail

scoop() {
  echo "Regenerating ${1:?Crate directory required}"
  ./contrib/scoop/scoop.json.sh "$1" "${2:-./contrib/scoop}"
}

# Add crates you want to regenerate on new releases here
scoop frb_codegen