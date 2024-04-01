USE LEARN
GO

-- Unique : duy nhất -> trong toàn bộ bảng. Trường nào có từ khóa Unique thì không thể có 2 giá trị trùng nhau
-- Not null : trường đó không được phép null
-- Default : giá trị mặc định của trường đó nếu không gán giá trị khi insert
 

 -- c1: tạo bảng ngay khi tạo
CREATE TABLE TestPrimaryKey1
(
	ID INT PRIMARY KEY,
	Name NVARCHAR(20) DEFAULT N'DAOVANSANG'
)
GO

-- c2 : Khi đã tạo bảng, muốn sửa cột thành primary key
ALTER TABLE dbo.TestPrimaryKey1 ADD PRIMARY KEY (ID)


-- c3 : khi đã tạo bảng, taọ primary key mà không phải ngay khi khai báo
CREATE TABLE TestPrimaryKey2(
	ID INT NOT NULL,
	Name NVARCHAR(100) DEFAULT 'DaoVanSang'
	PRIMARY KEY (ID)
)

 -- c4 : tạo primary key ngay trong bảng mà đặt tên cho key đó
 CREATE TABLE TestPrimaryKey3(
	Id INT NOT	NULL,
	Name NVARCHAR(100),

	CONSTRAINT PK_Test3 -- sau này xóa key cho dễ
	PRIMARY KEY (Id)
 )

 -- c5 : tạo primary key sau khi tạo bảng và đặt tên cho key đó
 CREATE TABLE TestPrimaryKey4
(
	ID INT NOT NULL,
	Name NVARCHAR(20) DEFAULT N'DAOVANSANG'
)
GO

ALTER TABLE dbo.TestPrimaryKey4 ADD CONSTRAINT PK_Test4 PRIMARY KEY (ID)

-- Khóa chính có 2 trường
 CREATE TABLE TestPrimaryKey5
(
	ID1 INT NOT NULL,
	ID2 INT NOT NULL,
	Name NVARCHAR(20) DEFAULT N'DAOVANSANG'

	PRIMARY KEY(ID1,ID2)
)