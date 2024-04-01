-- Foreign key
CREATE DATABASE Primary_Foreign
go

USE Primary_Foreign
GO

CREATE TABLE BoMon(
	MaBM CHAR(10) NOT NULL PRIMARY KEY,
	TenBM NVARCHAR(100) DEFAULT N'Tên bộ môn'
)
GO	

CREATE TABLE Lop(
	MaLop CHAR(10) NOT NULL ,
	TenLop NVARCHAR(100) DEFAULT N'Tên lớp',

	PRIMARY KEY(MaLop)
)



CREATE TABLE GiaoVien(
	MaGV CHAR(10) NOT NULL ,
	TenGV NVARCHAR(100) DEFAULT N'Tên giáo viên',
	DiaChi NVARCHAR(100) DEFAULT N'Tên địa chỉ',
	NgaySinh DATE,
	GioiTinh BIT,

	-- C1 : Tạo khóa ngoại ngay khi tạo bảng
	MaBM CHAR(10),
	FOREIGN KEY (MaBM) REFERENCES dbo.BoMon(MaBM)
)
 

CREATE TABLE HocSinh(
	MaHS CHAR(10) NOT NULL PRIMARY KEY ,
	TenHS NVARCHAR(100) DEFAULT N'Tên học sinh',
	DiaChi NVARCHAR(100) DEFAULT N'Tên địa chỉ',
	NgaySinh DATE,
	GioiTinh BIT,
)
-- Giáo viên này thuộc bộ môn nào, học sinh nào thuộc lớp nào
-- Khóa ngoại dùng để ràng buộc dữ liệu, để toàn vẹn dữ liệu
-- Điều kiện : 
-- Tham chiếu tới khóa chính
-- Unique, not null
-- Cùng kiểu dữ liệu
-- Cùng số lượng trường có sắp xếp

-- Lợi ích :
-- Đảm bảo toàn vẹn dữ liệu không có trường hợp tham chiếu tới dữ liệu không tồn tại


-- C2 : Tạo khóa ngoại sau khi tạo bảng
ALTER TABLE dbo.HocSinh ADD CONSTRAINT FK_HS FOREIGN KEY (MaHS) REFERENCES dbo.Lop(MaLop)

-- Hủy khóa
ALTER TABLE dbo.HocSinh DROP CONSTRAINT FK_HS 

-- Xem khóa chính, khóa ngoại tham chiếu : Database Diagrams -> New Database Diagrams