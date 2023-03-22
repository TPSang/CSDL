create database qlbh;
use qlbh;
create table hoaDon(
maHoaDon int primary key,
ngayMuaHang date not null,
maKhachHang varchar(5) not null,
trangThai varchar(30) not null
);
create table khachHang(
maKhachHang varchar(5) primary key,
hoVaTenLot tinytext not null,
Ten tinytext not null,
diaChi text,
dienThoai tinytext not null,
Email tinytext
);
create table hoaDonChiTiet(
maHoaDon int,
maSanPham int,
soLuong int not null,
maHoaDonChiTiet int primary key
);
create table sanPham(
maSanPham int primary key,
moTa varchar(225),
soLuong int not null,
donGia float not null,
tenSanPham varchar(45)
);

ALTER TABLE hoaDonChiTiet
add constraint FK_hoaDonChiTiet_hoaDon
foreign key(maHoaDon)
references hoaDon(maHoaDon),
add constraint FK_hoaDonChiTiet_sanPham
foreign key(maSanPham)
references sanPham(maSanPham);

ALTER TABLE hoaDon
add constraint FK_hoaDon_khachHang
foreign key(maKhachHang)
references khachHang(maKhachHang);

-- dl bảng khachHang --
insert into khachHang
values
-- BÀI 1 --

-- a --
select*
From khachhang;
-- b --
Select maKhachHang, concat(hoVaTenLot,' ',Ten) AS"hoVaTen", Email, dienThoai
from khachHang limit 10;
-- c --
select maSanPham, tenSanPham, soLuong*donGia as "tongTienKho"
from sanpham;
-- d --
select maKhachHang, concat(hoVaTenLot,' ',Ten) as 'hoVaTen', diaChi
from khachHang
where Ten like 'H%';
-- e --
select*
from khachHang
where diaChi like '%Đà Nẵng%';
-- f --
select*
from sanpham
where soLuong between 100 and 500;
-- g -- 
select* 
from hoadon
where trangThai = "Chưa thanh toán" and 
	  ngayMuaHang between '2019-01-01' and '2019-12-31';
-- h --
select*
from hoadon
where maKhachHang in ('KH001','KH003','KH006');