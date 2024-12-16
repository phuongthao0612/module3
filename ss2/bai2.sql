create database sales_management;
use sales_management;
create table customers(
id_customer int primary key,
name_customer varchar(25),
age_customer tinyint
);
create table orders(
id_order int primary key,
id_customer int,
date_order datetime,
total_price_order int,
foreign key (id_customer) references customers(id_customer)
);
create table products(
id_product int primary key,
name_product varchar(25),
price_product int
);
create table orderdetails(
id_order int,
id_product int,
quantity_order int,
primary key (id_order, id_product),
foreign key (id_order) references orders(id_order),
foreign key (id_product) references products(id_product)
);