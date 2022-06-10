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

--CREATE PROCEDURE musteriekle 
--    @musteri_ad		varchar(64) ,
--    @musteri_soy 	varchar(64) 
--As
--	INSERT INTO tblmusteri
--    VALUES 	(@musteri_ad,@musteri_soy);

--exec musteriekle  'Oya','Korkmaz';


--CREATE PROCEDURE kategoriekle 
--    @kategoriad	varchar(64) 
--As
--	INSERT INTO tblkategori
--    VALUES 	(@kategoriad);

--exec kakategoriekle 'Ocak';



--CREATE PROCEDURE kategoriguncelle
--	@id int,
--    @kategoriad	varchar(64) 

--As
--	update tblkategori
--    set kategoriad=	@kategoriad
		
--	where kategoriid=@id;

--exec kategoriguncelle 5,'Telefon';


--CREATE PROCEDURE kategorisil
--	@id int 

--As
--	delete from tblkategori
--	where kategoriid=@id;

--exec kategorisil 5;


--CREATE PROCEDURE urunekle 
--    @urunad varchar(250),
--	@urunmarka varchar(250),
--	@urunkategori int,
--	@urunfiyat smallint,
--	@urunstok decimal
--As
--	INSERT INTO tblurun
--    VALUES 	(@urunad,@urunmarka,@urunkategori,@urunfiyat,@urunstok);

--exec urunekle 'Televizyon','Boþ',2,2500,10;


--CREATE PROCEDURE urunguncelle
--	@urunid int,
--	@urunad varchar(250),
--	@urunmarka varchar(250),
--	@urunkategori int,
--	@urunfiyat smallint,
--	@urunstok decimal

--As
--	update tblurun
--    set  urunad=@urunad,
--	urunmarka=@urunmarka,
--	urunkategori=@urunkategori,
--	urunfiyat=@urunfiyat,
--	urunstok=@urunstok
		
--	where urunid=@urunid;

--exec urunguncelle 5,'Telefn','apple',2,3500,12;


--CREATE PROCEDURE urunsil
--	@id int 

--As
--	delete from tblurun
--	where urunid=@id;

--exec urunsil 5;

--CREATE PROCEDURE satisyap 
--    @urun int,
--	@musteri int,
--	@personel int,
--	@fiyat decimal
	
--As
--	INSERT INTO tblurun
--    VALUES 	(@urun,@musteri,@personel,@fiyat);

--exec satisyap 1,2,2,2500;




