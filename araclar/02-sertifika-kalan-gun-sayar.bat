@echo off
chcp 65001 >nul
title "Mali Muhur ve E-Imza Kalan Gun Sayaci - eimza-kep"
color 0A

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp002-sertifika-sayar.ps1"

echo.
echo Cikmak icin herhangi bir tusa basin...
pause >nul
