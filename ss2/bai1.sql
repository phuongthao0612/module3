create database quanly_donhang;
use quanly_donhang;
create table nha_cung_cap(
ma_nha_cung_cap int primary key,
ten_nha_cung_cap varchar (255),
dia_chi varchar (255),
sdt varchar (15)
);
create table phieu_xuat(
so_phieu_xuat int primary key,
ngay_xuat date
);
create table vat_tu(
ma_vat_tu int primary key,
ten_vat_tu varchar (255)
);
create table don_dat_hang(
so_don_hang int primary key,
ngay_dat_hang date,
ma_nha_cung_cap int,
foreign key (ma_nha_cung_cap) references nha_cung_cap (ma_nha_cung_cap)
);
create table phieu_nhap(
so_phieu_nhap int primary key,
ngay_nhap date
);
create table chi_tiet_phieu_xuat(
so_phieu_xuat int,
ma_vat_tu int,
don_gia_xuat decimal (10, 2), 
so_luong_xuat int,
primary key (so_phieu_xuat, ma_vat_tu),
foreign key (so_phieu_xuat) references phieu_xuat (so_phieu_xuat),
foreign key (ma_vat_tu) references vattu (ma_vat_tu)
);
create table chi_tiet_phieu_nhap(
ma_vat_tu int, 
so_phieu_nhap int, 
don_gia_nhap decimal (10, 2),
so_luong_nhap int,
primary key (ma_vat_tu, so_phieu_nhap),
foreign key (so_phieu_nhap) references phieu_nhap (so_phieu_nhap),
foreign key (ma_vat_tu) references vat_tu (ma_vat_tu)
);
create table chi_tiet_don_dat_hang(
ma_vat_tu int, 
so_don_hang int,
primary key (ma_vat_tu, so_don_hang),
foreign key (so_don_hang) references don_dat_hang(so_don_hang),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table cung_cap(
ma_nha_cung_cap INT,
ma_vat_tu int,
primary key (ma_nha_cung_cap, ma_vat_tu),
foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);