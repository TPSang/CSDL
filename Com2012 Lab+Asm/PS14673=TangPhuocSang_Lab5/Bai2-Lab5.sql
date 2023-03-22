-- lab5.2a. Hiển thị số lượng khách hàng có trong bảng khách hàng
select count(*) as 'số lượng KH'
from khachhang;
-- lab5.2b. Hiển thị đơn giá lớn nhất trong bảng SanPham
select max(dongia) as 'đơn giá lớn nhất'
from sanpham;
-- lab5.2c. Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
select min(soLuong) as 'số lượng thấp nhất'
from sanpham;
-- lab5.2d. Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
select SUM(soLuong) as'tổng số lượng'
from sanpham;
-- lab5.2e. Hiển thị số hoá đơn đã xuất trong tháng 12/2016 mà có trạng thái chưa thanh toán
select count(*) as 'số HD chưa thanh toán trong tháng 12-2019'
from hoadon
where trangthai = 'chưa thanh toán' and
      Ngaymuahang between '2019-12-01' and '2019-12-31';
-- lab5.2f. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn.
select mahoadon , count(masanpham) as'số loại sản phẩm'
from hoadonchitiet
group by mahoadon;
-- lab5.2g. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu 
-- chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
select maHoaDon as 'maHoaDon', count(maSanPham) as'số loại sản phẩm'
from hoadonchitiet
group by maHoaDon
having count(maSanPham) >=5;
-- lab5.2h. Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang, 
-- maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang
select maHoaDon, ngayMuaHang, maKhachHang
from hoadon
order by ngayMuaHang DESC ;