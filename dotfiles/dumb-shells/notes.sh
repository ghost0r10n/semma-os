#!/usr/bin/env bash
# Outputs recent notes for Waybar custom module
# - Prints the last 5 lines of ~/tmp/notes.txt
# - If the file is missing or empty, prints nothing (so Waybar shows only the icon)

set -euo pipefail

FILE="$HOME/tmp/notes.txt"

if [[ -s "$FILE" ]]; then
  tail -n 1 "$FILE"
else
  # No notes yet; emit empty output
  exit 0
fi
