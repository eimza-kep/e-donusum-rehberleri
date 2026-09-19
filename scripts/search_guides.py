#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
search_guides.py
----------------
E-Dönüşüm Rehberleri içinde anahtar kelime, kategori ve sorun araması yapar.

Kullanım:
    python search_guides.py "bloke"
    python search_guides.py --list
    python search_guides.py "fatura" --json
"""

import os
import sys
import glob
import re
import argparse
import json

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")

def get_guides(rehberler_dir):
    guides = []
    for filepath in sorted(glob.glob(os.path.join(rehberler_dir, "*.md"))):
        filename = os.path.basename(filepath)
        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()

        title_match = re.search(r"^#\s+(.+)$", content, re.MULTILINE)
        title = title_match.group(1).strip() if title_match else filename

        category_match = re.search(r">\s*\*\*Kategori:\*\*\s*(.+)$", content, re.MULTILINE)
        category = category_match.group(1).strip() if category_match else "Genel"

        audience_match = re.search(r">\s*\*\*Hedef Kitle:\*\*\s*(.+)$", content, re.MULTILINE)
        audience = audience_match.group(1).strip() if audience_match else "Herkes"

        guides.append({
            "filename": filename,
            "path": filepath,
            "title": title,
            "category": category,
            "audience": audience,
            "content": content
        })
    return guides

def main():
    parser = argparse.ArgumentParser(description="E-Dönüşüm Rehberleri Arama Motoru")
    parser.add_argument("query", nargs="?", default="", help="Aranacak anahtar kelime veya sorun tanımı")
    parser.add_argument("--list", action="store_true", help="Mevcut tüm rehberleri kategorileriyle listeler")
    parser.add_argument("--json", action="store_true", help="Sonuçları JSON formatında çıktı verir")
    args = parser.parse_args()

    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    rehberler_dir = os.path.join(base_dir, "rehberler")

    guides = get_guides(rehberler_dir)

    if args.list:
        if args.json:
            out = [{"filename": g["filename"], "title": g["title"], "category": g["category"]} for g in guides]
            print(json.dumps(out, ensure_ascii=False, indent=2))
        else:
            print(f"📖 Toplam {len(guides)} Rehber Mevcut:\n")
            current_cat = None
            for g in sorted(guides, key=lambda x: x["category"]):
                if g["category"] != current_cat:
                    current_cat = g["category"]
                    print(f"\n📂 [{current_cat}]")
                print(f"  • {g['filename']}: {g['title']}")
        return 0

    if not args.query:
        parser.print_help()
        return 0

    query = args.query.lower()
    results = []

    for g in guides:
        score = 0
        matches = []

        # Başlıkta arama (en yüksek ağırlık)
        if query in g["title"].lower():
            score += 10
            matches.append(f"Başlık eşleşmesi: {g['title']}")

        # Kategoride arama
        if query in g["category"].lower():
            score += 5
            matches.append(f"Kategori eşleşmesi: {g['category']}")

        # İçerikte arama
        lines = g["content"].split("\n")
        for idx, line in enumerate(lines, start=1):
            if query in line.lower() and not line.startswith("#"):
                score += 1
                if len(matches) < 4:
                    clean_line = line.strip().replace("`", "").replace("**", "")
                    if len(clean_line) > 100:
                        clean_line = clean_line[:97] + "..."
                    matches.append(f"Satır {idx}: {clean_line}")

        if score > 0:
            results.append({
                "filename": g["filename"],
                "title": g["title"],
                "category": g["category"],
                "audience": g["audience"],
                "score": score,
                "snippets": matches
            })

    results.sort(key=lambda x: x["score"], reverse=True)

    if args.json:
        print(json.dumps(results, ensure_ascii=False, indent=2))
    else:
        print(f"🔍 '{args.query}' için {len(results)} eşleşen rehber bulundu:\n")
        for idx, r in enumerate(results, start=1):
            print(f"{idx}. [{r['category']}] {r['title']}")
            print(f"   📄 Dosya: rehberler/{r['filename']} (Hedef Kitle: {r['audience']})")
            for snip in r["snippets"][:3]:
                print(f"      ↳ {snip}")
            print()

    return 0

if __name__ == "__main__":
    sys.exit(main())
