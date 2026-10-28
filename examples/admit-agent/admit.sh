#!/usr/bin/env bash
# Admit an agent to a running Rig kernel.
# Usage: ./admit.sh <name> <persona> <model>
set -euo pipefail
NAME="${1:?usage: admit.sh <name> <persona> <model>}"
PERSONA="${2:?usage: admit.sh <name> <persona> <model>}"
MODEL="${3:?usage: admit.sh <name> <persona> <model>}"
API="${RIG_API:-http://127.0.0.1:25196}"

MANIFEST=$(printf '[agent]\nname = "%s"\npersona = "%s"\nmodel = "%s"\n' "$NAME" "$PERSONA" "$MODEL")
# JSON-escape the manifest via python3 (no jq dependency)
PAYLOAD=$(MANIFEST="$MANIFEST" NAME="$NAME" python3 -c '
import json, os
print(json.dumps({"name": os.environ["NAME"], "manifest_toml": os.environ["MANIFEST"]}))')

curl -s -m 15 -X POST "$API/api/agents" \
  -H "Content-Type: application/json" \
  -d "$PAYLOAD"
echo
