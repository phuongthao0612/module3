create database quanly_donhang;
use quanly_donhang;
create table nhaCC(
maNCC int primary key,
tenNCC varchar (255),
diachi varchar (255),
sdt varchar (15)
);
create table phieuxuat(
soPX int primary key,
ngayxuat date
);
create table vattu(
maVTU int primary key,
tenVTU varchar (255)
);
create table donDH(
soDH int primary key,
ngayDH date,
maNCC int,
foreign key (maNCC) references nhaCC (maNCC)
);
create table phieunhap(
soPN int primary key,
ngaynhap date
);
create table chitiet_phieuxuat(
soPX int,
maVTU int,
DGXuat decimal (10, 2), 
SLXuat int,
primary key (soPX, maVTU),
foreign key (soPX) references phieuxuat (soPX),
foreign key (maVTU) references vattu (maVTU)
);
create table chitiet_phieunhap(
maVTU int, 
soPN int, 
DGNhap decimal (10, 2),
SLNhap int,
primary key (maVTU, soPN),
foreign key (soPN) references phieunhap (soPN),
foreign key (maVTU) references vattu (maVTU)
);
create table chitiet_dondh(
maVTU int, 
soDH int,
primary key (maVTU, soDH),
foreign key (soDH) references donDH(soDH),
foreign key (maVTU) references vattu(maVTU)
);
create table cungcap(
maNCC INT,
maVTU int,
primary key (maNCC, maVTU),
foreign key (maNCC) references nhaCC(maNCC),
foreign key (maVTU) references vattu(maVTU)
);