# E-İmza PIN Bloke Oldu: Adım Adım PUK ile Kilit Çözme Rehberi 🔒🆘

> **Kategori:** E-İmza (Elektronik İmza)  
> **Hedef Kitle:** E-İmza & Mali Mühür Kullanıcıları, Muhasebeciler, Şirket Sahipleri  
> **Tahmini Okuma Süresi:** 4 dakika  
> **Son Güncelleme:** 2026

---

## ⚠️ Kritik Güvenlik Kuralı: Kartın Yanması Ne Demektir?

E-İmza ve Mali Mühür akıllı kart çipleri, donanımsal güvenlik standartları (Common Criteria EAL4+ / FIPS 140-2) ile korunur:

* **PIN Deneme Hakkı:** PIN kodunuzu **3 kez üst üste yanlış girerseniz** cihaz kendisini kilitler (**BLOKE**).
* **Kilidi Açma:** Kilit yalnızca sertifika üreticinizden alacağınız **PUK Kodu** ile açılabilir.
* **Kritik Tehlike:** PUK kodunu da 3 kez hatalı girerseniz kartın çipi geri dönülemez biçimde kalıcı olarak kilitlenir (**Kart Yanar**). Bu durumda kart çöp olur ve bedeli karşılığında sıfırdan yeni bir e-imza / mali mühür satın almak zorunda kalırsınız!

---

## 🏢 Sağlayıcılara Göre PUK Kodu Nasıl Alınır?

### 1. TÜBİTAK Kamu SM (Mali Mühür & Kamu E-İmzası)
1. İnternet tarayıcınızdan **[nesislemleri.kamusm.gov.tr](https://nesislemleri.kamusm.gov.tr/)** adresine gidin.
2. Menüden **"Kilit Çözme"** sekmesine tıklayın.
3. T.C. Kimlik Numaranızı ve başvuru sırasında belirlediğiniz **Güvenlik Sözcüğü**'nü girin.
4. Sistemde kayıtlı cep telefonunuza gelen SMS onay kodunu yazın.
5. Ekranda size özel **PUK Kodunuz** görüntülenecektir.

### 2. TÜRKTRUST
* **Online Portal:** [online.turktrust.com.tr](https://online.turktrust.com.tr/) adresine e-Devlet veya SMS şifresi ile giriş yaparak "PIN/PUK İşlemleri" menüsünden temin edebilirsiniz.
* **Çağrı Merkezi:** `0850 222 88 75` numaralı müşteri destek hattını arayarak güvenlik teyidi sonrası PUK sıfırlama linki talep edebilirsiniz.

### 3. E-Güven
* **Online İşlemler:** [e-guven.com](https://www.e-guven.com/) üzerindeki Online İşlem Merkezi'ne giriş yapın.
* **Destek Hattı:** `0850 222 48 83` nolu hattan kimlik doğrulaması yaparak yeni PUK edinebilirsiniz.

### 4. E-Tuğra
* [e-tugra.com.tr](https://www.e-tugra.com.tr/) sitesinden "Müşteri Girişi" yapın. Sertifika detaylarında "PUK Sorgulama" alanını kullanın.

---

## 🛠️ PUK Kodunu Aldıktan Sonra Kilit Nasıl Çözülür?

Elinde PUK kodu olan bir kullanıcı için adımlar:

1. **AKİS Kart İzleme Aracını** açın.
2. USB Token takılı iken sol menüden sertifikanızı seçin.
3. Üst araç çubuğundaki **"PIN İşlemleri" > "Kilit Çöz" (Unblock PIN)** seçeneğine tıklayın.
4. Karşınıza gelen kutucuğa üreticiden aldığınız **PUK Kodunu** girin.
5. Hemen altındaki yeni şifre alanlarına unutmayacağınız **6 haneli yeni bir PIN** yazın ve onaylayın.
6. "Kilit başarıyla çözüldü" mesajını gördüğünüzde e-imzanız anında kullanıma hazırdır!

---

## 🤖 Hızlı Çözüm: Açık Kaynak Kilit Çözme Asistanı

PowerShell üzerinden hızlıca sağlayıcı portallarını açmak ve AKİS kilit ekranına gitmek için:

```powershell
# GitHub üzerindeki hazır aracımızı çalıştırın:
irm https://raw.githubusercontent.com/eimza-kep/eimza-pin-bloke-asistani/main/Unlock-PinAssistant.ps1 | iex
```

---

## 💡 Gelecekte Bloke Olmayı Önlemek İçin İpuçları

1. **Varsayılan PIN:** Yeni alınan e-imzalarda fabrika çıkışı PIN genellikle `123456` veya `1234` değildir. İlk kullanımda sizden özel şifre istenir.
2. **Caps Lock Tuşu:** PIN girerken klavyenizde Caps Lock tuşunun açık olmadığından emin olun (bazı token yazılımları büyük/küçük harf ayrımı yapar).
3. **2 Hatalı Girişten Sonra Durun:** 2 kez yanlış girdiyseniz 3. denemeyi yapmayın. Kart kilitlenmeden önce üretici portalından şifrenizi hatırlamaya çalışın.
