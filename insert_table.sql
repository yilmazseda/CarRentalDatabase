
------------------------------�EK�� TABLOSU------------------------------------
SET IDENTITY_INSERT �eki� ON;
INSERT INTO �eki�(�eki�_id,�eki�_ad�) VALUES
(1,'�nden �eki�'),
(2,'Arkadan �eki�'),
(3,'D�rt �eker')
SET IDENTITY_INSERT �eki� Off;


-----------------V�TES TABLOSU-------------------
SET IDENTITY_INSERT Vites ON;
INSERT INTO Vites(vites_id,vites_ad�) VALUES
(1,'Manuel'),
(2,'Yar� Otomatik'),
(3,'Otomatik')
SET IDENTITY_INSERT Vites Off;


---------------YAKIT TABLOSU---------------
SET IDENTITY_INSERT Yak�t ON;
INSERT INTO Yak�t(yak�t_id,yak�t_ad�) VALUES
(1,'Benzin'),
(2,'Benzin&LPG'),
(3,'Dizel'),
(4,'Hybrid'),
(5,'Elektrik')
SET IDENTITY_INSERT Yak�t Off;


------------------------------KASA TABLOSU------------------------------------
SET IDENTITY_INSERT Kasa ON;
INSERT INTO Kasa(kasa_id,kasa_ad�) VALUES
(1,'Cabrio'),
(2,'Coupe'),
(3,'Hatchback 3 Kap�'),
(4,'Hatchback 5 Kap�'),
(5,'Sedan'),
(6,'Station Wagon'),
(7,'Crossover'),
(8,'Roadster')
SET IDENTITY_INSERT Kasa Off;


-------------------------�L TABLOSU-------------------
SET IDENTITY_INSERT �l ON;
INSERT INTO �l(il_id,il_ad�) VALUES
(01,'Adana'),
(22,'Edirne'), 
(34,'�stanbul'),
(41,'Kocaeli'),
(59,'Tekirda�'),
(77,'Yalova'),
(08,'Artvin'),
(35,'�zmir'),
(16,'Bursa'),
(07,'Antalya'),
(26,'Eski�ehir'),
(17,'�anakkale'),
(14,'Bolu'),
(81,'D�zce'),
(06,'Ankara')
SET IDENTITY_INSERT �l Off;


------------------------------�L�E TABLOSU------------------------------------
SET IDENTITY_INSERT �l�e ON;
INSERT INTO �l�e(il�e_id,il�e_ad�,ilID) VALUES
(1,'�ukurova',01),
(2,'Seyhan',01),
(3,'Uzunk�pr�',22),
(4,'Meri�',22),
(5,'�spala',22),
(6,'Be�ikta�',34),
(7,'Avc�lar',34),
(8,'Bak�rk�y',34),
(9,'Kad�k�y',34),
(10,'Dilovas�',41),
(11,'Kartepe',41),
(12,'�ay�rova',41),
(13,'Dar�ca',41),
(14,'Ergene',59),
(15,'Saray',59),
(16,'Alt�nova',77),
(17,'Armutlu',77),
(18,'��narc�k',77),
(19,'�iftlikk�y',77),
(20,'Arhavi',08),
(21,'Hopa',08),
(22,'Fo�a',35),
(23,'Bornova',35),
(24,'�e�me',35),
(25,'Dikili',35),
(26,'�znik',16),
(27,'Mudanya',16),
(28,'Alanya',07),
(29,'Ka�',07),
(30,'Odunpazar�',26),
(31,'Biga',17),
(32,'Bozcaada',17),
(33,'Gerede',14),
(34,'Ak�akoca',81),
(35,'G�lba��',06),
(36,'Mamak',06)
SET IDENTITY_INSERT �l�e Off;


------------------------------MARKA TABLOSU------------------------------------
SET IDENTITY_INSERT Marka ON;
INSERT INTO Marka(marka_id,marka_ad�) VALUES
(1,'Audi'),
(2,'BMW'),
(3,'Bugatti'),
(4,'Chevrolet'),
(5,'Ferrari'),
(6,'Fiat'),
(7,'Ford'),
(8,'Hyundai'),
(9,'Lamborghini'),
(10,'Renault'),
(11,'Mercedes-Benz'),
(12,'Mazda'),
(13,'Mitsubishi'),
(14,'Nissan'),
(15,'Porsche')
SET IDENTITY_INSERT Marka Off;


------------------RENK TABLOSU-------------------------------------------------
SET IDENTITY_INSERT Renk ON;
INSERT INTO Renk(renk_id,renk_ad�) VALUES
(1,'Siyah'),
(2,'Bej'),
(3,'K�rm�z�'),
(4,'Beyaz'),
(5,'Sar�'),
(6,'Lacivert'),
(7,'Mor'),
(8,'Kahverengi'),
(9,'G�m��'),
(10,'F�me'),
(11,'�ampanya'),
(12,'Bordo')
SET IDENTITY_INSERT Renk Off;


------------OPS�YONEL �ZELL�K TABLOSU-------------------------------

SET IDENTITY_INSERT Opsiyonel�zellik ON;
INSERT INTO Opsiyonel�zellik(op_�zellik_id,op_�zellik_ad�) VALUES
(1,'Acil Panik Butonu'),
(2,'�ocuk kilidi'),
(3,'S�r�c� Kimlik Bildirimi'),
(4,'S�cakl�k �l�me ve Kontrol Sistemi'),
(5,'Yak�t Depo Sens�r'),
(6,'Kap� Sens�r'),
(7,'Mikrofon Birimi'),--ara� i�ini dinlemek i�in 
(8,'Sunroof'),
(9,'Lastik Sens�r�'),
(10,'Panoramik Cam Tavan'),
(11,'Mat Renk'),
(12,'Anahtars�z Giri�')
SET IDENTITY_INSERT Opsiyonel�zellik OFF;


------------------------�ZELL�K TABLOSU ---------------------------
SET IDENTITY_INSERT �zellik ON;
INSERT INTO �zellik(�zellik_id,�zellik_ad�) VALUES
(1,'�erit Takip Sistemi'),
(2,'Led'),
(3,'Dijital G�sterge'),
(4,'Multimedya Ekran� '),
(5,'Geri G�r�� Kameras�'),
(6,'18 inch Jant'),
(7,'Hayalet G�sterge'), 
(8,'Airbag'),
(9,'H�z Sabitleyici')
SET IDENTITY_INSERT �zellik OFF;



------------------------------MODEL TABLOSU------------------------------------
SET IDENTITY_INSERT Model ON;
INSERT INTO Model(model_id,model_ad�,markaID) VALUES
(1,'A5',1),
(2,'8',1),
(3,'RS',1),
(4,'i8',2),
(5,'518i',2),
(6,'Chiron',3),
(7,'Camaro',4), 
(8,'Impala',4), 
(9,'812 Superfast',5), 
(10,'California',5), 
(11,'Uno',6),
(12,'Panda',6),
(13,'Fiesta',7),
(14,'Mustang',7),
(15,'IX20',8),
(16,'Accent',8),
(17,'Aventador',9),
(18,'Gallardo',9),
(19,'Fluence',10),
(20,'Talisman',10),
(21,'E350',11),
(22,'Maybach S 150',11),
(23,'RX8',12),
(24,'Lancer Evolution',13),
(25,'Nissan GT-R',14),
(26,'Panamera',15),
(27,'Taycan',15)
SET IDENTITY_INSERT Model Off;


-----------MODEL�EK�� TABLOSU--------------
SET IDENTITY_INSERT Model�eki� ON;
INSERT INTO Model�eki�(m�ID,modelID,�eki�ID) VALUES
(1,1,1), --model:A5 �eki�:�nden �eki�
(2,2,3),
(3,3,2),
(4,4,2),
(5,5,2),
(6,6,1),
(7,7,3),
(8,8,2),
(9,9,1),
(10,10,1),
(11,11,2),
(12,12,1),
(13,13,3),
(14,14,3),
(15,15,3),
(16,16,1),
(17,17,2),
(18,18,1),
(19,19,3),
(20,20,3),
(21,21,1),
(22,22,1),
(23,23,2),
(24,24,3),
(25,25,2),
(26,26,1),
(27,27,3)
SET IDENTITY_INSERT Model�eki� OFF;





------------------ModelKasa TABLOSU--------------------
SET IDENTITY_INSERT ModelKasa ON;
INSERT INTO ModelKasa(mkID,modelID,KasaID) VALUES
(1,1,1), 
(2,2,5), 
(3,3,4),
(4,4,2),
(5,5,5),
(6,6,2),
(7,7,6), 
(8,8,8),
(9,9,2),
(10,10,1),
(11,11,4),
(12,12,3),
(13,13,7),
(14,14,2),
(15,15,1),
(16,16,5),
(17,17,5),
(18,18,7),
(19,19,8),
(20,20,8),
(21,21,7),
(22,22,3),
(23,23,2),
(24,24,3),
(25,25,2),
(26,26,4),
(27,27,3),
(28,2,5),
(29,3,5),
(30,14,5),
(31,18,5)
SET IDENTITY_INSERT ModelKasa OFF;







-------------------MODEL RENK TABLOSU-----------------
SET IDENTITY_INSERT ModelRenk ON;
INSERT INTO ModelRenk(ID,modelID,renkID) VALUES
(1,1,2), 
(2,2,3), 
(3,3,5),
(4,4,12),
(5,5,7),
(6,6,9),
(7,7,1), 
(8,8,1),
(9,9,8),
(10,10,5),
(11,11,6),
(12,12,11),
(13,13,10),
(14,14,1),
(15,15,6),
(16,16,8),
(17,17,5),
(18,18,11),
(19,19,10),
(20,20,3),
(21,21,3),
(22,22,8),
(23,23,2),
(24,24,2),
(25,25,4),
(26,26,6),
(27,27,12)
SET IDENTITY_INSERT ModelRenk OFF;






----------------------------Model_Op_�zellik TABLOSU---------------------------
SET IDENTITY_INSERT Model_OP_�zellik ON;
INSERT INTO Model_OP_�zellik(ID,fiyat,modelID,op_�zellikID) VALUES
(1,1000,1,1), 
(2,4000,2,10), 
(3,1500,3,8),
(4,700,4,7),
(5,3200,5,11),
(6,1400,6,11),
(7,3000,7,9), 
(8,1800,8,3),
(9,950,9,4),
(10,750,10,5),
(11,650,11,6),
(12,670,12,6),
(13,880,13,1),
(14,900,14,2),
(15,2000,15,11),
(16,3200,16,3),
(17,4000,17,8),
(18,700,18,2),
(19,1400,19,9),
(20,4200,20,10),
(21,4300,21,4),
(22,2150,22,5),
(23,2150,23,7),
(24,950,24,3),
(25,3000,25,2),
(26,1800,26,5),
(27,700,27,11),
(28,700,2,12),
(29,600,3,12),
(30,1500,14,12),
(31,200,18,12)
SET IDENTITY_INSERT Model_OP_�zellik OFF;




-------------------MODEL_�ZELL�K TABLOSU---------------
SET IDENTITY_INSERT Model_�zellik ON;
INSERT INTO Model_�zellik(ID,fiyat,modelID,�zellikID) VALUES
(1,1000,1,1), 
(2,4000,2,9), 
(3,1500,3,9),
(4,700,4,3),
(5,3200,5,2),
(6,1400,6,2),
(7,3000,7,1), 
(8,1800,8,7),
(9,950,9,4),
(10,750,10,5),
(11,650,11,7),
(12,670,12,2),
(13,880,13,5),
(14,900,14,9),
(15,2000,15,8),
(16,3200,16,8),
(17,4000,17,1),
(18,700,18,9),
(19,1400,19,6),
(20,4200,20,3),
(21,4300,21,2),
(22,2150,22,5),
(23,2150,23,1),
(24,950,24,1),
(25,3000,25,5),
(26,1800,26,7),
(27,700,27,4)
SET IDENTITY_INSERT Model_�zellik OFF;




---------------------------MODELYAKIT TABLOSU--------------
SET IDENTITY_INSERT ModelYak�t ON;
INSERT INTO ModelYak�t(myID,modelID,yak�tID) VALUES
(1,1,2), 
(2,2,3), 
(3,3,1),
(4,4,4),
(5,5,2),
(6,6,3),
(7,7,1), 
(8,8,2),
(9,9,2),
(10,10,4),
(11,11,3),
(12,12,4),
(13,13,3),
(14,14,2),
(15,15,1),
(16,16,1),
(17,17,1),
(18,18,2),
(19,19,3),
(20,20,3),
(21,21,2),
(22,22,4),
(23,23,2),
(24,24,4),
(25,25,1),
(26,26,3),
(27,27,1)
SET IDENTITY_INSERT ModelYak�t OFF;





-------------------MODEL V�TES TABLOSU------------------
SET IDENTITY_INSERT ModelVites ON;
INSERT INTO ModelVites (mvID,modelID,vitesID) VALUES
(1,1,2), 
(2,2,3), 
(3,3,2),
(4,4,3),
(5,5,3),
(6,6,2),
(7,7,1), 
(8,8,1),
(9,9,2),
(10,10,1),
(11,11,1),
(12,12,3),
(13,13,3),
(14,14,1),
(15,15,2),
(16,16,1),
(17,17,3),
(18,18,2),
(19,19,3),
(20,20,1),
(21,21,2),
(22,22,2),
(23,23,1),
(24,24,3),
(25,25,2),
(26,26,3),
(27,27,1)
SET IDENTITY_INSERT ModelVites OFF;







---------------M��TER� TABLOSU---------------
SET IDENTITY_INSERT M��teri ON;
INSERT INTO M��teri (m��teri_id,m��teri_ad�,m��teri_soyad,mail,adres,cinsiyet,telefon_no,ilID,il�eID) VALUES
(1,'Kutay','G�ren','kutaygoren@gmail.com','Atakent Mahallesi No:13','Erkek','05557894455',34,8),
(2,'Seda','Y�lmaz','sedayilmaz@gmail.com','Dere Mahallesi No:2','Kad�n','05557816455',34,9),
(3,'Enes','Kaya','eneskaya@gmail.com','Dere Mahallesi No:3','Erkek','05347845121',41,11),
(4,'Erhan','Akdere','erhanakdere@gmail.com','�stiklal Mahallesi No:14','Erkek','05567894235',77,17),
(5,'Alm�la','Sultanta�','almilasultantas@gmail.com','Dere Mahallesi No:5','Kad�n','05551561231',26,30),
(6,'�eyma','Pehlivan','seymapehlivan@gmail.com','�stiklal Mahallesi No:3','Kad�n','05557818645',22,4),
(7,'Emre','�at','emrecat@gmail.com','Cumhuriyet Mahallesi No:9','Erkek','05585421266',06,36),
(8,'Ya�mur','�zden','yagmurozden@gmail.com','�nk�lap Mahallesi No:5','Kad�n','05558542136',17,31),
(9,'Mahmut','Tuncer','mahmuttuncer@gmail.com','�akmak Mahallesi No:2','Erkek','05557654321',81,34),
(10,'Esra','Erdim','esraerdim@gmail.com','�nk�lap Mahallesi No:4','Kad�n','05557552398',01,2),
(11,'Dilan','Durmaz','dilandurmaz@gmail.com','�aml�ca Mahallesi No:15','Kad�n','05551561861',08,21),
(12,'Yusuf','�neyler','yusufuneyler@gmail.com','Atat�rk Mahallesi No:11','Erkek','05456858316',16,27),
(13,'G�rkem','Altun','gorkemaltun@gmail.com','Atakent Mahallesi No:3','Erkek','05468513575',06,34),
(14,'Sezercan', 'Yaz�c�','sezercanyazici@gmail.com','Ko�uyolu Mahallesi No:21','Erkek','05468341867',17,32);
SET IDENTITY_INSERT M��teri OFF;




----------------OTOMOB�L TABLOSU--------------------
SET IDENTITY_INSERT Otomobil ON;
INSERT INTO Otomobil (oto_id,motor_g�c�,motor_hacmi,model_yili,km,fiyat,siparis_tarihi,sat�ld���_tarih,plaka,durum,renkID,markaID,modelID,m��teriID,kasaID,�eki�ID,vitesID,yak�tID) VALUES
(1,190,1968,2020,0,600000,'2020-03-10','2020-03-12','34KTY13',0,2,1,1,1,1,1,2,2),
(2,233,2967,2019,1600,600000,NULL,NULL,'34SD16',1,3,1,2,2,5,3,3,3),
(3,560,3993,2014,2250,1500000,NULL,NULL,'34EA51',1,5,1,3,3,4,2,2,1),
(4,362,1500,2016,3500,940000,NULL,NULL,'34EA21',1,12,2,4,3,2,2,3,4),
(5,113,1796,1991,298000,23500,'2020-04-03','2020-04-15','34FYB60',2,7,2,5,4,5,2,3,2),
(6,1500,7993,2018,0,18500000,'2019-11-09','2019-11-11','34GRN13',0,9,3,6,1,2,1,2,3),
(7,275,1998,2017,2550,825000,NULL,NULL,'34NGC85',1,1,4,7,14,6,3,1,1),
(8,250,3250,1968,91000,480000,'2020-01-25','2020-01-29','34RY54',2,1,4,8,10,8,2,1,2),
(9,800,6496,2018,4669,5750000,'2020-02-06','2020-02-10','34BVC52',2,8,5,9,8,2,1,2,2),
(10,550,3500,2015,3850,2750000,NULL,NULL,'34GSH91',1,5,5,10,3,1,1,1,4),
(11,71,1372,1995,343000,16250,'2019-12-09','2019-12-13','34NCF14',2,6,6,11,7,4,2,1,3),
(12,60,1200,2004,179000,38900,'2020-12-09','2020-12-12','34DGH38',2,11,6,12,12,3,1,3,4),
(13,110,1400,2017,7560,127000,NULL,NULL,'34NV76',1,10,7,13,14,7,3,3,3),
(14,317,2300,2016,7150,1500000,NULL,NULL,'34AB883',1,1,7,14,14,2,3,1,2),
(15,125,1591,2012,35800,98000,'2019-10-24','2019-10-30','34DJ546',2,6,8,15,5,1,3,2,1),
(16,136,1582,2018,8450,132500,NULL,NULL,'34SN7864',1,8,8,16,5,5,1,1,1),
(17,700,6498,2012,7140,38500000,'2019-07-09','2019-07-15','34SRT46',2,5,9,17,1,5,2,3,1),
(18,575,5500,2012,12800,2225000,'2019-08-19','2019-08-26','34VAB85',2,11,9,18,8,7,1,2,2),
(19,100,999,2020,9675,135000,NULL,NULL,'34HS54',1,10,10,19,13,8,3,3,3),
(20,160,1598,2018,11000,285000,NULL,NULL,'34OPS06',1,3,10,20,13,8,3,1,3),
(21,275,1900,2018,1925,1000000,NULL,NULL,'34NCF16',1,3,11,21,12,7,1,2,2),
(22,469,3982,2019,0,3650000,'2019-08-19','2019-08-24','34JKA41',0,8,11,22,9,3,1,2,4),
(23,231,1308,2011,95000,152000,'2020-04-06','2020-04-12','34YZA12',2,2,12,23,9,2,2,1,2),
(24,295,1997,2009,13010,325000,NULL,NULL,'34ER76',1,2,13,24,11,3,3,3,4),
(25,600,3799,2016,11500,1515000,'2020-01-24','2020-02-02','34BEN55',2,4,14,25,6,2,2,2,1),
(26,462,2894,2019,6910,2100000,NULL,NULL,'34FB77',1,6,15,26,10,4,1,3,3),
(27,680,0,2020,1550,1930000,NULL,NULL,'34PRS67',1,12,15,27,11,3,3,1,1),
(28,780,1750,2011,80000,65000,'2018-05-02','2018-06-02','41GHC128',0,5,2,4,7,5,2,2,1),
(29,900,4500,2011,20000,36000,'2017-11-11','2017-11-11','36CDV12',1,6,2,5,12,5,3,3,4),
(30,145,600,2016,65000,90000,'2017-11-11','2017-11-11','36FGH451',1,9,2,4,12,5,3,2,5),
(31,500,450,2017,10000,20000,'2019-08-19','2019-08-19','81�LK00',0,3,2,5,7,5,3,2,5),
(32,145,113,1991,1796,298000,'2020-04-03','2020-04-15','34YF060',2,7,6,11,4,5,1,2,5),
(33,462,364,2019,690,21000,NULL,NULL,'35��70',1,6,6,12,6,5,2,2,4),
(34,469,3982,2019,0,3650000,'2019-08-19','2019-08-24','01�NM33',0,8,7,13,3,5,3,1,3),
(35,469,3982,2019,0,3650000,'2019-08-19','2019-08-24','34JKLM41',0,8,7,14,11,5,3,2,1)
SET IDENTITY_INSERT Otomobil OFF;





-----------------K�RALAMA TABLOSU--------------------
SET IDENTITY_INSERT Kiralama ON;
INSERT INTO Kiralama (kiralama_id,al��_km,teslim_km,kullan�m_km,kiraland���_tarih,teslim_edilen_tarih,teslim_edilecek_tarih,durum,g�n,birim_fiyat,m��teriID,otoID) VALUES 
(1,1500,1600,100,'2020-02-03','2020-02-05','2020-02-05',1,2,400,2,2), --0:yeni ara� , 1:kiral�k , 2:ikinci el 
(2,0,2250,2250,'2020-02-13','2020-02-17','2020-02-17',1,4,500,3,15),
(3,3250,3500,250,'2017-03-23','2017-03-28','2017-03-28',1,5,500,3,11),
(4,2500,2550,50,'2013-01-05','2013-01-06','2013-01-06',1,1,280,5,6),
(5,3600,3850,250,'2015-04-14','2015-04-20','2015-04-20',1,6,550,3,10),
(6,7500,7560,60,'2020-02-03','2020-02-04','2020-02-04',1,1,300,14,10),
(7,6900,7150,250,'2017-01-12','2017-01-28','2017-01-13',1,16,260,14,10),
(8,8350,8450,100,'2016-06-07','2016-06-18','2016-06-17',1,11,310,14,2),
(9,0,1000,1000,'2019-11-11','2019-11-14','2019-11-14',1,3,250,13,2),
(10,10550,11000,450,'2019-04-01','2019-04-17','2019-04-21',1,16,200,13,27),
(11,1750,1925,175,'2020-01-10','2020-01-25','2020-01-17',1,15,225,12,21),
(12,12760,13010,250,'2020-03-16','2020-03-20','2020-03-20',1,4,250,10,11),
(13,5000,5780,780,'2020-02-07','2020-02-24','2020-02-08',1,17,210,7,14),
(14,0,4300,4300,'2018-08-25','2019-09-25','2020-08-27',1,30,210,9,12),
(15,6850,6910,60,'2018-10-01','2018-10-26','2018-10-10',1,25,210,6,5),
(16,2000,2000,100,'2019-02-03','2019-02-05','2019-02-05',1,2,400,6,33), 
(17,2000,2000,100,'2017-02-03','2017-02-05','2017-02-05',1,2,500,3,34),
(18,2000,2000,100,'2018-02-03','2018-02-05','2018-02-05',1,2,600,11,35),
(19,3600,3850,250,'2020-04-14','2020-04-20','2020-04-20',2,6,550,6,31),
(20,12760,13010,250,'2020-04-14','2020-03-20','2020-03-20',2,4,250,8,30),
(21,8350,8450,100,'2020-04-14','2020-06-18','2020-06-17',2,1,310,11,29),
(22,0,1000,1000,'2020-04-14','2020-06-18','2020-06-17',0,3,250,13,2),
(23,6900,7150,250,'2020-04-14','2020-03-20','2020-03-20',0,16,260,14,10)
SET IDENTITY_INSERT Kiralama OFF;















----------------------SERV�S ��LEM� TABLOSU-----------------
SET IDENTITY_INSERT Servis��lemi ON;
INSERT INTO Servis��lemi(i�lem_id,i�lem_ad�,fiyat) VALUES
(1,'Periyodik Bak�m',2000),
(2,'Lastik De�i�imi',2000), 
(3,'Ya� De�i�imi',250),
(4,'Fren Balatas� De�i�imi',300),
(5,'Far Ampul� De�i�imi',150),
(6,'Genel Kontrol',200)
SET IDENTITY_INSERT Servis��lemi OFF;





-----------------SERV�S KAYDI TABLOSU-----------------
SET IDENTITY_INSERT ServisKayd� ON;
INSERT INTO ServisKayd�(kay�t_id,teslim_km,net_toplam,br�t_toplam,indirim_toplam�,teslim_tarih,getiri�_tarih,al��_km,otoID,m��teriID) VALUES 
(1,0,2000,2500,0,'2020-03-12','2020-03-12',0,1,1),                     --teslim_tarihi : m��teriye teslim edilen tarih
(2,1500,3000,2000,150,'2019-05-19','2019-05-12',1000,24,2),  
(3,7000,7000,7050,400,'2019-02-02 ','2019-01-01',4500,27,3),
(4,2100,3000,3500,500,' 2020-08-27','2020-08-25',1500,15,4),
(5,1350,1700,2000,100,'2020-08-27',' 2020-08-25',1000,11,5),
(6,3450,7540,7500,0,'2020-08-27 ','2020-08-25',3450,9,7),
(7,4000,3000,2500,700,'2015-12-12','2015-12-01',3000,8,14),
(8,0,3500,3500,0,'2017-06-20','2017-06-05',0,6,11),
(9,0,2500,2500,210,'2019-04-01','2019-04-01',1250,21,12),
(10,1000,1400,1700,340,'2019-04-01','2019-04-01',950,10,10),
(11,1000,1000,1250,0,'2018-03-12','2018-03-12',0,2,9),
(12,0,500,500,0,'2018-07-11','2018-07-01',0,5,7)
SET IDENTITY_INSERT ServisKayd� OFF;





-----------------KAYITLI��LEM TABLOSU----------------- 
--Kay�t ��lem--
SET IDENTITY_INSERT Kay�tl���lem ON;
INSERT INTO Kay�tl���lem(kay�tl�_i�lem_id,birim_fiyat,miktar,net_tutar,br�t_tutar,indirim_oran�,i�lem_ba�lang��_tarihsaat,i�lem_biti�_tarihsaat,i�lemID,kay�tID) VALUES
(1,200,1,1500,1600,0,'2020-03-12 12:00:00','2020-03-12 13:00:00' ,6,1),
(2,100,1,2000,2300,80,'2019-05-12 15:00:00','2019-05-18 17:00:00',3,2),
(3,50,2,1000,1200,80,'2019-01-01 10:00:00 ','2019-01-01 11:00:00 ',5,3),
(4,300,2,4000,4000,0,' 2020-08-27 09:00:00',' 2020-08-27 14:00:00',6,4),
(5,120,1,500,500,0,'2020-08-27 09:00:00','2020-08-27 14:00:00',2,5),
(6,120,1,500,500,0,'2020-08-24 08:00:00','2020-08-25 09:00:00',1,6),
(7,420,1,2800,3000,100,'2019-01-01 10:00:00 ','2019-01-04 11:00:00 ',2,7),
(8,200,1,1600,1600,0,'2020-03-12 11:00:00','2020-03-12 11:30:00',4,8 ),
(9,500,1,1600,1600,0,'2019-04-01 08:00:00','2019-04-01 10:00:00',1,9),
(10,50,2,1000,1200,80,'2019-04-01 17:00:00','2019-04-02 08:00:00',3,10),
(11,420,1,2800,3000,100,'2018-03-12 18:00:00','2018-03-13 09:00:00',6,11),
(12,500,1,1600,1600,0,'2018-07-02 13:00:00','2018-07-03 10:00:00 ',6,12)
SET IDENTITY_INSERT Kay�tl���lem OFF;


-------------------------------PERSONEL TABLOSU-----------------------INSERT ED�LECEK!!!!!!!!!!--- 
SET IDENTITY_INSERT Personel ON;
INSERT INTO Personel(personel_id,personel_ad,personel_soyad,mail,cinsiyet,i�e_giri�_y�l�,adres,ya�,kay�tID,ilID,il�eID) VALUES
(1,'Ahmet','Y�lmaz','ahmetyilmaz@gmail.com','Erkek',2019,'�aml�ca Mahallesi Ekrem sokak  No:21','24',1,34,9),
(2,'Mehmet','Y�lmaz','mehmetyilmaz@gmail.com','Erkek',2015,'Gezgin Mahallesi yenikent sokak No:21','30',2,41,13),
(3,'Ulus','�evik','uluscevik@gmail.com','Erkek',2018,'Atakent Mahallesi �avu� sokak No:14','27',3,77,16),
(4,'Ahmet','Yal�n','ahmetyalin@gmail.com','Erkek',2019,'G�zelce Mahallesi  durak sokak No:21','22',4,81,34),
(5,'Erol','T�rker','erolturker@gmail.com','Erkek',2017,'�aml�ca Mahallesi �aml�ca sokak No:22','32',5,06,35),
(6,'Metin','�sler','metinisler@gmail.com','Erkek',2016,'Atakent Mahallesi yaln�z sokak  No:19','25',6,06,36),
(7,'G�nd�z','K���k','g�nd�zkucuk@gmail.com','Erkek',2016,'Ko�uyolu Mahallesi  y�ld�z sokak No:11','44',7,41,11),
(8,'Aylin','Nazl�','aylinnazli@gmail.com','Kad�n',2019,'Ko�uyolu Mahallesi  mektep sokak No:3','26',8,22,4),
(9,'G�zde','K�se','gozdekose@gmail.com','Kad�n',2015,'Derin Mahallesi derin sokak  No:25','29',9,17,32),
(10,'Yal�n','T�rkmen','yalinturkmen@gmail.com','Erkek',2020,'�stiklal Mahallesi  �am sokak No:6','35',12,08,20)
SET IDENTITY_INSERT Personel OFF;



--------------Otomobil_OP_�zellik Tablosu---------------
SET IDENTITY_INSERT Otomobil_OP_�zellik ON;
INSERT INTO Otomobil_OP_�zellik(ID,fiyat,otoID,op_�zellikID) VALUES
(1,2000,5,2),
(2,1000,27,11), 
(3,500,2,5),
(4,700,4,7),
(5,150,3,6),
(6,2000,6,9),
(7,400,8,8),
(8,500,9,2),
(9,780,10,11),
(10,600,21,11),
(11,300,18,7),
(12,200,19,9)
SET IDENTITY_INSERT Otomobil_OP_�zellik OFF;

