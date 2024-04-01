CREATE DATABASE DATABASE_TEST3
GO
USE DATABASE_TEST3

-- Tạo table
CREATE TABLE GiangVien(
	MaGV NVARCHAR(10),
	Name NVARCHAR(100)
)

GO	
CREATE TABLE HocSinh(
	MaSV NVARCHAR(10),
	Name NVARCHAR(100),
	Old NUMERIC
)


-- Xóa table
GO
DROP TABLE dbo.HocSinh -- Xoa ca bang
TRUNCATE TABLE dbo.GiangVien  -- xoa toan bo du lieu



-- Edit table
ALTER TABLE dbo.GiangVien ADD NgaySinh DATE
GO