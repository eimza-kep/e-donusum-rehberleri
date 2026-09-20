@echo off
chcp 65001 >nul
title "e-Defter ve Berat Balans Kontrolcusu - eimza-kep"
color 0B

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp005-edefter-kontrolcu.ps1" -FilePath "%~1"

echo.
echo Cikmak icin herhangi bir tusa basin...
pause >nul
