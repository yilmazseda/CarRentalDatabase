
--1 Ya�� 40'dan b�y�k ve cinsiyeri kad�n olan personel var ise bu personeli tablodan silelim.(Olu�turd�umuz datbase i�erisinde ya�� 40'dan b�y�k cinsiyeti etkek olan bir tane personel vard�r)

DELETE FROM Personel WHERE ya�>40 AND cinsiyet='Kad�n'

--2) �eki��d'i 2 model�d'i 23 olan arac� model�eki� tablosundan sil

DELETE FROM Model�eki� WHERE �eki�ID=2 AND modelID=23

--3)Soyad� 'Y�lmaz' ve i�e_giri_y�l�=2015 olan personeli  tablodan sil

DELETE FROM Personel WHERE personel_soyad='Y�lmaz' AND i�e_giri�_y�l�='2015'

--4)Net_toplam� 1500'den k���k ve indirim toplam� 0'dan b�y�k olan servis kayd�n� sil.(ID'i 10 olan kay�t silinir)
DELETE FROM ServisKayd� WHERE net_toplam<1500 AND indirim_toplam�>0 
select * from ServisKayd�


--5)motor_g�c� 300'den k���k ve sat�ld��� tarih null olan otomobilleri tablodan sil

DELETE FROM Otomobil WHERE motor_g�c�<300 AND sat�ld���_tarih='NULL' 
















































