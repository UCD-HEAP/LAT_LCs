#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="/Users/veritas/Git/BAR"
REMOTE="github-latlcs-deploy"   
BRANCH="gh-pages"
LOG_FILE="github-latlcs-deploy.log"

exec >> "$LOG_FILE" 2>&1
echo "=== Run started: $(date) ==="

cd "$REPO_DIR"

git add -A

# below needed because first commit special!
if git rev-parse --verify HEAD >/dev/null 2>&1; then
    git commit --amend -m "Auto-deploy: $(date -u +%Y-%m-%dT%H:%M:%SZ)" --allow-empty
else
    git commit -m "Auto-deploy: $(date -u +%Y-%m-%dT%H:%M:%SZ)" --allow-empty
fi

git push --force "$REMOTE" gh-pages

echo "=== Run finished: $(date) ==="
