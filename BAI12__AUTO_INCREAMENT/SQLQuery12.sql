USE HowKteam
GO

-- AUTO INCREAMENT
-- Giả sử muốn insert 1tr record mà muốn id tự tăng
CREATE TABLE TESTAUTO1
(
	ID INT PRIMARY KEY IDENTITY, -- tự tăng trường này phải là số. Mặc định tự tăng từ 1, và 1 đơn vị
	Name NVARCHAR(30)
)
GO

INSERT INTO	 dbo.TESTAUTO1
VALUES
 (
	N'sang'
 ),
 (
	N'long'
 ),
 (
	N'lam'
	 
 ),
 (
	N'kien'
	 
 ),
 (
	N'khanh'
 ),
 (
	N'nhat'
 ),
 (
	N'binh'
 ) 
 
SELECT * FROM dbo.TESTAUTO1

-- Tự tăng bắt đầu từ 1 và tự tăng lên 10 đơn vị
CREATE TABLE TESTAUTO2 (
	ID INT PRIMARY KEY IDENTITY(1, 10),
    Name NVARCHAR(100)
);
GO
INSERT INTO	 dbo.TESTAUTO2
VALUES
 (
	N'sang'
 ),
 (
	N'long'
 ),
 (
	N'lam'
	 
 ),
 (
	N'kien'
	 
 ),
 (
	N'khanh'
 ),
 (
	N'nhat'
 ),
 (
	N'binh'
 ) 
 
 SELECT * FROM dbo.TESTAUTO2