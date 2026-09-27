# 2026/2027 e-İrsaliye Geçiş Zorunluluğu, Ciro Limitleri ve Karekod Standartları 🚚📋

> **Kategori:** e-İrsaliye, Lojistik & Vergi Hukuku  
> **Hedef Kitle:** Şirket Ortakları, Mali Müşavirler, Lojistik Yöneticileri, ERP Uzmanları  
> **Tahmini Okuma Süresi:** 6 dakika  
> **Son Güncelleme:** 2026

---

## 📌 2026 Yılı e-İrsaliye Ciro ve Sektörel Geçiş Limitleri

Gelir İdaresi Başkanlığı (GİB) 509 Sıra No.lu VUK Genel Tebliği uyarınca, e-İrsaliye uygulamasına geçiş zorunluluğu kapsamı her yıl güncellenmektedir:

1. **Genel Ciro Haddi:** Brüt satış hasılatı 10 Milyon TL ve üzeri olan mükellefler için e-İrsaliye uygulamasına geçiş zorunludur.
2. **Özel Sektörel Zorunluluklar:**
   - **ÖTV (I) Sayılı Liste:** Petrol, akaryakıt, madeni yağ lisansına sahip şirketler (Ciro şartı aranmaksızın).
   - **ÖTV (III) Sayılı Liste:** Tütün, alkol, kolalı gazoz imalatçıları ve toptancıları.
   - **Maden ve Taş Ocakları:** Maden Kanunu kapsamında işletme ruhsatı alan işletmeler.
   - **Şeker İmalatçıları ve Toptancıları:** Şeker Kanununda tanımlanan şeker üreticileri.
   - **Demir-Çelik Sektörü:** Demir, çelik ve demir cevheri üretimi veya toptan ticareti yapan mükellefler.
   - **Hal Kayıt Sistemi (HKS):** Sebze ve meyve toptancıları ve komisyoncuları.

---

## 📱 GİB Karekod (QR Kod) Teknik Standartları

e-İrsaliye belgelerinde yer alması zorunlu olan karekod, Gelir İdaresi Başkanlığı'nın güncel UBL-TR 1.2 kılavuzunda belirtilen veri yapısını taşımalıdır:

* **Karekod Boyutu:** Belgenin sağ üst köşesinde, en az 2x2 cm boyutunda ve 300 DPI çözünürlükte basılabilir netlikte olmalıdır.
* **Karekod İçerik Deseni:**
  ```text
  VKN|ALICI_VKN|IRSALIYE_NO|TARIH|FIILI_SEVK_TARIHI|ODENECEK_TUTAR|HASH
  ```
* **Karekodsuz Sevkiyat Riski:** Yol denetiminde mobil tabletlerle yapılan denetimlerde karekodu bulunmayan veya okunamayan e-İrsaliyeler için VUK Madde 353 uyarınca özel usulsüzlük cezası tatbik edilir.

---

## 🔍 e-İrsaliye XML Ayrıştırma ve İnceleme Aracı

Açık kaynak ekosistemimizde yer alan [`e-fatura-xml-goruntuleyici`](https://github.com/eimza-kep/e-fatura-xml-goruntuleyici) aracı ile gelen ve giden e-İrsaliye (`DespatchAdvice`) XML dosyalarındaki:
- Plaka numarası (`LicensePlateID`)
- Taşıyıcı ve şoför kimlik bilgileri (`CarrierParty`, `DriverPerson`)
- Kalem bazlı sevk miktarları ve teslim adresleri
tek tıkla doğrulanabilir ve görüntülenebilir.

---

## 🌐 İlgili Açık Kaynak Araçlar

* 📄 [e-fatura-xml-goruntuleyici](https://github.com/eimza-kep/e-fatura-xml-goruntuleyici) - UBL-TR e-İrsaliye ve e-Fatura XML ayrıştırıcı.
* 📨 [kep-adresi-dogrulayici](https://github.com/eimza-kep/kep-adresi-dogrulayici) - İrsaliye itirazlarında resmi bildirim kanalı doğrulayıcı.
* 📑 [gib-edefter-berat-xml-dogrulayici](https://github.com/eimza-kep/gib-edefter-berat-xml-dogrulayici) - Defter kayıtlarında irsaliye entegrasyonu denetimi.
