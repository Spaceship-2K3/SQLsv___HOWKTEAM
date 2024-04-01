USE HowKteam
GO	

-- Khắc phục khi gom nhiều trường mà kết quả ra lại k đúng
SELECT  GV.HOTEN, NT.TEN FROM dbo.GIAOVIEN AS GV , dbo.NGUOITHAN AS	NT
WHERE GV.MAGV = NT.MAGV

-- Chọn tất cả các giáo viên mà lương của họ cao hơn 2000
SELECT *  FROM dbo.GIAOVIEN AS GV
WHERE GV.LUONG > 2000

-- Lấy ra giáo viên là nữ và lương > 2000
SELECT * FROM	dbo.GIAOVIEN AS GV
WHERE GV.PHAI = N'Nữ' AND	GV.LUONG > 2000

-- Lấy ra giáo viên lớn hơn 50 tuổi  
-- YEAR -> Lấy ra năm của ngày
-- GETDATE -> Lấy ngày hiện tại
SELECT * FROM dbo.GIAOVIEN AS GV
WHERE  YEAR(GETDATE()) - YEAR(GV.NGSINH) > 50

-- Lấy ra họ tên giáo viên, năm sinh và tuổi của giáo viên nhỏ hơn 50
SELECT GV.HOTEN,GV.NGSINH, YEAR(GETDATE()) - YEAR(GV.NGSINH) AS N'TUOI' 
FROM dbo.GIAOVIEN AS GV
WHERE  YEAR(GETDATE()) - YEAR(GV.NGSINH) < 50

-- Lấy ra MaGV, tên GV và tên khoa của giáo viên đó làm việc.
SELECT GV.MAGV, GV.HOTEN, K.TENKHOA 
FROM dbo.GIAOVIEN AS GV, dbo.KHOA AS K, dbo.BOMON AS BM
WHERE GV.MABM = BM.MABM AND	BM.MAKHOA = K.MAKHOA

-- Lấy ra giáo viên là trưởng bộ môn
SELECT GV.* FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM 
WHERE GV.MAGV = BM.TRUONGBM

-- Đếm số lượng n  giáo viên  
-- COUNT (*) -> Đếm số lượng của tất cả record
-- COUNT (tên trương nào đó) -> Đếm số lương của tên trường nào đó
SELECT COUNT(MAGV) AS N'so luong giao vien' FROM dbo.GIAOVIEN

-- Đếm số lượng giáo người thân của giáo viên có mã GV là 007
SELECT COUNT(GV.MAGV) 
FROM dbo.GIAOVIEN AS GV, dbo.NGUOITHAN
WHERE GV.MAGV = NGUOITHAN.MAGV AND GV.MAGV = 007

-- Lấy ra tên giáo viên và tên đề tài người đó tham gia
SELECT GV.HOTEN,DT.TENDT FROM dbo.GIAOVIEN AS GV, dbo.DETAI AS DT,dbo.THAMGIADT AS TG
WHERE GV.MAGV = TG.MAGV AND TG.MADT = DT.MADT

-- BT 
-- 1. Xuất ra thông tin giáo viên và giáo viên quan lý chủ nhiệm của người đó
SELECT GV1.HOTEN, GV2.HOTEN FROM dbo.GIAOVIEN AS GV1, dbo.GIAOVIEN AS GV2
WHERE  GV1.GVQLCM = GV2.MAGV

-- 2. Xuất ra số lượng giáo viên của khoa công nghệ thông tin
SELECT COUNT(K.TENKHOA) AS N'SO LUONG GIAO VIEN'  
FROM dbo.KHOA AS K, dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
WHERE GV.MABM = BM.MABM 
AND BM.MAKHOA = K.MAKHOA 
AND K.TENKHOA= N'Công nghệ thông tin'

-- 3. Xuất ra thông tin giáo viên và đề tài người đó tham gia khi mà kết quả là đạt
SELECT GV.* FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TG
WHERE GV.MAGV = TG.MAGV AND TG.KETQUA = N'Đạt'