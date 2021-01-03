----------------------------------------STORED PROCEDURE-----------------------------------------------------

--1)Musteri tablosuna yeni musteri bilgilerini ekleyen prosedur(Insert SP)
IF OBJECT_ID ('SP_MUSTERIEKLE') IS NOT NULL
	DROP PROCEDURE SP_MUSTERIEKLE
GO

CREATE PROCEDURE SP_MUSTERIEKLE( @musteri_adi VARCHAR(40), @musteri_soyad VARCHAR(40), @mail VARCHAR(50), @adres VARCHAR(50),
@cinsiyet VARCHAR(5), @telefon_no CHAR(11), @ilID INT, @ilceID INT)
AS
BEGIN
INSERT INTO Musteri VALUES( @musteri_adi, @musteri_soyad, @mail, @adres, @cinsiyet, @telefon_no, @ilID ,@ilceID)
END

SELECT * FROM Musteri
--Run
EXEC SP_MUSTERIEKLE 'Secanur','Kalfaoglu','secakalfa@gmail.com','Demirkapı Mahallesi No:14','Kadın','02125153620','34','5'
SELECT * FROM Musteri

GO
--2)Teslimat performansi kotu olan araclara belirledigimiz oranda indirim uyguluyor.(Update SP)
IF OBJECT_ID ('SP_FIYAT_INDIRIMI') is not  null
	DROP PROCEDURE SP_FIYAT_INDIRIMI
GO

CREATE PROCEDURE SP_FIYAT_INDIRIMI(@INDIRIM_TUTARI FLOAT)
AS
BEGIN

	SET NOCOUNT ON
	UPDATE Otomobil SET fiyat = fiyat - fiyat * @INDIRIM_TUTARI
	WHERE OtoID IN (SELECT O.OtoID
	   
FROM (SELECT *, CASE
    WHEN Fark < (SELECT Avg(Fark) as Ort
FROM (SELECT DATEDIFF(DAY, Siparis_Tarihi, Satildigi_Tarih) as Fark FROM Otomobil WHERE Satildigi_Tarih is not null) A)
 THEN 'IYI'
    WHEN Fark > (SELECT Avg(Fark) as Ort
FROM (SELECT DATEDIFF(DAY, Siparis_Tarihi, Satildigi_Tarih) as Fark FROM Otomobil WHERE Satildigi_Tarih is not null) A)
 THEN 'KOTU'
	ELSE 'NORMAL'
	END AS Performans
	FROM (SELECT *, DATEDIFF(DAY, Siparis_Tarihi, Satildigi_Tarih) as Fark FROM Otomobil WHERE Satildigi_Tarih is not null) A) O
	INNER JOIN Renk R ON R.RenkID = O.RenkID
	INNER JOIN Marka MA ON O.MarkaID = MA.MarkaID
	INNER JOIN Model MO ON O.ModelID = MO.ModelID
	INNER JOIN Kasa K ON O.KasaID = K.KasaID
	INNER JOIN Cekis C ON O.CekisID = C.CekisID
	INNER JOIN Vites V ON O.VitesID = V.VitesID
	INNER JOIN Yakit Y ON O.YakitID = Y.YakitID
	INNER JOIN Musteri M ON O.MusteriID = M.MusteriID

WHERE O.Satildigi_Tarih IS NOT NULL AND Performans = 'KOTU')
SET NOCOUNT OFF
END
GO
--Guncellemeden onceki fiyatlar
SELECT O.Fiyat
	   
FROM (SELECT *, CASE
    WHEN Fark < (SELECT Avg(Fark) as Ort
FROM (SELECT DATEDIFF(DAY, Siparis_Tarihi, Satildigi_Tarih) as Fark FROM Otomobil WHERE Satildigi_Tarih is not null) A)
 THEN 'IYI'
    WHEN Fark > (SELECT Avg(Fark) as Ort
FROM (SELECT DATEDIFF(DAY, Siparis_Tarihi, Satildigi_Tarih) as Fark FROM Otomobil WHERE Satildigi_Tarih is not null) A)
 THEN 'KOTU'
	ELSE 'NORMAL'
	END AS Performans
	FROM (SELECT *, DATEDIFF(DAY, Siparis_Tarihi, Satildigi_Tarih) as Fark FROM Otomobil WHERE Satildigi_Tarih is not null) A) O
	INNER JOIN Renk R ON R.RenkID= O.RenkID
	INNER JOIN Marka MA ON O.MarkaID = MA.MarkaID
	INNER JOIN Model MO ON O.ModelID = MO.ModelID
	INNER JOIN Kasa K ON O.KasaID = K.KasaID
	INNER JOIN Cekis C ON O.CekisID = C.CekisID
	INNER JOIN Vites V ON O.VitesID = V.VitesID
	INNER JOIN Yakit Y ON O.YakitID = Y.YakitID
	INNER JOIN Musteri M ON O.MusteriID = M.MusteriID

WHERE O.Satildigi_Tarih IS NOT NULL AND Performans = 'KOTU'

--Guncellemenin yapildigi kisim
EXEC SP_FIYAT_INDIRIMI '0.0867'

--Güncelleme yapildiktan sonraki fiyatlar
SELECT O.Fiyat AS Guncel_Fiyat
	   
FROM (SELECT *, CASE
    WHEN Fark < (SELECT Avg(Fark) as Ort
FROM (SELECT DATEDIFF(DAY, Siparis_Tarihi, Satildigi_Tarih) as Fark FROM Otomobil WHERE Satildigi_Tarih is not null) A)
 THEN 'IYI'
    WHEN Fark > (SELECT Avg(Fark) as Ort
FROM (SELECT DATEDIFF(DAY, Siparis_Tarihi, Satildigi_Tarih) as Fark FROM Otomobil WHERE Satildigi_Tarih is not null) A)
 THEN 'KOTU'
	ELSE 'NORMAL'
	END AS Performans
	FROM (SELECT *, DATEDIFF(DAY, Siparis_Tarihi, Satildigi_Tarih) as Fark FROM Otomobil WHERE Satildigi_Tarih is not null) A) O
	INNER JOIN Renk R ON R.RenkID = O.RenkID
	INNER JOIN Marka MA ON O.MarkaID = MA.MarkaID
	INNER JOIN Model MO ON O.ModelID = MO.ModelID
	INNER JOIN Kasa K ON O.KasaID = K.KasaID
	INNER JOIN Cekis C ON O.CekisID = C.CekisID
	INNER JOIN Vites V ON O.VitesID = V.VitesID
	INNER JOIN Yakit Y ON O.YakitID = Y.YakitID
	INNER JOIN Musteri M ON O.MusteriID = M.MusteriID

WHERE O.Satildigi_Tarih IS NOT NULL AND Performans = 'KOTU'
GO
--3)Verilen plakayi silen prosedur.(Delete SP)

IF OBJECT_ID ('SP_ARACSIL') is not  null
	DROP PROCEDURE SP_ARACSIL
GO

CREATE PROCEDURE SP_ARACSIL( @PLAKA VARCHAR(10) )
AS
DECLARE @ARATABLO TABLE (Plaka VARCHAR(10))
	INSERT INTO @ARATABLO
	SELECT O.Plaka
	FROM Otomobil O
	WHERE O.Plaka = @PLAKA
	SELECT * FROM @ARATABLO
	DELETE FROM Otomobil
	WHERE Plaka IN (SELECT ART.Plaka FROM @ARATABLO ART)
GO
--Silmeden önceki hali
SELECT* FROM Otomobil
--Silmek istenilen plaka
EXEC SP_ARACSIL '34GRN13'
--Plakayi sildikten sonraki hali
SELECT *FROM Otomobil
GO

--4) Yasi girilen personelin bilgilerini getiren prosedur.(Cursor Select Procedure)
IF OBJECT_ID ('PrintCustomers_Cursor') is not  null
	DROP PROCEDURE PrintCustomers_Cursor
GO

CREATE PROCEDURE PrintCustomers_Cursor (@YAS INT )
AS
BEGIN
      SET NOCOUNT ON;
      DECLARE @personel_id INT,
              @Personel_Ad VARCHAR(20),
			  @Personel_Soyad VARCHAR(20),
			  @Mail VARCHAR(20),
              @Ise_Giris_Yili VARCHAR(20)
      DECLARE PrintCustomers CURSOR READ_ONLY
      FOR
      SELECT PersonelID, Personel_Ad, Personel_Soyad, Mail, Ise_Giris_Yili
      FROM Personel where Yas=@YAS
      --OPEN CURSOR.
      OPEN PrintCustomers
      --FETCH THE RECORD INTO THE VARIABLES.
      FETCH NEXT FROM PrintCustomers INTO
      @personel_id, @Personel_Ad, @Personel_Soyad, @Mail, @Ise_Giris_Yili
      WHILE @@FETCH_STATUS = 0
      BEGIN
            PRINT 'PersonelID'  +CHAR(9)+ char(9)+CHAR(9) +'Personel Adi' + CHAR(9)+char(9)+CHAR(9) +'Personel Soyad'+CHAR(9)+char(9)+CHAR(9) +'Mail Adresi'+CHAR(9)+char(9)+CHAR(9) +'Ise Giris Yili'
            PRINT '**************************************************************************************************************'
             --PRINT CURRENT RECORD.
             PRINT CAST(@personel_id AS VARCHAR(10)) + char(9)+CHAR(9) + CHAR(9)+char(9)+char(9)+char(9) + @Personel_Ad +CHAR(9)+CHAR(9)+CHAR(9)+CHAR(9)+char(9)+ @Personel_Soyad +CHAR(9)+ CHAR(9)+ CHAR(9) + CHAR(9)+ @Mail +CHAR(9)+ CHAR(9)+ @Ise_Giris_Yili
    
             --FETCH THE NEXT RECORD INTO THE VARIABLES.
             FETCH NEXT FROM PrintCustomers INTO
             @personel_id, @Personel_Ad,@Personel_Soyad,@Mail, @Ise_Giris_Yili
      END
      --CLOSE THE CURSOR.
      CLOSE PrintCustomers
      DEALLOCATE PrintCustomers
END

EXEC PrintCustomers_Cursor 22
GO

--5)En az verilen parametre kadar farkli markadan araba kiralayan ve verilen cinsiyete gore musterilerin bilgilerini getirem prosedur.(Select SP)
IF OBJECT_ID ('SP_KIRALAMA') is not  null
	DROP PROCEDURE SP_KIRALAMA
GO

CREATE PROCEDURE SP_KIRALAMA(@KIRALAMA_SAYISI INT, @CINSIYET VARCHAR(5))
AS
BEGIN
	SET NOCOUNT ON
	SELECT DISTINCT MU.MusteriID,  MU.Musteri_Adi + ' ' + MU.Musteri_Soyad AS Isım_Soyisim, MU.Telefon_No, MU.Mail, MU.Adres, MU.IlceID, MU.IlID, MU.Cinsiyet
	FROM(SELECT COUNT(M.Marka_Adi) AS KK, M.Marka_Adi, M.MarkaID 
	FROM (SELECT COUNT(K.MusteriID) AS 'Toplam kiralama sayısı',K.MusteriID
	FROM Kiralama K
	GROUP BY K.MusteriID 
	HAVING COUNT(K.MusteriID)>=@KIRALAMA_SAYISI ) MS 
			  INNER JOIN Kiralama K ON MS.MusteriID =K.MusteriID 
			  INNER JOIN Otomobil O ON K.otoID=O.OtoID
			  INNER JOIN Marka M ON O.MarkaID=M.MarkaID 
	GROUP BY M.Marka_Adi,M.MarkaID
	HAVING COUNT(M.Marka_Adi) >=@KIRALAMA_SAYISI) B 
			  INNER JOIN Otomobil O ON B.MarkaID = O.MarkaID
			  INNER JOIN Musteri MU ON O.MusteriID = MU.MusteriID
	WHERE MU.Cinsiyet = @CINSIYET
	SET NOCOUNT OFF
END
GO
--Run
EXEC SP_KIRALAMA '3' , 'Kadin'