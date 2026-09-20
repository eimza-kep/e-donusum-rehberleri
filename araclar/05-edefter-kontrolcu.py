#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
05-edefter-kontrolcu.py
-----------------------
e-Defter ve Berat XML dosyalarında borç-alacak eşitliğini (balans)
ve UTF-8 şema uyumunu denetler.
"""

import sys
import os
import re
import xml.etree.ElementTree as ET

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")

def check_edefter_xml(filepath):
    print("===============================================================================")
    print("          e-DEFTER & BERAT BALANS / ŞEMA HIZLI KONTROLCÜSÜ")
    print("                 (eimza-kep / e-donusum-rehberleri)")
    print("===============================================================================\n")

    if not os.path.exists(filepath):
        print(f"❌ HATA: Belirtilen dosya bulunamadı: {filepath}")
        return 1

    filename = os.path.basename(filepath)
    file_size_kb = os.path.getsize(filepath) / 1024
    print(f"📄 İncelenen Dosya: {filename} ({file_size_kb:.1f} KB)")

    # 1. Kodlama (Encoding) ve UTF-8 Denetimi
    try:
        with open(filepath, "rb") as f:
            raw_bytes = f.read(512)
        
        header_text = raw_bytes.decode("latin-1", errors="ignore")
        if "utf-8" not in header_text.lower():
            print("⚠️ UYARI: XML başlığında 'UTF-8' kodlaması açıkça belirtilmemiş olabilir!")
        else:
            print("  [OK] XML başlığı UTF-8 uyumlu.")

        # Tam metni oku
        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()
    except UnicodeDecodeError:
        print("❌ KRİTİK HATA: Dosya geçerli bir UTF-8 formatında değil! GİB Şema hatası verecektir.")
        return 1
    except Exception as e:
        print(f"❌ HATA: Dosya okunamadı: {e}")
        return 1

    # 2. Balans (Borç ve Alacak Toplamları) Arama
    debit_match = re.search(r"<(?:[a-zA-Z0-9_\-]+:)?totalDebit[^>]*>([0-9\.\,]+)</", content)
    credit_match = re.search(r"<(?:[a-zA-Z0-9_\-]+:)?totalCredit[^>]*>([0-9\.\,]+)</", content)

    # Başlangıç ve Bitiş Tarihleri
    start_date = re.search(r"<(?:[a-zA-Z0-9_\-]+:)?periodCoveredStartDate[^>]*>([0-9\-]+)</", content)
    end_date = re.search(r"<(?:[a-zA-Z0-9_\-]+:)?periodCoveredEndDate[^>]*>([0-9\-]+)</", content)

    if start_date and end_date:
        print(f"  📅 Defter Dönemi: {start_date.group(1)}  <--->  {end_date.group(1)}")

    if not debit_match or not credit_match:
        print("\n⚠️ [BİLGİ] Bu dosya doğrudan yevmiye/kebir defteri yerine GİB Berat dosyası olabilir.")
        # Berat kontrolü
        if "defter" in content.lower() or "berat" in content.lower():
            print("  [OK] Dosya e-Defter / Berat şeması barındırıyor.")
        else:
            print("  [!] Dosya içinde standart e-Defter / Berat etiketleri bulunamadı.")
        return 0

    try:
        total_debit = float(debit_match.group(1).replace(",", "."))
        total_credit = float(credit_match.group(1).replace(",", "."))
    except ValueError:
        print("❌ HATA: Borç veya alacak tutarı sayıya dönüştürülemedi.")
        return 1

    diff = round(abs(total_debit - total_credit), 4)

    print("\n-------------------------------------------------------------------------------")
    print(f"  🔹 Toplam Borç Tutarı  (Total Debit)  : {total_debit:,.2f} TL")
    print(f"  🔹 Toplam Alacak Tutarı (Total Credit) : {total_credit:,.2f} TL")
    print(f"  🔹 Fark Tutarı                         : {diff:,.2f} TL")
    print("-------------------------------------------------------------------------------")

    if diff == 0.0:
        print("\n  🟢 SONUÇ: BALANS KUSURSUZ! (Borç = Alacak)")
        print("  ✅ GİB e-Defter portalında 'Balans Hatası' alınmayacaktır.")
    else:
        print("\n  🚨 SONUÇ: BALANS HATASI MEVCUT! (Borç ve Alacak Eşit Değil!)")
        print(f"  ❌ Aradaki {diff:,.2f} TL'lik fark sebebiyle GİB beratı REDDEDECEKTİR.")
        print("  💡 Çözüm: Muhasebe fişlerindeki kuruş yuvarlama veya eksik mahsup maddesini düzeltin.")
        print("     Ayrıntılı bilgi: rehberler/19-e-defter-berat-yukleme-hatalari-cozum.md")

    return 0

def create_sample_file(path):
    sample = """<?xml version="1.0" encoding="UTF-8"?>
<gl-cor:accountingEntries xmlns:gl-cor="http://www.xbrl.org/int/gl/cor/2006-10-25">
  <gl-cor:documentInfo>
    <gl-cor:entriesType>journal</gl-cor:entriesType>
    <gl-cor:periodCoveredStartDate>2026-01-01</gl-cor:periodCoveredStartDate>
    <gl-cor:periodCoveredEndDate>2026-01-31</gl-cor:periodCoveredEndDate>
  </gl-cor:documentInfo>
  <gl-cor:totalDebit>458920.50</gl-cor:totalDebit>
  <gl-cor:totalCredit>458920.50</gl-cor:totalCredit>
</gl-cor:accountingEntries>"""
    with open(path, "w", encoding="utf-8") as f:
        f.write(sample)

if __name__ == "__main__":
    if len(sys.argv) > 1:
        target_path = sys.argv[1].strip('"').strip("'")
        if target_path.lower() in ("ornek", "sample", "--sample"):
            sample_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "ornek_edefter.xml")
            create_sample_file(sample_path)
            check_edefter_xml(sample_path)
        else:
            check_edefter_xml(target_path)
    else:
        print("Kullanım: python 05-edefter-kontrolcu.py <dosya_yolu.xml> veya ornek")
