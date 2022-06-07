create database odev4;
use odev4;

CREATE TABLE tblmusteri
(
	musteriid 	    int identity,	
    musteriad		varchar(64) 	not null,
    musterisoyad 	varchar(64) 	not null,
   
    
    primary key(musteriid)
);
CREATE TABLE tblkategori
(
	kategoriid			int identity,
	kategoriad	varchar(50),   
    
   primary key(kategoriid),
   
   
);
CREATE TABLE tblurun
(
	urunid			int identity,
    urunad 			varchar(250),
    urunmarka 		varchar(250),
	urunkategori 	int,
    urunfiyat		decimal(18,2),
    urunstok		smallint ,
    durum	   		bit,
    
	primary key(urunid),

	 foreign key(urunkategori) 	references tblkategori(kategoriid)
		on delete cascade on update cascade
);
CREATE TABLE tblpersonel
(
	personelid			int identity,
	personeladsoyad		varchar(50),   
    
   primary key(personelid),
   
   
);
CREATE TABLE tblsatiss
(
	satisid		int	identity,
	urun		int,	
	musteri		int, 
    personel	int,
	fiyat		decimal(18,2),			
    
	primary key(satisid),
   
	foreign key(musteri)	references tblmusteri(musteriid)
		on delete cascade on update cascade,
        
	foreign key(urun)	references tblurun(urunid)
		on delete cascade on update cascade  ,
		
	foreign key(personel)	references tblpersonel(personelid)
		on delete cascade on update cascade  
);

CREATE TABLE TBLADMIN
(
	ID			int identity,
	KULLANICI	varchar(50),
	SIFRE	varchar(50),
    
   primary key(ID), 
);


-- -------------------------------------------------------------------

CREATE PROCEDURE musteriekle 
	@musteri_id  	int ,
    @musteri_ad		varchar(64) ,
    @musteri_soy 	varchar(64) 
As
	INSERT INTO tblmusteri
    VALUES 	(@musteri_id,@musteri_ad,@musteri_soy);

exec musteriekle  identity,'Oya','Korkmaz';






CREATE PROCEDURE abc_MusteriEkle 
	@id  	varchar(64) ,
    @ad		varchar(64) ,
    @soy 	varchar(64) ,
    @tel 	varchar(25) ,
    @mail 	varchar(250),
    @adr 	varchar(250)

as
	INSERT INTO abc_musteriler
    VALUES 	(@id, @ad, @soy, @tel, @mail, @adr);


call abc_MusteriEkle('id1', 'ad', 'soyad', 'telefon', 'mail', 'adres');
select * from abc_musteriler;

DELIMITER $$
CREATE PROCEDURE abc_MusteriGuncelle (
	@id  	varchar(64) ,
    @ad		varchar(64) ,
    @soy 	varchar(64) ,
    @tel 	varchar(25) ,
    @mail 	varchar(250),
    @adr 	varchar(250)
)
BEGIN
	UPDATE abc_musteriler
    SET 
		musteri_ad		= @ad,
		musteri_soyad 	= @soy,
		musteri_tel 	= @tel,
		musteri_mail 	= @mail,
		musteri_adres 	= @adr
	WHERE 
    	musteri_id  	= @id;
END $$
DELIMITER ;

exec abc_MusteriGuncelle 'id1', 'ad1', 'soyad', 'telefon', 'mail', 'adres';
select * from abc_musteriler;

DELIMITER $$
CREATE PROCEDURE abc_MusteriSil (
	id  	varchar(64) 
)
BEGIN
	DELETE FROM abc_musteriler
	WHERE  	musteri_id  = id;
END $$
DELIMITER ;

call abc_MusteriSil('id1');
select * from abc_musteriler;

DELIMITER $$
CREATE PROCEDURE abc_MusteriBul (
	filtre  varchar(32) 
)
BEGIN
	SELECT * FROM abc_musteriler
    WHERE 
    	musteri_id  	LIKE  CONCAT('%',filtre,'%') OR
		musteri_ad		LIKE  CONCAT('%',filtre,'%') OR
		musteri_soyad 	LIKE  CONCAT('%',filtre,'%') OR
		musteri_tel 	LIKE  CONCAT('%',filtre,'%') OR
		musteri_mail 	LIKE  CONCAT('%',filtre,'%') OR
		musteri_adres 	LIKE  CONCAT('%',filtre,'%');
END $$
DELIMITER ;

call abc_MusteriBul('tele');
select * from abc_musteriler;

DELIMITER $$
CREATE PROCEDURE abc_MusteriSatislar(
	id			varchar(64)  
)
BEGIN
	SELECT * FROM abc_satislar
    WHERE musteri_id = id;
END $$
DELIMITER ;

-- -------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE abc_UrunlerHepsi ()
BEGIN
	SELECT * FROM abc_urunler;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE abc_UrunEkle (
	id			varchar(64)  ,
    ad 			varchar(250) ,
    kategori 	varchar(250) ,
	fiyat 		float		 ,
    stok		float 		 ,
    birim		varchar(16)  ,
    detay	   	varchar(250) 
)
BEGIN
	INSERT INTO abc_urunler
    VALUES 	(id, ad, kategori, fiyat, stok, birim, detay);
END $$
DELIMITER ;

call abc_UrunEkle('ur11', 'urun1', 'kat1', 123, 12, 'Adet', 'detay');
select * from abc_urunler;

DELIMITER $$
CREATE PROCEDURE abc_UrunGuncelle (
	id			varchar(64)  ,
    ad 			varchar(250) ,
    kategori 	varchar(250) ,
	fiyat 		float 	     ,
    stok		float 		 ,
    birim		varchar(16)  ,
    detay	   	varchar(250) 
)
BEGIN
	UPDATE abc_urunler
    SET 
		urun_ad 	  = ad,
		urun_kategori = kategori,
		urun_fiyat 	  = fiyat,
		urun_stok	  = stok,
		urun_birim	  = birim,
		urun_detay	  = detay
	WHERE 
    	urun_id  	  = id;
END $$
DELIMITER ;

call abc_UrunGuncelle('ur1', 'urun11', 'kat1', 123, 12, 'Adet', 'detay');
select * from abc_urunler;

DELIMITER $$
CREATE PROCEDURE abc_UrunStokGuncelle (
	id			varchar(64)  ,
    stok		float 		 
)
BEGIN
	UPDATE abc_urunler
    SET 
		urun_stok	  = stok
	WHERE 
    	urun_id  	  = id;
END $$
DELIMITER ;

call abc_UrunStokGuncelle('ur1', 13);
select * from abc_urunler;

DELIMITER $$
CREATE PROCEDURE abc_UrunSil (
	id			varchar(64)  
)
BEGIN
	DELETE FROM abc_urunler
	WHERE urun_id  = id;
END $$
DELIMITER ;

call abc_UrunSil('ur11');
select * from abc_urunler;

DELIMITER $$
CREATE PROCEDURE abc_UrunBul (
	filtre		varchar(32)
)
BEGIN
	SELECT * FROM abc_urunler
    WHERE 
    	urun_id  	  LIKE  CONCAT('%',filtre,'%') OR
		urun_ad 	  LIKE  CONCAT('%',filtre,'%') OR
		urun_kategori LIKE  CONCAT('%',filtre,'%') OR
		urun_fiyat 	  LIKE  CONCAT('%',filtre,'%') OR
		urun_stok	  LIKE  CONCAT('%',filtre,'%') OR
		urun_birim	  LIKE  CONCAT('%',filtre,'%') OR
		urun_detay	  LIKE  CONCAT('%',filtre,'%') ;
END $$
DELIMITER ;

call abc_UrunBul('ur1');
select * from abc_urunler;

DELIMITER $$
CREATE PROCEDURE abc_UrunSatislar(
	id			varchar(64)  
)
BEGIN
	SELECT * FROM abc_satislar
    WHERE urun_id = id;
END $$
DELIMITER ;

-- -----------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE abc_SatisEkle (
	sid		varchar(64) ,
	mid		varchar(64) ,
	uid		varchar(64) ,    
    tarih 	datetime 	,
	fiyat 	float 		
)
BEGIN
	INSERT INTO abc_satislar
    VALUES 	(sid, mid, uid, tarih, fiyat);
END $$
DELIMITER ;

call abc_SatisEkle('sat3', 'id1', 'ur1', '2009-10-10', 120);
select * from abc_satislar;

DELIMITER $$
CREATE PROCEDURE abc_SatisGuncelle (
	sid			varchar(64),
	mid			varchar(64),
    uid 		varchar(64),
    tarih 		datetime   ,
	fiyat 		float      
)
BEGIN
	UPDATE abc_satislar
    SET 
		musteri_id    = mid,
		urun_id 	  = uid,
		satis_tarih	  = tarih,
		satis_fiyat	  = fiyat
	WHERE 
		satis_id 	  = sid;
END $$
DELIMITER ;

call abc_SatisGuncelle('sat1', 'id1', 'ur1', '2009-10-11', 120);
select * from abc_satislar;

DELIMITER $$
CREATE PROCEDURE abc_SatisSil (
	id			varchar(64)  
)
BEGIN
	DELETE FROM abc_satislar
	WHERE satis_id  = id;
END $$
DELIMITER ;

call abc_SatisSil('sat1');
select * from abc_satislar;

DELIMITER $$
CREATE PROCEDURE abc_SatisDetay (
)
BEGIN
SELECT   
		s.satis_id,
        m.musteri_id,
        u.urun_id,
        CONCAT(musteri_ad,' ', musteri_soyad ) as `Müþteri Ad Soyad`,
        urun_ad as `Ürün`,
        urun_kategori as `Kategori`,
        urun_fiyat as `Birim Fiyat`,
        satis_fiyat as `Satýþ Fiyatý`,
		satis_tarih as `Satýþ Tarihi`
FROM  	abc_musteriler m inner join  abc_satislar s 
	on m.musteri_id = s.musteri_id 
		inner join abc_urunler u on s.urun_id = u.urun_id;
END $$
DELIMITER ;

-- ------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE abc_OdemeEkle (
	oid		varchar(64) ,
	mid		varchar(64) ,   
    tarih 	datetime 	,
	tutar 	float 		,
	tur		varchar(25) ,
    aciklama varchar(250)
)
BEGIN
	INSERT INTO abc_odemeler
    VALUES 	(oid, mid, tarih, tutar, tur, aciklama);
END $$
DELIMITER ;


call abc_OdemeEkle('oid1', 'id1', '2020-01-01', 150, 'Nakit', 'Ali Elden ödeme');
select * from abc_odemeler;

DELIMITER $$
CREATE PROCEDURE abc_OdemeDetay (
)
BEGIN
SELECT   
		o.odeme_id,
        m.musteri_id,
        CONCAT(musteri_ad,' ', musteri_soyad ) as `Müþteri Ad Soyad`,
        o.odeme_tarih as `Ödeme Tarihi`,
        o.odeme_tutar as `Ödeme Tutarý`,
        o.odeme_tur as `Ödeme Türü`,
        o.odeme_aciklama as `Açýklama`
		
FROM  	abc_musteriler m inner join  abc_odemeler o 
	on m.musteri_id = o.musteri_id;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE abc_OdemeGuncelle (
	oid		varchar(64) ,
	mid		varchar(64) ,   
    tarih 	datetime 	,
	tutar 	float 		,
	tur		varchar(25) ,
    aciklama varchar(250)
)
BEGIN
	UPDATE abc_odemeler
    SET
		musteri_id		= mid,
        odeme_tarih		= tarih,
        odeme_tutar		= tutar,
        odeme_tur		= tur,
        odeme_aciklama 	= aciklama
 	WHERE 
		odeme_id = oid; 
END $$
DELIMITER ;

call abc_OdemeGuncelle('oid1', 'id1', '2020-11-11', 150, 'Nakit', 'Ali Elden ödeme yaptý');
select * from abc_odemeler;

DELIMITER $$
CREATE PROCEDURE abc_OdemeSil (
	oid		varchar(64) 
)
BEGIN
	DELETE FROM abc_odemeler
    WHERE odeme_id = oid;
END $$
DELIMITER ;

call abc_OdemeSil('oid1');
select * from abc_odemeler;


-- -----------------------------

DELIMITER $$
CREATE PROCEDURE abc_MusteriBakiye(
	id		varchar(64)
)
BEGIN
	declare borc  float;
    declare odeme float;
    
	SELECT 	SUM(satis_fiyat) into borc  
    FROM 	abc_satislar 
    WHERE 	musteri_id = id;
    
    SELECT 	SUM(odeme_tutar) into odeme  
    FROM 	abc_odemeler 
    WHERE 	musteri_id = id;
    
    SELECT odeme - borc;
END $$
DELIMITER ;

call abc_MusteriBakiye('id1');
-- -----------------------------------------------

DELIMITER $$
CREATE PROCEDURE abc_SatislarToplam()
BEGIN
	SELECT 	SUM(satis_fiyat)  
    FROM 	abc_satislar ;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE abc_OdemelerToplam()
BEGIN
    SELECT 	SUM(odeme_tutar)  
    FROM 	abc_odemeler ;
END $$
DELIMITER ;

call abc_SatislarToplam();
call abc_OdemelerToplam();