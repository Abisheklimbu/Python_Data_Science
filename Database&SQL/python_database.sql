SHOW DATABASES;
-- CREATING NEW DATABASES 
CREATE DATABASE PYTHON_DATA_SCIENCE;

-- SHOWING AGAIN DATABASES
SHOW DATABASES;

-- USING ON PYTHON_DATA_SCIENCE 
USE PYTHON_DATA_SCIENCE

-- WORKING ON ABOVE DATABASE/ WHICH DATABASE YOU ARE WORKING
SELECT DATABASE();

-- DELETING ABOVE PYTHON_DATA_SCIENCE DATABASE 
DROP DATABASE PYTHON_DATA_SCIENCE; 

-- SHOWING AGAIN DATABASES
SHOW DATABASES;

-- CREATING SCHOOL DATABASE
CREATE DATABASE SCHOOL;

-- USING SCHOOL DATABASE
USE SCHOOL;

-- SEE SELECTED DATABASE
SELECT DATABASE();

-- CREATING students table in SCHOOL DATABASE 
CREATE TABLE students (Roll_no int, Name varchar(50));

-- DESCRIBING TABLE students 
DESCRIBE students;

-- DROPING/DELETING TABLE students 
DROP TABLE students;

-- SHOWING TABLE 
SHOW TABLES;

-- ALTER TABLE OR MODIFY TABLE students 
-- ADDING NEW COLUMN Class int
ALTER TABLE students ADD Class int;
DESCRIBE students;

-- ADDING NEW COLUMN Age int
ALTER TABLE students ADD Age varchar(10);
DESCRIBE students;

-- DROPING COLUMN Age 
ALTER TABLE students DROP COLUMN Age;
DESCRIBE students;

ALTER TABLE students ADD Age varchar(10);
DESCRIBE students;
-- MODIFYING COLUMN Age converting varchar into int 
ALTER TABLE students MODIFY COLUMN Age int;
DESCRIBE students;

USE SCHOOL;


-- Table Contraints 
CREATE TABLE students(
id int not null unique primary key,
s_name varchar(50) not null,
class int not null,
age int not null
);
describe students;

-- AUTO_INCREMENT (ID INT AUTO_INCREMENT) FOR GOING IN A SEQUENCE 1,2,3....,N. 

-- INSERT RECORDS INTO TABLE 
INSERT INTO students(id, s_name, class, age)
VALUES
(1, 'Abishek', 10, 16),
(2, 'Nishan', 9, 15),
(3, 'Manish', 8, 14),
(4, 'Nima', 7, 13),
(5, 'Manisha', 6, 12),
(6, 'Dipa', 5, 11); 

-- SELECT COMMAND
--  SELECT ALL FROM TABLE 
SELECT * FROM students;

-- SELECT ONLY ONE COLUMN
SELECT s_name FROM students;

-- SELECT TWO COLUMN FROM TABLE 
SELECT id,s_name FROM students;	

-- SELECT UNIQUE ONES 
SELECT DISTINCT id, s_name, class FROM students;

-- LIMIT IN SELECTION LIST ONLY FIRST 3 ROWS
SELECT * FROM students LIMIT 3;

-- SKIP THE FIRST 3 ROW -- OFFSET
SELECT * FROM students LIMIT 3 OFFSET 3;

-- SORT DATA USING ORDER BY 
SELECT * FROM students ORDER BY class,age asc;

-- WHERE FOR CONDITIONS 
SELECT * FROM students WHERE id = 1;

-- students age >= 13
SELECT * FROM students WHERE age >= 13;

-- students age < 13
SELECT * FROM students WHERE age < 13;

-- not 16 year old
SELECT * FROM students WHERE age != 16;

-- STRING 
SELECT * FROM students WHERE s_name = "Abishek";

-- LOGICAL OPERATOR 
-- AND OPERATOR 
SELECT * FROM students WHERE class > 7 AND age < 15;

-- OR OPERATOR 
SELECT * FROM students WHERE class > 7 OR age > 15;

-- NOT OPERATOR 
SELECT * FROM students WHERE NOT s_name = "Abishek";

-- BETWEEN OPERATOR 
SELECT * FROM students WHERE age BETWEEN 13 AND 15;

-- IN 
SELECT * FROM students WHERE s_name IN ("Abishek","Nishan");

-- LIKE
SELECT * FROM students WHERE s_name LIKE 'a%';

SELECT * FROM students WHERE s_name LIKE '%a';

SELECT * FROM students WHERE s_name LIKE '%im%';


-- UPDATE AND DELETE 
UPDATE students SET class = 8 WHERE id = 4;

UPDATE students SET s_name = "Sita" WHERE id = 5;

SELECT * FROM students;

DELETE FROM students WHERE id = 6;

-- AGGREGATE
-- COUNT 
SELECT DISTINCT s_name FROM students;
SELECT COUNT(DISTINCT s_name) FROM students;
SELECT COUNT(DISTINCT s_name) as 'Uniqe_Name' FROM students;

-- MAX
SELECT MAX(DISTINCT class) as "Maximum_class" FROM students;

-- MIN 
SELECT MIN(DISTINCT class) as "Minimum_class" FROM students;

-- AVG 
SELECT AVG(age) as "Average" FROM students WHERE class = 8;

-- SUM
SELECT SUM(DISTINCT class) as "SUM" FROM students;

