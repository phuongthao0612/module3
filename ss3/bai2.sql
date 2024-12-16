create database sales_management;
use sales_management;
create table customers(
id_customer int primary key,
name_customer varchar(25),
age_customer tinyint
);
create table orders(
id_order int auto_increment primary key,
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
create table orders_detail(
id_order int,
id_product int,
quantity_order int,
primary key (id_order, id_product),
foreign key (id_order) references orders(id_order),
foreign key (id_product) references products(id_product)
);

insert into customers values (1, 'Minh Quan', 10);
insert into customers values (2, 'Ngoc Oanh', 20);
insert into customers values (3, 'Hong Ha', 30);

insert into orders (id_customer, date_order) values (1, '2006-03-21');
insert into orders (id_customer, date_order) values (2, '2006-03-23');
insert into orders (id_customer, date_order) values (1, '2006-03-16');

insert into products values (1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

insert into orders_detail values (1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

select orders.id_order, orders.date_order, sum(orders_detail.quantity_order * products.price_product) as total_price_order
from orders
join orders_detail on orders.id_order = orders_detail.id_order
join products on products.id_product = orders_detail.id_product
group by orders.id_order, orders.date_order;

select customers.id_customer, customers.name_customer, products.name_product
from customers 
join orders on customers.id_customer = orders.id_customer
join orders_detail on orders.id_order = orders_detail.id_order
join products on products.id_product = orders_detail.id_product;

select customers.name_customer
from customers
left join orders on customers.id_customer = orders.id_customer
left join orders_detail on orders.id_order = orders_detail.id_order
where orders_detail.id_order is null;
