# ===============================================================================
#  e-Defter ve Berat Balans / Sema Hizli Kontrolcusu
#  Organizasyon: eimza-kep (https://github.com/eimza-kep)
# ===============================================================================

param (
    [string]$FilePath = ""
)

Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "            e-DEFTER VE BERAT BALANS / SEMA HIZLI KONTROLCUSU" -ForegroundColor Cyan
Write-Host "                   (eimza-kep / e-donusum-rehberleri)" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host ""

if ([string]::IsNullOrWhiteSpace($FilePath)) {
    $FilePath = Read-Host "Lutfen e-Defter XML dosya yolunu girin (veya 'ornek' yazin)"
}

$cleanPath = $FilePath.Trim('"').Trim("'")

if ($cleanPath.ToLower() -eq "ornek") {
    $cleanPath = Join-Path $PSScriptRoot "ornek_edefter.xml"
    if (-not (Test-Path $cleanPath)) {
        $sampleXml = @"
<?xml version="1.0" encoding="UTF-8"?>
<gl-cor:accountingEntries xmlns:gl-cor="http://www.xbrl.org/int/gl/cor/2006-10-25">
  <gl-cor:documentInfo>
    <gl-cor:entriesType>journal</gl-cor:entriesType>
    <gl-cor:periodCoveredStartDate>2026-01-01</gl-cor:periodCoveredStartDate>
    <gl-cor:periodCoveredEndDate>2026-01-31</gl-cor:periodCoveredEndDate>
  </gl-cor:documentInfo>
  <gl-cor:totalDebit>458920.50</gl-cor:totalDebit>
  <gl-cor:totalCredit>458920.50</gl-cor:totalCredit>
</gl-cor:accountingEntries>
"@
        Set-Content -Path $cleanPath -Value $sampleXml -Encoding UTF8
    }
}

if (-not (Test-Path $cleanPath)) {
    Write-Host ("HATA: Dosya bulunamadi: " + $cleanPath) -ForegroundColor Red
    exit 1
}

$fileItem = Get-Item $cleanPath
$sizeKb = [math]::Round($fileItem.Length / 1KB, 1)
Write-Host ("Incelenen Dosya: " + $fileItem.Name + " (" + $sizeKb + " KB)") -ForegroundColor White

try {
    $content = Get-Content -Path $cleanPath -Raw -Encoding UTF8
} catch {
    Write-Host "HATA: Dosya UTF-8 olarak okunamadi!" -ForegroundColor Red
    exit 1
}

if ($content -match "totalDebit[^>]*>([0-9\.\,]+)<" -and $content -match "totalCredit[^>]*>([0-9\.\,]+)<") {
    $debitStr = $matches[1] -replace ',', '.'
    # RegEx ikinci grup match kontrolu
    $rxDebit = [regex]::Match($content, "totalDebit[^>]*>([0-9\.\,]+)<")
    $rxCredit = [regex]::Match($content, "totalCredit[^>]*>([0-9\.\,]+)<")

    $totalDebit = [double]($rxDebit.Groups[1].Value -replace ',', '.')
    $totalCredit = [double]($rxCredit.Groups[1].Value -replace ',', '.')
    $diff = [math]::Round([math]::Abs($totalDebit - $totalCredit), 4)

    Write-Host "-------------------------------------------------------------------------------" -ForegroundColor Gray
    Write-Host ("  Toplam Borc Tutari  (Total Debit)  : " + $totalDebit.ToString("N2") + " TL") -ForegroundColor White
    Write-Host ("  Toplam Alacak Tutari (Total Credit) : " + $totalCredit.ToString("N2") + " TL") -ForegroundColor White
    Write-Host ("  Fark Tutari                         : " + $diff.ToString("N2") + " TL") -ForegroundColor White
    Write-Host "-------------------------------------------------------------------------------" -ForegroundColor Gray

    if ($diff -eq 0) {
        Write-Host ""
        Write-Host "  SONUC: BALANS KUSURSUZ! (Borc = Alacak)" -ForegroundColor Green
        Write-Host "  GIB e-Defter portalinda 'Balans Hatasi' alinmayacaktir." -ForegroundColor Green
    } else {
        Write-Host ""
        Write-Host "  SONUC: BALANS HATASI MEVCUT! (Borc ve Alacak Esit Degil!)" -ForegroundColor Red
        Write-Host ("  Aradaki " + $diff + " TL fark sebebiyle GIB berati REDDEDECEKTIR.") -ForegroundColor Red
        Write-Host "  Cozum: rehberler/19-e-defter-berat-yukleme-hatalari-cozum.md" -ForegroundColor Yellow
    }
} else {
    Write-Host "Standart totalDebit/totalCredit etiketleri bulunamadi." -ForegroundColor Yellow
    if ($content -match "berat" -or $content -match "defter") {
        Write-Host "Dosya e-Defter / Berat formati barindiriyor." -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "===============================================================================" -ForegroundColor Cyan
