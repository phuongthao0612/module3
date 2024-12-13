create database student_management;

use student_management;

create table students(
 id int auto_increment primary key,
 name_student varchar(200),
 age int,
 country varchar(50)
);

insert into students (name_student, age, country)
values ('Abc', 20, 'Vietnam');
select * from students;

alter table students change column country nationality varchar(50);

