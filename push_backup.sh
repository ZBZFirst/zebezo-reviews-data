#!/usr/bin/env bash
set -euo pipefail

cd /home/paulwasthere/zebezo-reviews-data

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Not a git repository. Run: git init"
  exit 1
fi

git add reviews.json photos README.md .gitignore sync_from_app.sh push_backup.sh

if git diff --cached --quiet; then
  echo "No review backup changes to commit."
else
  git commit -m "Update ZeBeZo reviews data"
fi

if git remote get-url origin >/dev/null 2>&1; then
  git push -u origin HEAD
else
  echo "No GitHub remote configured yet."
  echo "Add one with: git remote add origin git@github.com:OWNER/REPO.git"
fi
