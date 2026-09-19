# Normal E-Posta ile KEP Adresine Mail Atılır mı? 🛑✉️

> **Kategori:** KEP (Kayıtlı Elektronik Posta)  
> **Hedef Kitle:** Bilgi İşlem Uzmanları, Ofis Çalışanları, Genel Kullanıcılar  
> **Tahmini Okuma Süresi:** 4 dakika  
> **Son Güncelleme:** 2026

---

## 📌 Kısa ve Net Cevap: HAYIR!

Standart bir **Gmail, Hotmail, Outlook veya şirketinizin kurumsal e-posta sunucusundan** bir KEP adresine (örneğin `firma@hs01.kep.tr`) doğrudan e-posta **GÖNDERİLEMEZ**; aynı şekilde bir KEP adresinden normal bir Gmail adresine de doğrudan ileti **ATILAMAZ.**

Eğer normal e-postanızdan bir KEP adresine mail atmayı denerseniz:
* Sunucunuzdan anında **"550 Mailbox not found"** veya **"Delivery Status Notification (Failure)"** geri dönüş hata mesajı alırsınız.

---

## 🔒 Neden Gönderilemez? (Teknik & Hukuki Gerekçeler)

### 1. Kapalı Devre Güvenlik Mimarisi
KEP ağı, genel açık internet üzerindeki standart SMTP protokolünden izole edilmiş **özel ve kapalı bir protokoldür.** KEP sunucuları yalnızca karşılıklı kimliği doğrulanmış diğer lisanslı KEP sunucularından (KEPHS) gelen şifreli paketleri kabul eder.

### 2. Kimlik Tespiti Şartı
Normal e-postada herkes dilediği isimle ücretsiz hesap açabilir (`ahmet.yilmaz.official@gmail.com`). Oysa KEP'te her bir hesap T.C. Kimlik Kartı veya Ticaret Sicil Gazetesi ile bizzat doğrulanmıştır. Sahte hesap açılması imkansızdır.

### 3. Delil Üretim Mekanizması
Normal e-posta sunucuları TÜBİTAK zaman damgalı "Okundu / Ulaştı" delil makbuzu üretemez. KEP sisteminin hukuki niteliğinin bozulmaması için dış dünyadan gelen kimliksiz iletiler güvenlik duvarında engellenir.

---

## 💡 KEP Adresine Nasıl Mesaj Gönderilir?

Bir şirketin veya resmi kurumun KEP adresine mesaj gönderebilmek için:
1. Sizin de yetkili bir operatörden (PTT KEP, TÜRKKEP, TN KEP vb.) alınmış **aktif bir KEP hesabınızın** olması şarttır.
2. Gönderi yaparken mesajı onaylamak için takılı bir **E-İmza (Elektronik İmza)** donanımına sahip olmanız gerekir.
3. KEP Webmail veya KEP Masaüstü istemcisi üzerinden oturum açarak iletinizi yollamalısınız.

---

## ❓ İstisna: Bazı KEP Operatörlerinin "Standart E-Posta Bildirim" Özelliği

Pek çok KEP operatörü, KEP kutunuza yeni bir resmi tebligat veya ileti geldiğinde bunu kaçırmamanız için kişisel Gmail veya şirket mailinize şu şekilde **bilgilendirme uyarısı** yollar:
> *"Sayın Müşterimiz, KEP kutunuza 1 adet yeni ileti gelmiştir. Okumak için lütfen webmail portalına giriş yapınız."*

Bu sadece bir bilgilendirme SMS/e-postasıdır; KEP iletisinin aslı ve eki asla normal e-posta kutunuza aktarılmaz.
