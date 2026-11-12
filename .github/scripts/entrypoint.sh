#!/bin/bash
set -e

cd "${GITHUB_WORKSPACE:-/app}"

echo "Starting Frequency Analyzer..."

git config --global --add safe.directory "$PWD"

if [ -n "${GITHUB_TOKEN:-}" ] && [ -n "${GITHUB_REPOSITORY:-}" ]; then
  git remote set-url origin \
    "https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
fi

FREQ_RESULT=$(python3 .github/scripts/frequency.py "${FILE:-data.txt}")
echo "$FREQ_RESULT"

bash .github/scripts/update_readme.sh \
  "$FREQ_RESULT" "$GITHUB_USER"

echo "Process Completed!"