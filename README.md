# Veritabani Yonetim Sistemleri Proje Ödevi

Bu proje `BLM0224 Veritabanı Yönetim Sistemleri` dersi için hazırlanmıştır. Proje özetle: `Ubuntu 20.04  LTS` üzerinde `Apache Web Sunucusu` ile çalışan; `PHP`, `HTML`, `CSS`, `JavaScript` ve `MySQL` kullanılarak yapılmış bir kütüphane-otomasyonu sitesi olarak tanımlanabilir.

## Proje Grubu

* [Ali Cüneyt Çağlar](https://github.com/CuneytCaglar)
* [Ali Furkan Demir](https://github.com/AliFurkanDemir)
* [Ceyhun Şen](https://github.com/ceyhunsen)
* [Halil Karataş](https://github.com/hll-krts)
* [İbrahim Yahya Aydınlı](https://github.com/ibrahimyahyaaydinli)

## Kurulum

**Dikkat!**  
Kurulum için iki seçenek vardır: Tam kurulum ve kısmi kurulum. Tam kurulumda projenin çalışması için gerekli her şey yüklenir ve sisteminizde birkaç ayar değiştirilir. Kısmi kurulumda ise hiçbir gerekli paket yüklenmez, gerekli ayarlar yapılmaz. İki kurulum yönteminde de `MySQL` için kullanıcı, database ve tablolar ayarlarlanıp, web sitesinin dosyaları sunucu içinde olması gereken yere taşınacaktır. Eğer sisteminiz için `Apache web sunucusu`, `MySQL` ve `PHP` yüklenip, ayarlanmamışsa tam kurulum tavsiye edilir.  

Tam kurulum esnasında sisteminizde yapılacak değişiklikler:

* Gerekli paketler yüklenecektir.
* `Apache Web Sunucusu` için gerekli ayarlar yapılacaktır.
* `MySQL` varsayılan ayarlarıyla kurulacaktır.

Eğer sisteminiz yukarıdaki koşulları sağlıyorsa kısmi kurulum yapabilirsiniz.  

**Hangi kurulum seçeneğini seçmek istediğiniz kurulum esnasında sorulacaktır.**  

Kurulum:

```bash
sudo apt install -y git
git clone https://github.com/Kizlar-Grubu-Proje-Yapiyor/Veritabani-Yonetim-Sistemleri-Projesi.git
cd Veritabani-Yonetim-Sistemleri-Projesi/
sudo ./yukle.sh
```

## Lisans

[MIT License](LICENSE)
