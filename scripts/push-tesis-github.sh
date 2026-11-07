#!/usr/bin/env bash
set -euo pipefail
TOKEN="${GH_TOKEN_GIT:-${GH_TOKEN:-}}"
REMOTE="https://github.com/BLUTM0ND/tap-viaticos-g12-isur.git"
if [[ -z "$TOKEN" ]]; then
  echo "Falta GH_TOKEN_GIT (o GH_TOKEN). En la PC usa el PAT como password HTTPS." >&2
  exit 1
fi
cd "$(git rev-parse --show-toplevel)"
if git remote get-url github-tesis >/dev/null 2>&1; then
  git remote set-url github-tesis "https://x-access-token:${TOKEN}@github.com/BLUTM0ND/tap-viaticos-g12-isur.git"
else
  git remote add github-tesis "https://x-access-token:${TOKEN}@github.com/BLUTM0ND/tap-viaticos-g12-isur.git"
fi
git push -u github-tesis main
echo "OK: publicado en $REMOTE"
