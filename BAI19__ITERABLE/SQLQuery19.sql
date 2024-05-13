USE HowKteam
GO	

-- Cấu trúc : while (điều kiện thực hiện) -> Khối lệnh thực hiện

-- Cách sử dụng
DECLARE @i INT = 0
DECLARE @n INT = 1000

WHILE (@i <= @n)
BEGIN
    PRINT @i
	SET @i +=1
END

-- Vòng lặp

CREATE TABLE TestWhile(
	ID INT PRIMARY KEY,
	Luong FLOAT
)

-- Insert 10000 record vào bảng TestWhile 
-- Mà không trùng ID 
-- Tên bộ môn tăng dần

DECLARE @j INT = 0
DECLARE @k INT = 1000

WHILE (@j <= @k)
BEGIN
	INSERT dbo.TestWhile
	(
	    ID,
	    Luong
	)
	VALUES
	(   @j,  -- ID - int
	    @j + 100 -- Luong - float
	    )
	set @j +=1
END

SELECT * FROM dbo.TestWhile