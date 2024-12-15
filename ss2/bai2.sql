create database quanly_banhang;
use quanly_banhang;
create table customers(
cID int primary key,
cName varchar(255),
cAge int
);
create table orders(
oID int primary key,
cID int,
oDate date,
oTotalPrice decimal(10, 2),
foreign key (cID) references custumers(cID)
);
create table products(
pID int primary key,
pName varchar(255),
pPrice decimal(10, 2)
);
create table orderdetails(
oID int,
pID int,
odQTY int,
primary key (oID, pID),
foreign key (oID) references orders(oID),
foreign key (pID) references products(pID)
);