--1)Plakas� 34EA21 olan arac�n sipari�_tarihi='2020-04-01' ve sat�ld���_tarih '2020-04-02' olan arac�n sipari�_tarihi ve sat�ld���_tarih g�ncellenecek.

UPDATE Otomobil SET siparis_tarihi='2020-02-01', sat�ld���_tarih='2020-02-15' WHERE plaka='34EA21'

--2)plakas�=34EA51 olan otomobilin plakas� '08PL16' olarak g�ncellenecek.

UPDATE Otomobil SET plaka='08PL16' WHERE plaka='34EA51'


--3) Model �zellik tablosunda bulunan ve model ad� 'Accent' , fiyat� 2500 olan arac�n fiyat� 2100 olarak g�ncellenecek.


UPDATE Model_�zellik SET  fiyat=2100 FROM Model M INNER JOIN Model_�zellik  MO ON M.model_id =MO.modelID WHERE M.model_ad�='Accent'


--4)giri� y�l� 2015 ve cinsiyeti kad�n olan personellerin adresini ' ' olarak y�l�n� da 2018 olarak g�ncellenecek.
--eski adres:derin mahallesi derin sokak no:25

UPDATE Personel SET i�e_giri�_y�l�=2018 , adres='Hekim mahallesi derin sokak no:17' where i�e_giri�_y�l�='2015' AND cinsiyet='kad�n'



--5) Marka ad� 'BMW' , opsiyonel �zelli�i 'Mat renk' olan arac�n Modelrenk tablosundaki  fiyat� 1000 tl azalt�ld�

UPDATE Model_OP_�zellik SET fiyat=fiyat-1000 FROM Marka INNER JOIN Model ON Marka.marka_id = Model.markaID INNER JOIN Model_OP_�zellik ON Model.model_id = Model_OP_�zellik.modelID
INNER JOIN Opsiyonel�zellik ON Model_OP_�zellik.op_�zellikID=Opsiyonel�zellik.op_�zellik_id WHERE marka_ad�='BMW' AND op_�zellik_ad�='Mat Renk '












