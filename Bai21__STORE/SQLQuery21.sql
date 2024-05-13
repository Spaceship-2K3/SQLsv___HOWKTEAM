USE HowKteam
GO	

-- Store PROCEDURE

-- Là chương trình hay thủ tục
-- Một Stored Procedure là bao gồm các câu lệnh Transact-SQL và được lưu lại trong cơ sở dữ liệu.
-- Ta có thể dùng Transact-SQL EXCUTE (EXEC) để thực thi các stored procedure
-- Stored procedure khác với các hàm xử lý là giá trị trả về của chúng
-- Không chứa trong tên và chúng không được sử dụng trực tiếp trong biểu thức

-- Động(Module hóa) : Có thể chỉnh sửa khối lệnh, tải sử dụng nhiều lần
-- Nhanh hơn : Tự phân tích cú pháp cho tối ưu. Và tạo bản sao để lần chạy sau không cần thực thi lại từ đầu
-- Bảo mật : Giới hạn quyền cho user nào sử dụng user nào không 
-- Giảm bandwidth : Với các gói transaction lớn. Vài ngàn dòng lệnh một lúc thì dùng store sẽ đảm bảo

/*
	CREATE PROC <Tên store>
	[Paramter nếu có ]
	AS
	BEGIN
		<Code xử lý>
	END
*/

CREATE PROC USP_TEST
@MaGV NVARCHAR(10), @Luong INT
AS
BEGIN
    SELECT * FROM dbo.GIAOVIEN WHERE MAGV = @MaGV AND LUONG = @Luong
END

GO 

-- Cách sử dụng
-- C1 :
EXEC dbo.USP_TEST @MaGV = N'', -- nvarchar(10)
                  @Luong = 0   -- int

EXECUTE dbo.USP_TEST @MaGV = N'', -- nvarchar(10)
                     @Luong = 0   -- int

-- C2 : 
EXEC dbo.USP_TEST N'', 0 

EXECUTE dbo.USP_TEST  N'', 0

GO 

-- Nên dùng GO để ngăn cách các khối lệnh
CREATE PROC USP_SelectAllGiaoVien
AS SELECT * FROM dbo.GIAOVIEN

EXEC dbo.USP_SelectAllGiaoVien

