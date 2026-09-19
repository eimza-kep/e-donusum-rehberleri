# Mac (macOS) E-İmza ve Java Kurulum Kılavuzu (Apple Silicon & Intel) 🍏💻

> **Kategori:** E-İmza (Elektronik İmza)  
> **Hedef Kitle:** MacBook ve iMac Kullanıcıları, Avukatlar, Şirket Yöneticileri  
> **Tahmini Okuma Süresi:** 5 dakika  
> **Son Güncelleme:** 2026

---

## 📌 macOS Ekosisteminde E-İmza Neden Zorlayıcıdır?

Apple ekosistemi (macOS Sonoma, Sequoia vb.) güvenlik politikaları nedeniyle harici çekirdek uzantılarını (kext) kısıtlar ve Safari/Chrome tarayıcılarında Java Applet desteğini tamamen kaldırmıştır. Ayrıca Apple Silicon (M1, M2, M3, M4) çipleri ARM64 mimarisi kullandığından, x86_64 mimarisi için derlenmiş eski Türk e-imza kütüphaneleri Rosetta 2 çeviricisi gerektirir.

Doğru adımlarla Mac bilgisayarınızda e-imzayı %100 kararlı hale getirebilirsiniz.

---

## 🛠️ Adım Adım Kurulum Kılavuzu

### Adım 1: Rosetta 2 Kurulumu (Yalnızca M1/M2/M3/M4 Çipleri İçin)
Terminal uygulamasını açın (`Cmd + Boşluk > Terminal`) ve şu komutu verin:

```bash
softwareupdate --install-rosetta --agree-to-license
```

### Adım 2: Uyumlu Java (JRE) Yüklemesi
E-İmza kütüphaneleri Java 8 veya 11 ile en kararlı çalışır.
* **Önerilen Paket:** Eclipse Temurin OpenJDK 8 (LTS) veya Oracle Java 8 JRE.
* **Apple Silicon İçin:** Temurin'in `macOS / aarch64` veya `x64` paketini indirip kurun.

### Adım 3: AKİS macOS Sürümünün Yüklenmesi
1. [TÜBİTAK AKİS Destek Sayfası](https://akiskart.bilgem.tubitak.gov.tr/destek/)'na gidin.
2. macOS için hazırlanmış olan `.pkg` kurulum paketini indirin.
3. Çift tıklayarak kurulum sihirbazını tamamlayın.

> [!WARNING]
> **"Geliştirici Doğrulanamadığı İçin Açılamıyor" Uyarısı:**
> Mac güvenliği kuruluma izin vermezse:
> `Sistem Ayarları > Gizlilik ve Güvenlik > Güvenlik` bölümüne gidin.
> Altta çıkan **"Yine de Aç"** (Open Anyway) butonuna tıklayıp parolanızı girin.

### Adım 4: Kart Okuyucunun Terminalden Test Edilmesi
USB Token'ı Mac'inize takın (Type-C adaptör kullanıyorsanız kaliteli bir OTG dönüştürücü tercih edin).
Terminalde şu komutu çalıştırın:

```bash
pcsctool
# Veya sistem donanım bilgisini sorgulayın:
system_profiler SPUSBDataType | grep -i "card"
```
Aygıt listede görünüyorsa Mac donanımı başarıyla tanımıştır.

---

## ⚖️ UYAP Editörün Mac'te Çalıştırılması

Avukatlar ve hukukçular için UDF formatındaki belgeleri açmak:
1. [UYAP Doküman Editörü Mac Sürümü](https://uyap.gov.tr/Uyap-Editor)'nü indirin (`.dmg` veya `.zip`).
2. Uygulamalar (Applications) klasörüne sürükleyin.
3. İlk açılışta `Control` tuşuna basılı tutarak simgeye sağ tıklayıp **"Aç"** deyin.

---

## ❓ Sık Karşılaşılan Sorunlar ve Çözümleri

* **USB-C Hub Sorunu:** Bazı ucuz çoklayıcı hub'lar akıllı kartın çip voltajını besleyemez. Cihazı mümkünse doğrudan veya Apple onaylı adaptörle bağlayın.
* **AKİS Açılıyor ama Kart Görünmüyor:** Çipin USB içine ters takılmadığından ve kontakların temiz olduğundan emin olun.
* **e-Devlet Girişi:** Safari yerine Chrome veya Edge kullanarak e-Devlet Kapısı e-İmza uygulamasını (`edevlet-eimza.jnlp` veya yerel servis) başlatın.
