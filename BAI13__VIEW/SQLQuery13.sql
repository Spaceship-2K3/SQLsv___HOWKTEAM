USE HowKteam 
GO

-- View

SELECT * FROM dbo.GIAOVIEN

-- Tạo ra bảng lưu thông tin giáo viên , tên bộ môn và lương của giáo viên đó
SELECT HOTEN, TENBM, LUONG INTO LuongGiaoVien FROM dbo.GIAOVIEN, dbo.BOMON 
WHERE dbo.BOMON.MABM = dbo.GIAOVIEN.MABM

SELECT * FROM dbo.LuongGiaoVien

-- update cứng vào cái bảng đó
UPDATE dbo.GIAOVIEN SET LUONG = 9000
WHERE MAGV = '006'

-- Để tạo ra 1 bảng khi giá trị tham chiếu tới nó sẽ thay đổi khi update dữ liệu từ bảng đc tham chiếu
-- View là bảng ảo
-- Cập nhật dữ liệu theo bảng mà view truy vấn tới mỗi khi lấy view ra sài

-- Tạo ra view TestView từ câu truy vấn, sử dụng như bảng bình thường
CREATE VIEW TestView AS 
SELECT * FROM dbo.GIAOVIEN

UPDATE dbo.GIAOVIEN SET LUONG = 2000
WHERE MAGV = '001'

SELECT * FROM TestView


-- xóa view
DROP VIEW TestView

-- Sửa view
ALTER VIEW  TestView AS 
SELECT HOTEN FROM dbo.GIAOVIEN

-- Tạo view có dấu
CREATE VIEW [Giáo dục miễn phí] AS
SELECT * FROM dbo.KHOA

SELECT * FROM [Giáo dục miễn phí]