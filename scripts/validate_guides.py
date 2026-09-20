#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
validate_guides.py
------------------
E-Dönüşüm Rehberleri reposundaki tüm kılavuzları ve yardımcı araçları doğrular:
1. Rehber sayısının en az 20 olduğunu teyit eder.
2. Her rehberin başlık (#), kategori ve meta veri bloğunu içerdiğini doğrular.
3. Minimum başlık (##) derinliği ve içerik zenginliğini kontrol eder.
4. Tıkla-çalıştır araçların (araclar/) eksiksiz ve geçerli olduğunu doğrular.
"""

import os
import sys
import glob
import re

# Windows UTF-8 stdout desteği
if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")

def validate():
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    rehberler_dir = os.path.join(base_dir, "rehberler")
    araclar_dir = os.path.join(base_dir, "araclar")

    if not os.path.isdir(rehberler_dir):
        print(f"❌ HATA: 'rehberler' dizini bulunamadı: {rehberler_dir}")
        return 1

    md_files = sorted(glob.glob(os.path.join(rehberler_dir, "*.md")))
    total_guides = len(md_files)
    print(f"📚 Toplam bulunan rehber sayısı: {total_guides}")

    if total_guides < 20:
        print(f"❌ HATA: En az 20 rehber bekleniyordu, ancak {total_guides} rehber bulundu.")
        return 1

    errors = []
    success_count = 0

    for filepath in md_files:
        filename = os.path.basename(filepath)
        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()

        # 1. Başlık (# Başlık) kontrolü
        if not re.search(r"^#\s+.+", content, re.MULTILINE):
            errors.append(f"[{filename}] Ana başlık (# Başlık) bulunamadı.")

        # 2. Meta veri blok kontrolü (> **Kategori:** ...)
        if "**Kategori:**" not in content:
            errors.append(f"[{filename}] Meta veri bloğunda 'Kategori' alanı eksik.")

        # 3. Minimum içerik bölümü (en az 3 adet ## Başlık)
        h2_headings = re.findall(r"^##\s+.+", content, re.MULTILINE)
        if len(h2_headings) < 3:
            errors.append(f"[{filename}] Yetersiz alt başlık (##). En az 3 alt başlık bekleniyor, bulunan: {len(h2_headings)}.")

        # 4. Asgari karakter uzunluğu
        if len(content) < 500:
            errors.append(f"[{filename}] Rehber içeriği çok kısa ({len(content)} karakter).")

        if not any(f"[{filename}]" in err for err in errors):
            success_count += 1

    print(f"✅ Başarıyla doğrulanan rehber: {success_count}/{total_guides}")

    # 5. Tıkla-çalıştır araçları kontrol et
    required_tools = [
        "01-eimza-hizli-tani.bat",
        "01-eimza-tani.ps1",
        "02-sertifika-kalan-gun-sayar.bat",
        "02-sertifika-sayar.ps1",
        "03-uyap-java-onbellek-temizle.bat",
        "03-uyap-temizle.ps1",
        "04-e-fatura-goruntuleyici-baslat.bat",
        "04-e-fatura-xml-goruntuleyici.html",
        "05-edefter-balans-kontrolcu.bat",
        "05-edefter-kontrolcu.py",
        "05-edefter-kontrolcu.ps1"
    ]

    print("\n🛠️ Tıkla-Çalıştır Yardımcı Araçlar Kontrol Ediliyor...")
    if not os.path.isdir(araclar_dir):
        errors.append("araclar dizini bulunamadı!")
    else:
        for tool in required_tools:
            tool_path = os.path.join(araclar_dir, tool)
            if not os.path.exists(tool_path):
                errors.append(f"[araclar/{tool}] Gerekli yardımcı araç dosyası eksik.")
            elif os.path.getsize(tool_path) == 0:
                errors.append(f"[araclar/{tool}] Yardımcı araç dosyası boş.")
            else:
                print(f"  ✓ {tool} mevcut ve geçerli.")

    if errors:
        print("\n⚠️ Tespit Edilen Doğrulama Hataları:")
        for err in errors:
            print(f"  - {err}")
        return 1

    print("\n🎉 Tüm rehberler ve tıkla-çalıştır araçlar kalite kriterlerini eksiksiz geçti!")
    return 0

if __name__ == "__main__":
    sys.exit(validate())
