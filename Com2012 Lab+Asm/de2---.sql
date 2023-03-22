create database de2;
use de2;


create table HoiDong(
MAHĐT varchar(20) primary key,
TENHĐT varchar(30),
TENCT varchar(30),
ĐCHĐT varchar(30),
ĐTHĐT varchar(30)
);

create table PhongThi(
SOPT int primary key,
ĐCPT varchar(250),
MAHĐT varchar(40),
foreign key (MAHĐT) references HoiDong(MAHĐT)
);

create table Truong(
MATR varchar(30) primary key,
TENTR varchar(255),
ĐCTR varchar(255),
LHTR varchar(255)
);

create table GiaoVIen(
MAGV varchar(30) primary key,
TENGV varchar(50),
CHUYENMON varchar(30),
CHUCDANH varchar(30),
MAHĐT varchar(30),
MATR varchar(30),
foreign key(MAHĐT) references HoiDong(MAHĐT),
foreign key(MATR) references Truong(MATR)
);

create table ThiSinh(
SOBD varchar(30) primary key,
TEN varchar(30),
NGSINH date,
PHAI varchar(30),
CCNGHE varchar(250),
MATR varchar(250),
SOPT int not null,
foreign key(MATR) references Truong(MATR),
foreign key(SOPT) references PhongThi(SOPT)
);
create table MonThi(
MAMT varchar(250) primary key,
TENMT varchar(250),
BUOI varchar(250),
NGAY date
);
create table KetQua(
SODB varchar(30) primary key,
MAMT varchar(250),
DIEMTHI varchar(250),
foreign key(MAMT) references MonThi(MAMT)
);

use quanlyviecthitotnghiep;

SELECT TS.SOBD , TS.TENTS , T.TENTR FROM THISINH TS INNER JOIN TRUONG T ON T.MATR = TS.MATRUONG AND TS.MATRUONG= "NTMK";

SELECT  TS.SOBD , TS.TENTS , KQ.DIEMTHI  FROM KETQUA KQ INNER JOIN  THISINH TS ON TS.SOBD = KQ.SOBD INNER JOIN TRUONG T ON T.MATR = TS.MATRUONG AND TS.MATRUONG= "NCT" AND MAMT = "V" ORDER BY KQ.DIEMTHI DESC;

SELECT T.MATR , T.TENTR , PT.SOPT , count(TS.SOPT) AS "MAPHONGTHI" , DCPT FROM TRUONG T INNER JOIN THISINH TS ON T.MATR = TS.MATRUONG INNER JOIN PHONGTHI PT ON TS.SOPT = PT.SOPT GROUP BY (TS.SOPT) ORDER BY SOPT ASC; 

SELECT TS.SOBD , TS.TENTS , TS.NGAYSINH , TS.PHAI , TS.MATRUONG ,TR.TENTR , TS.SOPT, MT.TENMT , KQ.DIEMTHI FROM TRUONG TR INNER JOIN THISINH TS ON TR.MATR = TS.MATRUONG INNER JOIN KETQUA KQ ON TS.SOBD = KQ.SOBD AND KQ.DIEMTHI < 5 INNER JOIN MONTHI MT ON KQ.MAMT = MT.MAMT;

SELECT MT.MAMT , MT.TENMT FROM MONTHI MT WHERE MT.NGAYTHI = "2010/05/21";
