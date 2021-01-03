--1)Plakasý 34EA21 olan aracýn sipariþ_tarihi='2020-04-01' ve satýldýðý_tarih '2020-04-02' olan aracýn sipariþ_tarihi ve satýldýðý_tarih güncellenecek.

UPDATE Otomobil SET siparis_tarihi='2020-02-01', satýldýðý_tarih='2020-02-15' WHERE plaka='34EA21'

--2)plakasý=34EA51 olan otomobilin plakasý '08PL16' olarak güncellenecek.

UPDATE Otomobil SET plaka='08PL16' WHERE plaka='34EA51'


--3) Model Özellik tablosunda bulunan ve model adý 'Accent' , fiyatý 2500 olan aracýn fiyatý 2100 olarak güncellenecek.


UPDATE Model_Özellik SET  fiyat=2100 FROM Model M INNER JOIN Model_Özellik  MO ON M.model_id =MO.modelID WHERE M.model_adý='Accent'


--4)giriþ yýlý 2015 ve cinsiyeti kadýn olan personellerin adresini ' ' olarak yýlýný da 2018 olarak güncellenecek.
--eski adres:derin mahallesi derin sokak no:25

UPDATE Personel SET iþe_giriþ_yýlý=2018 , adres='Hekim mahallesi derin sokak no:17' where iþe_giriþ_yýlý='2015' AND cinsiyet='kadýn'



--5) Marka adý 'BMW' , opsiyonel özelliði 'Mat renk' olan aracýn Modelrenk tablosundaki  fiyatý 1000 tl azaltýldý

UPDATE Model_OP_Özellik SET fiyat=fiyat-1000 FROM Marka INNER JOIN Model ON Marka.marka_id = Model.markaID INNER JOIN Model_OP_Özellik ON Model.model_id = Model_OP_Özellik.modelID
INNER JOIN OpsiyonelÖzellik ON Model_OP_Özellik.op_özellikID=OpsiyonelÖzellik.op_özellik_id WHERE marka_adý='BMW' AND op_özellik_adý='Mat Renk '












