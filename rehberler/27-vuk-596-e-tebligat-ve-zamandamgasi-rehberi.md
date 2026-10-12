# Vergi Usul Kanunu 596 Sıra No.lu Genel Tebliği Kapsamında Yeni Nesil E-Tebligat ve Zaman Damgası Rehberi

> **Son Güncelleme:** Ekim 2026  
> **Kapsam:** Hazine ve Maliye Bakanlığı Gelir İdaresi Başkanlığı Elektronik Tebligat Sistemi, 213 Sayılı VUK m. 107/A, VUK 596 Sıra No.lu Tebliğ, 5070 Sayılı Elektronik İmza Kanunu.

---

## 📌 1. Giriş ve VUK 596 Tebliğinin Getirdiği Yenilikler

Vergi Usul Kanunu 596 Sıra No.lu Genel Tebliği ile Gelir İdaresi Başkanlığı (GİB) tarafından yürütülen elektronik tebligat altyapısı, modern kriptografik delil güvenliği, zaman damgası denetimi ve çoklu iletişim kanalı entegrasyonu ile kapsamlı şekilde güncellenmiştir.

Bu düzenlemenin temel amacı:
* E-Tebligat gönderim ve teslim anlarının **TÜBİTAK Kamu SM** veya yetkili ESHS zaman damgasıyla saniye hassasiyetinde mühürlenmesi,
* Tebligat mazbata kayıtlarının değiştirilemez kılınması,
* Şirket yöneticileri ve yetkilendirilmiş mali müşavirlerin bildirim mekanizmalarının güçlendirilmesidir.

---

## ⚖️ 2. Hukuki Tebellüğ Anı ve 5 Gün Kuralı

Vergi Usul Kanunu'nun 107/A maddesi ve VUK 596 uyarınca:

> **Elektronik ortamda yapılan tebligat, muhatabın elektronik adresine ulaştığı tarihi izleyen beşinci günün sonunda yapılmış sayılır.**

### Örnek Süre Hesabı:
* **Sisteme Düşme Tarihi:** 14 Ekim Salı saat 10:30
* **1. Gün:** 15 Ekim Çarşamba
* **2. Gün:** 16 Ekim Perşembe
* **3. Gün:** 17 Ekim Cuma
* **4. Gün:** 18 Ekim Cumartesi
* **5. Gün (Tebellüğ Sayılma Anı):** 19 Ekim Pazar saat 23:59:59
* **Dava / İtiraz Süresinin Başlangıcı:** 20 Ekim Pazartesi

> [!WARNING]
> Muhatabın sisteme giriş yapıp yapmadığına veya tebligatı açıp okuyup okumadığına **bakılmaksızın**, 5. günün sonunda tebligat yasal olarak tamamlanmış kabul edilir.

---

## 🔒 3. Zaman Damgası ve Mazbata Doğrulama Standartları

VUK 596 ile birlikte GİB e-Tebligat sisteminde üretilen tüm mazbatalar (teslim tutanakları) aşağıdaki standartları karşılar:

1. **RFC 3161 Zaman Damgası:** Zaman damgası sunucusu tarafından üretilen ASN.1 `TimeStampToken` yapısı mazbata XML'ine eklenir.
2. **SHA-256 Özet Doğrulama:** Tebliğ edilen belgenin (ihbarname, ödeme emri, rapor) özeti ile mazbatada kayıtlı özet birebir eşleşmelidir.
3. **Kamu SM Kök Sertifika Zinciri:** Zaman damgasının güvenilirliği, Türkiye Ulusal Kök Sertifika Otoritesi zincirinde doğrulanabilir olmalıdır.

---

## 📱 4. SMS ve E-Posta Bilgilendirmelerinin Hukuki Niteliği

Tebliğ uyarınca muhataplara e-tebligat gönderildiğinde sistem tarafından kayıtlı cep telefonuna SMS ve e-posta adresine bilgilendirme iletisi gönderilir.

* **Bilgilendirmenin Ulaşmaması:** SMS veya e-postanın teknik aksaklıklar, operatör engeli veya spam filtreleri nedeniyle muhataba ulaşmaması, **elektronik tebligatın geçerliliğini etkilemez**.
* **Tavsiye:** Şirket yetkililerinin GİB İnteraktif Vergi Dairesi / Dijital Vergi Dairesi profillerindeki iletişim bilgilerini her 6 ayda bir kontrol etmeleri ve şirket adına en az iki yetkili iletişim numarası tanımlamaları önerilir.

---

## 🏛️ 5. Yasal Başvuru ve Dava Süreleri (İYUK m. 7)

Elektronik tebligat ile tebliğ edilen vergi/ceza ihbarnamelerine karşı:

| Belge Türü | Yasal Süre | Başvuru Mercii | Hukuki Dayanak |
|:---|:---|:---|:---|
| Vergi ve Ceza İhbarnamesi (Dava Açma) | 30 Gün | Vergi Mahkemesi | İYUK m. 7 |
| Uzlaşma Başvurusu | 30 Gün | İlgili Uzlaşma Komisyonu | VUK Ek m. 1 |
| Ceza İndirimi Talebi | 30 Gün | Vergi Dairesi | VUK m. 376 |
| Ödeme Emrine İtiraz | 15 Gün | Vergi Mahkemesi | 6183 s. AATUHK m. 58 |

> [!IMPORTANT]
> Süreler, 5 günlük tebellüğ süresinin tamamlandığı günü takip eden ilk günden itibaren işlemeye başlar. Sürenin son günü resmi tatil veya hafta sonuna denk gelirse tatili takip eden ilk mesai günü mesai bitiminde sona erer.

---

## ✅ 6. Kurumsal Uyum Kontrol Listesi

- [ ] Dijital Vergi Dairesi üzerindeki e-Tebligat iletişim telefonları ve e-posta adresleri güncel mi?
- [ ] Şirket yetkilisi değiştiğinde Ticaret Sicil tescili sonrası vergi dairesine bildirim yapıldı mı?
- [ ] Muhasebe / Finans departmanı haftada en az iki kez (Pazartesi ve Perşembe) gelen kutusunu tarıyor mu?
- [ ] Gelen tebligatların zaman damgalı mazbata PDF/XML dosyaları 10 yıl yasal saklama süresi boyunca yedekleniyor mu?
