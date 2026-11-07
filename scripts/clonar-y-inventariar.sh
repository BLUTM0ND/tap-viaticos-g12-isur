#!/usr/bin/env bash
# Clona repos privados G12 e imprime inventario de viáticos (sin secretos).
set -euo pipefail

TOKEN="${GH_TOKEN_GIT:-${GH_TOKEN:-}}"
if [[ -z "$TOKEN" ]]; then
  echo "GH_TOKEN_GIT=missing (también GH_TOKEN)" >&2
  exit 1
fi
echo "GitHub token=present"
GH_TOKEN="$TOKEN"
export GH_TOKEN

ROOT="${1:-/tmp/g12}"
mkdir -p "$ROOT"

clone_or_update() {
  local repo="$1"
  local dest="$ROOT/$repo"
  local url="https://x-access-token:${GH_TOKEN}@github.com/BLUTM0ND/${repo}.git"
  if [[ -d "$dest/.git" ]]; then
    git -C "$dest" fetch --depth=1 origin
    git -C "$dest" reset --hard origin/HEAD
  else
    git clone --depth=1 "$url" "$dest"
  fi
}

clone_or_update g12-public-html
clone_or_update g12-android-2222

WEB="$ROOT/g12-public-html"
AND="$ROOT/g12-android-2222"

echo "===== WEB tree (top) ====="
find "$WEB" -maxdepth 3 -type f \( -name '*.php' -o -name '*.sql' -o -name '*.js' \) 2>/dev/null | head -200

echo "===== WEB viaticos-ish paths ====="
find "$WEB" -iname '*viatic*' -o -iname '*viaje*' -o -iname '*gasto*' -o -iname '*comprob*' -o -iname '*rendic*' -o -iname '*ocr*' 2>/dev/null | head -200

echo "===== ANDROID tree (top) ====="
find "$AND" -maxdepth 4 -type f \( -name '*.kt' -o -name '*.java' -o -name '*.xml' -o -name '*.gradle' \) 2>/dev/null | head -200

echo "===== ANDROID viaticos-ish paths ====="
find "$AND" -iname '*viatic*' -o -iname '*viaje*' -o -iname '*gasto*' -o -iname '*comprob*' -o -iname '*ocr*' -o -iname '*fcm*' 2>/dev/null | head -200

echo "===== SQL / CREATE TABLE ====="
rg -n -i "create table|alter table" "$WEB" -g '*.sql' -g '*.php' 2>/dev/null | head -100 || true

echo "===== Done ====="
