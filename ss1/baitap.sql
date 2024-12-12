create database bai1;

use bai1;

create table students(
 id int auto_increment primary key,
 name_student varchar(200),
 age int,
 country varchar(50)
);

insert into students (name_student, age, country)
values ('Abc', 20, 'Vietnam');

select * from students;


create table classes (
id int auto_increment primary key, 
name_class varchar(200)
);

create table teachers (
id int auto_increment primary key,
name_teacher varchar(200),
age int,
country varchar(50)
);
