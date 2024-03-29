-- Script daha onceden calistirildi ise kalintilarini temizler
DROP DATABASE IF EXISTS kutuphanedb;
DROP TABLE IF EXISTS kutuphanedb.adresler, kutuphanedb.kutuphane, kutuphanedb.uyeler, kutuphanedb.kitaplar, kutuphanedb.yazarlar, kutuphanedb.kategoriler, kutuphanedb.emanet, kutuphanedb.kitap_kategori, kutuphanedb.kitap_yazar, kutuphanedb.kutuphane_kitap;
DROP USER IF EXISTS kgpy;


-- Database'i olusturur
CREATE DATABASE IF NOT EXISTS kutuphanedb;


-- Database icindeki tablolari olusturur
CREATE TABLE IF NOT EXISTS kutuphanedb.adresler (
	adres_no INT NOT NULL AUTO_INCREMENT,
	adres VARCHAR(100),
	PRIMARY KEY (adres_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kutuphane (
	kutuphane_no INT NOT NULL AUTO_INCREMENT,
	kutuphane_adi VARCHAR(100),
	adres_no INT,
	PRIMARY KEY (kutuphane_no),
	FOREIGN KEY (adres_no) REFERENCES kutuphanedb.adresler(adres_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.uyeler (
	uye_no INT NOT NULL AUTO_INCREMENT,
	uye_adi VARCHAR(25),
	uye_soyadi VARCHAR(25),
	uye_tel_no VARCHAR(13),
	uye_eposta VARCHAR(50),
	uye_sifre VARCHAR(20),
	adres_no INT,
	PRIMARY KEY (uye_no),
	FOREIGN KEY (adres_no) REFERENCES kutuphanedb.adresler(adres_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kitaplar (
	isbn_no VARCHAR(17),
	kitap_adi VARCHAR(40),
	yayin_evi VARCHAR(40),
	PRIMARY KEY (isbn_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.yazarlar (
	yazar_no INT NOT NULL AUTO_INCREMENT,
	yazar_adi VARCHAR(25),
	yazar_soyadi VARCHAR(25),
	PRIMARY KEY (yazar_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kategoriler (
	kategori_no INT NOT NULL AUTO_INCREMENT,
	kategori_ismi VARCHAR(30),
	PRIMARY KEY (kategori_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.emanet (
	emanet_no INT NOT NULL AUTO_INCREMENT,
	kutuphane_no INT,
	uye_no INT,
	isbn_no VARCHAR(17),
	alim_tarihi DATE,
	teslim_tarihi DATE,
	PRIMARY KEY (emanet_no),
	FOREIGN KEY (kutuphane_no) REFERENCES kutuphanedb.kutuphane(kutuphane_no),
	FOREIGN KEY (uye_no) REFERENCES kutuphanedb.uyeler(uye_no),
	FOREIGN KEY (isbn_no) REFERENCES kutuphanedb.kitaplar(isbn_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kitap_kategori (
	kitap_kategori_no INT NOT NULL AUTO_INCREMENT,
	isbn_no VARCHAR(17),
	kategori_no INT,
	PRIMARY KEY (kitap_kategori_no),
	FOREIGN KEY (isbn_no) REFERENCES kutuphanedb.kitaplar(isbn_no),
	FOREIGN KEY (kategori_no) REFERENCES kutuphanedb.kategoriler(kategori_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kitap_yazar (
	kitap_yazar_no INT NOT NULL AUTO_INCREMENT,
	isbn_no VARCHAR(17),
	yazar_no INT,
	PRIMARY KEY (kitap_yazar_no),
	FOREIGN KEY (isbn_no) REFERENCES kutuphanedb.kitaplar(isbn_no),
	FOREIGN KEY (yazar_no) REFERENCES kutuphanedb.yazarlar(yazar_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kutuphane_kitap (
	kutuphane_kitap_no INT NOT NULL AUTO_INCREMENT,
	kutuphane_no INT,
	isbn_no VARCHAR(17),
	adet INT,
	PRIMARY KEY (kutuphane_kitap_no),
	FOREIGN KEY (kutuphane_no) REFERENCES kutuphanedb.kutuphane(kutuphane_no),
	FOREIGN KEY (isbn_no) REFERENCES kutuphanedb.kitaplar(isbn_no)
);


-- Kullanici olusturup tum haklari ona verir
CREATE USER 'kgpy'@'%' IDENTIFIED WITH mysql_native_password BY 'sifresiz.Zor97';
GRANT ALL ON kutuphanedb.* TO 'kgpy'@'%';
