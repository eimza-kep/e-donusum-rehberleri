# Mali Mühür Nedir? Bireysel E-İmzadan Hangi Noktalarda Ayrılır? 🔴🔑

> **Kategori:** Mali Mühür  
> **Hedef Kitle:** Şirket Ortakları, Mali Müşavirler, Muhasebe Yöneticileri, Girişimciler  
> **Tahmini Okuma Süresi:** 5 dakika  
> **Son Güncelleme:** 2026

---

## 📌 Giriş: Dijital Kaşe vs. Dijital İmza

İş dünyasında en sık karıştırılan iki kavram **Mali Mühür** ve **Elektronik İmza (E-İmza)**dır. İkisi de USB Token donanımı ve akıllı kart çipi şeklinde teslim edilir; ancak hukuki nitelikleri, kullanım amaçları ve verdikleri yetkiler tamamen farklıdır.

Kısa ve net formül:
* **E-İmza = Islak İmza (Kişiyi Temsil Eder)**
* **Mali Mühür = Kurumsal Kaşe (Şirketi Temsil Eder)**

---

## 📊 Kapsamlı Karşılaştırma Tablosu

| Kriter | Elektronik İmza (E-İmza) | Mali Mühür (MM) |
| :--- | :--- | :--- |
| **Temsil Ettiği Varlık** | Gerçek Kişi (Şahıs) | Tüzel Kişilik (Şirket, Kurum) |
| **Yasal Dayanak** | 5070 Sayılı Elektronik İmza Kanunu | Vergi Usul Kanunu (VUK) Tebliğleri |
| **Yetkili Üretici** | Tüm Yetkili Özel ESHS'ler (TÜRKTRUST, E-Güven vb.) | **Yalnızca TÜBİTAK BİLGEM Kamu SM** |
| **Zorunluluk Alanı** | Bireysel işler, UYAP, KEP, Web Tapu, İhaleler | **e-Fatura, e-Defter ve e-İrsaliye başvurusu ve beratı** |
| **Şirket Sahibi Değişirse** | Kişiye ait kalır, iptal edilmez | Şirket Vergi Kimlik No (VKN) adına kalmaya devam eder |
| **Geçerlilik Süresi** | Genellikle 1, 2 veya 3 Yıl | **3 Yıl** |
| **Fiyatlandırma** | Özel piyasa rekabetine tabi | Kamu SM resmi sabit tarifesi |

---

## 🏢 Mali Mühür Nerede Zorunludur?

1. **e-Dönüşüm Sistemine İlk Giriş:** Şirketiniz e-Fatura, e-Defter veya e-İrsaliye sistemine ilk kez kaydolurken GİB portalında kimlik doğrulama mali mühür ile yapılır.
2. **e-Defter Beratı İmzalama:** Her ay veya geçici vergi dönemlerinde Yevmiye ve Kebir berat dosyaları mali mühür ile imzalanıp GİB'e yüklenir.
3. **Mali Belgelerin Değişmezliği:** Muhasebe kayıtlarının geriye dönük tahrif edilmediğini garanti eder.

---

## ❓ Şahıs Şirketleri Mali Mühür Almak Zorunda mıdır?

> [!TIP]
> **Önemli İstisna:** Gelir İdaresi Başkanlığı düzenlemelerine göre **Şahıs Firmaları (Bilanço usulü veya işletme hesabı)** e-Fatura ve e-Defter süreçlerinde mali mühür yerine **kendi adlarına alınmış şahsi Nitelikli Elektronik İmzalarını (E-İmza)** kullanabilirler.
> 
> Ancak **Limited Şirket (Ltd. Şti.) ve Anonim Şirket (A.Ş.)** gibi sermaye şirketleri mutlaka tüzel kişi **Mali Mührü** temin etmek zorundadır!

---

## ⚠️ Kritik Uyarı: Süre Takibi ve Kriz Yönetimi

Mali mührün süresi bittiğinde e-Defter beratı yüklenemez ve şirket ağır usulsüzlük cezalarıyla karşılaşır.
Bilgisayarınızdaki mali mühür süresini tek tıkla denetlemek için açık kaynaklı [mali-muhur-eimza-suresi-kontrol](https://github.com/eimza-kep/mali-muhur-eimza-suresi-kontrol) aracımızı kullanabilirsiniz:

```powershell
.\Check-CertificateExpiry.ps1 -AlertDays 45
```
