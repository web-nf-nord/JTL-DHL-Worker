@echo off
title JTL-DHL Worker - PRODUKTION
color 0A
cd /d "%~dp0"

echo ============================================
echo    JTL-DHL WORKER - PRODUKTIONSBETRIEB
echo ============================================
echo.
echo Startzeit: %date% %time%
echo.
echo Worker ueberwacht den CSV-Exportordner.
echo Neue CSV-Dateien werden automatisch verarbeitet.
echo.
echo Zum Beenden: STRG + C druecken
echo ============================================
echo.

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0JTL-DHL-Worker.ps1" -AutoProduction

echo.
echo ============================================
echo    JTL-DHL Worker wurde beendet
echo ============================================
pause