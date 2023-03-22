

-- 1. TẠO CSDL PS14673_LAB4
CREATE DATABASE PS14673_LAB4;

-- 2. TẠO BẢNG VANPHONG
CREATE TABLE VANPHONG
(
   MaVP int primary key,
   TenVP varchar(50) not null,
   DiaChi varchar(100) not null
);
-- 3. TẠO BẢNG CHUSOHUU
CREATE TABLE CHUSOHUU
(
   MaCSH int primary key,
   HoTen varchar(50) not null,
   DienThoai varchar(15) not null,
   DiaChi varchar(50) not null
);  
-- 4. TẠO BẢNG BATDONGSAN
CREATE TABLE BATDONGSAN
( 
   MaBDS int primary key,
   DiaChi varchar(50) not null,
   MaCSH int references CHUSOHUU(MaCSH),
   MaVP int references VANPHONG(MaVP)
);
-- 5. TẠO BẢNG NHANVIEN
CREATE TABLE NHANVIEN
(
   MaNV int primary key,
   TenNV varchar(50) not null,
   DiaChi varchar(50) not null,
   Email varchar(50) not null,
   DienThoai varchar(15),
   MaVP int references VANPHONG(MaVP)
);   
-- 6. TẠO BẢNG THANNHAN
CREATE TABLE THANNHAN
(
   MaTN int primary key,
   HoTen varchar(50) not null,
   NgaySinh date not null,
   MoiQuanHe varchar(50),
   MaNV int references NHANVIEN(MaNV)
);
   
