-- Tìm kiếm gần đúng
-- Like có nghĩa là tồn tại thằng đó
USE HowKteam
GO

-- Xuất ra thông tin giáo viên mà tên bắt đầu có chữ l
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE 'l%'

-- Xuất ra thông tin giáo viên kết thúc bằng chữ n
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE '%n'

-- Xuất ra thông tin giáo viên có tồn tại chữ n
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE '%n%'

-- Xuất ra thông tin giáo viên có tồn tại chữ ế
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE N'%ế%'

----------------------------------------------------------------------------------------------------------------------------------------------------

-- INNER JOIN
-- inner join -> kiểu cũ
-- mỗi join đều cần 1 điều kiện
SELECT * 
FROM dbo.GIAOVIEN,dbo.BOMON
WHERE dbo.BOMON.MABM = dbo.GIAOVIEN.MABM


-- inner join -> kiểu mới
 SELECT * 
 FROM dbo.GIAOVIEN INNER JOIN dbo.BOMON 
 ON BOMON.MABM = GIAOVIEN.MABM

-- có thể viết tắt INNER JOIN -> JOIN
 SELECT * 
 FROM dbo.GIAOVIEN   JOIN dbo.BOMON 
 ON BOMON.MABM = GIAOVIEN.MABM


 ----------------------------------------------------------------------------------------------------------------------------------------------------


-- FULL OUTER JOIN
SELECT * FROM dbo.GIAOVIEN, dbo.BOMON
WHERE dbo.BOMON.MABM = dbo.GIAOVIEN.MABM

-- FULL OUTER JOIN : gom 2 bảng lại theo điều kiện,trả ra kết quả bảng mà trường nào k giông nhau sẽ trả về null -> hiếm khi sd
SELECT * FROM dbo.GIAOVIEN FULL OUTER JOIN dbo.BOMON
ON dbo.BOMON.MABM = dbo.GIAOVIEN.MABM

-- Cross join là tổ hợp mỗi record của bảng A với mỗi all record của bảng B
SELECT * FROM dbo.GIAOVIEN CROSS JOIN dbo.BOMON


----------------------------------------------------------------------------------------------------------------------------------------------------

-- left join
-- bảng bên phải nhập vào bảng bên trái
-- record nào bảng phải không có thì để null
-- record nào bảng trái không có thì không điền vào
SELECT * FROM dbo.GIAOVIEN LEFT JOIN dbo.BOMON
ON BOMON.MABM = GIAOVIEN.MABM

-- right join
SELECT * FROM dbo.GIAOVIEN right JOIN dbo.BOMON
ON BOMON.MABM = GIAOVIEN.MABM

----------------------------------------------------------------------------------------------------------------------------------------------------

-- UNION : liên hợp, hai bảng riêng biệt kết hợp lại
/*
	 Theo đó, khi sử dụng lệnh SELECT union sql,
	 cho phép người dùng kết hợp kết quả của hai hoặc nhiều lệnh SELECT mà không 
	 trả về bất cứ bản ghi trùng lặp nào (do chức năng của lệnh này là kết hợp lai các kiểu dữ 
	 liệu có cấu trúc giống nhau từ nhiều bảng thành một nhưng loại bỏ các cơ sở dữ liệu trùng nhau).

*/

 
SELECT MAGV FROM dbo.GIAOVIEN
WHERE LUONG < 2000
UNION
SELECT MAGV FROM dbo.NGUOITHAN
WHERE PHAI = N'Nữ'

----------------------------------------------------------------------------------------------------------------------------------------------------

-- SELECT INTO

/*
	SELECT INTO là một câu lệnh dùng để tạo 
	mới một bảng và sao chép dữ liệu từ một hoặc nhiều bảng có sẵn
*/

-- Lấy hết dữ liệu của bảng gv đưa vào bảng mới tên là TableA
-- Bảng này có các record tương ứng như bảng GV
SELECT * INTO TableA
FROM dbo.GIAOVIEN
SELECT * FROM dbo.TableA

-- Lấy hết dữ liệu của bảng gv đưa vào bảng mới tên là TableB
-- Bảng này có các record tương ứng như bảng GV
-- Có một cột dữ liệu là HoTen tương ứng như bảng GV 
SELECT HOTEN INTO TableB
FROM dbo.GIAOVIEN

SELECT * FROM dbo.TableB

-- Lấy hết dữ liệu của bảng gv đưa vào bảng mới tên là TableC
-- Bảng này có các record tương ứng như bảng GV
-- Với điều kiện lương > 2000
SELECT * INTO TableC
FROM dbo.GIAOVIEN
WHERE LUONG > 2000

SELECT * FROM dbo.TableC

-- Tạo ra nhiều bảng backup bảng GV đưa vào DB backup.db
SELECT MAGV, HOTEN INTO BackupGV
FROM dbo.GIAOVIEN, dbo.BOMON
WHERE dbo.BOMON.MABM = dbo.GIAOVIEN.MABM

SELECT * FROM dbo.BackupGV

-- Tạo ra một bảng mà GVBK y chang nhưng không có dữ liệu
SELECT * into GVBK
FROM dbo.GIAOVIEN
WHERE 6 > 9


----------------------------------------------------------------------------------------------------------------------------------------------------

-- INSERT INTO SELECT : coppy dữ liệu vào bảng đã tồn tại

SELECT * INTO CloneGV
FROM dbo.GIAOVIEN
WHERE 1 =0
go
INSERT INTO dbo.CloneGV
SELECT * FROM dbo.GIAOVIEN