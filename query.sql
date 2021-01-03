
--1)MODEL YILI  2018'ÝN  ÜZERÝNDE OLMAYAN OTOMOBÝLLERÝN  MODEL YILI ,PLAKAS ,FÝYAT ,MOTOR GÜCÜ BÝLGÝLERÝNÝ EKRANA GETÝREN SORGU 
SELECT oto_id,model_yili,plaka,fiyat FROM Otomobil WHERE Otomobil.model_yili NOT IN ( SELECT DISTINCT Otomobil.model_yili FROM Otomobil WHERE model_yili>2018)

--2)OPSÝYONEL ÖZELLÝK FÝYATI EN YÜKSEK OLAN OTOMOBÝLÝN ÖZELLÝK ADI, FÝYATI , MARKA ADI , MODEL ADI BÝLGÝLERÝNÝ EKRANA GETÝEN SORGU


SELECT  OpsiyonelÖzellik.op_özellik_adý AS [OPSÝYONEL ÖZELLÝK],Otomobil_OP_Özellik.fiyat AS Fiyat, marka_adý AS [Marka ], model_adý AS [Model ]  FROM Marka 
INNER JOIN Model ON Marka.marka_id = Model.markaID 
INNER JOIN Model_OP_Özellik ON Model_OP_Özellik.modelID=Model.model_id 
INNER JOIN Otomobil_OP_Özellik INNER JOIN OpsiyonelÖzellik ON Otomobil_OP_Özellik.op_özellikID=OpsiyonelÖzellik.op_özellik_id
ON Model_OP_Özellik.modelID=Otomobil_OP_Özellik.otoID WHERE Otomobil_OP_Özellik.fiyat IN (SELECT Max(fiyat) FROM Otomobil_OP_Özellik)


--3) MODEL YILI 2010'DAN YUKARU  , KM'SÝ 100000'DEN KÜÇÜK VE MARKA ADI  BMW OLAN ARACIN KAÇ ADET OLDUÐUNU BULAN SORGU

SELECT count(*) [KAÇ ADET] FROM Marka INNER JOIN Otomobil ON Marka.marka_id = Otomobil.markaID 
INNER JOIN Çekiþ ON Otomobil.çekiþID=Çekiþ.çekiþ_id WHERE (model_yili>2010 AND km<100000 AND çekiþ_adý='Arkadan Çekiþ' AND marka_adý='bmw')


--4)HANGÝ MARKADAN KAÇ ADET KÝRALANMIÞ
SELECT M.marka_adý , COUNT(*) Miktar FROM Otomobil O INNER JOIN Kiralama  K ON O.oto_id=K.otoID INNER JOIN Marka M ON O.markaID=M.marka_id GROUP BY  M.marka_id,M.marka_adý 


--5)HER MÜÞTERÝNÝN KÝRALADIÐI ARAÇ ADET SAYISINI EKRANA GETÝREN SORGU 
SELECT COUNT(*) Adet, M.müþteri_adý FROM Müþteri M
INNER JOIN Kiralama K ON K.müþteriID = M.müþteri_id
GROUP BY M.müþteri_adý


--6)HER BÝR MARKA ÝÇÝN 2019 MODEL HEM HIZ SABÝTLEYÝCÝ  HEM DE ANAHTARSIZ GÝRÝÞ ÖZELLÝÐÝNE SAHÝP SEDAN KASA TÝPLÝ KÝRALIK ARAÇ SAYISI

SELECT COUNT(*)  FROM Marka INNER JOIN Model ON Marka.marka_id=Model.model_id 
INNER JOIN Otomobil ON Model.model_id=Otomobil.modelID 
INNER JOIN ModelKasa ON ModelKasa.modelID=Model.model_id
INNER JOIN Kasa ON Kasa.kasa_id=ModelKasa.KasaID
INNER JOIN Model_Özellik ON Model.model_id=Model_Özellik.modelID
INNER JOIN Özellik ON Özellik.özellik_id=Model_Özellik.modelID
INNER JOIN Model_OP_Özellik ON Model_OP_Özellik.modelID=Model.model_id
INNER JOIN OpsiyonelÖzellik on OpsiyonelÖzellik.op_özellik_id=Model_OP_Özellik.op_özellikID
INNER JOIN Kiralama ON Kiralama.otoID =Otomobil.oto_id 
WHERE ( Otomobil.model_yili='2020' AND op_özellik_adý='Yakýt Depo Sensörü' AND özellik_adý='Geri Dönüþ Kamerasý' AND kasa_adý='Cabrio' )


--7)EN DÜÞÜK FÝYATLI AUDÝ MARKA OTOMOBÝLÝN  FÝYATINDAN DAHA FAZLA FÝYATA SAHÝP ARAÇLARIN MODEL YILINI VE FÝYATINI EKRANA GETÝREN SORGU 

-->Any komutu verilen deðerlerin herhangi birinden büyük olan (en küçüðünden büyük) kayýtlarý listelemeyi saðlar.

SELECT model_yili AS MODELYILI ,fiyat AS FÝYAT ,marka_adý AS [MARKA ADI] FROM Otomobil INNER JOIN Marka ON Otomobil.markaID=Marka.marka_id
WHERE fiyat<any (SELECT fiyat FROM Otomobil WHERE marka_adý='Audi' )

--8)KAYITLI ÝÞLEMLERDE BULUNAN EN YÜKSEK FÝYATLI SERVÝS ÝÞLEMÝNE SAHÝP KAYITA AÝT BÝLGÝLERÝ GETÝREN SORGU 

SELECT  kayýtlý_iþlem_id,iþlem_baþlangýç_tarihsaat,iþlem_bitiþ_tarihsaat,iþlem_adý AS ÝþlemAdý,fiyat  AS ÝþlemFiyat FROM KayýtlýÝþlem INNER JOIN ServisÝþlemi ON ServisÝþlemi.iþlem_id=KayýtlýÝþlem.iþlemID
WHERE fiyat=(SELECT  MAX(fiyat)  FROM ServisÝþlemi )

--9)'2020-04-14' TARÝHÝNDE KÝRALANAN ÝKÝNCÝ EL ARAÇLARIN GETÝRDÝÐÝ TOPLAM KAZANÇ (DURUM 2 : 2.EL ARAÇLAR)

select SUM(K.toplam_ücret) AS [Kiralanan 2.El Araçtan Elde Edilen Toplam Kazanç]from Kiralama K WHERE (K.kiralandýðý_tarih='2020-04-14' and K.durum=2)


--10) BUGÜN SATILAN OTOMOBÝLÝN OTOMOBÝL ID ,MARKA ADI , MODEL ADI , MODEL YILI , FÝYAT  BÝLGÝLERÝNÝ  EKRANA GETÝREN SORGU. 

SELECT oto_id,marka_adý,model_adý,model_yili,fiyat FROM Otomobil INNER JOIN Model ON Otomobil.modelID=Model.model_id INNER JOIN Marka ON Model.markaID=Marka.marka_id
WHERE CONVERT(DATE,satýldýðý_tarih) = CONVERT (date,getdate())

--11)En az 3 farklý markadan araba kiralayan müþterilerin bilgileri
