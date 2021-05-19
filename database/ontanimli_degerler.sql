USE kutuphanedb;

-- Kutuphaneler
INSERT INTO kutuphanedb.adresler (adres) VALUES ("Atatürk Cad. Kurtoğlu Mah. No:1 16360 Yıldırım/Bursa");
INSERT INTO kutuphanedb.kutuphane (kutuphane_adi, adres_no) VALUES ("Şehir Kütüphanesi", LAST_INSERT_ID());

INSERT INTO kutuphanedb.adresler (adres) VALUES ("Emniyet Cad. Mimarsinan Mh. No:2 Yıldırım/Bursa");
INSERT INTO kutuphanedb.kutuphane (kutuphane_adi, adres_no) VALUES ("Mimar Sinan Sosyal Yaşam Merkezi Kütüphanesi", LAST_INSERT_ID());

INSERT INTO kutuphanedb.adresler (adres) VALUES ("İbrahim Paşa Mah. Kız Okulu Cad. Osmangazi/Bursa");
INSERT INTO kutuphanedb.kutuphane (kutuphane_adi, adres_no) VALUES ("Şehbenderler Konağı Kütüphanesi", LAST_INSERT_ID());

-- Uyeler
INSERT INTO kutuphanedb.adresler (adres) VALUES ("Bir Mah. Birbir Cad. Osmangazi/Bursa");
INSERT INTO kutuphanedb.uyeler (uye_adi, uye_soyadi, uye_tel_no, uye_eposta, uye_sifre, adres_no) VALUES ("Ahmet", "Demir", "+905058559624", "ahmetdemir@email.com", "cokzorsifre", LAST_INSERT_ID());

INSERT INTO kutuphanedb.adresler (adres) VALUES ("İki Mah. İkiiki Cad. Yıldırım/Bursa");
INSERT INTO kutuphanedb.uyeler (uye_adi, uye_soyadi, uye_tel_no, uye_eposta, uye_sifre, adres_no) VALUES ("Mehmet", "Gümüş", "+905557889452", "mehmetgumus@email.com", "fantailekola", LAST_INSERT_ID());

-- Kitaplar
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("978-975-08-0001-X", "Kuyucaklı Yusuf", "Yapı Kredi Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("978-975-363-802-7", "Kürk Mantolu Madonna", "Yapı Kredi Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("878-955-373-802-2", "Deneme Kitap 1", "Bir Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("178-978-363-882-9", "Deneme Kitap 2", "İki Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("278-175-368-802-4", "Deneme Kitap 3", "Bir Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("978-975-363-808-5", "Deneme Kitap 4", "Üç Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("278-675-383-822-2", "Deneme Kitap 5", "Dört Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("478-673-363-872-1", "Deneme Kitap 6", "Dört Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("878-655-353-722-5", "Deneme Kitap 7", "Dört Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("778-685-343-872-3", "Deneme Kitap 8", "Dört Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("277-676-384-822-4", "Deneme Kitap 9", "Dört Yayınları");


-- Yazarlar
INSERT INTO kutuphanedb.yazarlar (yazar_adi, yazar_soyadi) VALUES ("Sabahattin", "Ali");
INSERT INTO kutuphanedb.yazarlar (yazar_adi, yazar_soyadi) VALUES ("Yazar", "Bir");
INSERT INTO kutuphanedb.yazarlar (yazar_adi, yazar_soyadi) VALUES ("Yazar", "İki");
INSERT INTO kutuphanedb.yazarlar (yazar_adi, yazar_soyadi) VALUES ("Yazar", "Üç");

-- Kategoriler
INSERT INTO kutuphanedb.kategoriler (kategori_ismi) VALUES ("Türk ve Dünya Klasikleri");
INSERT INTO kutuphanedb.kategoriler (kategori_ismi) VALUES ("Bilim Kurgu");
INSERT INTO kutuphanedb.kategoriler (kategori_ismi) VALUES ("Eğitim");


-- Emanet
INSERT INTO kutuphanedb.emanet (kutuphane_no, uye_no, isbn_no, alim_tarihi) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehir Kütüphanesi"), (SELECT uye_no FROM uyeler WHERE uye_adi = "Mehmet" AND uye_soyadi = "Gümüş"), "978-975-363-802-7", "2021-05-13");
UPDATE kutuphanedb.emanet SET teslim_tarihi = "2021-05-14" WHERE uye_no = (SELECT uye_no FROM uyeler WHERE uye_adi = "Mehmet" AND uye_soyadi = "Gümüş");

-- Kitap - kategori
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("978-975-08-0001-X", (SELECT kategori_no FROM kategoriler WHERE kategori_ismi = "Türk ve Dünya Klasikleri"));
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("978-975-363-802-7", (SELECT kategori_no FROM kategoriler WHERE kategori_ismi = "Türk ve Dünya Klasikleri"));

-- Kitap - yazar
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("978-975-08-0001-X", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "Sabahattin" AND yazar_soyadi = "Ali"));
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("978-975-363-802-7", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "Sabahattin" AND yazar_soyadi = "Ali"));

-- Kutuphane - kitap
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehir Kütüphanesi"), "978-975-08-0001-X", 10);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehir Kütüphanesi"), "978-975-363-802-7", 2);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Mimar Sinan Sosyal Yaşam Merkezi Kütüphanesi"), "978-975-08-0001-X", 30);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehir Kütüphanesi"), "878-955-373-802-2", 21);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Mimar Sinan Sosyal Yaşam Merkezi Kütüphanesi"), "178-978-363-882-9", 5);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehbenderler Konağı Kütüphanesi"), "278-175-368-802-4", 56);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Mimar Sinan Sosyal Yaşam Merkezi Kütüphanesi"), "978-975-363-808-5", 4);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehbenderler Konağı Kütüphanesi"), "278-675-383-822-2", 1);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehir Kütüphanesi"), "478-673-363-872-1", 8);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Mimar Sinan Sosyal Yaşam Merkezi Kütüphanesi"), "878-655-353-722-5", 155);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehbenderler Konağı Kütüphanesi"), "778-685-343-872-3", 2);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehir Kütüphanesi"), "277-676-384-822-4", 89);