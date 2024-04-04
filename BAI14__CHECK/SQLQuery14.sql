-- Check
USE HowKteam
GO	

-- Có thể tạo check y như tạo khóa chính 
-- C1 : 
CREATE TABLE TESTCHECK1(
	ID INT PRIMARY KEY IDENTITY,
	Luong INT CHECK (Luong > 3000 AND Luong < 9000)
)
go
INSERT dbo.TESTCHECK1
(
    Luong
)
VALUES
(0  -- Luong - int -> LỖI
    )

-- C2 : 
CREATE TABLE TESTCHECK2(
	ID INT PRIMARY KEY IDENTITY,
	Luong INT ,
	CONSTRAINT CK_Luong CHECK (Luong > 3000 AND Luong < 9000)
)
GO

-- C3 :
ALTER TABLE dbo.TESTCHECK1 ADD CONSTRAINT ck_luong
CHECK (Luong > 2000 AND Luong < 9000)