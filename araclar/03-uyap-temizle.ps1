# ===============================================================================
#  UYAP ve Java Onbellek & Sertifika Sifirlayici
#  Organizasyon: eimza-kep (https://github.com/eimza-kep)
# ===============================================================================

Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "            UYAP VE JAVA ONBELLEK / SERTIFIKA SIFIRLAYICI" -ForegroundColor Cyan
Write-Host "                   (eimza-kep / e-donusum-rehberleri)" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "UYAP Portali veya Editorundeki kilitlenme ve sertifika takilmalarini cozer." -ForegroundColor Gray
Write-Host ""

# 1. Java Deployment Onbellegi
Write-Host "[1/4] Java Deployment Onbellegi Temizleniyor..." -ForegroundColor Yellow
$javaws = Get-Command "javaws" -ErrorAction SilentlyContinue
if ($javaws) {
    Start-Process -FilePath "javaws" -ArgumentList "-uninstall" -NoNewWindow -Wait -ErrorAction SilentlyContinue
    Start-Process -FilePath "javaws" -ArgumentList "-clearcache" -NoNewWindow -Wait -ErrorAction SilentlyContinue
    Write-Host "  [OK] Java Web Start onbellegi komutla temizlendi." -ForegroundColor Green
}

$cacheDirs = @(
    "$env:LOCALAPPDATA\Sun\Java\Deployment\cache",
    "$env:USERPROFILE\AppData\LocalLow\Sun\Java\Deployment\cache",
    "$env:APPDATA\Sun\Java\Deployment\cache"
)

foreach ($dir in $cacheDirs) {
    if (Test-Path $dir) {
        try {
            Remove-Item -Path $dir -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host ("  [OK] Onbellek klasoru silindi: " + (Split-Path $dir -Leaf)) -ForegroundColor Green
        } catch {
            Write-Host ("  [!] Onbellek klasoru kismen silindi: " + (Split-Path $dir -Leaf)) -ForegroundColor Yellow
        }
    }
}
Write-Host ""

# 2. UYAP Gecici Dosyalari
Write-Host "[2/4] UYAP ve AKIS Gecici Log Dosyalari Temizleniyor..." -ForegroundColor Yellow
$uyapDir = "$env:USERPROFILE\.uyap"
if (Test-Path $uyapDir) {
    Get-ChildItem -Path $uyapDir -Include "*.log","*.tmp" -Recurse -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
    Write-Host "  [OK] UYAP gecici dosyalari ve loglar temizlendi." -ForegroundColor Green
} else {
    Write-Host "  [OK] UYAP log klasoru temiz." -ForegroundColor Green
}
Write-Host ""

# 3. DNS ve Guvenli Baglanti Onbellegi
Write-Host "[3/4] Windows SSL/DNS Ag Onbellegi Yenileniyor..." -ForegroundColor Yellow
Clear-DnsClientCache -ErrorAction SilentlyContinue
Write-Host "  [OK] DNS ve guvenli baglanti onbellegi tazelendi." -ForegroundColor Green
Write-Host ""

# 4. Akilli Kart Hizmeti (SCardSvr)
Write-Host "[4/4] Akilli Kart Hizmeti (SCardSvr) Yeniden Baslatiliyor..." -ForegroundColor Yellow
$svc = Get-Service -Name "SCardSvr" -ErrorAction SilentlyContinue
if ($svc) {
    try {
        Restart-Service -Name "SCardSvr" -Force -ErrorAction Stop
        Write-Host "  [OK] Akilli Kart Hizmeti basariyla sifirlandi ve calisiyor." -ForegroundColor Green
    } catch {
        Write-Host "  [BILGI] Hizmet yeniden baslatilamadi (Yonetici yetkisi gerektirebilir)." -ForegroundColor Yellow
    }
}
Write-Host ""

Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "Tum onbellek ve servisler basariyla temizlendi!" -ForegroundColor Green
Write-Host "Simdi lutfen tarayicinizi veya UYAP Dokuman Editorunu bastan acin." -ForegroundColor White
Write-Host "Rehber: rehberler/23-uyap-avukat-vatandas-portal-e-imza.md" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
