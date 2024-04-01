USE HowKteam
GO	

-- Truy vấn lồng : tách những câu truy vấn thành những câu truy vấn nhỏ hơn

-- Kiểm tra xem giáo viên 001 có phải là giáo viên quản lý chuyên môn hay không
-- Lấy ra danh sách các mã giáo viên  QLCM
-- Kiểm tra mã GV tồn tại trong danh sách đó
SELECT * FROM	dbo.GIAOVIEN
WHERE MAGV = '001'
-- 001 tồn tại trong danh sách
AND 
MAGV IN (
	SELECT GVQLCM FROM dbo.GIAOVIEN
)


-- Truy vấn lồng trong from
SELECT * FROM
dbo.GIAOVIEN , (SELECT * FROM dbo.DETAI) AS DT


-- 1.Xuất ra danh sách giáo viên tham gia nhiều hơn một đề tài
-- Lấy ra tất cả thông tin của giáo viên khi mà
SELECT * 
FROM dbo.GIAOVIEN AS GV 
-- Số lượng đề tài giáo viên đó tham gia > 1, tức là mỗi giáo viên sẽ kiểm gia lặp lại
WHERE 1< (
	SELECT COUNT(*) FROM dbo.THAMGIADT
	WHERE MAGV = GV.MAGV
)

-- 2. Xuất ra thông tin của khoa mà có nhiều hơn 2 giáo viên
-- Lấy được danh sách bộ môn nằm trong khoa hiện tại

  
SELECT * FROM dbo.KHOA AS K
WHERE 2 < (
	SELECT COUNT(*) FROM dbo.BOMON AS BM , dbo.GIAOVIEN AS GV
	WHERE BM.MAKHOA = K.MAKHOA
	AND BM.MABM = GV.MABM
)

-- Sắp xếp giảm dần
SELECT MAGV FROM dbo.GIAOVIEN
ORDER BY MAGV DESC

-- Sắp xếp tăng dần 
SELECT MAGV FROM dbo.GIAOVIEN
ORDER BY MAGV ASC

-- lấy ra danh sách GVT2 với số lượng phần tử = count(*) /2
SELECT TOP(5) * FROM dbo.GIAOVIEN

/*
	1. Xuất ra thông tin giáo viên mà có hơn 2 người thân
	2. Xuất ra danh sách các giáo viên lớn tuổi hơn ít nhất 5 người các giáo viên trong trường
*/
-- 1. Xuất ra thông tin giáo viên mà có hơn 2 người thân
 
SELECT * FROM dbo.GIAOVIEN AS GV
WHERE 1 < (
	SELECT COUNT(*) FROM dbo.NGUOITHAN AS  NT 
	WHERE GV.MAGV = NT.MAGV
)

-- 2.  Xuất ra danh sách các giáo viên lớn tuổi hơn ít nhất 5 người các giáo viên trong trường
SELECT *, YEAR(GETDATE()) - YEAR(GV1.NGSINH) FROM dbo.GIAOVIEN AS GV1
WHERE 5 < (
	SELECT COUNT(*) FROM dbo.GIAOVIEN AS GV2 
	WHERE  YEAR(GETDATE()) - YEAR(GV1.NGSINH) > YEAR(GETDATE()) - YEAR(GV2.NGSINH)
)
