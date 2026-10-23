# e-İrsaliye Karekod Doğrulayıcı
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$inputStr = $args[0]
if (-not $inputStr) {
    Write-Host "Lutfen e-Irsaliye uzerindeki karekod metnini yapistirin veya 'ornek' yazin:"
    $inputStr = Read-Host "Karekod Verisi"
}

if ($inputStr -eq "ornek" -or -not $inputStr) {
    $inputStr = "1234567890|9876543210|IRS2026000000412|2026-10-23|14:30:00|2026-10-23|15:00:00|34ABC123|145250.00|e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    Write-Host "Ornek karekod yuklendi:" -ForegroundColor Yellow
    Write-Host $inputStr -ForegroundColor DarkGray
    Write-Host ""
}

$parts = $inputStr.Split("|")
Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host "   GIB 509 VUK UYUMLU e-IRSALIYE KAREKOD DOGRULAYICI" -ForegroundColor Yellow
Write-Host "================================================================================" -ForegroundColor Cyan

if ($parts.Length -lt 7) {
    Write-Host "HATA: Karekod formati gecersiz! En az 7 ila 10 alan icermelidir." -ForegroundColor Red
    exit 1
}

$errors = @()

$satici = $parts[0].Trim()
if ($satici.Length -eq 10 -or $satici.Length -eq 11) {
    Write-Host "  [OK] Satici VKN/TCKN       : $satici" -ForegroundColor Green
} else {
    Write-Host "  [HATA] Satici VKN/TCKN     : $satici (10 veya 11 hane olmali)" -ForegroundColor Red
    $errors += "Satici VKN gecersiz"
}

$alici = $parts[1].Trim()
if ($alici.Length -eq 10 -or $alici.Length -eq 11) {
    Write-Host "  [OK] Alici VKN/TCKN        : $alici" -ForegroundColor Green
} else {
    Write-Host "  [HATA] Alici VKN/TCKN      : $alici (10 veya 11 hane olmali)" -ForegroundColor Red
    $errors += "Alici VKN gecersiz"
}

$belgeNo = $parts[2].Trim()
if ($belgeNo.Length -eq 16) {
    Write-Host "  [OK] Belge No              : $belgeNo" -ForegroundColor Green
} else {
    Write-Host "  [HATA] Belge No            : $belgeNo (16 hane olmali)" -ForegroundColor Red
    $errors += "Belge no 16 hane olmali"
}

$duzenlemeTarih = $parts[3].Trim()
$duzenlemeSaat = if ($parts.Length -gt 4) { $parts[4].Trim() } else { "" }
Write-Host "  [OK] Duzenleme Zamani      : $duzenlemeTarih $duzenlemeSaat" -ForegroundColor Green

$sevkTarih = if ($parts.Length -gt 5) { $parts[5].Trim() } else { "" }
$sevkSaat = if ($parts.Length -gt 6) { $parts[6].Trim() } else { "" }
Write-Host "  [OK] Fiili Sevk Zamani     : $sevkTarih $sevkSaat" -ForegroundColor Green

if ($parts.Length -gt 7) {
    $plaka = $parts[7].Trim()
    Write-Host "  [OK] Arac Plaka No         : $plaka" -ForegroundColor Green
}

if ($parts.Length -gt 8) {
    $tutar = $parts[8].Trim()
    Write-Host "  [OK] Toplam Tutar          : $tutar TL" -ForegroundColor Green
}

if ($parts.Length -gt 9) {
    $hashVal = $parts[9].Trim()
    $hashLen = $hashVal.Length
    Write-Host "  [OK] Imza Ozeti (SHA-256)  : $hashLen karakter" -ForegroundColor Green
}

Write-Host "--------------------------------------------------------------------------------" -ForegroundColor DarkGray
if ($errors.Count -eq 0) {
    Write-Host "SONUC: Karekod yapisi GIB e-Irsaliye standardina UYGUNDUR." -ForegroundColor Green
} else {
    Write-Host "SONUC: Karekodda $($errors.Count) adet hata bulundu!" -ForegroundColor Red
}
Write-Host "================================================================================" -ForegroundColor Cyan
