
--1 Yaþý 40'dan büyük ve cinsiyeri kadýn olan personel var ise bu personeli tablodan silelim.(Oluþturdðumuz datbase içerisinde yaþý 40'dan büyük cinsiyeti etkek olan bir tane personel vardýr)

DELETE FROM Personel WHERE yaþ>40 AND cinsiyet='Kadýn'

--2) çekiþýd'i 2 modelýd'i 23 olan aracý modelçekiþ tablosundan sil

DELETE FROM ModelÇekiþ WHERE çekiþID=2 AND modelID=23

--3)Soyadý 'Yýlmaz' ve iþe_giri_yýlý=2015 olan personeli  tablodan sil

DELETE FROM Personel WHERE personel_soyad='Yýlmaz' AND iþe_giriþ_yýlý='2015'

--4)Net_toplamý 1500'den küçük ve indirim toplamý 0'dan büyük olan servis kaydýný sil.(ID'i 10 olan kayýt silinir)
DELETE FROM ServisKaydý WHERE net_toplam<1500 AND indirim_toplamý>0 
select * from ServisKaydý


--5)motor_gücü 300'den küçük ve satýldýðý tarih null olan otomobilleri tablodan sil

DELETE FROM Otomobil WHERE motor_gücü<300 AND satýldýðý_tarih='NULL' 
















































