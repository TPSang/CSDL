------------------- CREATE DATABASE -------------------
CREATE DATABASE QLXUATKHO_COM1012;
USE QLXUATKHO_COM1012;
------------------- CREATE TABLE -------------------
CREATE TABLE LOAIHANG(
	MALOAI CHAR(4) NOT NULL,
    TENLOAI VARCHAR(100) NOT NULL,
    PRIMARY KEY(MALOAI)
);
CREATE TABLE HANGHOA(
	MAHH CHAR(4) NOT NULL,
    TENHH VARCHAR(30) NOT NULL,
    DONVT VARCHAR(15) NOT NULL,
    DONGIA DOUBLE NOT NULL,
    LOAI CHAR(4) NOT NULL,
    PRIMARY KEY(MAHH),
    FOREIGN KEY(LOAI) REFERENCES LOAIHANG(MALOAI)
);
CREATE TABLE CUAHANG(
	MACH CHAR(4) PRIMARY KEY NOT NULL,
    TENCH VARCHAR(120) NOT NULL,
    DIACHI VARCHAR(50) NOT NULL,
    SODT VARCHAR(15) NOT NULL,
    EMAIL VARCHAR(20),
    NGUOIDD VARCHAR(30)
);
CREATE TABLE PHIEUXUAT(
	SOPHIEU CHAR(5) NOT NULL,
    NGAYLAP DATE NOT NULL,
    NGAYXUAT DATE,
    MACH CHAR(4) NOT NULL,
    PRIMARY KEY(SOPHIEU),
    FOREIGN KEY(MACH) REFERENCES CUAHANG(MACH)
);
CREATE TABLE CTPHIEUXUAT(
	SOPHIEU CHAR(5) NOT NULL,
    MAHH CHAR(4) NOT NULL,
    SOLUONG INT NOT NULL,
    GHICHU VARCHAR(50),
    PRIMARY KEY(SOPHIEU, MAHH),
    FOREIGN KEY(SOPHIEU) REFERENCES PHIEUXUAT(SOPHIEU),
    FOREIGN KEY(MAHH) REFERENCES HANGHOA(MAHH)
);

------------------- INSERT INTO -------------------
INSERT INTO CUAHANG(MACH,TENCH,DIACHI,SODT,EMAIL,NGUOIDD) VALUES
	('CH01', 'Vân Thanh Fashion – Chi nhánh Quận 5','123 Nguyễn Trãi, Quận 5, Tp.HCM','0909099099','thanhtt@gmail.com','Trần Tuấn Thành'),
    ('CH02', 'Vân Thanh Fashion – TTTM AERON TÂN PHÚ','30 Bờ Bao Tân Thắng, Quận Tân Phú, Tp.HCM','0909099099','areontp@gmail.com','Nguyễn Thành Công'),
    ('CH03', 'Vân Thanh Fashion – Chi nhánh Quận 3','123 Nguyễn Trãi, Quận 5, Tp.HCM','0862887733','huongnk@gmail.com','Nguyễn Kim Hương'),
    ('CH04', 'Vân Thanh Fashion – Chi nhánh Vũng Tàu','123 Nguyễn Trãi, Quận 5, Tp.HCM','0909099099','thanhdt@gmail.com','Đỗ Thị Thanh'),
    ('CH05', 'Vân Thanh Fashion – Chi nhánh Hà Nội','123 Nguyễn Trãi, Quận 5, Tp.HCM','0909099099',null,'Trần Quốc Hậu');

INSERT INTO LOAIHANG(MALOAI,TENLOAI) VALUES
	('TTNA','Thời trang Nam công sở'),
    ('TTNU','Thời trang Nữ công sở'),
    ('DPHS','Đồng phục học sinh'),
    ('TTTE','Thời trang Trẻ em'),
    ('TTTN','Thời trang trung niên'),
    ('PKTT','Phụ kiện thời trang');

INSERT INTO HANGHOA(MAHH,TENHH,DONVT,DONGIA,LOAI) VALUES
	('AK01','Áo khoát KaKi nữ hàn Quốc','Cái',285000,'TTNU'),
    ('AK02','Áo khoát nữ dáng dài','cái',675000,'TTNU'),
    ('SM01','Áo sơ mi nam','Cái',315000,'TTNA'),
    ('SM02','Sơ mi ngắn tay cổ trụ','Cái',285000,'TTNA'),
    ('DA01','Đầm caro công sở','Cái',252000,'TTNU'),
    ('DP01','Đồng phục học sinh','Bộ',180000,'DPHS'),
    ('DP02','Đồng phục học sinh THCS','Bộ',220000,'DPHS'),
    ('BO01','Bộ thun trẻ em','Bộ',280000,'TTTE'),
    ('AO01','Áo thun bé trai ngắn tay','Cái',85000,'TTTE'),
    ('AO02','Áo khoát lửng trẻ em cao cấp','Cái',320000,'TTTE');

INSERT INTO PHIEUXUAT(SOPHIEU,NGAYLAP,NGAYXUAT,MACH) VALUES
	('PX011','2021-07-06','2021-07-12','CH01'),
    ('PX012','2021-07-12','2021-07-20','CH02'),
    ('PX013','2021-08-04','2021-08-20','CH05'),
    ('PX021','2021-08-09','2021-08-20','CH01'),
    ('PX022','2021-08-22','2021-09-20','CH01'),
    ('PX023','2021-09-06','2021-09-20','CH02'),
    ('PX024','2021-09-13','2021-09-20','CH05'),
    ('PX025','2021-09-16','2021-09-25','CH01'),
    ('PX031','2021-10-15',null,'CH01'),
    ('PX032','2021-01-15',null,'CH02'),
    ('PX033','2021-12-15',null,'CH01');

INSERT INTO CTPHIEUXUAT(SOPHIEU,MAHH,SOLUONG,GHICHU) VALUES
	('PX021','DA01',20,'Đủ size'),
    ('PX021','AO02',20,null),
    ('PX025','SM01',30,''),
    ('PX025','AK01',10,'Nhiều màu'),
    ('PX025','DP01',100,'Áo + Váy'),
    ('PX031','BO01',30,null),
    ('PX032','DP01',200,'Áo + Váy'),
    ('PX032','DP02',200,null),
    ('PX033','AO02',10,null),
    ('PX033','BO01',50,null),
    ('PX033','AO01',20,'Size 16-20'),
    ('PX033','AK01',12,'Màu Xanh, Hồng, Tím'); 
    
    -- --------------------------------
    
-- Y6. Viết các câu truy vấn sau:
-- 6.1. Hiển thị tất cả mặt hàng. Danh sách sắp xếp theo đơn giá tăng dần.
select *
from hang hoa
order by dongia asc;

-- 6.2. Hiển thị tất cả các mặt hàng thuộc loại hàng “Thời trang”. Thông tin gồm: mã mặt hàng, tên mặt hàng, đơn vị tính, qui cách, đơn giá, loại hàng.
select maHH, TenHH, donVT, dongia, loaihang.maLoai
from loaihang, hanghoa
where loaihang.maloai = hanghoa.loai
and loaihang.tenloai like "Thời Trang%";
-- cách 2
select maHH, TenHH, donVT, dongia, a.maLoai
from loaihang a, hanghoa b
where a.maloai = b.loai
and a.tenloai like "Thời Trang%";
-- 6.3. Thống kê số mặt hàng theo loại hàng, thông tin gồm: mã loại hàng, tên loại hàng, tổng số mặt hàng. Danh sách sắp xếp theo tổng số mặt hàng giảm dần.
select maLoai, TenLoai, count(maHH) as 'Tổng số hàng hóa'
from loaihang, hanghoa
where loaihang.maloai = hanghoa.loai
group by maLoai, TenLoai
order by count(maHH) desc;
-- 6.4. Liệt kê số phiếu xuất, ngày xuất hàng, tên cửa hàng, mã mặt hàng, tên mặt hàng, tên loại hàng, số lượng, đơn giá, thành tiền.
select phieuxuat.SOPHIEU, phieuxuat.NGAYXUAT, cuahang.TENCH,hanghoa.MAHH, hanghoa.TenHH, hanghoa.LOAI, ctphieuxuat.SOLUONG, hanghoa.DONGIA, ctphieuxuat
from ctphieuxuat,hanghoa,cuahang,phieuxuat
where hanghoa.MAHH = ctphieuxuat.MAHH
and cuahang.MACH = phieuxuat.MACH
and phieuxuat.SOPHIEU = ctphieuxuat.SOPHIEU;
-- 6.5 Thống kế tổng thành tiền hàng đã xuất mỗi tháng trong năm 2021 theo cửa hàng, 
-- thông tin gồm: tháng/năm, tên cửa hàng, tổng thành tiền.
select phieuxuat.NgayXuat as "ngay Xuat", cuahang.TenCH as "Ten Cua Hang", sum((ctphieuxuat.SoLuong * hanghoa.DonGia)) as 'Tong Thanh Tien' 
from ctphieuxuat, hanghoa, phieuxuat, cuahang
where phieuxuat.NgayXuat between '2020-12-31' and '2022-01-01'
and ctphieuxuat.MaHH = hanghoa.MaHH and
 phieuxuat.MaCH = cuahang.MaCH and
 phieuxuat.SoPhieu = ctphieuxuat.SOPHIEU;
 -- 6.6 Liệt kê 5 mặt hàng có số lượng xuất kho nhiều nhất trong tháng 10 năm 2021.
SELECT C.MaHH, TenHH, sum(A.SoLuong) as"so Lượng Xuất"
from ctphieuxuat A, phieuxuat B, hanghoa C
where C.MaHH= A.MaHH and B.SoPhieu = A. SOPHIEU and NgayXuat between '2021-09-30' and '2021-11-01'
group by C.MaHH
order by SUM(A. SoLuong) DESC
LIMIT 5;
-- cho dữ liệu thiếu nên lấy hết trong năm 2021
SELECT C.MaHH, TenHH, sum(A.SoLuong) as"Số Lượng Xuất"
from ctphieuxuat A, phieuxuat B, hanghoa C
where C.MaHH= A.MaHH and B.SoPhieu = A. SOPHIEU and NgayXuat between '2021-01-01' and '2021-12-31'
group by C.MaHH
order by SUM(A. SoLuong) DESC
LIMIT 5;
 ('PX029', 'KH005', '120', 'Áo + quần');



-- 6.1
select * from hanghoa
order by dongia asc;

-- 6.2
select mahh,tenhh,donvitinh,dongia,hh.maloai from hanghoa hh
inner join loaihang lh on hh.maloai = lh.maloai and tenloai like '%Thời trang%';

-- 6.3
select hh.maloai,tenloai,count(hh.maloai) as 'Tổng mặt hàng'
from hanghoa hh inner join loaihang lh
on hh.maloai = lh.maloai
group by maloai,tenloai
order by count(hh.maloai) desc;

-- 6.4
select ctpx.sophieu,ngayxuat,ch.tench,ctpx.mahh,tenhh,tenloai,soluong,dongia,dongia * soluong as 'Thành tiền'
from cuahang ,ctphieuxuat ctpx inner join phieuxuat px on px.sophieu = ctpx.sophieu
inner join hanghoa hh on hh.mahh = ctpx.mahh
inner join loaihang lh on lh.maloai = hh.maloai
inner join cuahang ch on ch.mach = px.mach
group by ctpx.sophieu, ngayxuat, tench, ctpx.mahh, tenhh, tenloai, soluong, dongia;

-- 6.5
select concat(month(ngayxuat),'/',year(ngayxuat)) as 'Tháng/Năm',tench,	sum(dongia*soluong) as 'Tổng thành tiền'
from phieuxuat px inner join ctphieuxuat ctpx on px.sophieu = ctpx.sophieu
inner join hanghoa hh on hh.mahh = ctpx.mahh
inner join cuahang ch on ch.mach = px.mach
where year(ngayxuat)=2021
group by concat(month(ngayxuat),'/',year(ngayxuat)) ,tench;

-- 6.6
select tenhh ,sum(soluong) as 'Tổng sô lượng'from  ctphieuxuat ctpx
inner join hanghoa hh on ctpx.mahh = hh.mahh
inner join phieuxuat px on px.sophieu = ctpx.sophieu
where month(ngayxuat)=10 and year(ngayxuat)=2021
group by tenhh 
order by sum(soluong) desc
limit 5;

-- 6.7
select tench, count(ch.mach) as 'Số lần nhập', sum(dongia*soluong) as 'Số tiền thanh toán'
from ctphieuxuat ctpx inner join phieuxuat px on ctpx.sophieu = px.sophieu
inner join cuahang ch on ch.mach = px.mach and ch.diachi = 'Quận 3'
inner join hanghoa	hh on hh.mahh=ctpx.mahh;

-- 6.8
select ngayxuat, count(ch.mach) as 'Tổng số lần xuất', sum(dongia*soluong) as 'Tổng thành tiền'
from ctphieuxuat ctpx inner join phieuxuat px on ctpx.sophieu = px.sophieu
inner join cuahang ch on ch.mach = px.mach 
inner join hanghoa	hh on hh.mahh=ctpx.mahh
group by ngayxuat;

-- 6.9
update phieuxuat
set ngayxuat = curdate()
where ngayxuat is null;
SET SQL_SAFE_UPDATES = 0;

-- 6.10
update hanghoa
set dongia = dongia - dongia*0.1
where maloai in (
select maloai from loaihang 
where tenloai = 'Đồng phục học sinh'
);

-- 6.11
delete from cuahang
where mach not in (
 select mach from phieuxuat
);

-- 6.12
select tenhh ,sum(soluong) as 'Tổng số lượng'from  ctphieuxuat ctpx
inner join hanghoa hh on ctpx.mahh = hh.mahh
inner join phieuxuat px on px.sophieu = ctpx.sophieu
group by tenhh
having sum(soluong)<= all(
select  sum(soluong) as 'Tổng số lượng'from  ctphieuxuat ctpx
inner join hanghoa hh on ctpx.mahh = hh.mahh
inner join phieuxuat px on px.sophieu = ctpx.sophieu
group by tenhh);

-- 6.13
select mahh,tenhh,maloai from hanghoa
where mahh not in(
select hh.mahh from ctphieuxuat ctpx
 -- 6.8 Thống kê sô lượng hàng xuất kho theo ngày, thông tin hiển thị: Ngày xuất hàng, tổng số lần xuất hàng, tổng thành tiền.
select ngayxuat, count(ch.mach) as 'Tổng số lần xuất', sum(dongia*soluong) as 'Tổng thành tiền'
from ctphieuxuat ctpx inner join phieuxuat px on ctpx.sophieu = px.sophieu
inner join cuahang ch on ch.mach = px.mach 
inner join hanghoa	hh on hh.mahh=ctpx.mahh
group by ngayxuat;
 -- 6.9 Cập nhật ngày xuất hàng là ngày hiện hành cho các phiếu xuất chưa có ngày xuất
SET SQL_SAFE_UPDATES = 0;
update phieuxuat set phieuxuat.NgayXuat = '2022-04-06'
where phieuxuat.NgayXuat is null;
-- 6.10 Cập nhật đơn giá của “Đồng phục học sinh” giảm 10% trên đơn giá hiện tại.
 SET SQL_SAFE_UPDATES = 0;
update hanghoa set hanghoa.DonGia = hanghoa.DonGia * 0.9
where hanghoa.Loai - 'OPHS';
-- 6.11 Thực hiện xóa các cửa hàng chưa có thông tin xuất hàng.
delete from cuahang
where mach not in (
 select mach from phieuxuat);
-- 6.12 Liệt kê danh sách các mặt hàng có số lượng xuất hàng thấp nhất: Mã hàng, tên hàng, tổng số lượng xuất kho.
select tenhh ,sum(soluong) as 'Tổng số lượng'from  ctphieuxuat ctpx
inner join hanghoa hh on ctpx.mahh = hh.mahh
inner join phieuxuat px on px.sophieu = ctpx.sophieu
group by tenhh
having sum(soluong)<= all(
select  sum(soluong) as 'Tổng số lượng'from  ctphieuxuat ctpx
inner join hanghoa hh on ctpx.mahh = hh.mahh
inner join phieuxuat px on px.sophieu = ctpx.sophieu
group by tenhh);
-- 6.13 Liệt kê những mặt hàng chưa từng xuất cho các cửa hàng, thông tin gồm: Mã mặt hàng, tên mặt hàng, tên loại hàng.
select hanghoa.mahh, hanghoa.tenhh, loaihang.TenLoai
from hanghoa, loaihang
where loaihang.MaLoai - hanghoa.Loai
and hanghoa.mahh not in (select mahh from ctphieuxuat);

select mahh from ctphieuxuat;
