USE LEARN
GO

ALTER TABLE dbo.HOCSINH ADD NgaySinh DATE
GO

-- Thêm dữ liệu
-- Kiểu số -> số bình thường
-- Kiểu ký tự hoặc ngày cần để trong cặp nháy đơn
-- Nếu là unicode thì cần có N phía trước cặp nháy đơn N''
-- Thứ tự này là đúng nếu đổi chỗ thì phải đổi lại chỗ values cho nó đúng 
 
CREATE TABLE test(
	MaSo INT,
	Ten NVARCHAR(30),
	NgaySinh DATE,
	GioiTinh BIT,
	DiaChi CHAR(20),
	TienLuong FLOAT
)
GO
-- Insert dữ liệu theo thứ tự của bảng
INSERT dbo.test
-- có thể xóa dòng này đi nhưng phải đúng thứ tự khi khai báo
(
    MaSo,
    Ten,
    NgaySinh,
    GioiTinh,
    DiaChi,
    TienLuong
)
VALUES
(   1,         -- MaSo - int 
    N'DaoVanSang',   -- Ten - nvarchar(10) (Nếu nhiều hơn 10 ô nhớ sẽ gây lỗi)
    '20031021', -- NgaySinh - date
    1,      -- GioiTinh - bit - true
    'Yên Mỹ, Hưng Yên',        -- DiaChi - char(20) - sẽ lỗi
    1000        -- TienLuong - float
    )
GO	
-- Insert dữ liệu với trường mong muốn, insert multiple data
INSERT INTO dbo.test 
VALUES
(2,  N'Quang', '20030910', 0, 'Bac Ninh', 1000 ),
(3 ,N'lam','20030910',0,'Bac Ninh',1000  ),
(4 , N'dat', '20030910', 0, 'Bac Ninh',1000),
(5 , N'Nguyen Van', '19900520', 1, N'Hanoi', 1500),
(6 , N'Tran Thi', '19850815', 0, N'Ho Chi Minh', 1200),
(7, N'Le Van', '19990228', 1, N'Da Nang', 1800),
(8, N'Pham Thi', '19801110', 0, N'Hai Phong', 2000),
(9, N'Vo Van', '19950418', 1, N'Can Tho', 1300),
(10, N'Nguyen Thi F', '19880722', 0, N'Bien Hoa', 1600),
(11, N'Tran Van G', '19930905', 1, N'Vung Tau', 1400),
(12, N'Le Thi H', '19821230', 0, N'Hue', 1700),
(13, N'Pham Van I', '19980314', 1, N'Quang Ninh', 1100),
(14, N'Truong Van K', '19910625', 1, N'Long An', 1900),
(16, N'Tran Van L', '19940808', 1, N'Phu Yen', 1200),
(17, N'Nguyen Thi M', '19870125', 0, N'Nha Trang', 1800),
(18, N'Le Van N', '19960612', 1, N'Quy Nhon', 1400),
(19, N'Pham Thi P', '19810930', 0, N'Dien Bien', 2000),
(20, N'Ho Van Q', '19970314', 1, N'Sa Pa', 1100),
(21, N'Dinh Van R', '19900520', 1, N'Bac Giang', 1500),
(22, N'Mai Thi S', '19881122', 0, N'Phan Thiet', 1600),
(23, N'Nguyen Van T', '19930405', 1, N'Vinh', 1400),
(24, N'Tran Thi U', '19821215', 0, N'Tuy Hoa', 1700),
(25, N'Le Van V', '19980228', 1, N'Kon Tum', 1300),
(26, N'Pham Van X', '19910710', 1, N'Son La', 1900),
(27, N'Vo Thi Y', '19850918', 0, N'Bac Lieu', 1600),
(28, N'Dao Van Z', '19960322', 1, N'Dong Thap', 1400),
(29, N'Truong Van BB', '19800530', 1, N'Ca Mau', 2000),
(30, N'Dinh Van CC', '19970814', 0, N'Thanh Hoa', 1100),
(31, N'Nguyen Van DD', '19921125', 1, N'Tien Giang', 1700),
(32, N'Le Thi EE', '19860218', 0, N'Vinh Long', 1300),
(33, N'Pham Van FF', '19930605', 1, N'Quang Binh', 1800),
(34, N'Tran Van GG', '19890930', 0, N'Bac Kan', 1600),
(35, N'Nguyen Thi HH', '19950412', 1, N'Lam Dong', 1500)

GO

-- Xóa dữ liệu
-- Nếu chỉ Delete <Tên bảng> => xóa toàn bộ dữ liệu trong bảng
-- Xóa trường mong muốn dùng thêm where
-- Các toán tử : <, >, <=, =>, <>, AND, OR, =
DELETE dbo.test WHERE TienLuong < 1200 
DELETE dbo.test WHERE GioiTinh = 0 AND	MaSo = 3

-- Update 
-- update dữ liệu toàn bộ bảng với một trường update
UPDATE dbo.test SET TienLuong = 100000

-- update dữ liệu toàn bộ bảng bởi nhiều trường update
UPDATE dbo.test SET TienLuong  = 1, DiaChi = 'diachi'

-- update dữ liệu của trường mong muốn
UPDATE dbo.test SET TienLuong = 1000 WHERE GioiTinh = 1
