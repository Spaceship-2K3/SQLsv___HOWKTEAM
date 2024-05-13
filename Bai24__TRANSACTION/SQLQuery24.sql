USE HowKteam
GO	

-- TRANSACTION : na ná giống git
-- TRANSACTION trong SQL là tiến trình thực hiện một nhóm các câu lệnh SQL


SELECT * FROM dbo.NGUOITHAN
-- cách 1 : 
BEGIN TRANSACTION
DELETE dbo.NGUOITHAN WHERE TEN = 'VANSANG'
-- Chuỗi thao tác loằng ngoằng phức tạp
ROLLBACK -- hủy bỏ trans

BEGIN TRANSACTION
DELETE dbo.NGUOITHAN WHERE TEN = 'VANSANG'
-- Chuỗi thao tác loằng ngoằng phức tạp
COMMIT -- chấp nhận trans

-- cách 2 : 
DECLARE @Trans VARCHAR(20)
SELECT @Trans = 'Trans1'

BEGIN TRANSACTION @Trans
DELETE dbo.NGUOITHAN WHERE TEN = 'VANSANG'
-- Chuỗi thao tác loằng ngoằng phức tạp
COMMIT TRANSACTION @Trans -- chấp nhận trans

-- Đặt mốc thời gian để quay lại
BEGIN TRANSACTION 
SAVE TRANSACTION Trans1
DELETE dbo.NGUOITHAN WHERE TEN = 'VANSANG'
COMMIT  

SAVE TRANSACTION Trans2
DELETE dbo.NGUOITHAN WHERE TEN = 'VANSANG2'
ROLLBACK TRANSACTION Trans1
