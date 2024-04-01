USE HowKteam
GO	
-- Group by : Lệnh Group by trong SQL Server được dùng để sắp xếp dữ liệu giống hệt nhau theo các nhóm với sự trợ giúp của một số hàm khác.
-- Để làm được điều này trong SQL, chúng ta có thể sử dụng câu lệnh GROUP BY.
-- cột hiển thị phải là thuộc tính nằm trong khối group by hoặc là Agreegate function

-- Xuất ra danh sách tên bộ môn và số lượng giáo viên của bộ môn đó 
-- gom nhóm,  xuất ra từng thằng
-- do COUNT(*) nó k chạy liên tục chạy 1 lần là hết luôn, nó k ra từng thằng và từng dòng

-- ! GROUP BY
SELECT TENBM , COUNT(*) AS N'Số lượng giáo viên' FROM dbo.BOMON, dbo.GIAOVIEN
WHERE dbo.BOMON.MABM = dbo.GIAOVIEN.MABM
GROUP BY TENBM 
 

-- Lấy ra danh sách giáo viên có lương > lương trung bình của giáo viên
-- Lương trung bình = tổng lương / số lượng
SELECT * FROM dbo.GIAOVIEN
WHERE LUONG > (SELECT SUM(LUONG) / COUNT(MAGV) FROM dbo.GIAOVIEN)

-- Xuất ra tên giáo viên và số lượng công việc giáo viên đó làm
SELECT GV.HOTEN,COUNT(TG.MADT) FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TG
WHERE GV.MAGV = TG.MAGV
GROUP BY GV.HOTEN

/*
	1. Xuất ra tên giáo viên và số lượng người thân của GV đó
	2. Xuất ra tên giáo viên và số lượng đề tài đã hoàn thành mà giáo viên đó đã tham gia
	3. Xuất ra tên khoa có tổng số lương của giáo viên trong khoa là lớn nhất
*/
-- 1. Xuất ra tên giáo viên và số lượng người thân của GV đó
SELECT GV.HOTEN ,  COUNT(GV.MAGV) FROM dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT
WHERE GV.MAGV = NT.MAGV
GROUP BY GV.HOTEN 

-- 2. Xuất ra tên giáo viên và số lượng đề tài đã hoàn thành mà giáo viên đó đã tham gia
SELECT GV.HOTEN, COUNT(TG.KETQUA) FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TG
WHERE GV.MAGV = TG.MAGV AND TG.KETQUA = N'Đạt'
GROUP BY GV.HOTEN

-- 3. Xuất ra tên khoa có tổng số lương của giáo viên trong khoa là lớn nhất

SELECT TOP(1) K.TENKHOA, SUM(GV.LUONG) AS N'TONG LUONG' FROM dbo.KHOA AS K, dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
WHERE K.MAKHOA = BM.MAKHOA AND GV.MABM = BM.MABM
GROUP BY K.TENKHOA

/**	Agreegate Function  

	AVG()	-> RETURN THE AVERAGE VALUE
	COUNT()	-> RETURN THE NUMBER OF ROWS
	FIRST()	-> RETURN THE FIRST VALUE
	LAST()	-> RETURN THE LAST VALUE
	MAX()	-> RETURN THE LARGEST VALUE
	MIN()	-> RETURN THE SMALLEST VALUE
	ROUND()	-> RETURN THE A NUMERIC FIELD TO THE NUMBER OF DECIMALS SPECIFIED
	SUM()	-> RETURN THE SUM
*/

/** STRING FUNCTION
	CHARINDEX	Searches an expression in a string expression and returns its starting position if found
	CONCAT()	 
	LEFT()	 
	LEN() / LENGTH()	Returns the length of the value in a text field
	LOWER() / LCASE()	Converts character data to lower case
	LTRIM()	 
	SUBSTRING() / MID()	Extract characters from a text field
	PATINDEX()	 
	REPLACE()	 
	RIGHT()	 
	RTRIM()	 
	UPPER() / UCASE()	Converts character data to upper case
*/


-- ! GROUP BY - HAVING
-- having giông như where của select nhưng giành cho group by
-- having là where của group by

-- Xuất ra số lượng giáo viên trong từng bộ môn mà số giáo viên > 2
SELECT dbo.BOMON.MABM,COUNT(*) FROM dbo.BOMON , dbo.GIAOVIEN
WHERE dbo.BOMON.MABM = dbo.GIAOVIEN.MABM
GROUP BY dbo.BOMON.MABM
HAVING COUNT(*) > 2

-- Xuất ra mức lương và tổng tuổi của giáo viên nhận mức lương đó
-- và có người thân
-- và tuổi phải lớn hơn tuổi trung bình
SELECT LUONG, SUM( YEAR(GETDATE() - YEAR(dbo.GIAOVIEN.NGSINH))) FROM dbo.GIAOVIEN , dbo.NGUOITHAN
WHERE dbo.GIAOVIEN.MAGV = dbo.NGUOITHAN.MAGV
AND dbo.GIAOVIEN.MAGV IN (SELECT MAGV FROM dbo.NGUOITHAN )
GROUP BY LUONG
HAVING YEAR(GETDA)