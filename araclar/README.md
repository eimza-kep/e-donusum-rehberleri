# E-Dönüşüm Tıkla-Çalıştır Yardımcı Araçları 🛠️⚡

Bu klasörde yer alan araçlar, herhangi bir komut satırı, terminal veya kodlama bilgisine ihtiyaç duymadan, Windows üzerinde doğrudan **çift tıklanarak** çalıştırılmak üzere hazırlanmıştır.

Tüm araçlar **%100 çevrimdışı (offline)** çalışır, hiçbir kişisel veriyi veya mali kaydı internete göndermez ve üçüncü taraf sunucularla iletişim kurmaz.

---

## 🧰 5 Temel Araç ve İşlevleri

| No | Araç Dosyası | Başlatıcı (.bat) | Ne İşe Yarar? |
| :---: | :--- | :--- | :--- |
| **01** | `01-eimza-tani.ps1` | **`01-eimza-hizli-tani.bat`** | E-İmza & USB Akıllı Kart algılama, SCardSvr servisi onarma ve AKİS/Java denetimi. |
| **02** | `02-sertifika-sayar.ps1` | **`02-sertifika-kalan-gun-sayar.bat`** | Mali Mühür ve E-İmza geçerlilik bitiş tarihini ve **kalan gün sayısını** hesaplar, 30 günden az kaldıysa kırmızı alarm verir. |
| **03** | `03-uyap-temizle.ps1` | **`03-uyap-java-onbellek-temizle.bat`** | UYAP Portal ve UYAP Doküman Editörü kilitlenmelerini çözer; Java Deployment ve SSL önbelleğini sıfırlar. |
| **04** | `04-e-fatura-xml-goruntuleyici.html` | **`04-e-fatura-goruntuleyici-baslat.bat`** | Gelen ham UBL-TR e-Fatura / e-Arşiv / e-SMM XML dosyalarını sürükle-bırak ile şık faturaya dönüştürür; KDV ve toplamları hesaplar, tek tıkla PDF/Yazdır çıktısı verir. |
| **05** | `05-edefter-kontrolcu.ps1` / `.py` | **`05-edefter-balans-kontrolcu.bat`** | e-Defter beratını GİB'e yüklemeden önce borç-alacak kuruş dengesini (balans) ve UTF-8 şema uyumunu denetler; berat reddini önler. |

---

## 🚀 Kullanım Rehberi

### 1. `01-eimza-hizli-tani.bat`
* **Kullanım:** Çift tıklayın.
* E-imzanız takılı olduğu halde bilgisayar kartı görmüyorsa, Windows Akıllı Kart servisini (`SCardSvr`) otomatik başlatır ve takılı kart okuyucuları listeler.

### 2. `02-sertifika-kalan-gun-sayar.bat`
* **Kullanım:** Çift tıklayın.
* Windows Sertifika Deposu'nu tarar. TÜBİTAK Kamu SM, E-Tuğra, E-Güven vb. sertifikalarınızın kalan gün sayısını yeşil/sarı/kırmızı gösterir.

### 3. `03-uyap-java-onbellek-temizle.bat`
* **Kullanım:** Çift tıklayın.
* UYAP'a giriş yaparken beyaz ekranda kalma veya eski sertifika hatası aldığınızda tek tıkla Java önbelleğini ve akıllı kart oturumlarını temizler.

### 4. `04-e-fatura-goruntuleyici-baslat.bat`
* **Kullanım:** Çift tıklayın (veya doğrudan `.html` dosyasını tarayıcınızda açın).
* Açılan ekranda XML faturanızı pencereye sürükleyip bırakın. Fatura anında resmi şablonuyla ekrana gelir.

### 5. `05-edefter-balans-kontrolcu.bat`
* **Kullanım:** 
  1. e-Defter XML dosyanızı doğrudan bu `.bat` dosyasının üzerine sürükleyip bırakabilirsiniz.
  2. Veya dosyaya çift tıklayıp dosya yolunu pencereye sürükleyebilirsiniz.
  3. Test amaçlı denemek için ekranda `ornek` yazıp Enter'a basabilirsiniz.

---

## 🔒 Güvenlik & Gizlilik İlkeleri
* **Sıfır İletişim:** Hiçbir araç sunucuya veya dış ağa veri göndermez.
* **Açık Kaynak:** Tüm kodlar düz metin olarak incelenebilir (.bat, .ps1, .py, .html).
* **Lisans:** MIT Lisansı.
