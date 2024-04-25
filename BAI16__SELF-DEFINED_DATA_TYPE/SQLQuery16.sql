-- Kiểu dữ liệu tự định nghĩa
USE HowKteam
GO

--	EXEC sp_addtype 'Tên kiểu dữ liệu ', 'Kiểu dữ liệu thực tế', 'Not null' (có hay không đều được)
--	Kiểu dữ liệu này được lưu trong Programmability -> Type -> User-Defined Data Type


EXEC  sp_addtype 'NNAME', 'nvarchar(100)', 'Not null'

CREATE TABLE TESTYPEL(
	Name NNAME,
	Address NVARCHAR(100)
)

EXEC sp_addtype 'ADDRESS', 'nvarchar(500)' 

-- Xóa type
EXEC sp_droptype 'ADDRESS'