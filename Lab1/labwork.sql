/*
 * 1. Create a database called Lab1, use the database, and create
 * the above tables using the give script file lab1data.sql 
 */

/*
 * 2. Find all courses whose description contains the word
 * ‘database’. 
 */

SELECT * 
FROM course 
WHERE course.description LIKE "%database%";

/*
 * 3. Find all students (by student ID and name) who do not have a
 * phone number recorded in the table, in ascending order of
 * last name. 
 */
 
SELECT student.sid, student.slastname, student.sfirstname 
FROM student 
WHERE phone IS NULL
ORDER BY student.slastname ASC;
 
-- 4. Find all courses that are offered in semester 1, 2016 but not
-- in semester 2, 2016. 

SELECT *
FROM course, courseoffer
WHERE courseoffer.year = 2016 
AND courseoffer.semester = 1;

 
-- 5. Find all students enrolled in 3512ICT in semester 1, 2016.
SELECT *
FROM student, enrolment
WHERE enrolment.sid = student.sid
AND enrolment.cid = "3612ICT"
AND enrolment.year = 2016
AND enrolment.semester = "1";

SELECT * 
FROM student
WHERE student.sid IN (
	SELECT enrolment.sid
	FROM enrolment
	WHERE enrolment.cid = "3612ICT"
	AND enrolment.year = 2016
	AND enrolment.semester = "1"
);

-- 6. Find the number of female students enrolled in 2002ICT, in
-- semester 2, 2016.
SELECT COUNT(*)
FROM student
WHERE student.sid IN (
	SELECT enrolment.sid
	FROM enrolment
	WHERE enrolment.cid = "2002ICT"
	AND enrolment.year = 2016
	AND enrolment.semester = "1"
)
AND student.gender = "F";


-- 7. Find the number of students who received F, P, C, D, and HD
-- respectively in 1420ICT in semester 2, 2016.
SELECT COUNT(*) AS NumberofGrades
FROM enrolment, student
WHERE enrolment.sid = student.sid
AND enrolment.cid = "1420ICT"
AND enrolment.year = 2015
AND enrolment.semester = "2"
GROUP BY enrolment.grade


-- 8. Find all students by (ID and name) who enrolled in less than
-- 2 courses in semester 1, 2016.


-- 9. Find the courses which have an enrolment of less than five
-- students in semester 1, 2016.

-- 10. List the names of those students who received HD in
-- 1420ICT in semester 2, 2016.

-- 11. List all faculties by name, and if the faculty teaches a course
-- in semester 2, 2016, also list the course id. 

-- 12. Find all students who received D or HD in every course
-- he/she enrolled in in semester 2, 2015.

-- 13. Find all students who enrolled in some courses and received
-- D or HD in every course he/she enrolled in in semester 2,
-- 2016.

-- 14. Modify the structure of the table student to add an attribute
-- email.

-- 15. Change the grade to HD for students enrolled in 2002ICT,
-- semester 1, 2016 and whose grade is D 