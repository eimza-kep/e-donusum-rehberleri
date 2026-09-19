# AKİS ve Akıllı Kart Sürücü Kurulum Kılavuzu 💳💻

> **Kategori:** E-İmza (Elektronik İmza)  
> **Hedef Kitle:** Windows, Mac ve Linux Kullanıcıları, Sistem Yöneticileri  
> **Tahmini Okuma Süresi:** 5 dakika  
> **Son Güncelleme:** 2026

---

## 📌 Genel Bakış: Middleware (Ara Yazılım) Nedir?

Bir e-imza USB cihazını bilgisayara taktığınızda işletim sisteminin kart içindeki çipi okuyabilmesi için iki temel yazılım katmanına ihtiyaç vardır:
1. **Donanım Kart Okuyucu Sürücüsü (CCID Driver):** USB portu ile kart donanımını haberleştirir (ACS ACR38/39, Omnikey, Gemalto vb.).
2. **Kart Yönetim Middleware'ı (AKİS / SafeNet):** Çipin içindeki Java Card veya Akıllı Kart İşletim Sistemine (AKİS) erişip kriptografik anahtarları sunar.

Türkiye'deki e-imza ve mali mühürlerin %80'inden fazlası TÜBİTAK UEKAE tarafından geliştirilen milli **AKİS (Akıllı Kart İşletim Sistemi)** çipini kullanmaktadır.

---

## 🪟 1. Windows Kurulum Adımları (Windows 10 & 11)

### Adım 1: Resmi Sürücüyü İndirin
* TÜBİTAK Resmi Destek Portalı: [akiskart.bilgem.tubitak.gov.tr/destek/](https://akiskart.bilgem.tubitak.gov.tr/destek/)
* Sistem türünüze uygun olan (çoğunlukla **Windows 64 Bit**) güncel `.msi` kurulum paketini indirin.

### Adım 2: Kurulumu Tamamlayın
1. Kurulumu yönetici olarak çalıştırın.
2. Kurulum tamamlandıktan sonra Başlat menüsünden **"AKİS Kart İzleme Aracı"** programını açın.
3. USB Token'ınızı takın. Sol menüde adınız ve soyadınız (veya şirket unvanınız) görünüyorsa kurulum başarılıdır!

### Sık Karşılaşılan Windows Hatası: "Kart Okuyucu Bulunamadı"
Eğer USB takılı olmasına rağmen araç hiçbir aygıt görmüyorsa:
* Windows Arama kutusuna `services.msc` yazın.
* **Smart Card (Akıllı Kart - SCardSvr)** hizmetini bulun.
* Başlangıç türünü **"Otomatik"** yapın ve **"Başlat"** butonuna basın.
* Tek tıkla otomatik onarım için açık kaynaklı [akilli-kart-surucu-teshis](https://github.com/eimza-kep/akilli-kart-surucu-teshis) betiğimizi kullanabilirsiniz.

---

## 🍏 2. macOS Kurulum Adımları (Apple Silicon M1/M2/M3/M4 & Intel)

macOS üzerinde e-imza çalıştırmak için ek adımlar gereklidir:

1. **Java Runtime (JRE) Yüklemesi:**  
   Oracle veya Temurin OpenJDK 8 / 11 sürümünü yükleyin. Apple Silicon için macOS `arm64` paketini tercih edin.
2. **AKİS Mac Sürümü:**  
   TÜBİTAK portalından macOS için `.pkg` dosyasını indirin ve kurun.
3. **Güvenlik İzni (Gatekeeper):**  
   "Geliştirici doğrulanamadı" uyarısı alırsanız: `Sistem Ayarları > Gizlilik ve Güvenlik > Yine de Aç` butonuna tıklayın.
4. **Tarayıcı Desteği:** Chrome veya Safari üzerinde Java applet çalışmadığından, imzalama işlemlerinde masaüstü e-imza uygulamaları (UYAP Editör, E-İmzam vb.) kullanılır.

---

## 🐧 3. Linux (Ubuntu / Debian / Pardus / Fedora) Kurulumu

Milli işletim sistemimiz Pardus ve diğer Linux dağıtımlarında AKİS kurulumu:

```bash
# Gerekli bağımlılıkları kurun (Debian / Ubuntu / Pardus)
sudo apt update
sudo apt install pcscd libpcsclite1 pcsc-tools default-jre -y

# pcscd akıllı kart servisini başlatın ve otomatik yapın
sudo systemctl enable --now pcscd

# AKİS paketini kurun (.deb)
sudo dpkg -i akis_2.0_amd64.deb
sudo apt install -f
```

Bağlantıyı test etmek için terminalde şu komutu verin:
```bash
pcsc_scan
```
Ekranda kart üreticisi ve ATR bilgisi akıyorsa Linux üzerinde e-imzanız başarıyla algılanmıştır.

---

## 🛠️ Sorun Giderme Matrisi

| Belirti / Hata | Olası Neden | Doğrudan Çözüm |
| :--- | :--- | :--- |
| **Aygıt Yöneticisinde Sarı Ünlem** | Windows CCID sürücüsü eksik | Üretici sitesinden ACS ACR38/ACR39 sürücüsünü yükleyin. |
| **"SCardEstablishContext: 0x8010001D"** | Windows Akıllı Kart Servisi kapalı | `net start SCardSvr` komutuyla servisi çalıştırın. |
| **AKİS "Kart Takılı Değil" Diyor** | Çip ile okuyucu kontakları tozlanmış | USB'yi çıkarın, SIM boyutundaki çipi nazikçe silip tekrar takın. |

---

## 🔗 İlgili Kaynaklar ve İndirmeler

* 🏛️ [TÜBİTAK AKİS Resmi Destek Portalı](https://akiskart.bilgem.tubitak.gov.tr/destek/)
* 🏛️ [Kamu SM Sürücü Deposu](https://kamusm.bilgem.tubitak.gov.tr/islemler/surucu_indirme/)
* 🛠️ [Açık Kaynak Akıllı Kart Teşhis Scripti](https://github.com/eimza-kep/akilli-kart-surucu-teshis)
