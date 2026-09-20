@echo off
chcp 65001 >nul
title "UYAP ve Java Onbellek ve Sertifika Sifirlayici - eimza-kep"
color 0E

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp003-uyap-temizle.ps1"

echo.
echo Cikmak icin herhangi bir tusa basin...
pause >nul
