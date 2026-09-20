@echo off
chcp 65001 >nul
title "E-Imza ve Akilli Kart Hizli Tani - eimza-kep"
color 0B

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp001-eimza-tani.ps1"

echo.
echo Cikmak icin herhangi bir tusa basin...
pause >nul
