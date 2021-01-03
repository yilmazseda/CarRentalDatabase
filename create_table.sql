--CREATE DATABASE OtoSatisSistemi
--Tablo olu�turma 


CREATE TABLE Marka
(
marka_id INT   IDENTITY(1,1) PRIMARY KEY ,
marka_ad� VARCHAR(30) NOT NULL,
) 
-------------------------------------------------------------------
CREATE TABLE Renk
(
renk_id INT  IDENTITY(1,1) PRIMARY KEY,
renk_ad� VARCHAR(15) NOT NULL,
)
------------------------------------------------------------------------
CREATE TABLE �zellik
(
�zellik_id INT  IDENTITY(1,1) PRIMARY KEY,
�zellik_ad� VARCHAR(50) 
)
-------------------------------------------------------------------
CREATE TABLE Opsiyonel�zellik
(
op_�zellik_id INT  IDENTITY(1,1) PRIMARY KEY,
op_�zellik_ad� VARCHAR(50) 
)
--------------------------------------------------------------------
CREATE TABLE Servis��lemi
(
i�lem_id INT  IDENTITY(1,1) PRIMARY KEY,
i�lem_ad� VARCHAR(50) NOT NULL,
fiyat INT NOT NULL
)
-----------------------------------------------------------------------
CREATE TABLE Model
(
model_id INT  IDENTITY(1,1) PRIMARY KEY,
model_ad� VARCHAR(25) NOT NULL,
markaID INT FOREIGN KEY REFERENCES Marka(marka_id) NOT NULL,
)
----------------------------------------------------------------------------
CREATE TABLE �l
(
il_id INT  IDENTITY(1,1) PRIMARY KEY,
il_ad� VARCHAR(25)
)
---------------------------------------------------------------------------
CREATE TABLE �l�e
(
il�e_id INT  IDENTITY(1,1) PRIMARY KEY,
il�e_ad� VARCHAR(25),
ilID INT FOREIGN KEY REFERENCES �l(il_id) NOT NULL
)


---------------------------------------------------------------------------
CREATE TABLE M��teri
(
m��teri_id INT  IDENTITY(1,1) PRIMARY KEY,
m��teri_ad� VARCHAR(40) NOT NULL,
m��teri_soyad VARCHAR(40) NOT NULL,
mail VARCHAR(50) UNIQUE,
adres VARCHAR(50) ,
cinsiyet VARCHAR(5),
telefon_no CHAR(11) UNIQUE,
ilID INT FOREIGN KEY REFERENCES �l(il_id) NOT NULL,
il�eID INT FOREIGN KEY REFERENCES �l�e(il�e_id) NOT NULL,
)

-------------------------------------------------------------------------------------
CREATE TABLE Kasa
(
kasa_id INT  IDENTITY(1,1) PRIMARY KEY,
kasa_ad� VARCHAR(20) NOT NULL,
)
----------------------------------------------------------------------------
CREATE TABLE �eki�
(
�eki�_id INT  IDENTITY(1,1) PRIMARY KEY,
�eki�_ad� VARCHAR(20) NOT NULL,

)
--------------------------------------------------------------------------
CREATE TABLE Yak�t
(
yak�t_id INT  IDENTITY(1,1) PRIMARY KEY,
yak�t_ad� VARCHAR(20) NOT NULL,

)
------------------------------------------------------------------------
CREATE TABLE Vites
(
vites_id INT  IDENTITY(1,1) PRIMARY KEY,
vites_ad� VARCHAR(20) NOT NULL,

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
CREATE TABLE Model�eki�
(
m�ID INT  IDENTITY(1,1) PRIMARY KEY,
modelID INT FOREIGN KEY REFERENCES Model(model_id) NOT NULL,
�eki�ID INT FOREIGN KEY REFERENCES �eki�(�eki�_id) NOT NULL
)
----------------------------------------------------------------------
CREATE TABLE ModelYak�t
(
myID INT  IDENTITY(1,1) PRIMARY KEY,
modelID INT FOREIGN KEY REFERENCES Model(model_id) NOT NULL,
yak�tID INT FOREIGN KEY REFERENCES Yak�t(yak�t_id) NOT NULL
)
----------------------------------------------------------------------
CREATE TABLE Otomobil
(
oto_id INT IDENTITY(1,1) PRIMARY KEY,
motor_g�c� VARCHAR(30) NOT NULL,
motor_hacmi VARCHAR(30) NOT NULL,
model_yili CHAR(4) ,
km VARCHAR(30) NOT NULL, --1500-2550 kn
fiyat INT NOT NULL,
siparis_tarihi DATE ,
sat�ld���_tarih DATE ,
plaka VARCHAR(20) UNIQUE,
durum SMALLINT NOT NULL, --0,1,2 durumlaru ne anlama geliyor.s�t�nun bu �ekilde doldur.
renkID INT FOREIGN KEY REFERENCES Renk(renk_id) NOT NULL,
markaID INT FOREIGN KEY REFERENCES Marka(marka_id) NOT NULL,
modelID INT FOREIGN KEY REFERENCES Model(model_id) NOT NULL,
m��teriID INT FOREIGN KEY REFERENCES M��teri(m��teri_id) NOT NULL,
kasaID INT FOREIGN KEY REFERENCES Kasa(kasa_id) NOT NULL,
�eki�ID INT FOREIGN KEY REFERENCES �eki�(�eki�_id) NOT NULL,
vitesID INT FOREIGN KEY REFERENCES Vites(vites_id) NOT NULL,
yak�tID INT FOREIGN KEY REFERENCES Yak�t(yak�t_id) NOT NULL,
)


-------------------------------------------------------------
CREATE TABLE Otomobil_OP_�zellik
(
ID  INT  IDENTITY(1,1) PRIMARY KEY,
fiyat INT,
otoID INT FOREIGN KEY REFERENCES Otomobil(oto_id),
op_�zellikID  INT FOREIGN KEY REFERENCES Opsiyonel�zellik(op_�zellik_id) NOT NULL
)

-----------------------------------------------------------------
CREATE TABLE ServisKayd�
(
kay�t_id INT  IDENTITY(1,1) PRIMARY KEY,
teslim_km VARCHAR(30) NOT NULL,
net_toplam INT NOT NULL,
br�t_toplam INT NOT NULL,
indirim_toplam� INT NOT NULL,
teslim_tarih DATE NOT NULL,
getiri�_tarih DATE NOT NULL,
al��_km VARCHAR(30) NOT NULL,
otoID INT FOREIGN KEY REFERENCES Otomobil(oto_id) NOT NULL,
m��teriID INT FOREIGN KEY REFERENCES M��teri(m��teri_id) NOT NULL,
)

-------------------------------------------------------------------
CREATE TABLE Kiralama
(
kiralama_id INT  IDENTITY(1,1) PRIMARY KEY,
al��_km VARCHAR(30) NOT NULL,
teslim_km VARCHAR(30) NOT NULL, 
kullan�m_km VARCHAR(30) NOT NULL,
kiraland���_tarih DATE NOT NULL,
teslim_edilen_tarih DATE NOT NULL,
teslim_edilecek_tarih DATE NOT NULL,
durum SMALLINT NOT NULL,
toplam_�cret AS (g�n*birim_fiyat), 
g�n int NOT NULL, 
birim_fiyat INT NOT NULL,
m��teriID INT FOREIGN KEY REFERENCES M��teri(m��teri_id) NOT NULL,
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
i�e_giri�_y�l� CHAR(4) NOT NULL,
adres VARCHAR(50),
ya� VARCHAR(2) UNIQUE,
kay�tID INT FOREIGN KEY REFERENCES ServisKayd�(kay�t_id) NOT NULL,
ilID INT FOREIGN KEY REFERENCES �l(il_id) NOT NULL,
il�eID INT FOREIGN KEY REFERENCES �l�e(il�e_id) NOT NULL,
)
---------------------------------------------------------------------
CREATE TABLE Kay�tl���lem --servis_i�emi ve servis_kayd� aras�ndaki ili�ki
(
kay�tl�_i�lem_id INT  IDENTITY(1,1) PRIMARY KEY,
birim_fiyat INT NOT NULL,
miktar VARCHAR(3) NOT NULL, 
net_tutar INT NOT NULL,
br�t_tutar	INT NOT NULL,
indirim_oran� INT NOT NULL,
i�lem_ba�lang��_tarihsaat DATETIME NOT NULL,
i�lem_biti�_tarihsaat DATETIME NOT NULL,
i�lemID INT FOREIGN KEY REFERENCES Servis��lemi(i�lem_id) NOT NULL,
kay�tID INT FOREIGN KEY REFERENCES ServisKayd�(kay�t_id) NOT NULL
)
-------------------------------------------------------------------
CREATE TABLE Model_OP_�zellik
(
ID  INT  IDENTITY(1,1) PRIMARY KEY,
fiyat INT,
modelID INT FOREIGN KEY REFERENCES Model(model_id) NOT NULL,
op_�zellikID  INT FOREIGN KEY REFERENCES Opsiyonel�zellik(op_�zellik_id) NOT NULL
)

---------------------------
CREATE TABLE Model_�zellik
(
ID  INT  IDENTITY(1,1) PRIMARY KEY,
fiyat INT,
modelID INT FOREIGN KEY REFERENCES Model(model_id) NOT NULL,
�zellikID  INT FOREIGN KEY REFERENCES �zellik(�zellik_id) NOT NULL
)
--------------------------------------------------------------------
CREATE TABLE ModelRenk
(
ID  INT  IDENTITY(1,1) PRIMARY KEY,
modelID INT FOREIGN KEY REFERENCES Model(model_id) NOT NULL,
renkID INT FOREIGN KEY REFERENCES Renk(renk_id) NOT NULL
)
