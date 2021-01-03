------------------------------------------TRIGGER------------------------------------------

--Performansi kotu oldugu icin arac fiyati dusuruldugu zaman,
--bu satisi yapan personelin maasini belli oranda dusuren trigger
--Teslimat geç yapildiginda otomobilin fiyatinda %5lik indirim yapiliyor,
--bu gerçeklestiginde de satisi yapan personelin maasinda %5lik bir kesinti oluyor.

IF OBJECT_ID ('KESINTI') is not null
	DROP TRIGGER KESINTI
GO

CREATE TRIGGER KESINTI ON OTOMOBIL
AFTER UPDATE
AS
IF UPDATE(Fiyat)
	BEGIN
			UPDATE Personel SET Maas = Maas - Maas * 0.05
	WHERE PersonelID IN (SELECT O.PersonelID
	   
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
		PRINT 'Maas Bilgisi Guncellendi'
	END
GO
select *from personel --Update öncesi
select * from Otomobil --Update öncesi
GO
UPDATE Otomobil SET fiyat = fiyat - fiyat * 0.05
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
GO

--Run
select *from personel --Update sonrasi
select * from Otomobil--Update sonrasi