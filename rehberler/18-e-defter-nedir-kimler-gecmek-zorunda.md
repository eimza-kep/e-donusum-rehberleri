# e-Defter Nedir ve Berat Yükleme Takvimi Nasıl İşler? 📑⚖️

> **Kategori:** e-Defter & Beratlar  
> **Hedef Kitle:** Mali Müşavirler, Muhasebe Yöneticileri, Şirket Ortakları  
> **Tahmini Okuma Süresi:** 6 dakika  
> **Son Güncelleme:** 2026

---

## 📌 Giriş: Fiziki Defter Tasdikine Son

e-Defter; Vergi Usul Kanunu ve Türk Ticaret Kanunu hükümleri gereğince tutulması zorunlu olan **Yevmiye Defteri** ve **Defter-i Kebir (Büyük Defter)** kayıtlarının dijital ortamda tutulması, Mali Mühür veya e-İmza ile imzalanması ve Gelir İdaresi Başkanlığı'na (GİB) **"Berat"** dosyasının yüklenmesi uygulamasıdır.

e-Deftere geçen mükellefler:
* Notere gidip her yıl sonu yüzlerce sayfalık defter tasdik ettirme masrafından kurtulur.
* Noter kapanış tasdiki yapmaz.
* Defterler fiziksel olarak basılmaz, güvenli elektronik ortamda saklanır.

---

## 🔍 e-Defter Sisteminde "Berat" Nedir?

Pek çok kişi e-Defter uygulamasında tüm muhasebe kayıtlarının ve ticari sırların GİB'e yüklendiğini zanneder. **Bu bir yanılgıdır!**

* **Defter Dosyası:** Şirketin tüm yevmiye maddelerini içeren devasa XML dosyasıdır. **Şirketin kendi bünyesinde kalır, GİB'e gönderilmez.**
* **Berat Dosyası:** Defter dosyasının kriptografik matematiksel özetini (SHA-256 Digest Hash) ve mali mührünü barındıran küçük bir XML dosyasıdır. **GİB'e yalnızca bu berat yüklenir.**
* GİB bu beratı kendi mührüyle de imzalayarak onaylar ve mükellefe geri verir (**GİB Onaylı Berat**).

---

## 🗓️ Berat Yükleme Takvimi ve Dönem Tercihleri

Mükellefler e-Defter beratlarını yüklemek için iki farklı yöntemden birini seçebilir:

### 1. Aylık Yükleme Tercihi (Varsayılan)
İlgili ayı takip eden **üçüncü ayın son gününe kadar** yüklenir.
* Ocak ayı beratı: **30 Nisan**'a kadar
* Şubat ayı beratı: **31 Mayıs**'a kadar
* Mart ayı beratı: **30 Haziran**'a kadar ...

### 2. Geçici Vergi Dönemleri Bazında Yükleme Tercihi (3 Aylık)
Geçici vergi beyannamelerinin verildiği ayın son gününe kadar toplu yüklenir:
* **1. Dönem (Ocak - Şubat - Mart):** Mayıs ayının son günü
* **2. Dönem (Nisan - Mayıs - Haziran):** Ağustos ayının son günü
* **3. Dönem (Temmuz - Ağustos - Eylül):** Kasım ayının son günü
* **4. Dönem (Ekim - Kasım - Aralık):** Gelir/Kurumlar vergisi beyannamesi ayının son günü

---

## 🛡️ Yükleme Öncesi Kontrol: XML Doğrulama

GİB portalına berat yüklerken en ufak bir kuruşluk tutar dengesizliği veya şema hatası beratın reddedilmesine neden olur. Yükleme yapmadan önce açık kaynaklı [gib-edefter-berat-xml-dogrulayici](https://github.com/eimza-kep/gib-edefter-berat-xml-dogrulayici) aracımızla dosyalarınızı doğrulayabilirsiniz:

```bash
# Borç/Alacak dengesini ve şemayı test eder:
python validate_edefter_xml.py 1234567890-202601-YB-000000.xml
```
