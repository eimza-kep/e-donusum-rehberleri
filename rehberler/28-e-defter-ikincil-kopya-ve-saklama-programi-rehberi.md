# e-Defter İkincil Kopya ve Saklama Programı Kurulum ve Hata Çözüm Rehberi 📑💾

> **Kategori:** e-Defter, Vergi Hukuku & GİB BİGEM  
> **Hedef Kitle:** Mali Müşavirler, Muhasebe Müdürleri, BT Yöneticileri, ERP Danışmanları  
> **Tahmini Okuma Süresi:** 8 dakika  
> **Son Güncelleme:** 2026  
> **Yasal Dayanak:** 1 Sıra No.lu Elektronik Defter Genel Tebliği, VUK 509, GİB e-Defter Saklama Kılavuzu

---

## 📌 1. e-Defter İkincil Kopya Saklama Zorunluluğu Nedir?

Gelir İdaresi Başkanlığı (GİB) tarafından yayımlanan 1 Sıra No.lu Elektronik Defter Genel Tebliği'nde Değişiklik Yapılmasına Dair Tebliğ uyarınca:

> **e-Defter tutan tüm mükellefler, oluşturdukları e-Defter dosyaları (Yevmiye ve Kebir) ile bunlara ait onaylı berat dosyalarını ve GİB onaylı beratlarını, Gelir İdaresi Başkanlığı'nın Bilgi İşlem Merkezi (BİGEM) sistemine ikincil kopya olarak yüklemek ZORUNDADIR.**

Bu zorunluluk; şirketlerin defter verilerinin yangın, su baskını, fidye yazılımı (ransomware), disk arızası veya şirket içi veri kaybı durumlarında devlet güvencesinde korunmasını sağlamaktadır.

---

## 📅 2. İkincil Kopya Yükleme Takvimi ve Yasal Süreler

e-Defter beratlarının GİB portalına yüklenmesinin ardından ikincil kopyaların GİB saklama sistemine aktarılması için belirlenen süreler şunlardır:

### A) Aylık Yükleme Tercihinde Bulunanlar:
| Dönem | Berat Yükleme Son Günü | İkincil Kopya Yükleme Son Günü |
|---|---|---|
| **Ocak** | Nisan ayı sonu | Mayıs ayı sonu |
| **Şubat** | Mayıs ayı sonu | Haziran ayı sonu |
| **Mart** | Haziran ayı sonu | Temmuz ayı sonu |
| **Nisan** | Temmuz ayı sonu | Ağustos ayı sonu |
| **Mayıs** | Ağustos ayı sonu | Eylül ayı sonu |
| **Haziran** | Eylül ayı sonu | Ekim ayı sonu |
| **Temmuz** | Ekim ayı sonu | Kasım ayı sonu |
| **Ağustos** | Kasım ayı sonu | Aralık ayı sonu |
| **Eylül** | Aralık ayı sonu | Takip eden Ocak ayı sonu |
| **Ekim** | Takip eden Ocak ayı sonu | Takip eden Şubat ayı sonu |
| **Kasım** | Takip eden Şubat ayı sonu | Takip eden Mart ayı sonu |
| **Aralık** | Takip eden Nisan ayı sonu (Gelir Vergisi) / Mayıs ayı sonu (Kurumlar Vergisi) | Berat yükleme ayını takip eden ay sonu |

### B) Geçici Vergi Dönemleri Bazında Yükleme Tercihinde Bulunanlar:
1. **1. Geçici Dönem (Ocak-Şubat-Mart):** Beratlar Mayıs sonu -> İkincil Kopyalar **Haziran ayı sonu**
2. **2. Geçici Dönem (Nisan-Mayıs-Haziran):** Beratlar Ağustos sonu -> İkincil Kopyalar **Eylül ayı sonu**
3. **3. Geçici Dönem (Temmuz-Ağustos-Eylül):** Beratlar Kasım sonu -> İkincil Kopyalar **Aralık ayı sonu**
4. **4. Dönem (Ekim-Kasım-Aralık):** Gelir/Kurumlar vergisi beyan ayı sonu -> İkincil kopyalar takip eden ay sonu

> [!IMPORTANT]
> Özel entegratör kullanan mükelleflerde, entegratörün saklama hizmeti vermesi durumunda bu aktarım entegratör tarafından arka planda otomatik yapılır; ancak defter sahibinin GİB portalından aktarımın gerçekleştiğini **kontrol etme ve doğrulama sorumluluğu** devam eder.

---

## 🛠️ 3. GİB e-Defter Saklama Programı Kurulumu ve Yapılandırma

Kendi yazılımı veya yerel ERP ile e-Defter tutan mükellefler, GİB tarafından yayımlanan **e-Defter Saklama Programı**'nı yerel bir sunucuya kurmalıdır:

1. **Java Runtime Environment (JRE):** Sistemde 64-bit Java 8 veya üzeri (OpenJDK 11/17) kurulu olmalıdır.
2. **Programın İndirilmesi:** `edefter.gov.tr` adresinden `e-Defter Saklama Programı` ZIP arşivi indirilir.
3. **Dizin Yapısı:**
   ```text
   C:\edefter_saklama\
   ├── edefter-saklama.jar
   ├── baslat.bat
   ├── ayar.xml
   └── log\
   ```
4. **`ayar.xml` Yapılandırması:**
   - `<vkn>`: Şirketin 10 haneli VKN veya 11 haneli TCKN bilgisi.
   - `<defterDizini>`: İmzalanmış defter ve berat XML dosyalarının bulunduğu kaynak klasör (`D:\EDEFTER_ARSIV\2026\`).
   - `<zamanlanmisGorev>`: Otomatik aktarım saati (örneğin her gece `02:00`).

---

## ⚠️ 4. Sık Karşılaşılan Hatalar ve Çözüm Reçeteleri

### Hata 1: `SocketTimeoutException` veya `Connection Timed Out`
* **Neden:** Yükleme dosya boyutunun büyük olması veya internet servis sağlayıcısının GİB sunucularına giden 443 portundaki TCP paketlerini zaman aşımına uğratması.
* **Çözüm Reçetesi:**
  1. Yükleme işlemini internet trafiğinin sakin olduğu mesai saatleri dışına (22:00 - 06:00) ayarlayın.
  2. Şirket güvenlik duvarında (Fortinet, Sophos, pfSense vb.) `edefter.gov.tr` ve `efatura.gov.tr` IP blokları için SSL Denetimi (Deep Packet Inspection) istisnası tanımlayın.
  3. `baslat.bat` dosyasındaki Java bellek limitini artırın:
     ```bash
     java -Xms1024m -Xmx4096m -jar edefter-saklama.jar
     ```

### Hata 2: `504 Gateway Timeout` Hatası
* **Neden:** Yasal yükleme sürelerinin son günlerinde yüz binlerce mükellefin aynı anda GİB sunucularına veri yüklemesi nedeniyle GİB yük dengeleyicilerinin (Load Balancer) aşırı yüklenmesi.
* **Çözüm Reçetesi:**
  - Defterlerin tamamını tek seferde göndermek yerine ay bazında parça parça gönderin.
  - Gönderim işlemini son günlere bırakmayınız.

### Hata 3: `Hash Değeri Uyuşmuyor` (BİGEM Doğrulama Başarısız)
* **Neden:** Saklama programının göndermeye çalıştığı berat XML dosyasının hash değeri ile daha önce GİB Portal'a yüklenmiş ve onaylanmış beratın hash değerinin farklı olması.
* **Çözüm Reçetesi:**
  1. Defter dizinindeki berat dosyasının üzerinde değişiklik (yeniden imzalama, formatlama) yapılmadığından emin olun.
  2. GİB e-Defter portalına (`uyg.edefter.gov.tr`) giriş yaparak onaylı beratı ("GİB Onaylı Berat") portaldan yeniden indirin ve saklama dizinine kopyalayın.

### Hata 4: `PKIX path building failed / Sertifika Zinciri Doğrulanamadı`
* **Neden:** Java'nın yerleşik güvenilir sertifika deposunda (`cacerts`) TÜBİTAK Kamu SM kök ve alt kök sertifikalarının eksik olması.
* **Çözüm Reçetesi:**
  - `kamusm.gov.tr` adresinden Kamu SM Kök Sertifikasını (`kok-sertifika.crt`) indirin.
  - Java `keytool` aracı ile sertifikayı içe aktarın:
    ```bash
    keytool -import -trustcacerts -alias kamusm -file kok-sertifika.crt -keystore "C:\Program Files\Java\jre\lib\security\cacerts" -storepass changeit
    ```

---

## 🔒 5. İkincil Kopya Yükleme Durumunun Kontrol Edilmesi

Yükleme işleminin başarıyla tamamlandığını doğrulamak için:

1. `https://uyg.edefter.gov.tr` adresine Mali Mühür veya e-İmza ile giriş yapın.
2. Sol menüden **"e-Defter Saklama / İkincil Kopya Durum Sorgulama"** ekranına gelin.
3. İlgili yıl ve ayı seçip **Sorgula** butonuna basın.
4. Tabloda:
   - **Yevmiye Defteri:** `Aktarıldı (Yeşil)`
   - **Yevmiye Beratı:** `Aktarıldı (Yeşil)`
   - **Büyük Defter (Kebir):** `Aktarıldı (Yeşil)`
   - **Kebir Beratı:** `Aktarıldı (Yeşil)`
   - **GİB Onaylı Beratlar:** `Eşleşti (Yeşil)`
   ibarelerinin yer aldığından emin olun ve ekran görüntüsü/çıktı alarak saklayınız.

---

## 🌐 6. İlgili Açık Kaynak Araçlar

* 📊 [05-edefter-kontrolcu.py](../araclar/05-edefter-kontrolcu.py) - Yevmiye ve Kebir borç/alacak denkliğini kuruş seviyesinde denetleyen CLI aracı.
* 📑 [gib-edefter-berat-xml-dogrulayici](https://github.com/eimza-kep/gib-edefter-berat-xml-dogrulayici) - Berat XML şema ve SHA-256 doğrulayıcı.
* 🏛️ [mali-muhur-merkezi](https://github.com/eimza-kep/mali-muhur-merkezi) - Tüzel kişi mali mühür kurulum ve PIN yönetim merkezi.
