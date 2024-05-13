USE HowKteam
GO	

-- CURSOR
-- Cursor trong SQL Server được hiểu đơn giản là một công cụ cho phép chúng ta duyệt qua từng dòng của dữ liệu trong một tập dữ liệu. 
-- Khi có nhu cầu từng record của bảng. Với mỗi record có kết quả xử lý riêng thì dùng cursor

-- Declare <Tên con trỏ> cursor for <câu select>
-- Open <Tên con trỏ>

-- FETCH NEXT FROM <Tên con trỏ> INTO <Danh sách các biến tương ứng kết quả truy vấn>

-- WHILE @FETCH_STATUS = 0
-- BEGIN
-- Câu lệnh thực hiện
-- FETCH NEXT lại lần nữa
-- FETCH NEXT FROM <Tên con trỏ> INTO <Danh sách các biến tương ứng kết quả truy vấn >
-- END

-- CLOSE <tên con trỏ>
-- DEALLOCATE <tên con trỏ>

----------------------------------------------------------------------------------------------

-- Từ tuổi của giáo viên
-- Nếu lớn hơn 40 thì cho lương là 2500
-- Nếu nhỏ hơn 40 và lớn hơn 30 cho lương là 2000
-- Ngược lại thì lương là 1500

-- Lấy ra danh sách MaGV kèm tuổi đưa vào con trỏ có tên là GiaoVienCursor

-- ! Khai báo Cursor
DECLARE GiaoVienCursor CURSOR FOR SELECT MAGV, 
YEAR(GETDATE()) - YEAR(NGSINH) FROM dbo.GIAOVIEN

-- ! Mở cursor
OPEN GiaoVienCursor

DECLARE @MaGV CHAR(10)
DECLARE @Tuoi INT 

-- Lấy dữ liệu dòng đầu tiên
FETCH NEXT FROM GiaoVienCursor INTO @MaGV, @Tuoi

-- Duyệt qua từng dòng dữ liệu
WHILE @@FETCH_STATUS = 0
BEGIN	
	IF @Tuoi > 40
		BEGIN
		    UPDATE dbo.GIAOVIEN SET LUONG = 2500 WHERE MAGV = @MaGV
		END
	ELSE IF @Tuoi > 30
		BEGIN
		    UPDATE dbo.GIAOVIEN SET LUONG = 2000 WHERE MAGV = @MaGV
		END
	ELSE	
		BEGIN
		    UPDATE dbo.GIAOVIEN SET LUONG = 1500 WHERE MAGV = @MaGV
		END
	FETCH NEXT FROM GiaoVienCursor INTO	@MaGV, @Tuoi
END

CLOSE GiaoVienCursor
DEALLOCATE GiaoVienCursor


SELECT * FROM dbo.GIAOVIEN
