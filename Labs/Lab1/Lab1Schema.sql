drop table if exists enrolment;
drop table if exists courseoffer;
drop table if exists faculty;
drop table if exists course;
drop table if exists student; 


create table student (
sid char(7) primary key,
slastname char(15) not null,
sfirstname char(15) not null,
gender ENUM ('F', 'M') not null,
phone char(10)
);

create table course (
cid char(7) primary key, 
ctitle varchar(30) not null, 
description varchar(50) not null
); 

create table faculty (
fid char(7) primary key,
flastname char(15) not null,
ffirstname char(15) not null,
ftitle ENUM('Prof','Apro', 'Dr', 'Mr', 'Ms') not null,
email char(25) not null,
Constraint uni_faculty unique (email)
);

create table courseoffer (
cid char(7), 
semester ENUM('1', '2'), 
year Year, 
fid char(7) not null, 
venue char(8),
constraint PK_courseoffer primary key (cid, semester, year),
constraint fk1_courseoffer foreign key (cid) references course(cid),
constraint fk2_courseoffer foreign key (fid) references faculty(fid)
);


create table enrolment (
sid char(7), 
cid char(7),  
semester ENUM('1','2'), 
year year,
grade enum('F','P','C','D', 'HD'),
constraint pk_enrollment primary key (sid, cid, semester, year),
constraint fk1_enrollment foreign key (sid) references student(sid),
constraint fk2_enrollment foreign key (cid, semester, year) references courseoffer(cid, semester, year) on delete cascade
);



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

insert into courseoffer values ('2002ICT', '1', 2016, '2134560', 'G02_1.24'); 
insert into courseoffer values ('3612ICT', '1', 2016, '2134560', 'G30_1.29'); 
insert into courseoffer values ('1410ICT', '1', 2016, '2134561', 'G02_1.24'); 
insert into courseoffer values ('1420ICT', '2', 2015, '2134563', 'G39_3.24'); 
insert into courseoffer values ('1420ICT', '1', 2015, '2134563', 'G39_3.24'); 


insert into enrolment values ('1234567', '2002ICT', '1', 2016, 'HD');
insert into enrolment values ('1234560', '2002ICT', '1', 2016, 'D');
insert into enrolment values ('1234561', '2002ICT', '1', 2016, 'F');
insert into enrolment values ('1234563', '2002ICT', '1', 2016, 'C');
insert into enrolment values ('1234562', '2002ICT', '1', 2016, 'D');
insert into enrolment values ('1234560', '1420ICT', '2', 2015, 'HD');
insert into enrolment values ('1234561', '1420ICT', '2', 2015, 'C');
insert into enrolment values ('1234562', '1420ICT', '2', 2015, 'C');
insert into enrolment values ('1234563', '1420ICT', '2', 2015, 'HD');
insert into enrolment values ('1234567', '1420ICT', '2', 2015, 'HD');
insert into enrolment values ('1234565', '1420ICT', '2', 2015, 'D');
insert into enrolment values ('1234560', '3612ICT', '1', 2016, 'HD');
insert into enrolment values ('1234561', '3612ICT', '1', 2016, 'C');
insert into enrolment values ('1234562', '3612ICT', '1', 2016, 'C');
