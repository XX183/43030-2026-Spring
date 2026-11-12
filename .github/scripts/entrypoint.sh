#!/bin/bash
set -e

cd /app

echo "Starting Frequency Analyzer..."

FREQ_RESULT=$(python3 /app/.github/scripts/frequency.py /app/data.txt)
echo "$FREQ_RESULT"

bash /app/.github/scripts/update_readme.sh \
  "$FREQ_RESULT" "$GITHUB_USER"

echo "Process Completed!"