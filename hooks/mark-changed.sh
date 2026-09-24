#!/usr/bin/env bash
# PostToolUse на Edit|Write|NotebookEdit: помечает, что в этом ходе менялись файлы.
# Флаг потом читает verify-gate.sh и не даёт ходу закончиться без приёмки.
set -uo pipefail

DIR="${TMPDIR:-/tmp}/claude-workbench"
mkdir -p "$DIR" 2>/dev/null || exit 0

SID="$(python3 -c 'import json,sys
try:
    print(json.load(sys.stdin).get("session_id") or "default")
except Exception:
    print("default")' 2>/dev/null)" || SID="default"
[ -n "$SID" ] || SID="default"

: > "$DIR/changed-$SID" 2>/dev/null || true
exit 0
