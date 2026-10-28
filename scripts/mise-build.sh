#!/usr/bin/env bash
# Direct build entry: mise owns the toolchain; mbx-cache restores eligible task outputs.
set -euo pipefail

ROOT="$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel)"
BUILD_CMD=$(cat <<'BUILD'
cargo build --workspace && cargo test --workspace
BUILD
)
exec /home/toxic/estate/ranch/scripts/mise-build.sh "rig" "$ROOT" "$BUILD_CMD"
