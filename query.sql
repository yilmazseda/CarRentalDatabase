
--1)MODEL YILI  2018'�N  �ZER�NDE OLMAYAN OTOMOB�LLER�N  MODEL YILI ,PLAKAS ,F�YAT ,MOTOR G�C� B�LG�LER�N� EKRANA GET�REN SORGU 
SELECT oto_id,model_yili,plaka,fiyat FROM Otomobil WHERE Otomobil.model_yili NOT IN ( SELECT DISTINCT Otomobil.model_yili FROM Otomobil WHERE model_yili>2018)

--2)OPS�YONEL �ZELL�K F�YATI EN Y�KSEK OLAN OTOMOB�L�N �ZELL�K ADI, F�YATI , MARKA ADI , MODEL ADI B�LG�LER�N� EKRANA GET�EN SORGU


SELECT  Opsiyonel�zellik.op_�zellik_ad� AS [OPS�YONEL �ZELL�K],Otomobil_OP_�zellik.fiyat AS Fiyat, marka_ad� AS [Marka ], model_ad� AS [Model ]  FROM Marka 
INNER JOIN Model ON Marka.marka_id = Model.markaID 
INNER JOIN Model_OP_�zellik ON Model_OP_�zellik.modelID=Model.model_id 
INNER JOIN Otomobil_OP_�zellik INNER JOIN Opsiyonel�zellik ON Otomobil_OP_�zellik.op_�zellikID=Opsiyonel�zellik.op_�zellik_id
ON Model_OP_�zellik.modelID=Otomobil_OP_�zellik.otoID WHERE Otomobil_OP_�zellik.fiyat IN (SELECT Max(fiyat) FROM Otomobil_OP_�zellik)


--3) MODEL YILI 2010'DAN YUKARU  , KM'S� 100000'DEN K���K VE MARKA ADI  BMW OLAN ARACIN KA� ADET OLDU�UNU BULAN SORGU

SELECT count(*) [KA� ADET] FROM Marka INNER JOIN Otomobil ON Marka.marka_id = Otomobil.markaID 
INNER JOIN �eki� ON Otomobil.�eki�ID=�eki�.�eki�_id WHERE (model_yili>2010 AND km<100000 AND �eki�_ad�='Arkadan �eki�' AND marka_ad�='bmw')


--4)HANG� MARKADAN KA� ADET K�RALANMI�
SELECT M.marka_ad� , COUNT(*) Miktar FROM Otomobil O INNER JOIN Kiralama  K ON O.oto_id=K.otoID INNER JOIN Marka M ON O.markaID=M.marka_id GROUP BY  M.marka_id,M.marka_ad� 


--5)HER M��TER�N�N K�RALADI�I ARA� ADET SAYISINI EKRANA GET�REN SORGU 
SELECT COUNT(*) Adet, M.m��teri_ad� FROM M��teri M
INNER JOIN Kiralama K ON K.m��teriID = M.m��teri_id
GROUP BY M.m��teri_ad�


--6)HER B�R MARKA ���N 2019 MODEL HEM HIZ SAB�TLEY�C�  HEM DE ANAHTARSIZ G�R�� �ZELL���NE SAH�P SEDAN KASA T�PL� K�RALIK ARA� SAYISI

SELECT COUNT(*)  FROM Marka INNER JOIN Model ON Marka.marka_id=Model.model_id 
INNER JOIN Otomobil ON Model.model_id=Otomobil.modelID 
INNER JOIN ModelKasa ON ModelKasa.modelID=Model.model_id
INNER JOIN Kasa ON Kasa.kasa_id=ModelKasa.KasaID
INNER JOIN Model_�zellik ON Model.model_id=Model_�zellik.modelID
INNER JOIN �zellik ON �zellik.�zellik_id=Model_�zellik.modelID
INNER JOIN Model_OP_�zellik ON Model_OP_�zellik.modelID=Model.model_id
INNER JOIN Opsiyonel�zellik on Opsiyonel�zellik.op_�zellik_id=Model_OP_�zellik.op_�zellikID
INNER JOIN Kiralama ON Kiralama.otoID =Otomobil.oto_id 
WHERE ( Otomobil.model_yili='2020' AND op_�zellik_ad�='Yak�t Depo Sens�r�' AND �zellik_ad�='Geri D�n�� Kameras�' AND kasa_ad�='Cabrio' )


--7)EN D���K F�YATLI AUD� MARKA OTOMOB�L�N  F�YATINDAN DAHA FAZLA F�YATA SAH�P ARA�LARIN MODEL YILINI VE F�YATINI EKRANA GET�REN SORGU 

-->Any komutu verilen de�erlerin herhangi birinden b�y�k olan (en k�����nden b�y�k) kay�tlar� listelemeyi sa�lar.

SELECT model_yili AS MODELYILI ,fiyat AS F�YAT ,marka_ad� AS [MARKA ADI] FROM Otomobil INNER JOIN Marka ON Otomobil.markaID=Marka.marka_id
WHERE fiyat<any (SELECT fiyat FROM Otomobil WHERE marka_ad�='Audi' )

--8)KAYITLI ��LEMLERDE BULUNAN EN Y�KSEK F�YATLI SERV�S ��LEM�NE SAH�P KAYITA A�T B�LG�LER� GET�REN SORGU 

SELECT  kay�tl�_i�lem_id,i�lem_ba�lang��_tarihsaat,i�lem_biti�_tarihsaat,i�lem_ad� AS ��lemAd�,fiyat  AS ��lemFiyat FROM Kay�tl���lem INNER JOIN Servis��lemi ON Servis��lemi.i�lem_id=Kay�tl���lem.i�lemID
WHERE fiyat=(SELECT  MAX(fiyat)  FROM Servis��lemi )

--9)'2020-04-14' TAR�H�NDE K�RALANAN �K�NC� EL ARA�LARIN GET�RD��� TOPLAM KAZAN� (DURUM 2 : 2.EL ARA�LAR)

select SUM(K.toplam_�cret) AS [Kiralanan 2.El Ara�tan Elde Edilen Toplam Kazan�]from Kiralama K WHERE (K.kiraland���_tarih='2020-04-14' and K.durum=2)


--10) BUG�N SATILAN OTOMOB�L�N OTOMOB�L ID ,MARKA ADI , MODEL ADI , MODEL YILI , F�YAT  B�LG�LER�N�  EKRANA GET�REN SORGU. 

SELECT oto_id,marka_ad�,model_ad�,model_yili,fiyat FROM Otomobil INNER JOIN Model ON Otomobil.modelID=Model.model_id INNER JOIN Marka ON Model.markaID=Marka.marka_id
WHERE CONVERT(DATE,sat�ld���_tarih) = CONVERT (date,getdate())

--11)En az 3 farkl� markadan araba kiralayan m��terilerin bilgileri
