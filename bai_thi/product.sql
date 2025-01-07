create database bai_thi;
use bai_thi;

create table products (
product_id int auto_increment primary key,
product_name varchar(255) not null,
product_price decimal(10,2) not null,
discount decimal(5,2) not null,
stock int not null
);

create table employees (
employee_id int auto_increment primary key,
employee_name varchar(255) not null,
birthday date not null,
address varchar(255) not null
);

create table customers (
customer_id int auto_increment primary key,
customer_name varchar(50) not null,
birthday date not null,
phone varchar(15) not null,
address varchar(255) not null,
email varchar(255) not null
);

create table orders (
order_id int auto_increment primary key,
payment_method varchar(50) not null,
customer_id int not null,
employee_id int not null,
order_date date not null,
delivery_date date not null,
delivery_address varchar(255) not null,
foreign key (customer_id) references customers (customer_id),
foreign key (employee_id) references employees (employee_id)
);

create table order_details (
order_detail_id int auto_increment primary key,
product_id int not null,
order_id int not null,
quantity int not null,
foreign key (product_id) references products (product_id),
foreign key (order_id) references orders (order_id),
unique (product_id, order_id)
);

INSERT INTO products (product_name, product_price, discount, stock) 
VALUES
('Laptop', 1500.00, 10.00, 50),
('Smartphone', 800.00, 5.00, 100),
('Tablet', 600.00, 15.00, 70),
('Headphones', 100.00, 20.00, 150),
('Smartwatch', 200.00, 10.00, 120),
('Keyboard', 50.00, 0.00, 200),
('Mouse', 30.00, 0.00, 250),
('Monitor', 300.00, 5.00, 60),
('Printer', 120.00, 10.00, 40),
('Camera', 500.00, 5.00, 30);

INSERT INTO employees (employee_name, birthday, address) 
VALUES
('John Doe', '1985-04-12', '123 Main St'),
('Jane Smith', '1990-06-25', '456 Oak Rd'),
('Alice Brown', '1982-11-07', '789 Pine Ave'),
('Bob Johnson', '1975-03-22', '101 Maple Dr'),
('Charlie White', '1992-08-14', '202 Birch Blvd'),
('David Green', '1980-02-19', '303 Cedar Ln'),
('Eve Black', '1988-05-30', '404 Elm St'),
('Frank Blue', '1995-07-01', '505 Fir Ave'),
('Grace Red', '1987-10-17', '606 Willow Rd'),
('Hank Grey', '1993-01-05', '707 Ash St');

INSERT INTO customers (customer_name, birthday, phone, address, email) 
VALUES
('Michael Lee', '1990-03-12', '0901234567', '1 Hanoi St', 'mike@example.com'),
('Sarah Kim', '1985-05-20', '0912345678', '2 HCMC St', 'sarah@example.com'),
('James Wong', '1992-11-01', '0923456789', '3 Danang St', 'james@example.com'),
('Sophia Chen', '1987-07-15', '0934567890', '4 Hue St', 'sophia@example.com'),
('Daniel Tan', '1990-09-30', '0945678901', '5 Nha Trang St', 'daniel@example.com'),
('Olivia Zhang', '1988-04-25', '0956789012', '6 Hanoi St', 'olivia@example.com'),
('David Park', '1993-12-13', '0967890123', '7 HCMC St', 'david@example.com'),
('Ella Lee', '1989-02-08', '0978901234', '8 Danang St', 'ella@example.com'),
('Liam Kim', '1991-06-18', '0989012345', '9 Hue St', 'liam@example.com'),
('Sophia Lim', '1994-01-23', '0990123456', '10 Nha Trang St', 'sophia.lim@example.com');

INSERT INTO orders (payment_method, customer_id, employee_id, order_date, delivery_date, delivery_address) 
VALUES
('Credit Card', 1, 1, '2025-01-07', '2025-01-10', '1 Hanoi St'),
('Cash', 2, 2, '2025-01-06', '2025-01-09', '2 HCMC St'),
('PayPal', 3, 3, '2025-01-05', '2025-01-08', '3 Danang St'),
('Credit Card', 4, 4, '2025-01-04', '2025-01-07', '4 Hue St'),
('Cash', 5, 5, '2025-01-03', '2025-01-06', '5 Nha Trang St'),
('PayPal', 6, 6, '2025-01-02', '2025-01-05', '6 Hanoi St'),
('Credit Card', 7, 7, '2025-01-01', '2025-01-04', '7 HCMC St'),
('Cash', 8, 8, '2024-12-30', '2025-01-02', '8 Danang St'),
('PayPal', 9, 9, '2024-12-29', '2025-01-01', '9 Hue St'),
('Credit Card', 10, 10, '2024-12-28', '2025-01-03', '10 Nha Trang St');

INSERT INTO order_details (order_id, product_id, quantity) 
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(2, 4, 2),
(3, 5, 1),
(4, 6, 2),
(5, 7, 1),
(6, 8, 1),
(7, 9, 1),
(8, 10, 1);




