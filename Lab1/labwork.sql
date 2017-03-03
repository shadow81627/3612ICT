/*
 * 1. Create a database called Lab1, use the database, and create
 * the above tables using the give script file lab1data.sql 
 */
 
 

/*
 * 2. Find all courses whose description contains the word
 * ‘database’. 
 */

SELECT * FROM course 
WHERE course.description LIKE "%database%";

/*
 * 3. Find all students (by student ID and name) who do not have a
 * phone number recorded in the table, in ascending order of
 * last name. 
 */
 
 SELECT studnet.sid, student.slastname, student.sfirstname * FROM student 
 WHERE phone = NULL
 ORDER BY student.slastname ASC;
 
 