@echo off
REM ============================================================
REM  Test local de PlanifPro (PWA) — Windows
REM  Necessaire car un service worker ne fonctionne pas en
REM  ouverture directe du fichier HTML (file://).
REM  Usage : double-clic, ou serve-local.bat 8080
REM ============================================================
cd /d %~dp0
set PORT=%1
if "%PORT%"=="" set PORT=8080

where python >nul 2>nul
if errorlevel 1 (
  echo Python est requis. Installe-le depuis https://python.org puis relance ce script.
  pause
  exit /b 1
)

echo PlanifPro (test local) : http://localhost:%PORT%/PlanifPro.html
echo Ctrl+C pour arreter le serveur.
python -m http.server %PORT%
pause
