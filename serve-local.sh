#!/usr/bin/env bash
# ============================================================
#  Test local de PlanifPro (PWA)
#  Nécessaire car un service worker ne fonctionne pas si on
#  ouvre le fichier HTML directement (file://) — il faut un
#  vrai serveur http, même local.
#  Usage : ./serve-local.sh [port]   (port par défaut : 8080)
# ============================================================
set -e
PORT="${1:-8080}"
cd "$(dirname "$0")"

if ! command -v python3 >/dev/null 2>&1; then
  echo "Python 3 est requis. Installe-le puis relance ce script."
  exit 1
fi

echo "PlanifPro (test local) → http://localhost:${PORT}/PlanifPro.html"
echo "Ctrl+C pour arrêter le serveur."
python3 -m http.server "$PORT"
