create database demo;
use demo;
create table products(
id int auto_increment primary key,
product_code varchar(50),
product_name varchar(50),
product_price decimal(10,2),
product_amount int,
product_description varchar(200),
product_status bit
);
insert into products (product_code, product_name, product_price, product_amount, product_description, product_status)
values ('P001', 'Product A', 100.00, 10, 'xyz', 1),
('P002', 'Product B', 200.00, 15, 'klm', 1),
('P003', 'Product C', 150.00, 20, 'pop', 0);
create unique index index_product_code on products (product_code);
create index index_product_name_price on products(product_name, product_price);
explain select product_code, product_name, product_price, product_amount, product_description, product_status
from products where product_code = 'P001';

create view view_products as 
select product_code, product_name, product_price, product_status from products;
drop view view_products;
create view view_products as
select product_code, product_name, product_price, product_amount, product_status from products;
drop view view_products;

delimiter //
create procedure getAllProduct()
begin 
select product_code, product_name, product_price, product_amount, product_description, product_status
from products;
end //
delimiter ;
call getAllProduct();
delimiter //
create procedure addProduct(
in p_product_code varchar(50),
in p_product_name varchar(50),
in p_product_price decimal (10,2),
in p_product_amount int,
in p_product_description varchar(200),
in p_product_status bit
)
begin
insert into products (product_code, product_name, product_price, product_amount, product_description, product_status)
values (p_product_code, p_product_name, p_product_price, p_product_amount, p_product_description, p_product_status);
end //
delimiter ;
call addProduct('P004', 'Product D', 250.00, 30, 'abc', 1);
delimiter //
create procedure updateProduct(
    in p_id int,
    in p_product_code varchar(50),
    in p_product_name varchar(50),
    in p_product_price decimal(10, 2),
    in p_product_amount int,
    in p_product_description varchar(200),
    in p_product_status bit
)
begin
    update products
    set 
        product_code = p_product_code,
        product_name = p_product_name,
        product_price = p_product_price,
        product_amount = p_product_amount,
        product_description = p_product_description,
        product_status = p_product_status
    where id = p_id;
end //
delimiter ;
call updateProduct(1, 'P001', 'Product Abb', 120.00, 12, 'qui', 1);
delimiter //
create procedure deleteProduct(
    in p_id int
)
begin
    delete from products where id = p_id;
end //
delimiter ;
call deleteProduct(3);

