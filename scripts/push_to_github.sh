#!/usr/bin/env bash
set -e
REPO_ARG="${1:-efv-gumen-rock-v7.0}"
VISIBILITY="${2:-public}"
if command -v gh >/dev/null 2>&1 && [[ "$REPO_ARG" != http* ]] && [[ "$REPO_ARG" != git@* ]]; then
  gh repo create "$REPO_ARG" --"$VISIBILITY" --source=. --remote=origin --push
else
  git remote remove origin 2>/dev/null || true
  git remote add origin "$REPO_ARG"
  git branch -M main
  git push -u origin main
fi
