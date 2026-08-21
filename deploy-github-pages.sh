#!/usr/bin/env bash
# ============================================================
#  Déploiement de PlanifPro sur GitHub Pages
#
#  Prérequis (une seule fois) :
#   1. Un compte GitHub (https://github.com)
#   2. git installé sur ta machine
#   3. Un dépôt vide déjà créé sur GitHub (bouton "New repository")
#   4. git configuré avec tes identifiants (ou une clé SSH) pour
#      pouvoir pousser vers GitHub depuis ce terminal
#
#  Usage :
#    ./deploy-github-pages.sh <utilisateur-github> <nom-du-repo>
#  Exemple :
#    ./deploy-github-pages.sh matardieng planifpro
# ============================================================
set -e

GH_USER="$1"
GH_REPO="$2"

if [ -z "$GH_USER" ] || [ -z "$GH_REPO" ]; then
  echo "Usage : ./deploy-github-pages.sh <utilisateur-github> <nom-du-repo>"
  echo "Exemple : ./deploy-github-pages.sh matardieng planifpro"
  exit 1
fi

cd "$(dirname "$0")"

if [ ! -d .git ]; then
  echo "→ Initialisation du dépôt git..."
  git init
  git branch -M main
fi

echo "→ Ajout des fichiers de la PWA..."
git add PlanifPro.html manifest.json sw.js icon-192.png icon-512.png icon-512-maskable.png

if git diff --cached --quiet; then
  echo "→ Rien de nouveau à déployer."
else
  git commit -m "Déploiement PlanifPro $(date '+%Y-%m-%d %H:%M')"
fi

if ! git remote | grep -q '^origin$'; then
  echo "→ Ajout du dépôt distant GitHub..."
  git remote add origin "https://github.com/${GH_USER}/${GH_REPO}.git"
fi

echo "→ Envoi vers GitHub..."
git push -u origin main

echo ""
echo "✅ Fichiers envoyés sur https://github.com/${GH_USER}/${GH_REPO}"
echo ""
echo "Dernière étape (une seule fois) sur GitHub :"
echo "  Settings → Pages → Source: branche 'main', dossier '/ (root)' → Save"
echo ""
echo "PlanifPro sera alors disponible à cette adresse (1-2 min après activation) :"
echo "  https://${GH_USER}.github.io/${GH_REPO}/PlanifPro.html"
