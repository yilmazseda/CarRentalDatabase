-------------------------------------TRANSACTION-----------------------------
--Musteri tablosuna yeni musteri eklendiginde,
--eklenen bu musteri id'si ile servis kaydi tablosuna yeni servis kaydi  ekleme islemini kontrol eden transaction
IF OBJECT_ID ('MüsteriKontrolSP') IS NOT NULL
	DROP PROCEDURE MüsteriKontrolSP
GO

CREATE PROCEDURE MüsteriKontrolSP
AS
BEGIN
BEGIN TRANSACTION 
BEGIN TRY 
--Musteri tablosuna yeni bir kayit eklendi
INSERT INTO Musteri (MusteriID,Musteri_Adi,Musteri_Soyad,Mail,Adres,Cinsiyet,Telefon_No,IlID,IlceID)
VALUES (16,'Semra','Yilmaz','semrayilmaz@gmail.com','sultaniye mahallesi no:5','Kadin','02156578959','34','8')
--Musteri tablosuna en son eklenen musteriidisini MusteriID degiskenine atayalim
DECLARE @MusteriID INT
SET @MusteriID = @@IDENTITY
--Servis kaydi tablosuna son eklenen musterinin id'si ile yeni kayit ekleyelim
INSERT INTO ServisKaydi (KayitID,Teslim_Km,Net_Toplam,Brut_Toplam,Indirim_Toplami,Teslim_Tarih,Getiris_Tarih,Alis_Km,OtoID,MusteriID)
VALUES(13,60000,6500,7000,0,'2020-10-12','2020-10-10',65000,1,@MusteriID)
--Eger tüm islemler basarili olursa commit ile onayla
COMMIT TRANSACTION
END TRY
--Eger islemlerden biri bile basarisiz olursa geri al(rollback)
BEGIN CATCH 
PRINT 'Musteri ekleme isleminiz basarisiz oldu!'
ROLLBACK TRANSACTION
END CATCH
END
GO
--Run
EXEC MüsteriKontrolSP
--Transaction calistirildiktan sonra kontrol edilmesi gereken tablolar
SELECT * FROM Musteri
SELECT * FROM ServisKaydi

