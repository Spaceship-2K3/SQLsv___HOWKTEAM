-- Indexes
USE HowKteam
GO	
-- index dùng để tăng tốc truy vấn 
-- tăng tốc độ tìm kiếm bù lại chậm tốc độ thêm, xóa, sửa
-- cho phép các trường trùng nhau


-- tạo index trên bảng giáo viên
CREATE INDEX IndexName ON dbo.GIAOVIEN(MAGV)

SELECT * FROM dbo.GIAOVIEN
WHERE MAGV = '001' AND HOTEN ='VANSANG'

-- Không cho phép các trường trùng nhau
CREATE UNIQUE INDEX IndexNameUnique ON dbo.NGUOITHAN