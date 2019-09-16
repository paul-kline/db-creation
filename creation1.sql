drop database if exists exampleschool;
create database exampleschool;
use exampleschool;
drop table if exists instructors;

create table instructors
(
    name VARCHAR(255) NOT NULL,
    office_hours VARCHAR(255) default NULL,
    id INT PRIMARY KEY AUTO_INCREMENT);
INSERT INTO instructors
    (name,office_hours)
VALUES("Staff", NULL),
    ("Paul", "pauloffice"),
    ("Coogan", "Coogan office"),
    ("Morin", "Morin office");

drop table if exists students;
create table students
(
    name varchar(255) NOT NULL,
    year ENUM("Fr", "So","Jr","Sr") not null default "Fr",
    age TINYINT NOT NULL,
    major varchar(20) NOT NULL default "undecided",
    id int primary key auto_increment
);
INSERT INTO students(name,year,age,major) values ('Mark G', "Fr",18,"CS");
INSERT INTO students(name,year,age) values('Sarah P',"So",20);

DROP TABLE IF EXISTS classes;
create table classes(
    department varchar(255) NOT NULL,
    class_number int NOT NULL,
    description varchar(500),
    id int primary key auto_increment,
    instructor_id int default null,
    foreign key (instructor_id) references instructors(id) on update cascade on delete set null
);
-- insert into classes(department, class_number,instructor_id) values("EECS", 123,0);
-- this fails, because no instructor exists with id 0.
insert into classes(department, class_number,instructor_id) values("EECS", 123,2);
-- update instructors set id=5 where id=1;
-- ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`exampleschool`.`classes`, CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`id`))
