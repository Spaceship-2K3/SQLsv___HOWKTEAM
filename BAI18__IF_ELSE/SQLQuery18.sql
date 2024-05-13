USE HowKteam
GO	
--  If else 

-- Ví dụ 1 : kiểm tra xem lương của giáo viên nhập vào có lớn hơn mức lương trung bình hay không
DECLARE @LuongTrungBinh INT
DECLARE @SoLuongGiaoVien INT

SELECT @SoLuongGiaoVien = COUNT(*) FROM dbo.GIAOVIEN
SELECT @LuongTrungBinh = SUM(LUONG) / @SoLuongGiaoVien  FROM dbo.GIAOVIEN

DECLARE @MaGV CHAR(10) = '003'
DECLARE @LuongMaGV INT = 0

SELECT @LuongMaGV = LUONG FROM dbo.GIAOVIEN WHERE MAGV = @MaGV


-- Nếu lương của @MaGV > @LuongTrungBinh
-- Xuất ra Lớn hơn
-- Ngược lại xuất ra nhỏ hơn
 

IF  (@LuongMaGV >  @LuongTrungBinh)  
	BEGIN	-- begin và end là bắt đầu và kết thúc 1 khối lệnh(k bắt buộc)
		PRINT @MaGV
		PRINT @LuongMaGV
		PRINT @LuongTrungBinh
		PRINT N'Lớn hơn'
	END
ELSE	
	BEGIN	 
		PRINT @MaGV
		PRINT @LuongMaGV
		PRINT @LuongTrungBinh
		PRINT N'Nhỏ hơn'
	END

SELECT * FROM dbo.GIAOVIEN

-- Ví dụ 2 : Update lương của toàn bộ giáo viên nếu lương nhập vào cao hơn lương trung bình
-- Ngược lại chỉ update lương của giáo viên nữ
DECLARE @LuongTrungBinh2 INT
DECLARE @SoLuongGiaoVien2 INT

SELECT @SoLuongGiaoVien2 = COUNT(*) FROM dbo.GIAOVIEN
SELECT @LuongTrungBinh2 = SUM(LUONG) / @SoLuongGiaoVien2  FROM dbo.GIAOVIEN

DECLARE @Luong INT = 2000

IF (@Luong > @LuongTrungBinh2)
	BEGIN
	    UPDATE dbo.GIAOVIEN SET LUONG = @Luong
	END
ELSE
	BEGIN
		UPDATE dbo.GIAOVIEN SET LUONG = @Luong
		WHERE PHAI = N'Nữ'
	END

SELECT * FROM dbo.GIAOVIEN