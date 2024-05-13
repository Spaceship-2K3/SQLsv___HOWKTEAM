USE HowKteam
GO	

-- FUNCTION
-- Function trong SQL Server là các đối tượng database chứa một nhóm lệnh SQL để triển khai một nhiệm vụ cụ thể
-- Một hàm chấp nhận các tham số đầu vào, thực thi hành động, sau đó trả về kết quả.
-- Bạn cần ghi nhớ rằng hàm đó luôn trả về một giá trị đơn lẻ hoặc một bảng
-- SQL Server không cho phép sử dụng các hàm để chèn, xóa hoặc update bản ghi trong bảng cơ sở dữ liệu.

/*
	- Sau đây là những quy tắc tạo các hàm trong SQL Server:
		+ Một hàm phải có tên. Tên không thể bắt đầu bằng một ký tự đặc biệt như @, $, # hoặc ký tự tương tự khác.
		+ Lệnh SELECT là lệnh duy nhất hoạt động với các hàm.
		+ Bạn có thể dùng một hàm tại vị trí bất kỳ như AVG, COUNT, SUM, MIN, DATE và các hàm khác bằng truy vấn SELECT trong SQL.
		+ Bất cứ khi nào gọi một hàm, nó sẽ được biên dịch.
		+ Hàm phải trả về một giá trị hoặc kết quả.
		+ Hàm chỉ sử dụng các tham số đầu vào.
		+ Bạn không thể dùng lệnh TRY và CATCH trong hàm.

*/

-- Hàm không có tham số
CREATE FUNCTION UF_SelectAllGiaoVien()
RETURNS TABLE
AS RETURN SELECT * FROM dbo.GIAOVIEN
GO
-- sử dụng hàm
SELECT * FROM dbo.UF_SelectAllGiaoVien()


-- Hàm có tham số
CREATE FUNCTION UF_SelectLuongGiaoVien(@MaGV CHAR(10))
RETURNS INT
AS
BEGIN
    DECLARE @Luong INT
	SELECT @Luong = Luong FROM dbo.GIAOVIEN WHERE MAGV= @MaGV
	RETURN @Luong
END

-- sử dụng hàm
SELECT dbo.UF_SelectLuongGiaoVien('006') AS DB
SELECT dbo.UF_SelectLuongGiaoVien(MaGV) FROM dbo.GIAOVIEN

-- Xóa function, store
DROP PROC dbo.USP_TEST
DROP FUNCTION dbo.UF_SelectAllGiaoVien

-- Sửa hàm
ALTER FUNCTION UF_SelectLuongGiaoVien(@MaGV CHAR(10))
RETURNS INT
AS
BEGIN
    DECLARE @Luong INT
	SELECT @Luong = Luong FROM dbo.GIAOVIEN WHERE MAGV= @MaGV
	RETURN @Luong
END

------------------------------------------------------------------------

-- Tạo function tính một số truyền vào phải là số chẵn hay không

CREATE FUNCTION UF_IsOdd(@Num int)
RETURNS NVARCHAR(20)
AS
BEGIN
	IF(@Num %2 = 0)
		RETURN N'Số Chẵn'
	ELSE
		RETURN N'Số lẻ'
	RETURN N'Không xác định'
END

SELECT dbo.UF_IsOdd(3) 

ALTER FUNCTION UF_AgeOfYear(@Year date	)
RETURNS int
AS
BEGIN
    RETURN YEAR(GETDATE()) - YEAR(@Year)
END

SELECT dbo.UF_AgeOfYear(NgSinh),
dbo.UF_IsOdd( dbo.UF_AgeOfYear(NgSinh))
FROM dbo.GIAOVIEN