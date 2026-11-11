#!/bin/bash
set -e

FREQ_RESULT="$1"
GITHUB_USER="$2"
TIMESTAMP=$(date -u '+%Y-%m-%d %H:%M:%S UTC')

printf '\n[%s - %s - %s]\n' \
  "$GITHUB_USER" "$FREQ_RESULT" "$TIMESTAMP" >> README.md

git config user.name "github-actions"
git config user.email "github-actions@users.noreply.github.com"

git add README.md
git commit -m "Update README with vowel frequency results"
git push origin main