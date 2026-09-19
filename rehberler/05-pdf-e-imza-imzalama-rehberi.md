# PDF Dokümanlara Ücretsiz ve Güvenli E-İmza Atma Rehberi 📜🔏

> **Kategori:** E-İmza (Elektronik İmza)  
> **Hedef Kitle:** Şirket Çalışanları, Avukatlar, Muhasebeciler, Bireysel Kullanıcılar  
> **Tahmini Okuma Süresi:** 5 dakika  
> **Son Güncelleme:** 2026

---

## 📌 Islak İmza Görseli ile Dijital İmza Arasındaki Fark

Pek çok kullanıcı PDF üzerine elle atılmış bir imza fotoğrafı yapıştırmayı "e-imza" zannetmektedir. **Bu tamamen yanlıştır ve yasal geçerliliği yoktur!**

* **Görsel İmza (Kaşe/Resim):** Bir grafik nesnesidir; herkes tarafından kopyalanabilir, tahrifata açıktır, inkar edilebilir.
* **Elektronik İmza (PAdES / ETSI TS 102 778):** Belgenin bayt özetini (Hash) alan, akıllı karttaki özel anahtar ile şifreleyen, zaman damgası ve X.509 sertifika zinciri içeren kriptografik bir mühürdür. Belgede tek bir harf veya nokta değişse dahi imza anında geçersiz olur.

---

## 🛠️ Yöntem 1: Adobe Acrobat Reader ile Ücretsiz İmzalama (En Yaygın)

Adobe Acrobat Reader DC ücretsiz sürümü Türk e-imzalarını doğrudan destekler:

1. PDF belgenizi **Adobe Acrobat Reader** ile açın.
2. Üst menüden **"Tüm Araçlar" > "Sertifika Kullan" (Certificates)** seçeneğine tıklayın.
3. Çıkan üst çubuktan **"Dijital Olarak İmzala" (Digitally Sign)** butonuna basın.
4. Fare imleci ile imzanızın görünmesini istediğiniz dikdörtgen bir alanı çizin.
5. Açılan pencerede takılı akıllı kartınızdaki **adınızı ve sertifikanızı** seçin.
6. **"İmzala"** butonuna basın, belgenin yeni imzalı kopyasını kaydedin ve kartınızın **6 haneli PIN kodunu** girin.

---

## ⚖️ Yöntem 2: UYAP Doküman Editörü ile İmzala & PDF'e Aktar

Adalet Bakanlığı'nın ücretsiz UYAP Editörü mükemmel bir milli imzalama aracıdır:

1. Metninizi UYAP Editör'de yazın veya Word/PDF'ten kopyalayın.
2. Üst menüden **"Araçlar" > "İmzala"** diyerek akıllı kartınız ile belgeyi imzalayın.
3. Belgeniz güvenli `.udf` formatına dönüşür.
4. İmzalı halini mahkemelere, icra dairelerine veya noterlere doğrudan sunabilirsiniz.

---

## 🐍 Yöntem 3: Python ile Otomasyon ve Toplu İmza Doğrulama

Kurumsal arşivinizdeki veya sözleşmelerinizdeki imzaların geçerliliğini denetlemek için açık kaynaklı Python aracımızı kullanabilirsiniz:

```bash
# Tek bir PDF dosyasının imzasını doğrula:
python verify_pdf_signature.py sozlesme_imzali.pdf

# JSON çıktısı al (Entegrasyon için):
python verify_pdf_signature.py sozlesme_imzali.pdf --json
```

Bu araç ETSI PAdES standartlarını, imzacının TCKN/adını, imza tarihini ve bayt aralığı (ByteRange) bütünlüğünü doğrular.

---

## 🛡️ İmzanın Doğruluğunu Nasıl Kontrol Edebilirsiniz?

İmzalanmış bir PDF dosyasını alıcı tarafın kontrol etmesi için resmi devlet portalları mevcuttur:
* 🏛️ **e-Devlet Belge Doğrulama:** [turkiye.gov.tr/belge-dogrulama](https://www.turkiye.gov.tr/belge-dogrulama)
* 🏛️ **TÜBİTAK Kamu SM E-İmza Doğrulama Portalı:** Sertifika zincirinin güvenilirliğini onaylar.
* **Adobe Acrobat İçi:** İmzanın üzerine tıklandığında "İmza Geçerlidir" (Signature is Valid) yeşil onay işareti görülmelidir.
