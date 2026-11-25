@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0JTL-DHL-Worker.ps1" -ValidateOnly -Once
pause