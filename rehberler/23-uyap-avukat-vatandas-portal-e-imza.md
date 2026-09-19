# UYAP Avukat ve Vatandaş Portalında E-İmza Kullanım Rehberi ⚖️🏛️

> **Kategori:** UYAP & Hukuk Teknolojileri  
> **Hedef Kitle:** Avukatlar, Stajyer Avukatlar, Hukuk Sekreterleri, Vatandaşlar  
> **Tahmini Okuma Süresi:** 8 dakika  
> **Son Güncelleme:** 2026

---

## 📌 Giriş: Dijital Yargı ve UYAP

**Ulusal Yargı Ağı Bilişim Sistemi (UYAP)**; mahkemeler, icra daireleri, savcılıklar ve adli tıp kurumlarını tek bir entegre dijital ağda buluşturan Türkiye Cumhuriyeti Adalet Bakanlığı altyapısıdır.

Avukatlar ve vatandaşlar, adliyeye gitmeden adli işlemleri bilgisayar başından yürütebilmek için **Nitelikli Elektronik İmza (E-İmza)** kullanırlar.

---

## ⚖️ Avukat Portal vs Vatandaş Portal: E-İmza Neden Zorunlu?

| İşlem | e-Devlet Şifresi ile Giriş | E-İmza ile Giriş |
| :--- | :---: | :---: |
| **Dava ve İcra Dosyalarını Görüntüleme** | ✅ | ✅ |
| **Duruşma Günlerini Takip Etme** | ✅ | ✅ |
| **Yeni Dava Açma / İcra Takibi Başlatma** | ❌ (Yetkisiz) | ✅ (Tam Yetki) |
| **Dilekçe, Savunma ve Beyan Gönderme** | ❌ (Hukuken Geçersiz) | ✅ (5070 Sayılı Kanun Uyarınca Geçerli) |
| **Dosyadan Evrak / Bilirkişi Raporu İndirme**| ⚠️ (Kısıtlı) | ✅ (Tam Erişim) |
| **Masraf ve Harç Yatırma** | ✅ | ✅ |

> **Hukuki İlke:** HMK (Hukuk Muhakemeleri Kanunu) gereğince mahkemeye sunulan dilekçelerin ıslak imzalı veya güvenli elektronik imzalı olması şarttır. E-İmzasız gönderilen dilekçeler işleme alınmaz.

---

## 📝 UYAP Doküman Editörü (.UDF) ve İmzalama Adımları

Adalet Bakanlığı, mahkeme evraklarında standart sağlamak için ücretsiz **UYAP Doküman Editörü (.udf)** yazılımını sunar:

```
[Dilekçenizi Yazın (Word/LibreOffice)]
                 │
                 ▼
[UYAP Editörüne Yapıştırın veya Doğrudan Editörde Yazın]
                 │
                 ▼
[Üst Menüden "İmzala" Butonuna Basın]
                 │
                 ▼
[Akıllı Kartınızı Seçin & PIN Kodunuzu Girin]
                 │
                 ▼
[.udf Belgesi Kriptografik Olarak İmzalandı]
                 │
                 ▼
[Avukat/Vatandaş Portaldan Mahkemeye Gönderin]
```

---

## 🛠️ En Sık Karşılaşılan UYAP E-İmza Hataları ve Çözümleri

### 1. "Akıllı Kart Bulunamadı / Kart Takılı Değil"
* **Neden Olur:** USB kart okuyucu gevşemiş olabilir veya AKİS sürücüsü arkaplanda kilitlenmiştir.
* **Çözüm:**
  1. USB dongle'ı çıkarıp farklı bir USB portuna takın.
  2. Başlat menüsünden `AKİS Kart İzleme Aracı`nı açın. Kartınız orada görünüyorsa UYAP'ı yeniden deneyin.
  3. Görünmüyorsa AKİS yazılımını güncel sürümle yeniden yükleyin.

### 2. "Sertifika Doğrulanamadı / Kök Sertifika Eksik"
* **Neden Olur:** Bilgisayarınızın sertifika deposunda E-İmza sağlayıcınızın (E-Tuğra, Türktok, E-Güven, Kamu SM vb.) Kök Sertifikası yüklü değildir.
* **Çözüm:** E-imza sağlayıcınızın web sitesindeki "Kök ve Alt Kök Sertifikaları" indirip Windows Sertifika Yöneticisi'ne (`certmgr.msc`) "Güvenilen Kök Sertifika Yetkilileri" altına aktarın.

### 3. "UYAP E-İmza Uygulaması Başlatılamadı"
* **Neden Olur:** Tarayıcılar (Chrome, Edge) eski Java eklentilerini engellediği için Adalet Bakanlığı **"UYAP E-İmza Uygulaması"** yerel istemcisini geliştirmiştir.
* **Çözüm:**
  1. `uyap.gov.tr` üzerinden en güncel **UYAP E-İmza İstemcisi**ni indirin ve kurun.
  2. Görev çubuğunda (saat yanında) UYAP logosunun yeşil/aktif olduğundan emin olun.

### 4. macOS (Apple Silicon M1/M2/M3/M4) UYAP Sorunları
* macOS kullanıcıları UYAP Editörü açarken *"Bilinmeyen geliştirici"* uyarısı alıyorsa:  
  * `Sistem Ayarları` -> `Gizlilik ve Güvenlik` -> *"Yine de Aç"* butonuna basmalıdır.
  * Kart okuyucu için Homebrew ile `pcsc-lite` kütüphanesinin kurulu olması gerekebilir.

---

## 🔗 Resmi Bağlantılar ve İndirme Merkezleri
* [UYAP Avukat Portalı](https://avukat.uyap.gov.tr)
* [UYAP Vatandaş Portalı](https://vatandas.uyap.gov.tr)
* [UYAP Doküman Editörü İndirme Sayfası](https://uyap.gov.tr/Uyap-Editor)
* [Adalet Bakanlığı Bilgi İşlem Genel Müdürlüğü](https://bilgiislem.adalet.gov.tr)
