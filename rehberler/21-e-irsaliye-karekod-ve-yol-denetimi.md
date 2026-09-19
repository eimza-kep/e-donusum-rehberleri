# e-İrsaliye Düzenleme, Zorunlu Karekod ve Yol Denetimleri Rehberi 🚚📦

> **Kategori:** e-İrsaliye & Lojistik  
> **Hedef Kitle:** Lojistik Müdürleri, Depo Sorumluları, Muhasebeciler, Şoförler  
> **Tahmini Okuma Süresi:** 7 dakika  
> **Son Güncelleme:** 2026

---

## 📌 Giriş: Kağıt Sevk İrsaliyesinden Dijital Sevkiyata

e-İrsaliye, mal sevkiyatında kağıt ortamdaki "Sevk İrsaliyesi" ile birebir aynı hukuki niteliğe sahip, veri formatı Gelir İdaresi Başkanlığı (GİB) tarafından belirlenen elektronik belgedir.

Geleneksel irsaliyede yaşanan kaybolma, ıslanma, sevk irsaliyesi koçanının araçta unutulması ve sonradan fatura ile eşleştirilememe sorunları e-İrsaliye ile tamamen son bulmuştur. Ancak e-İrsaliye sisteminde denetimler anlık ve dijital olarak yürütülür.

---

## ⏰ Altın Kural: Mal Yola Çıkmadan Önce Gönderim

> **🚨 KRİTİK YASAL KURAL:** e-İrsaliye mutlaka **malın fiili sevkinden önce** düzenlenmeli ve GİB sistemine başarıyla iletilmiş olmalıdır.

* Mal kamyona yüklenip hareket ettikten sonra kesilen e-İrsaliyeler, geriye dönük düzenlenmiş sayılarak VUK uyarınca özel usulsüzlük cezasına tabidir.
* e-İrsaliye üzerinde **"Düzenleme Tarihi ve Saati"** ile **"Fiili Sevk Tarihi ve Saati"** ayrı ayrı yer alır. Sevkiyat saati gerçeği yansıtmalıdır.

---

## 📱 Zorunlu Karekod (QR Kod) Standardı

GİB teknik kılavuzları gereğince e-İrsaliye belgelerinin üzerinde okunabilir bir **Karekod (QR Kod)** bulunması zorunludur.

### Karekod İçerisinde Hangi Bilgiler Yer Alır?
* Belge Numarası (GİB standart 16 haneli kod)
* Düzenleyen VKN/TCKN ve Unvan
* Alıcı VKN/TCKN ve Unvan
* Belge Tarihi, Saati ve Fiili Sevk Saati
* Mal Kalem Sayısı ve Toplam Ağırlık/Adet Bilgisi
* Belge İmza Özeti (Hash Değeri)

---

## 👮 Yol Denetiminde Maliye ve Polis Neye Bakar?

Sevkiyat sırasında Maliye yol denetim ekipleri veya trafik polisleri tarafından araç durdurulduğunda denetim şu şekilde işler:

```
[Maliye/Polis Denetimi]
        │
        ▼
[Şoför Belgeyi Gösterir] ──► Kağıt Çıktı VEYA Akıllı Telefon/Tablet Ekranındaki Karekod
        │
        ▼
[Tablet ile Karekod Taranır]
        │
        ▼
[GİB e-Belge Sorgulama Sistemi]
   ├─► Belge GİB sisteminde mevcut mu? (Evet/Hayır)
   ├─► Sevk saati ile denetim saati uyumlu mu?
   ├─► Araç plakası irsaliye ile eşleşiyor mu?
   └─► Kasadaki fiziksel mal ile irsaliye miktarı tutarlı mı?
```

### Şoförün Yanında Kağıt Çıktı Bulunması Zorunlu mu?
* **HAYIR.** e-İrsaliyenin karekodunu içeren görüntünün akıllı telefon, tablet veya araç takip ekranından denetim görevlisine gösterilmesi mevzuat açısından tamamen geçerlidir.
* Ancak sahadaki olası şarj bitmesi, internet çekmemesi veya ekran kırılması risklerine karşı firmaların şoföre **1 nüsha karekodlu kağıt çıktı** vermesi en güvenli uygulama pratiğidir.

---

## 🚛 e-İrsaliyede Bulunması Zorunlu Alanlar

1. **Taşıyıcı Bilgileri:** Sevkiyatı kargo veya ambar yapıyorsa taşıyıcı firmanın VKN'si ve unvanı.
2. **Özmal Sevkiyat:** Şirket malı kendi aracıyla taşıyorsa araç çekici/dorse plaka numarası ve şoförün TCKN bilgisi.
3. **Mal Tanımı:** Taşınan ürünlerin cinsi, ambalaj tipi, adedi, kilogramı veya litresi.
4. **Teslimat Adresi:** Malın indirileceği tam açık adres ve varsa depo kodu.

---

## 🔌 Sistem Arızasında Matbu İrsaliye Kullanımı

İnternet kesintisi, GİB sistem bakım çalışması veya elektrik kesintisi nedeniyle e-İrsaliye düzenlenemiyorsa:
1. Araçta acil durumlar için bulundurulan **matbu kağıt sevk irsaliyesi** elle düzenlenir.
2. İrsaliyenin üzerine belirgin harflerle *"Teknik imkânsızlıklar nedeniyle matbu düzenlenmiştir"* şerhi düşülür.
3. Sistem normale döndüğünde **en geç 48 saat içinde** aynı bilgilerle sistemden e-İrsaliye oluşturulup GİB'e iletilir ve üzerine matbu irsaliyenin seri ve sıra numarası yazılır.

---

## 📥 e-İrsaliye Yanıt Süreçleri (Kabul / Ret)

Alıcı mükellef malları teslim aldığında e-İrsaliyeye sistem üzerinden yanıt verebilir:
* **Kabul:** Tüm mallar eksiksiz teslim alınmıştır.
* **Kısmi Kabul:** Gelen malların bir kısmı hasarlı veya eksiktir (Örn: 100 adet sevk edildi, 85 adet kabul edildi, 15 adet hasarlı iade).
* **Ret:** Sevkiyat yanlış adrese gelmiştir veya ticari anlaşma dışıdır (Fiili sevk başlamadan önce verilmelidir).
* **Yasal Yanıt Süresi:** Malın tesliminden itibaren **7 gündür**. 7 gün içinde yanıt verilmezse irsaliye tam kabul edilmiş sayılır.

---

## 🔗 İlgili Resmi Bağlantılar
* [GİB e-İrsaliye Portalı ve Duyurular](https://ebelge.gib.gov.tr)
* [e-İrsaliye Teknik Uygulama Kılavuzu](https://ebelge.gib.gov.tr/kilavuzlar.html)
