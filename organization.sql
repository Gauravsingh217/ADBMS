/* filtering data from tables */
/* WHERE , SELECT DISTINCT , AND , OR , IN , NOT IN , BETWEEN , LIKE , LIMIT , IS NULL */

create database organization;
use organization;

create table employee(emp_id int not null primary key, first_name varchar(20), last_name varchar(20), gender char, role varchar(15), dept varchar(20), manager_id varchar(10));
desc employee;

INSERT INTO employee VALUES (101, 'Prasad', 'Deshmukh', 'M', 'Developer', 'IT', 'M11');
INSERT INTO employee VALUES (102, 'Sneha', 'Patil', 'F', 'HR Exec', 'HR', 'M12');
INSERT INTO employee VALUES (103, 'Amit', 'Shinde', 'M', 'Lead', 'IT', 'M13');
INSERT INTO employee VALUES (104, 'Pooja', 'Kulkarni', 'F', 'Analyst', 'Finance', 'M14');
INSERT INTO employee VALUES (105, 'Rohan', 'More', 'M', 'Tester', 'QA', 'M15');

SELECT * FROM employee;


/* select distinct keyword */
/* the distinct keyword in the select statement is used to eliminates duplicate rows from the result set that may be produced whiie querying data from a table. */

select distinct dept from employee order by dept;
select distinct role from employee order by role;

/* AND operation is a logical operator that combines two or more boolean expression and returns 1 and  0, or null. the and operator is used for filtering data with where clause */

SELECT * FROM employee WHERE role = 'Developer' AND dept = 'IT';

/* OR operator:it combines two boolean expressions and returns true */

select * from employee where role = 'Developer' or role = 'IT';
select * from employee where role = 'Lead' or role = 'IT';

/* IN operator : is is used to determine if a value matches any other value in the list. */

select * from employee where role in('Lead','IT');
select * from employee where role in('Analyst','Finance');

/* NOT IN OPERATOR : is formed by combining the NOT and IN operatoor. it is contrast to the IN operator is used to determine if a value does not match any of the value in the list */

select * from employee where role not in('Analyst','Finance');


/* BETWEEN operator : it is a logical operator that deserves that determmines wheter a value belongs in a range. */

alter table employee add column experience int;
SELECT * FROM employee;

UPDATE employee SET experience = 8  WHERE emp_id = 101;
UPDATE employee SET experience = 5  WHERE emp_id = 102;
UPDATE employee SET experience = 10 WHERE emp_id = 103;
UPDATE employee SET experience = 15 WHERE emp_id = 104;
UPDATE employee SET experience = 6  WHERE emp_id = 105;
 
select * from employee where experience between 6 and 10;  -- BETWEEN OPERATOR
select * from employee where experience = 5 or experience = 10;

/* LIKE OPERATOR : it is logical operator that determines whether or not a string contains a specified pattern. */

select * from employee where last_name like 'P%';
select * from employee where last_name like 'S%';
select * from employee where first_name like 'P%';

/* LIMMIT OPERATR : it is in the select statement is used to limit the number of rows returnedd */

select * from employee;
select * from employee order by experience limit 3;


/* IS NULL  : this determines whether or nnot a value is null. */
INSERT INTO employee VALUES (106, 'Asha', 'Joshi', 'F', 'President', 'HR', ' ', NULL);
INSERT INTO employee (emp_id, first_name, last_name, gender, role, dept)  VALUES (107, 'Vedika', 'Dahale', 'F', 'Lead', 'Finance');

select * from employee where manager_id is null;
select * from employee where experience is null;

select * from employee where experience is not null;


select count(*) from employee;

select count(emp_id) from employee where dept = 'IT';
select Min(experience) from employee;
select Max(experience) from employee;
select sum(experience) from employee;
select Avg(experience) as emp_exr from employee;

select * from employee;

