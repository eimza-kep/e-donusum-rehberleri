# KEP (Kayıtlı Elektronik Posta) Nedir ve Ne İşe Yarar? 📬⚖️

> **Kategori:** KEP (Kayıtlı Elektronik Posta)  
> **Hedef Kitle:** Şirket Yöneticileri, İK Müdürleri, Avukatlar, Girişimciler  
> **Tahmini Okuma Süresi:** 5 dakika  
> **Son Güncelleme:** 2026

---

## 📌 Giriş: Dijital Dünyanın İadeli Taahhütlü Mektubu

Kayıtlı Elektronik Posta (**KEP**); gönderici ve alıcının kimliklerinin kesin olarak doğrulandığı, iletinin içeriğinin değiştirilemediği ve iletim zamanının saniyesi saniyesine resmi delil olarak kayıt altına alındığı güvenli e-posta sistemidir.

Türkiye'de KEP sistemi, **Türk Ticaret Kanunu (TTK 18/3)**, **Tebligat Kanunu (7/a)** ve BTK'nın ilgili yönetmelikleri ile düzenlenmiştir.

---

## 🏛️ KEP Sistemi Neleri Garanti Eder? (5 Temel Delil)

Normal e-postalarda (Gmail, Outlook vb.) karşı taraf "Mail gelmedi", "Spam kutuma düştü" veya "İçeriği değiştirilmiş" diyerek inkar edebilir. Ancak KEP sisteminde **inkar edilemez 5 delil (delil paketi)** üretilir:

1. **Gönderim Delili:** Göndericinin e-postayı saat kaçta sisteme teslim ettiğinin delili.
2. **Ulaşma / İletim Delili:** İletinin alıcının KEP posta kutusuna ulaştığı anın delili.
3. **Okunma / Teslim Delili:** Alıcının posta kutusuna düşme anı veya açılma anı.
4. **Bütünlük Delili:** İletinin yolda hiçbir siber saldırı veya tahrifatla değiştirilmediğinin kriptografik garantisi.
5. **Zaman Damgası:** TÜBİTAK atomik saatine bağlı resmi zaman damgası.

> [!IMPORTANT]
> **5 Günlük Kanuni Kural:** Tebligat Kanunu uyarınca, KEP kutusuna ulaşan elektronik tebligat, **alıcı tarafından açılıp okunmasa dahi 5. günün sonunda resmen tebliğ edilmiş (okunmuş) sayılır.**

---

## 💼 KEP Nerelerde Kullanılır?

* **İhtarnameler ve Fesih Bildirimleri:** Notere gitmeden noter masrafsız hukuki ihtar çekme.
* **İş Hukuku & İK:** İş sözleşmesi feshi, istifa dilekçesi, savunma talebi ve bordro iletimi.
* **Ticari Sözleşmeler & Teklifler:** İhale teklifleri, sözleşme revizyonları, sipariş onayları.
* **Resmi Kurum Yazışmaları:** Kamu kurumları, belediyeler, bakanlıklar ve mahkemelere resmi evrak sunma.
* **e-Fatura İtirazları:** Kesilen faturaya 8 günlük kanuni itiraz süresi içinde resmi itiraz bildiriminde bulunma.

---

## 🔍 KEP Adresi Doğrulama

Bir KEP adresinin formatını ve BTK yetkili operatörünü doğrulamak için açık kaynaklı [kep-adresi-dogrulayici](https://github.com/eimza-kep/kep-adresi-dogrulayici) aracımızı kullanabilirsiniz:

```bash
python kep_validator.py sirket@hs01.kep.tr
```
