# PlanifPro — Déploiement PWA

Ce dossier contient les 6 fichiers nécessaires à l'installation de
PlanifPro comme application (PWA). **Ils doivent rester ensemble, dans
le même dossier**, sur un serveur en http(s) — pas en ouverture directe
du fichier (`file://`), sinon le service worker ne s'active pas.

## Contenu du dossier
- `PlanifPro.html` — l'application
- `manifest.json` — identité de l'app (nom, icônes, couleurs)
- `sw.js` — service worker (cache hors-ligne)
- `icon-192.png`, `icon-512.png`, `icon-512-maskable.png` — icônes
- `serve-local.sh` / `serve-local.bat` — tester en local (Mac/Linux/Windows)
- `deploy-github-pages.sh` — déployer sur GitHub Pages en une commande

## 1. Tester en local avant de déployer
```
./serve-local.sh
```
(ou double-clic sur `serve-local.bat` sous Windows)
puis ouvrir **http://localhost:8080/PlanifPro.html** — le bouton
"Installer PlanifPro" doit apparaître dans Chrome/Edge.

## 2. Déployer en ligne — Option A : GitHub Pages (gratuit, recommandé)
1. Créer un compte sur https://github.com si besoin
2. Créer un dépôt vide (bouton "New repository"), par ex. `planifpro`
3. Dans un terminal, depuis ce dossier :
   ```
   ./deploy-github-pages.sh <ton-utilisateur-github> planifpro
   ```
4. Sur GitHub : **Settings → Pages → Branch: main / (root) → Save**
5. L'app est disponible sur :
   `https://<ton-utilisateur-github>.github.io/planifpro/PlanifPro.html`

## 3. Déployer en ligne — Option B : sans terminal (glisser-déposer)
Si tu préfères éviter git/terminal : va sur https://app.netlify.com/drop
et glisse-dépose tout ce dossier. Netlify te donne une adresse en
quelques secondes, avec https automatique (requis pour la PWA).

## 4. Déployer sur un hébergement classique (o2switch, etc.)
Envoie simplement les 6 fichiers de l'app (pas les scripts) par FTP
dans le dossier public de ton hébergement, tous au même niveau.

---
Une fois en ligne en https, le bouton **"Installer PlanifPro"**
apparaîtra automatiquement sur Chrome/Edge (desktop et Android).
Sur iPhone/iPad (Safari) : Partager → "Sur l'écran d'accueil".
