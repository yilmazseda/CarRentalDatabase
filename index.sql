
-----------------------------------INDEX----------------------------------------------------------

--oncelikle 3 adet tablo olusturuyoruz
If OBJECT_ID('IndeksOrnek1') IS NOT NULL 
	DROP TABLE IndeksOrnek1
Go
If OBJECT_ID('IndeksOrnek2') IS NOT NULL 
	DROP TABLE IndeksOrnek2
Go
If OBJECT_ID('IndeksOrnek3') IS NOT NULL 
	DROP TABLE IndeksOrnek3
Go
--1.tabloda  clustered index veya NonClustered Index bulunmamaktadir.Yani bu tablo heap tablodur.
Create Table IndeksOrnek1 (x INT,y varchar(50))
go
--2.tabloda farkli olarak x'i primary key tanimladik.Y sütunu da Clustured index olarak tanimlandi.
Create Table IndeksOrnek2 (x Int Primary Key,y varchar(50))
go
--3.tabloda x'i primary key tanimladik daha sonra y sutununa NonClustured index tanimladik.
Create Table IndeksOrnek3 (x Int Primary Key,y varchar(50))
go
--NonClustered Index tanimladigimiz y degiskenini bulmak daha az okumayla gerçeklesecek ve bununla beraber daha hizli sekilde ulasmis olacagiz.
Create Nonclustered Index IndeksOrnek3 on IndeksOrnek3 (y)
With(Pad_Index=on,FillFactor =90,Drop_Existing=Off) 

--Gecici tablo olusturduk ve otomobil isimlerini ekledik.
--Ilk sutun id oludgu icin otomatik olarak degerler alacak.Deger sutununa da marka isimleri eklenecek.
DECLARE @degerler TABLE(id INT IDENTITY(1,1),deger VARCHAR(20))
INSERT INTO @degerler VALUES ('BMW'),('AUDI'),('MERCEDES'),('VOLVO'),('VW'),('SEAT'),('HONDA'),('MAZDA'),('FIAT'),('SUBARU')

DECLARE @x INT=1,@y INT
DECLARE @deger VARCHAR(20)
--Indexin sagladigi performansi gorebilmek için kalabalik veri üzerinde calismamiz gerekiyor.
--Verilerimiz çok az olsaydi indexin sagladigi performansi olcemezdik.
--Bu yuzden bir dongu kurduk. x 100000'den kucuk oldugu surece dongumuz calisacak.
--Bu deger kadar da(100000) islem gerceklesip tabloya veri eklenecek.

WHILE @x<100000
BEGIN
	IF @x<50000 --x degeri 50000'den buyuk oldugu surece tum @deger degiskenine Ferrari markasi eklenecek.
		SET @deger='Ferrari' 
	ELSE
	   BEGIN
		SET @y=(CONVERT(int,ROUND(RAND()*10,0))%10)+1 --1.degerden 50000. degere kadar ise, random olarak uretilen id'ye(1ile 10 arasi) ait markalar @deger degiskenine eklenecek.
		SELECT @deger=@deger FROM @degerler WHERE id=@y
	   END --ilk 50 bin satir random olarak secilen marka isimlerini alirken geri kalan 50bin satirin tumu Ferrari markasi ile doldurulacak.
    --3 adet tablomuz var hepsi ayni degerleri tutacak.X sutunu sayisal degeri , y sutunu da  @deger degiskeninden gelen markalarin isimlerini tutacak.
	INSERT INTO IndeksOrnek1 VALUES (@x,@deger)
	INSERT INTO IndeksOrnek2 VALUES (@x,@deger)
	INSERT INTO IndeksOrnek3 VALUES (@x,@deger)
	SET @x+=1 --x degerini her seferinde 1 arttirarak dongu icerisinde kalmasini sagladik.
END
GO


--Hiç index bulunmayan(tablo1),sadece clustered index bulunduran(tablo2),hem nonclustered hem de clustered index bulunduran(tablo3) tablolalari test edecegiz.
--Test etme islemi için select kullaniyoruz
--Her tablo için select sorgusu yazildi.Kosul kisimlarini WHERE komutu ile birlikte verdik.

SET STATISTICS IO ON --ciktilarin bize gonderilmesi icin SET STATISTICS IO ON satirini ekledik.
--x'i 50000'den buyuk olanlar ferrari degerine sahipti.Ayni sekilde y'si ferrari degerine sahip olanlarin da x degeri 50000'den buyuktu.
--Yani iki kosulda ayni anlamda.Ikisi de ayni satir sayisinda veri getirecek.


Select * from IndeksOrnek1 where x>50000 
Select * from IndeksOrnek1 where y='ferrari'



SET STATISTICS IO ON 

Select * from IndeksOrnek2 where x>50000
Select * from IndeksOrnek2 where y='ferrari'

Select * from IndeksOrnek3 where x>50000
Select * from IndeksOrnek3 where y='ferrari'

--Bizim için önemli olan yer logical_read kismidir.Mantiksal okuma yapar.Yani illaki diske bakmasina gerek yok ram'den de okuma yapiyor olabilir.Onemli olan ne kadar okuma yaptigi
--IndexOrnek2 tablosunun x sutunu primary key idi ve clustered index vardi.IndexOrnek1 ise heap table idi.Primary key yoktu.
--IndexOrnek2'de Clustered index oldugu için okuma sayisi azaldi.Yani primary key ile performansi arrtirdik.
--y sutununda ise logical_read yeniden artti.Bu da primary key'in burada bir faydası olmadigini gosterir
--IndexOrnek de kullandigimiz nonclustered ile logical_reads yari yariya azaldi.
