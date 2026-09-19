# Mali Mührün Süresi Bittiğinde veya Bozulduğunda Acil Eylem Planı 🚨🔥

> **Kategori:** Mali Mühür  
> **Hedef Kitle:** Mali Müşavirler, Muhasebe Müdürleri, Şirket Yöneticileri  
> **Tahmini Okuma Süresi:** 5 dakika  
> **Son Güncelleme:** 2026

---

## 📌 Kriz Senaryosu: Berat Günü Mali Mühür Çalışmıyor!

Ayın son günü saat 22:00, e-Defter beratı göndereceksiniz. USB Token'ı taktınız fakat:
* **"Sertifikanın süresi dolmuştur (Certificate Expired)"**
* **"Akıllı kart arızalandı / I/O Hatası"**
* Veya **"PIN bloke oldu, PUK bulunamıyor"**

Bu durumda soğukkanlı kalarak resmi GİB mevzuatına uygun adımları atmanız gerekir.

---

## 🏃 Adım 1: Hemen Yeni Mali Mühür Başvurusu Yapın ve Ödeyin

GİB ve vergi incelemelerinde "mücbir sebep" veya iyi niyet kanıtı olarak **Kamu SM başvuru ve ödeme dekontunun tarihi** esas alınır.

1. Vakit kaybetmeden [mportal.kamusm.gov.tr](https://mportal.kamusm.gov.tr/bp/mali.go) üzerinden acil başvuru yapın.
2. İnternet bankacılığı ile ödemesini hemen gerçekleştirin ve dekontu PDF olarak saklayın.

---

## 🏛️ Adım 2: GİB'e Mücbir Sebep / Ek Süre Dilekçesi Verme (VUK 13)

Vergi Usul Kanunu 13. maddesi (Mücbir Sebepler) kapsamında:

1. **Dijital Vergi Dairesi (İnteraktif Vergi Dairesi)** portalına giriş yapın.
2. `Genel Dilekçe Ver` menüsünü seçin.
3. Dilekçe metninde:
   * Şirketin VKN ve unvanını,
   * Mali mührün donanımsal olarak arızalandığını / süresinin bittiğini,
   * Yeni mühür başvurusunun yapıldığını (Kamu SM talep no ve ödeme dekontunu ekleyerek),
   * Yeni mühür teslim edilene kadar berat yükleme süresi için ek süre talep edildiğini belirtin.
4. Bu dilekçe, ileride kesilebilecek özel usulsüzlük cezalarına karşı şirketin en güçlü hukuki kalkanıdır.

---

## 🛡️ Adım 3: Özel Entegratör İmzası Seçeneği (Yedek Çözüm)

Eğer şirketiniz bir **Özel Entegratör** ile çalışıyorsa ve GİB portalında daha önce entegratörünüze **"Saklama ve İmzalama Yetkisi"** verdiyseniz:

* Bazı özel entegratörler kendi kurumsal mali mühürleri ile mükellef adına berat imzalama yetkisine sahiptir.
* Muhasebe programınızla veya entegratörünüzün destek masasıyla derhal iletişime geçerek entegratör mührüyle beratın gönderilip gönderilemeyeceğini teyit edin.

---

## 🔍 Önleyici Çözüm: Otomatik Süre Takibi

Bu krizi bir daha asla yaşamamak için şirket bilgisayarlarınıza haftalık zamanlanmış kontrol kurun:

```powershell
# Bitiş süresine 30 günden az kalan sertifikaları tespit eder:
.\Check-CertificateExpiry.ps1 -AlertDays 30 -FailOnCritical
```

Bu komutu Windows Görev Zamanlayıcısı'na (Task Scheduler) bağlayarak her Pazartesi sabahı otomatik çalıştırabilir ve 30 gün kala erkenden uyarı alabilirsiniz.
