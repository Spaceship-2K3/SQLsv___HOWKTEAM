USE HowKteam
GO

--  Declare và sử dụng biến

-- Tìm ra mã giáo viên có lương cao nhất
SELECT * FROM dbo.GIAOVIEN WHERE  LUONG = (SELECT MAX(LUONG) FROM dbo.GIAOVIEN)

-- Lấy ra tuổi của giáo viên với mã GV 001 
SELECT YEAR(GETDATE()) - YEAR(NGSINH) FROM dbo.GIAOVIEN WHERE MAGV = '001'

----------------------------------------------------------------------------------


-- VD1:  Tạo ra một biến char lưu mã giáo viên lương thấp nhất

DECLARE @MinSalaryMAGV CHAR(10)   -- Phải chạy 1 cụm
SELECT @MinSalaryMAGV = MAGV  FROM dbo.GIAOVIEN WHERE LUONG = (SELECT MIN(LUONG) FROM dbo.GIAOVIEN)

SELECT YEAR(GETDATE()) - YEAR(NGSINH) FROM dbo.GIAOVIEN WHERE MAGV = @MinSalaryMAGV

----------------------------------------------------------------------------------

-- Biến bắt đầu = ký tự @
-- Khởi tạo với kiểu dữ liệu
DECLARE @i INT  

-- Khởi tạo với giá trị mặc định
DECLARE @j INT = 0

-- Set dữ liệu cho biến
SET @i = @j + 1
SET @i += 1


-- Set thông qua câu select
DECLARE @MaxLuong INT
SELECT @MaxLuong = MAX(LUONG) FROM dbo.GIAOVIEN

---------------------------------------------------------

-- 1. Xuất ra số lượng người thân của giáo viên 001
-- Lưu mã giáo viên 001 lại
-- Tìm ra số lượng người thân tương ứng với mã giáo viên
DECLARE @MaGV CHAR(10) = '001'
SELECT COUNT(*) FROM dbo.NGUOITHAN WHERE MAGV = @MaGV

-- 2. Xuất ra tên của giáo viên có lương thấp nhất
DECLARE @MinLuong INT
SELECT @MinLuong = MIN(LUONG) FROM dbo.GIAOVIEN 

DECLARE @TenGV NVARCHAR(100)
SELECT @TenGV = HOTEN FROM dbo.GIAOVIEN  WHERE LUONG = @MinLuong

-- Xuất ra màn hình phải bôi đen toàn bộ câu lênh với biến
PRINT @TenGV