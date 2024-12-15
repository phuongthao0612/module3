create database demo;
use demo;
create table students (
id_student int primary key,
name_student varchar (200)
);
create table classtype (
id_classtype int primary key,
name_classtype varchar (200)
);
create table classes (
id_class int primary key,
name_class varchar (200),
id_classtype int,
foreign key (id_classtype) references classtype (id_classtype)
);
create table students_classes (
id_student int,
id_class int,
primary key (id_student, id_class),
foreign key (id_student) references students (id_student),
foreign key (id_class) references classes (id_class)
);
select students.id_student, students.name_student, classes.name_class
from students
join students_classes on students.id_student = students_classes.id_student
join classes on students_classes.id_class = classes.id_class;
select students.id_student, students.name_student, classes.name_class, classtype.name_classtype
from students
join students_classes on students.id_student = students_classes.id_student
join classes on students_classes.id_class = classes.id_class
join classtype on classes.id_classtype = classtype.id_classtype;
select students.id_student, students.name_student, classes.name_class
from students
left join students_classes on students.id_student = students_classes.id_student
left join classes on students_classes.id_class = classes.id_class;
select id_student, name_student
from students
where name_student in ('Tien', 'Toan');
select classes.name_class, count(students_classes.id_student) as number_of_students
from classes
left join students_classes on classes.id_class = students_classes.id_class
group by classes.name_class;
select id_student, name_student
from students
order by name_student asc;
