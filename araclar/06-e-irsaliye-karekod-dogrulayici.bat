@echo off
chcp 65001 >nul
title "e-İrsaliye Karekod Doğrulayıcı - eimza-kep"
color 0B

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp006-e-irsaliye-karekod-dogrulayici.ps1" "%~1"

echo.
echo Cikmak icin herhangi bir tusa basin...
pause >nul
