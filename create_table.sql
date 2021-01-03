--CREATE DATABASE OtoSatisSistemi
--Tablo oluþturma 


CREATE TABLE Marka
(
marka_id INT   IDENTITY(1,1) PRIMARY KEY ,
marka_adý VARCHAR(30) NOT NULL,
) 
-------------------------------------------------------------------
CREATE TABLE Renk
(
renk_id INT  IDENTITY(1,1) PRIMARY KEY,
renk_adý VARCHAR(15) NOT NULL,
)
------------------------------------------------------------------------
CREATE TABLE Özellik
(
özellik_id INT  IDENTITY(1,1) PRIMARY KEY,
özellik_adý VARCHAR(50) 
)
-------------------------------------------------------------------
CREATE TABLE OpsiyonelÖzellik
(
op_özellik_id INT  IDENTITY(1,1) PRIMARY KEY,
op_özellik_adý VARCHAR(50) 
)
--------------------------------------------------------------------
CREATE TABLE ServisÝþlemi
(
iþlem_id INT  IDENTITY(1,1) PRIMARY KEY,
iþlem_adý VARCHAR(50) NOT NULL,
fiyat INT NOT NULL
)
-----------------------------------------------------------------------
CREATE TABLE Model
(
model_id INT  IDENTITY(1,1) PRIMARY KEY,
model_adý VARCHAR(25) NOT NULL,
markaID INT FOREIGN KEY REFERENCES Marka(marka_id) NOT NULL,
)
----------------------------------------------------------------------------
CREATE TABLE Ýl
(
il_id INT  IDENTITY(1,1) PRIMARY KEY,
il_adý VARCHAR(25)
)
---------------------------------------------------------------------------
CREATE TABLE Ýlçe
(
ilçe_id INT  IDENTITY(1,1) PRIMARY KEY,
ilçe_adý VARCHAR(25),
ilID INT FOREIGN KEY REFERENCES Ýl(il_id) NOT NULL
)


---------------------------------------------------------------------------
CREATE TABLE Müþteri
(
müþteri_id INT  IDENTITY(1,1) PRIMARY KEY,
müþteri_adý VARCHAR(40) NOT NULL,
müþteri_soyad VARCHAR(40) NOT NULL,
mail VARCHAR(50) UNIQUE,
adres VARCHAR(50) ,
cinsiyet VARCHAR(5),
telefon_no CHAR(11) UNIQUE,
ilID INT FOREIGN KEY REFERENCES Ýl(il_id) NOT NULL,
ilçeID INT FOREIGN KEY REFERENCES Ýlçe(ilçe_id) NOT NULL,
)

-------------------------------------------------------------------------------------
CREATE TABLE Kasa
(
kasa_id INT  IDENTITY(1,1) PRIMARY KEY,
kasa_adý VARCHAR(20) NOT NULL,
)
----------------------------------------------------------------------------
CREATE TABLE Çekiþ
(
çekiþ_id INT  IDENTITY(1,1) PRIMARY KEY,
çekiþ_adý VARCHAR(20) NOT NULL,

)
--------------------------------------------------------------------------
CREATE TABLE Yakýt
(
yakýt_id INT  IDENTITY(1,1) PRIMARY KEY,
yakýt_adý VARCHAR(20) NOT NULL,

)
------------------------------------------------------------------------
CREATE TABLE Vites
(
vites_id INT  IDENTITY(1,1) PRIMARY KEY,
vites_adý VARCHAR(20) NOT NULL,

)
-------------------------------------------------------------------------
CREATE TABLE ModelVites
(
mvID INT  IDENTITY(1,1) PRIMARY KEY,
modelID INT FOREIGN KEY REFERENCES Model(model_id) NOT NULL,
vitesID INT FOREIGN KEY REFERENCES Vites(vites_id) NOT NULL
)
---------------------------------------------------------------
CREATE TABLE ModelKasa
(
mkID INT  IDENTITY(1,1) PRIMARY KEY,
modelID INT FOREIGN KEY REFERENCES Model(model_id) NOT NULL,
KasaID INT FOREIGN KEY REFERENCES Kasa(kasa_id) NOT NULL
)

------------------------------------------------------------
CREATE TABLE ModelÇekiþ
(
mçID INT  IDENTITY(1,1) PRIMARY KEY,
modelID INT FOREIGN KEY REFERENCES Model(model_id) NOT NULL,
çekiþID INT FOREIGN KEY REFERENCES Çekiþ(çekiþ_id) NOT NULL
)
----------------------------------------------------------------------
CREATE TABLE ModelYakýt
(
myID INT  IDENTITY(1,1) PRIMARY KEY,
modelID INT FOREIGN KEY REFERENCES Model(model_id) NOT NULL,
yakýtID INT FOREIGN KEY REFERENCES Yakýt(yakýt_id) NOT NULL
)
----------------------------------------------------------------------
CREATE TABLE Otomobil
(
oto_id INT IDENTITY(1,1) PRIMARY KEY,
motor_gücü VARCHAR(30) NOT NULL,
motor_hacmi VARCHAR(30) NOT NULL,
model_yili CHAR(4) ,
km VARCHAR(30) NOT NULL, --1500-2550 kn
fiyat INT NOT NULL,
siparis_tarihi DATE ,
satýldýðý_tarih DATE ,
plaka VARCHAR(20) UNIQUE,
durum SMALLINT NOT NULL, --0,1,2 durumlaru ne anlama geliyor.sütünun bu þekilde doldur.
renkID INT FOREIGN KEY REFERENCES Renk(renk_id) NOT NULL,
markaID INT FOREIGN KEY REFERENCES Marka(marka_id) NOT NULL,
modelID INT FOREIGN KEY REFERENCES Model(model_id) NOT NULL,
müþteriID INT FOREIGN KEY REFERENCES Müþteri(müþteri_id) NOT NULL,
kasaID INT FOREIGN KEY REFERENCES Kasa(kasa_id) NOT NULL,
çekiþID INT FOREIGN KEY REFERENCES Çekiþ(çekiþ_id) NOT NULL,
vitesID INT FOREIGN KEY REFERENCES Vites(vites_id) NOT NULL,
yakýtID INT FOREIGN KEY REFERENCES Yakýt(yakýt_id) NOT NULL,
)


-------------------------------------------------------------
CREATE TABLE Otomobil_OP_Özellik
(
ID  INT  IDENTITY(1,1) PRIMARY KEY,
fiyat INT,
otoID INT FOREIGN KEY REFERENCES Otomobil(oto_id),
op_özellikID  INT FOREIGN KEY REFERENCES OpsiyonelÖzellik(op_özellik_id) NOT NULL
)

-----------------------------------------------------------------
CREATE TABLE ServisKaydý
(
kayýt_id INT  IDENTITY(1,1) PRIMARY KEY,
teslim_km VARCHAR(30) NOT NULL,
net_toplam INT NOT NULL,
brüt_toplam INT NOT NULL,
indirim_toplamý INT NOT NULL,
teslim_tarih DATE NOT NULL,
getiriþ_tarih DATE NOT NULL,
alýþ_km VARCHAR(30) NOT NULL,
otoID INT FOREIGN KEY REFERENCES Otomobil(oto_id) NOT NULL,
müþteriID INT FOREIGN KEY REFERENCES Müþteri(müþteri_id) NOT NULL,
)

-------------------------------------------------------------------
CREATE TABLE Kiralama
(
kiralama_id INT  IDENTITY(1,1) PRIMARY KEY,
alýþ_km VARCHAR(30) NOT NULL,
teslim_km VARCHAR(30) NOT NULL, 
kullaným_km VARCHAR(30) NOT NULL,
kiralandýðý_tarih DATE NOT NULL,
teslim_edilen_tarih DATE NOT NULL,
teslim_edilecek_tarih DATE NOT NULL,
durum SMALLINT NOT NULL,
toplam_ücret AS (gün*birim_fiyat), 
gün int NOT NULL, 
birim_fiyat INT NOT NULL,
müþteriID INT FOREIGN KEY REFERENCES Müþteri(müþteri_id) NOT NULL,
otoID INT FOREIGN KEY REFERENCES Otomobil(oto_id) NOT NULL
)
------------------------------------------------------------------------
CREATE TABLE Personel  
(
personel_id INT  IDENTITY(1,1) PRIMARY KEY,
personel_ad VARCHAR(30) NOT NULL,
personel_soyad VARCHAR(30) NOT NULL,
mail VARCHAR(50) UNIQUE,
cinsiyet VARCHAR(5) ,
iþe_giriþ_yýlý CHAR(4) NOT NULL,
adres VARCHAR(50),
yaþ VARCHAR(2) UNIQUE,
kayýtID INT FOREIGN KEY REFERENCES ServisKaydý(kayýt_id) NOT NULL,
ilID INT FOREIGN KEY REFERENCES Ýl(il_id) NOT NULL,
ilçeID INT FOREIGN KEY REFERENCES Ýlçe(ilçe_id) NOT NULL,
)
---------------------------------------------------------------------
CREATE TABLE KayýtlýÝþlem --servis_iþemi ve servis_kaydý arasýndaki iliþki
(
kayýtlý_iþlem_id INT  IDENTITY(1,1) PRIMARY KEY,
birim_fiyat INT NOT NULL,
miktar VARCHAR(3) NOT NULL, 
net_tutar INT NOT NULL,
brüt_tutar	INT NOT NULL,
indirim_oraný INT NOT NULL,
iþlem_baþlangýç_tarihsaat DATETIME NOT NULL,
iþlem_bitiþ_tarihsaat DATETIME NOT NULL,
iþlemID INT FOREIGN KEY REFERENCES ServisÝþlemi(iþlem_id) NOT NULL,
kayýtID INT FOREIGN KEY REFERENCES ServisKaydý(kayýt_id) NOT NULL
)
-------------------------------------------------------------------
CREATE TABLE Model_OP_Özellik
(
ID  INT  IDENTITY(1,1) PRIMARY KEY,
fiyat INT,
modelID INT FOREIGN KEY REFERENCES Model(model_id) NOT NULL,
op_özellikID  INT FOREIGN KEY REFERENCES OpsiyonelÖzellik(op_özellik_id) NOT NULL
)

---------------------------
CREATE TABLE Model_Özellik
(
ID  INT  IDENTITY(1,1) PRIMARY KEY,
fiyat INT,
modelID INT FOREIGN KEY REFERENCES Model(model_id) NOT NULL,
özellikID  INT FOREIGN KEY REFERENCES Özellik(özellik_id) NOT NULL
)
--------------------------------------------------------------------
CREATE TABLE ModelRenk
(
ID  INT  IDENTITY(1,1) PRIMARY KEY,
modelID INT FOREIGN KEY REFERENCES Model(model_id) NOT NULL,
renkID INT FOREIGN KEY REFERENCES Renk(renk_id) NOT NULL
)
