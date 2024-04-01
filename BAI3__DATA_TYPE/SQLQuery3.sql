-- Các kiểu dữ liệu hay dùng

-- int : kiểu số nguyên, tập hợp N.  VD : -9, 91000,...
-- float : kiểu số thực, tập hợp R.  VD : 10.2, 0.9, 10...
-- char : kiểu ký tự.(bộ nhớ cấp phát cứng, không viết tiếng việt)	VD: char(10)-> 10 ô nhớ này không ai được động vô Vd : a,b,c
-- varchar : Kiểu ký tự, ( không viết tiếng việt) bộ nhớ cấp phát động varchar(10) -> 10 ô nhớ chỉ được lấy khi có dữ liệu nằm ở trong. VD 'kteam' chỉ dùng 5 ô nhớ
-- nchar : n là unicode , có thể lưu tiêng việt
-- nvarchar : kiểu ký tự cấp phát động có thể lưu tiêng Việt
-- date : lưu trữ ngày, tháng, năm
-- time : lưu trữ giờ, phút, giây
-- BIT : lưu giá trị 0 và 1
-- text : lưu văn bản lớn
-- ntext : lưu văn bản có tiếng việt

CREATE TABLE test
(	
	MaSv CHAR(10), -- khai bao truong MaSv kieu char cap phat cung 10 o nho
	Doc NVARCHAR(100), -- khai bao truong Doc kieu nvarchar cap phat dong 50 o nho
	Birth DATE,
	Sex BIT
)