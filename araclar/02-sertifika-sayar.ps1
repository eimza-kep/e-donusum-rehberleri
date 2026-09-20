# ===============================================================================
#  Mali Muhur & E-Imza Kalan Gun Sayaci ve Sertifika Alarmi
#  Organizasyon: eimza-kep (https://github.com/eimza-kep)
# ===============================================================================

Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "       MALI MUHUR & E-IMZA KALAN GUN SAYACI VE SERTIFIKA ALARMI" -ForegroundColor Cyan
Write-Host "                   (eimza-kep / e-donusum-rehberleri)" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Windows Sertifika Deposu (Kisisel ve Akilli Kart) Taraniyor..." -ForegroundColor Yellow
Write-Host ""

$rawCerts = @()

# .NET X509Store uzerinden hem CurrentUser hem LocalMachine taranir
$storeNames = @(
    @{ Name = "My"; Location = [System.Security.Cryptography.X509Certificates.StoreLocation]::CurrentUser },
    @{ Name = "My"; Location = [System.Security.Cryptography.X509Certificates.StoreLocation]::LocalMachine }
)

foreach ($s in $storeNames) {
    try {
        $st = New-Object System.Security.Cryptography.X509Certificates.X509Store($s.Name, $s.Location)
        $st.Open([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadOnly)
        foreach ($cert in $st.Certificates) {
            $rawCerts += $cert
        }
        $st.Close()
    } catch {
        # Devam et
    }
}

# Filtreleme ve tekillestirme
$matchedCerts = @()
foreach ($c in $rawCerts) {
    $sub = $c.Subject
    $iss = $c.Issuer
    if ($c.HasPrivateKey -or $sub -match "TCKN|VKN|Kamu SM|TUBITAK|E-Tugra|E-Guven|Turktok|Elektronik" -or $iss -match "Kamu SM|TUBITAK|E-Tugra|E-Guven|Turktok") {
        $matchedCerts += $c
    }
}

if ($matchedCerts.Count -eq 0 -and $rawCerts.Count -gt 0) {
    $matchedCerts = $rawCerts
}

$uniqueCerts = $matchedCerts | Sort-Object -Property Thumbprint -Unique

if ($uniqueCerts.Count -eq 0) {
    Write-Host "  [BILGI] Sertifika deposunda henuz kayitli bir E-Imza / Mali Muhur sertifikasi bulunamadi." -ForegroundColor Yellow
    Write-Host "  * E-Imza veya Mali Muhur USB tokeninizi bilgisayara takin." -ForegroundColor Gray
    Write-Host "  * AKIS Kart Izleme Aracini acarak kartinizin okundugundan emin olun." -ForegroundColor Gray
    Write-Host "  * Akilli kart takildiginda Windows sertifikayi otomatik olarak bu depoya aktarir." -ForegroundColor Gray
    Write-Host ""
} else {
    Write-Host ("Bulunan Sertifika Sayisi: " + $uniqueCerts.Count) -ForegroundColor Green
    Write-Host "-------------------------------------------------------------------------------" -ForegroundColor Gray

    $now = Get-Date

    foreach ($c in $uniqueCerts) {
        $subject = $c.Subject
        $issuer = $c.Issuer
        $notAfter = $c.NotAfter
        $daysLeft = [math]::Floor(($notAfter - $now).TotalDays)

        $commonName = $subject
        if ($subject -match "CN=([^,]+)") {
            $commonName = $matches[1]
        }
        $issuerName = $issuer
        if ($issuer -match "CN=([^,]+)") {
            $issuerName = $matches[1]
        }

        Write-Host ("  [KULLANICI] : " + $commonName) -ForegroundColor White
        Write-Host ("  [MAKAM/ESHS]: " + $issuerName) -ForegroundColor Gray
        Write-Host ("  [BITIS]     : " + $notAfter.ToString('dd.MM.yyyy HH:mm')) -ForegroundColor Gray

        if ($daysLeft -lt 0) {
            $absDays = [math]::Abs($daysLeft)
            Write-Host ("  [ALARM]     : SURESI DOLMUS! (" + $absDays + " gun once bitti)") -ForegroundColor Red
            Write-Host "  [UYARI]     : Bu sertifika ile e-Defter, e-Fatura veya UYAP imzalamasi YAPILAMAZ!" -ForegroundColor Red
            Write-Host "  [COZUM]     : 'rehberler/08-mali-muhur-suresi-dolunca-yapilacaklar.md' rehberine bakin." -ForegroundColor Yellow
        } elseif ($daysLeft -le 30) {
            Write-Host ("  [DIKKAT]    : ACIL YENILEME GEREKIYOR! (Yalnizca " + $daysLeft + " GUN KALDI)") -ForegroundColor Magenta
            Write-Host "  [ONERI]     : Kamu SM veya ESHS'ye derhal yenileme basvurusu yapmaniz onerilir!" -ForegroundColor Yellow
        } else {
            Write-Host ("  [DURUM]     : GECERLI (" + $daysLeft + " gun kaldi)") -ForegroundColor Green
        }
        Write-Host "-------------------------------------------------------------------------------" -ForegroundColor Gray
    }
}

Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "Rehberler: https://github.com/eimza-kep/e-donusum-rehberleri" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
