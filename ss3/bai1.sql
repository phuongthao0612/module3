create database student_management;
use student_management;
create table classes(
id_class int not null auto_increment primary key,
name_class varchar(60) not null,
start_date datetime not null,
status bit
);
create table students(
id_student int not null auto_increment primary key,
name_student varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
id_class int not null,
foreign key (id_class) references classes (id_class)
);
create table subjects(
id_subject int not null auto_increment primary key,
name_subject varchar(30) not null,
credit tinyint not null default 1 check (credit >=1),
status bit default 1
);
 create table marks(
 id_mark int not null auto_increment primary key,
 id_subject int not null,
 id_student int not null,
 mark float default 0 check (mark between 0 and 100),
 exam_times tinyint default 1,
 unique (id_subject, id_student),
 foreign key (id_subject) references subjects (id_subject),
 foreign key (id_student) references students (id_student)
 );
 insert into classes values (1, 'A1', '2008-12-20', 1);
 insert into classes values (2, 'A2', '2008-12-22', 1);
 insert into classes values (3, 'B3', current_date, 0);
 
 insert into students (name_student, address, phone, status, id_class) values ('Hung', 'Ha Noi', '0912113113', 1, 1);
 insert into students (name_student, address, status, id_class) values ('Hoa', 'Hai phong', 1, 1);
 insert into students (name_student, address, phone, status, id_class) values ('Manh', 'HCM', '0123123123', 0, 2);
 
 insert into subjects values (1, 'CF', 5, 1);
 insert into subjects values (2, 'C', 6, 1);
 insert into subjects values (3, 'HDJ', 5, 1);
 insert into subjects values  (4, 'RDBMS', 10, 1);
 
 insert into marks (id_subject, id_student, mark, exam_times) values (1, 1, 8, 1);
 insert into marks (id_subject, id_student, mark, exam_times) values (1, 2, 10, 2);
 insert into marks (id_subject, id_student, mark, exam_times) values (2, 1, 12, 1);
 
 select * from students where name_student like 'h%';
 
 select * from classes where month(start_date) = 12;
 
 select * from subjects where credit between 3 and 5;
 
 update students set id_class = 2 where name_student = 'Hung' limit 1;
 
 select students.name_student, subjects.name_subject, marks.mark
 from marks
 join students on marks.id_student = students.id_student
 join subjects on marks.id_subject = subjects.id_subject
 order by marks.mark desc, students.name_student asc
 