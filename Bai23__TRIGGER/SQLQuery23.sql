USE HowKteam
GO	


-- TRIGGER

-- Trigger sẽ được gọi mỗi khi có thao tác thay đổi thông tin bảng -> tức là mỗi khi thêm, xóa, sửa bảng phải qua trigger
-- Inserted : chứa những trường đã insert | update vào bảng
-- Deleted : chứa những trường bị xóa khỏi bảng
/*
	CREATE TRIGGER tên_trigger  
	ON { Tên_bảng }   
	[ WITH <Options> ]  
	{ FOR | AFTER | INSTEAD OF }   
	{ [INSERT], [UPDATE] , [DELETE] }
*/

CREATE FUNCTION UF_PrintName (@Name NVARCHAR(100))
RETURNS INT
AS
BEGIN
    PRINT
END
GO


CREATE TRIGGER UTG_InsertGiaoVien
ON dbo.GIAOVIEN
FOR	 INSERT,UPDATE
AS 
BEGIN
    PRINT 'trigger'
END
GO	

ALTER TRIGGER UTG_InsertGiaoVien
ON dbo.GIAOVIEN
FOR	 INSERT,UPDATE
AS 
BEGIN
	ROLLBACK TRAN -- Hủy bỏ thay đổi cập nhật bảng
    PRINT 'trigger2'
END

-----------------------------------------------------------------------------------

-- Không cho phép xóa thông tin của giáo viên có tuổi lớn hơn 50
CREATE TRIGGER UTG_AbortOlderThan40
ON dbo.GIAOVIEN
FOR DELETE
AS
BEGIN
    DECLARE @Count INT = 0
	
	SELECT @Count = COUNT(*) FROM Deleted
	WHERE YEAR(GETDATE() - YEAR(Deleted.NGSINH)) > 50

	IF (@Count > 0)
		BEGIN
		    PRINT N'Không được xóa người hơn 40 tuổi'
			ROLLBACK TRAN
		END
END