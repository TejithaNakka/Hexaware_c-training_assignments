create table Students( student_id int primary key, FirstName varchar(10), LastName varchar(10),date_of_birth date, Email varchar(20), Phone_number bigint)
Insert into Students values(101, 'Tejitha', 'Nakka','07-31-2003', 'nakka@gmail.com', 9683742987)
Insert into Students values(102, 'Sri', 'Devi','08-05-2002', 'devi@gmail.com', 9683742978)
Insert into Students values(103, 'Deepa', 'Raj', '02-01-1997','raj@gmail.com', 9683742999)
Insert into Students values(104, 'Virat', 'Kohli','10-23-2010', 'virat@gmail.com', 9683745987)
Insert into Students values(105, 'MahendraSingh', 'Dhoni', '10-04-2007','dhoni@gmail.com', 9683742947)
Insert into Students values(106, 'Raj', 'Kumar', '09-04-2002','kumar@gmail.com', 9683742237)
Insert into Students values(107, 'Sai', 'Ram', '08-02-2006','sai@gmail.com', 9683742984)
Insert into Students values(108, 'Hema', 'Lakshmi','12-12-2002','hema@gmail.com', 9683742287)
Insert into Students values(109, 'Kalyan', 'Raj', '03-23-2004','raj@gmail.com', 9683742957)
Insert into Students values(110, 'Naga', 'Chaitanya', '12-03-2008','naga@gmail.com', 9683742917)

select *from Students

create table Courses( course_id int primary key, Course_name varchar(10), credits int, teacher_id int, foreign key(Teacher_id)references Teacher(Teacher_id))
Insert into Courses values(300,'Java', 3, 001)
Insert into Courses values(301,'Python', 3, 002)
Insert into Courses values(302,'DS', 3, 003)
Insert into Courses values(303,'OOPs', 3, 004)
Insert into Courses values(304,'DS', 3, 005)
Insert into Courses values(305,'Java', 3, 006)
Insert into Courses values(306,'C#', 3, 007)
Insert into Courses values(307,'Java', 3, 008)
Insert into Courses values(308,'C#', 3, 009)
Insert into Courses values(309,'OOPs', 3, 010)

select * from Courses

Create table Enrollments (
enrollment_id int primary key,
student_id int,
course_id int,
enrollment_date date, 
foreign key(student_id) references Students(student_id), 
foreign key (course_id) references Courses(course_id))
Insert into Enrollments values(1000,101, 300, '04-09-2024')
Insert into Enrollments values(1001,102, 301, '03-05-2024')
Insert into Enrollments values(1002,103, 302, '09-12-2023')
Insert into Enrollments values(1003,104, 303, '02-19-2024')
Insert into Enrollments values(1004,105, 304, '11-29-2023')
Insert into Enrollments values(1005,106, 305, '10-02-2023')
Insert into Enrollments values(1006,107, 306, '01-15-2024')
Insert into Enrollments values(1007,108, 307, '01-29-2024')
Insert into Enrollments values(1008,109, 308, '02-29-2024')
Insert into Enrollments values(1009,110, 309, '04-03-2024')
Insert into Enrollments values(1010,111, 308, '04-03-2024')
Insert into Enrollments values(1012,102, 301, '04-03-2024')
Insert into Enrollments values(1013,111, 306, '04-03-2024')

select (amount) from Payments

select * from Enrollments


create table Teacher (teacher_id int primary key, first_name varchar(20), Last_name varchar(20), email varchar(20))
Insert into Teacher values(001,' Pasupuleti', 'Rajesh', 'rajesh@gmail.com')
Insert into Teacher values(002,'Krishna', 'Gopal', 'krishnagopal@gmail.com')
Insert into Teacher values(003, 'Atreya', 'Kumar', 'kumar@gmail.com')
Insert into Teacher values(004,' Bala', 'Kumari', 'bala@gmail.com')
Insert into Teacher values(005,' Naga', 'Vallika', 'vallika@gmail.com')
Insert into Teacher values(006,' Leela', 'vathi', 'leela@gmail.com')
Insert into Teacher values(007,'Raj ', 'Mohan', 'rajmohan@gmail.com')
Insert into Teacher values(008,' Ram', 'kishore', 'kishore@gmail.com')
Insert into Teacher values(009,' Deepa', 'Rani', 'sudha@gmail.com')
Insert into Teacher values(010,' Srinivas', 'Raj', 'Srinivas@gmail.com')

Select * from Teacher


Create Table Payments(
payment_id  int primary key,
student_id int,
amount int,
payment_date date,
foreign key(student_id) references Students(student_id))

Insert into Payments values(201,101, 3000, '05-09-2024')
Insert into Payments values(202,102, 1500, '09-12-2023')
Insert into Payments values(203,103, 4000, '02-19-2024')
Insert into Payments values(204,104, 2000, '11-29-2023')
Insert into Payments values(205,105, 4000, '10-02-2023')
Insert into Payments values(206,106, 3000, '01-15-2024')
Insert into Payments values(207,107, 6000, '01-29-2024')
Insert into Payments values(208,108, 3000, '02-29-2024')
Insert into Payments values(209,109, 6000, '04-03-2024')
Insert into Payments values(210,110, 2000, '04-03-2024')

select * from Payments

--q1--
Insert into Students values (111, 'John', 'Doe', '1995-08-15', 'john.doe@example.com',1234567890)

--q2--
Insert into Enrollments values(1010, 111,308,'04-03-2024')

--q3--
update Teacher set email='sri@gmail.com' where first_name='srinivas'

--q4--
delete from Enrollments where student_id=110 and course_id=309

--q5--
update Courses set teacher_id=001 where Course_name='java'

--q6--
delete from Enrollments where student_id=101
delete from Payments where student_id=101
delete from Students where student_id=101

--q7--
update Payments set amount=3500 where amount=3000

--task-3
--q1--
select SUM(amount) as Total_amount from Payments
select * from Students INNER join Payments on Payments.student_id= Students. student_id

--q2--
select * from Courses INNER JOIN Enrollments on Enrollments.course_id= Courses.course_id
select course_id,course_name,credits, count(Courses. course_id) from Courses

--q3--
select Students.student_id, Students.FirstName
from Students LEFT JOIN Enrollments on Students.student_id= Enrollments.student_id 
where Enrollments.student_id is NULL

--q4--
SELECT 
   Students.FirstName,
   Students. LastName,
  Courses. course_name
FROM 
   Students
INNER JOIN 
   Enrollments ON Enrollments.student_id = Students.student_id
INNER JOIN 
   Courses ON Courses.course_id = Enrollments.course_id;

--q5--
Select 
	Teacher.first_name,
	Teacher. Last_name,
	Courses. Course_name
FROM
	Teacher
INNER JOIN 
	Courses ON Courses. teacher_id = teacher. teacher_id

--q6--
Select Students.FirstName,
Enrollments. enrollment_date,
Courses. Course_name
from Students
INNER JOIN
	Enrollments ON Enrollments.student_id= Students. student_id
INNER JOIN
	Courses ON Courses.course_id=Enrollments. course_id

--q7--
select Students. FirstName,
Students. student_id
from Students
LEFT JOIN
	Payments ON Students.student_id= Payments.student_id 
WHERE
	Payments. student_id IS NULL

--q8--
Select Courses.Course_name
FROM Courses
LEFT JOIN
	Enrollments ON Courses.course_id= Enrollments.course_id
WHERE
	Enrollments.course_id IS NULL

--q9--
select firstname,lastname,count(enrollments.student_id) as
noOfEnrollments from students
left join 
enrollments on students.student_id=enrollments.student_id 
group by firstname,lastname 
having count(enrollments.student_id)>1

--q10--
Select Teacher.first_name,
Teacher.Last_name, Courses.Course_name
from Teacher
LEFT JOIN
	Courses ON Teacher.teacher_id= Courses.teacher_id
WHERE
	Courses.teacher_id IS NULL

--q4.1
select course_id,avg(student_count) as Avg_no_of_students 
from (
	select course_id,count(student_id) as student_count from enrollments group by course_id
) as subQuery
group by course_id 

select course_id,avg(count(student_id)) over() from(
select course_id,student_id from enrollments ) as subquery group by course_id

--q4.2
select CONCAT(firstname,' ', LASTname) as Name, amount from Students 
inner join Payments on Students.student_id= Payments.student_id
where
Payments.amount= (select MAX(amount) from Payments)


select *from Enrollments

--q4.3

select *from courses where course_id=
(select course_id from
(select top 1 course_id,count(course_id) 
as noOFEnrollments from enrollments
group by course_id order by count(course_id) desc)
as subquery )

--q4.5
begin transaction 
insert into enrollments values (113,102,302,'2024-04-02')
insert into enrollments values (114,102,303,'2024-04-02')
insert into enrollments values (115,102,304,'2024-04-02')
insert into enrollments values (116,102,305,'2024-04-02')
insert into enrollments values (117,102,306,'2024-04-02')
insert into enrollments values (118,102,307,'2024-04-02')
insert into enrollments values (119,102,308,'2024-04-02')
insert into enrollments values (120,102,309,'2024-04-02')
select *from enrollments
rollback;
SELECT s.student_id, s.FirstName, s.LastName
FROM Students s
WHERE (
    SELECT COUNT(DISTINCT course_id)
    FROM Enrollments
    ) = (
    SELECT COUNT(DISTINCT course_id)
    FROM Enrollments e
    WHERE e.student_id = s.student_id
)

--q4.6

select * from teacher where first_name in( 
select first_name from Teacher where teacher_id not in (select distinct teacher_id from Courses))

--q4.7
select AVG(age) as average_age from(
SELECT 
    DATEDIFF(YEAR, date_of_birth, GETDATE()) AS age
FROM 
    Students)as avg_age 

--q4.8
select * from Enrollments
select * from Courses

select * from Courses where Course_name in(
select Courses.Course_name from Courses
where course_id not in (select distinct course_id from Enrollments))


--q4.9
select * from Payments
select distinct Payments.student_id,SUM(amount) from Payments group by student_id

--q4.10
select * from Students where student_id=(
select student_id from(select student_id, COUNT(student_id) as no_of from Payments group by student_id) as sub
where  no_of >1 )

--q4.11
select s.firstname,s.student_id,sum(p.amount) as totalpayments
from students s inner join payments p on
s.student_id=p.student_id group by firstname,s.student_id

--q4.12

select Course_name,count(student_id) as course_enrollment_count from courses
inner join enrollments on courses.course_id=enrollments.course_id group by Course_name

--q4.13
select * from Payments
select* from Students

select AVG(amount) from Payments
inner join Students on  Students. student_id =Payments.student_id