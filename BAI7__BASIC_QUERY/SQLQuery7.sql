USE HowKteam
GO	

-- Lưu ý chạy script query trước khi chạy thử script này

-- cấu trúc truy vấn
-- Lấy hết tất cả dữ liệu bảng bộ môn
SELECT * FROM dbo.BOMON

-- Lấy Mã đề tài + tên đề tài trong bảng bộ môn
SELECT MABM, TENBM FROM dbo.BOMON

-- Đổi tên cột hiển thị
SELECT  MABM AS	'1', TENBM AS	'2' FROM dbo.BOMON

-- Truy vấn 1 lúc 2 table
SELECT * FROM dbo.GIAOVIEN, dbo.KHOA -- tổ hợp với từng 10 cặp

-- Xuất ra mã giáo viên + tên + tên bộ môn giáo viên đó dạy (AS như alias, đích danh table đó)
SELECT GV.MAGV, GV.HOTEN, BM.TENBM  
FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM

-- BT
-- 1. Truy xuất thông tin của bảng Tham gia đề tài
SELECT * FROM dbo.DETAI

-- 2. Lấy ra Mã Khoa và tên khoa tương ứng
SELECT MAKHOA,TENKHOA FROM dbo.KHOA

-- 3. Lấy ra MaGV, tên GV và họ tên người thân tương ứng
SELECT GV.MAGV, GV.HOTEN, NT.TEN AS N'Ten Nguoi Than' 
FROM dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT
WHERE GV.MAGV = NT.MAGV

-- 4. Lấy ra MaGV, tên GV và tên khoa của giáo viên đó làm việc. Gợi ý : bộ môn nằm trong khoa
SELECT GV.MAGV, GV.HOTEN, K.TENKHOA  
FROM dbo.GIAOVIEN AS GV,dbo.KHOA AS K,dbo.BOMON AS BM
 