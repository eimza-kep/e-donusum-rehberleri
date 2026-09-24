# UYAP UDF Dosyalarını Yapay Zeka (LLM & RAG) İçin Markdown'a Dönüştürme Rehberi 🤖⚖️

> **Kategori:** UYAP & Hukuk Teknolojileri (LegalTech)  
> **Hedef Kitle:** Avukatlar, Hukuk Büroları, LegalTech Geliştiricileri, Yapay Zeka Araştırmacıları  
> **Tahmini Okuma Süresi:** 6 dakika  
> **Son Güncelleme:** 2026

---

## 📌 Giriş: UDF Formatı ve Yapay Zeka Uyumluluğu

Adalet Bakanlığı Ulusal Yargı Ağı Bilişim Sistemi'nin (**UYAP**) standart dosya formatı olan `.udf` (UYAP Doküman Formatı), mahkeme kararları, tensip zaptları, dava dilekçeleri ve bilirkişi raporlarının resmi saklama biçimidir.

Ancak günümüz üretken yapay zeka modelleri (**Google Gemini, ChatGPT, Claude, DeepSeek**) ve yerel RAG (Retrieval-Augmented Generation) sistemleri, ham `.udf` dosyalarını doğrudan okuyamaz. Çünkü UDF dosyası:
1. Sıkıştırılmış bir **ZIP arşivi** mimarisindedir.
2. İçerisinde XML metin hiyerarşisi (`content.xml`) barındırır.
3. Evrak içine eklenmiş delil fotoğrafları, vekaletname taranmış belgeleri ve imzalar **Base64** kodlamasıyla XML düğümlerine gömülüdür.

Bu durum, hukuk profesyonellerinin dilekçelerini yapay zekaya özetletmesini, içtihat taratmasını veya tensip zaptından yasal süreleri çıkartmasını engeller.

---

## 🛠️ Açık Kaynak Çözüm: `udf2md`

Türkiye açık kaynak dijital dönüşüm ekosistemi kapsamında geliştirilen [`udf2md`](https://github.com/eimza-kep/udf2md), UDF formatını temiz, okunabilir ve yapay zeka dostu **Markdown (.md)** formatına dönüştürür.

### Temel Özellikler:
* **Başlık ve Paragraf Hiyerarşisi:** UYAP dokümanındaki koyu, italik ve altı çizili metinleri Markdown formatına (`**kalın**`, `*italik*`) dönüştürür.
* **Tablo Desteği:** Dava dosyasındaki masraf ve hesap tablolarını Markdown tablolarına çevirir.
* **Görsel Ayıklama (`--extract-images`):** Dokümana gömülü delil fotoğraflarını `.png` olarak çıkartıp Markdown metnine göreceli bağlantı ekler.
* **CLI ve Node.js Kütüphanesi:** Terminalden tek satırla veya Python/Node.js arka uç sistemlerine entegre edilerek çalıştırılabilir.

---

## 🚀 Hızlı Kullanım Adımları

### 1. Kurulum
Node.js ortamında terminalden global olarak kurabilir veya NPX ile doğrudan çalıştırabilirsiniz:

```bash
# Doğrudan çalıştırma (Kurulum gerektirmez)
npx @eimza-kep/udf2md dilekce.udf

# Veya kalıcı kurulum
npm install -g @eimza-kep/udf2md
```

### 2. Tek Bir Dosyayı Dönüştürme
```bash
# dilekce.udf dosyasını dilekce.md olarak kaydeder
udf2md dava_dilekcesi.udf
```

### 3. Görselleri Otomatik Ayıklayarak Dönüştürme
Bilirkişi raporları ve delil fotoğrafları içeren dosyalar için:
```bash
udf2md bilirkisi_raporu.udf -o cikti.md --extract-images
```

Bu komut:
- `cikti.md` dosyasını oluşturur.
- Dokümandaki tüm gömülü görselleri `images/` klasörüne kaydeder ve metin içine `![Resim](images/image_1.png)` formatında yerleştirir.

---

## 🤖 Yapay Zeka & LLM Prompt Örneği

Dönüştürdüğünüz `.md` dosyasını ChatGPT veya Gemini'a yükledikten sonra aşağıdaki prompt ile analiz yaptırabilirsiniz:

```text
Aşağıda UYAP UDF formatından Markdown'a dönüştürülmüş bir tensip zaptı bulunmaktadır.
Lütfen bu metni inceleyerek:
1. Davacı ve davalı taraf vekillerini listele.
2. Mahkemenin taraflara verdiği kesin süreleri ve yasal sonuçlarını maddeler halinde çıkar.
3. Bir sonraki duruşma gün ve saatini belirt.
```

---

## 🔗 İlgili Açık Kaynak Projeler

* 📝 [udf2md GitHub Deposu](https://github.com/eimza-kep/udf2md)
* 🖥️ [uyap-web-udf-editor (Tarayıcıda UDF Açıcı)](https://github.com/eimza-kep/uyap-web-udf-editor)
* ⚖️ [uyap-editor-hizli-onarim (Windows UYAP Onarım)](https://github.com/eimza-kep/uyap-editor-hizli-onarim)
