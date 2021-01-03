-----FONKSIYON------------------
--*Her bir marka için secilen model yili,
--hem hiz sabitleyici hem de secilen opsiyonel ozellige sahip sedan kiralik araC sayisi
--2 parametre ile model yili ve opsiyonel ozellik
IF OBJECT_ID ('FONK') is not  null

	DROP FUNCTION FONK

GO
CREATE FUNCTION DBO.FONK (@MODELYILI VARCHAR(20), @OPOZELLIK VARCHAR(20))
RETURNS TABLE
AS 
RETURN 
(SELECT  O.ModelID, O.Model_Yili, OZ.Ozellik_Adi, OP.Op_Ozellik_adi, K.Kasa_Adi, MA.Marka_Adi
FROM Marka MA INNER JOIN Model MDL ON MA.MarkaID = MDL.MarkaID
			  INNER JOIN Model_Ozellik MO ON MDL.ModelID = MO.ModelID
			  INNER JOIN Ozellik OZ ON MO.OzellikID = OZ.OzellikID
			  INNER JOIN Model_OP_Ozellik MOP ON MO.modelID = MOP.ModelID
			  INNER JOIN OpsiyonelOzellik OP ON MOP.op_OzellikID = OP.Op_OzellikID
			  INNER JOIN Otomobil O ON MO.ModelID = O.ModelID
			  INNER JOIN Kasa K ON O.KasaID = K.KasaID
			  INNER JOIN Kiralama KR ON O.OtoID = KR.OtoID
	  
WHERE O.Model_Yili = @MODELYILI 
	AND OZ.Ozellik_Adi = 'Hiz Sabitleyici' 
	AND OP.Op_Ozellik_Adi = @OPOZELLIK
	AND K.Kasa_Adi = 'Sedan'
)
GO

SELECT * FROM DBO.FONK('2019','Anahtarsiz Giris')
