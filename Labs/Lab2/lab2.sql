drop table if exists faculty;
drop table if exists course;
drop table if exists student; 


create table student (
sid char(7) primary key,
slastname char(15) not null,
sfirstname char(15) not null,
gender ENUM ('F', 'M') not null,
phone char(10)
)
ENGINE = INNODB;

create table course (
cid char(7) primary key, 
ctitle varchar(30) not null, 
description varchar(50) not null
)
ENGINE = MEMORY; 

create table faculty (
fid char(7) primary key,
flastname char(15) not null,
ffirstname char(15) not null,
ftitle ENUM('Prof','Apro', 'Dr', 'Mr', 'Ms') not null,
email char(25) not null,
Constraint uni_faculty unique (email)
)
ENGINE = MyISAM;

Insert into student values ('1234567', 'Goodman', 'Michael', 'M', null);
Insert into student values ('1234560', 'Goodman', 'Lisa', 'F', '0413777888');
Insert into student values ('1234561', 'Burke', 'Ada', 'F', '0755567779');
Insert into student values ('1234562', 'English', 'Lisa', 'F', '0414567890');
Insert into student values ('1234563', 'Pullan', 'David', 'M', '0412777888');
Insert into student values ('1234564', 'Li', 'Chen', 'M', '0412777848');
Insert into student values ('1234565', 'Moe', 'Chloe', 'F', '0412747888');

Insert into faculty values ('2134560', 'Wang', 'John', 'Dr', 'j.wang@griffith.edu.au');
Insert into faculty values ('2134561', 'Stantic', 'Bela', 'Dr', 'B.stantic@griffith.edu.au');
Insert into faculty values ('2134562', 'Rodney', 'Topor', 'Prof', 'R.Topor@griffith.edu.au');
Insert into faculty values ('2134563', 'Liew',  'Alan', 'Apro','A.liew@griffith.edu.au');

Insert into course values ('2002ICT', 'Database Design', 'This course teaches database....');
Insert into course values ('1420ICT', 'Systems Analysis and Design', 'This course introduces ...');
Insert into course values ('1410ICT', 'Introduction to IS', 'This course is a introduction ...');
Insert into course values ('3612ICT', 'Database systems', 'This course teaches fundamental ...');

SELECT * FROM STUDENT;

SELECT * FROM COURSE;

SELECT * FROM FACULTY;