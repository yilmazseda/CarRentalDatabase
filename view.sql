----------------------------------------------VIEW-------------------------------

--Satılan araçların özellikleri,teslimat performansları ve müşterinin bilgilerini getiren view
IF OBJECT_ID ('DBO.SATISPERFORMANSI') is not  null
	DROP VIEW DBO.SATISPERFORMANSI
GO

CREATE VIEW DBO.SATISPERFORMANSI AS
SELECT TOP(100) O.OtoID,  O.Fiyat, O.Model_Yili, O.Km, O.Plaka, R.Renk_Adi, MA.Marka_Adi, MO.Model_Adi,
	  Fark, Teslim_Performans
FROM (SELECT *, CASE
    WHEN Fark < (SELECT Avg(Fark) as Ort
FROM(SELECT DATEDIFF(DAY, Siparis_Tarihi, Satildigi_Tarih) as Fark FROM Otomobil WHERE Satildigi_Tarih is not null) A)
 THEN 'IYI'
    WHEN Fark > (SELECT Avg(Fark) as Ort
FROM (SELECT DATEDIFF(DAY, Siparis_Tarihi, Satildigi_Tarih) as fark FROM Otomobil WHERE Satildigi_Tarih is not null) A)
 THEN 'KOTU'
	ELSE 'NORMAL'
	END AS Teslim_Performans
	from (SELECT *, DATEDIFF(DAY, Siparis_Tarihi, Satildigi_Tarih) as Fark FROM Otomobil WHERE Satildigi_Tarih is not null) A) O
	INNER JOIN Renk R ON R.RenkID = O.renkID
	INNER JOIN Marka MA ON O.MarkaID = MA.MarkaID
	INNER JOIN Model MO ON O.ModelID = MO.ModelID
	INNER JOIN Kasa K ON O.KasaID = K.KasaID
	INNER JOIN Cekis C ON O.CekisID = C.CekisID
	INNER JOIN Vites V ON O.VitesID = V.VitesID
	INNER JOIN Yakit Y ON O.YakitID = Y.YakitID
 ORDER BY Fark ASC
GO
--Run
SELECT  O.OtoID,  O.Fiyat, O.Model_Yili, O.Km, O.Plaka, R.Renk_Adi, MA.Marka_Adi, MO.Model_Adi,
	  Fark, Teslim_Performans, M.Musteri_Adi + ' '+ M.Musteri_Soyad AS Satılan_Kisi, M.Telefon_No AS Telefon
FROM DBO.SATISPERFORMANSI
INNER JOIN Otomobil O ON DBO.SATISPERFORMANSI.OtoID = O.OtoID
INNER JOIN Musteri M ON O.MusteriID = M.MusteriID
INNER JOIN Renk R ON R.RenkID = O.RenkID
INNER JOIN Marka MA ON O.MarkaID = MA.MarkaID
INNER JOIN Model MO ON O.ModelID = MO.ModelID
