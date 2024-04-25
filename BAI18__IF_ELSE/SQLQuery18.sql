USE HowKteam
GO	
--  If else 

DECLARE @LuongTrungBinh INT
DECLARE @SoLuongGiaoVien INT

SELECT @SoLuongGiaoVien = COUNT(*) FROM dbo.GIAOVIEN
SELECT @LuongTrungBinh = SUM(LUONG) / @SoLuongGiaoVien  FROM dbo.GIAOVIEN
