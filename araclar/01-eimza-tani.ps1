# ===============================================================================
#  E-Imza & Akilli Kart Hizli Tani ve Servis Denetimi
#  Organizasyon: eimza-kep (https://github.com/eimza-kep)
# ===============================================================================

Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "        E-IMZA & AKILLI KART HIZLI TANI VE SERVIS ONARIM ARACI" -ForegroundColor Cyan
Write-Host "                    (eimza-kep / e-donusum-rehberleri)" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Akilli Kart Hizmeti (SCardSvr)
Write-Host "[1/4] Windows Akilli Kart Hizmeti (SCardSvr) Kontrol Ediliyor..." -ForegroundColor Yellow
$svc = Get-Service -Name "SCardSvr" -ErrorAction SilentlyContinue
if ($svc) {
    if ($svc.Status -eq "Running") {
        Write-Host "  [OK] Akilli Kart Hizmeti (SCardSvr) CALISIYOR." -ForegroundColor Green
    } else {
        Write-Host "  [!] Hizmet durmus durumda. Baslatilmaya calisiliyor..." -ForegroundColor Yellow
        try {
            Start-Service -Name "SCardSvr" -ErrorAction Stop
            Write-Host "  [OK] Akilli Kart Hizmeti basariyla BASLATILDI." -ForegroundColor Green
        } catch {
            Write-Host "  [HATA] Hizmet baslatilamadi. Lutfen Yonetici olarak calistirin." -ForegroundColor Red
        }
    }
} else {
    Write-Host "  [UYARI] SCardSvr hizmeti bulunamadi." -ForegroundColor Red
}
Write-Host ""

# 2. Takili Kart Okuyucular
Write-Host "[2/4] Takili Akilli Kart Okuyucular Taraniyor..." -ForegroundColor Yellow
$readers = Get-CimInstance Win32_PnPEntity | Where-Object { 
    $_.PNPClass -eq "SmartCardReader" -or $_.Name -like "*Smart Card*" -or $_.Name -like "*CCID*" -or $_.Name -like "*Omnikey*" -or $_.Name -like "*ACS*" 
}

if ($readers) {
    foreach ($r in $readers) {
        Write-Host ("  [OK] Bulunan Okuyucu: " + $r.Name + " (Durum: " + $r.Status + ")") -ForegroundColor Green
    }
} else {
    Write-Host "  [UYARI] Takili fiziksel kart okuyucu bulunamadi!" -ForegroundColor Yellow
    Write-Host "  * E-Imza / Mali Muhur USB cihazini bilgisayara takip tekrar deneyin." -ForegroundColor Gray
}
Write-Host ""

# 3. AKIS ve Kart Kutuphanesi
Write-Host "[3/4] AKIS (Akilli Kart Izleme Sistemi) Surucusu Denetleniyor..." -ForegroundColor Yellow
$akisPaths = @(
    "$env:ProgramFiles\AKIS",
    "${env:ProgramFiles(x86)}\AKIS",
    "$env:SystemRoot\System32\akisp11.dll",
    "$env:SystemRoot\SysWOW64\akisp11.dll"
)
$akisFound = $false
foreach ($p in $akisPaths) {
    if (Test-Path $p) {
        $akisFound = $true
        break
    }
}

if ($akisFound) {
    Write-Host "  [OK] TUBITAK AKIS surucusu sistemde yuklu." -ForegroundColor Green
} else {
    Write-Host "  [BILGI] AKIS surucusu standart dizinlerde bulunamadi." -ForegroundColor Yellow
    Write-Host "  (Kamu SM veya AKIS kart kullaniyorsaniz akilli.kart.gov.tr adresinden surucuyu kurabilirsiniz.)" -ForegroundColor Gray
}
Write-Host ""

# 4. Java ve UYAP Ortami
Write-Host "[4/4] Java Ortami Denetleniyor..." -ForegroundColor Yellow
$javaCmd = Get-Command "java" -ErrorAction SilentlyContinue
if ($javaCmd) {
    $javaVer = & java -version 2>&1 | Select-Object -First 1
    Write-Host ("  [OK] Java Kurulu: " + $javaVer) -ForegroundColor Green
} else {
    Write-Host "  [BILGI] Global Java bulunamadi (UYAP gomulu calisma ortamini kullaniyor olabilir)." -ForegroundColor Gray
}
Write-Host ""

Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "Tani islemi tamamlandi. Sorun devam ediyorsa rehberler/03 ve 04'e bakin:" -ForegroundColor Cyan
Write-Host "https://github.com/eimza-kep/e-donusum-rehberleri" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
