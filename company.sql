-- Sql constraints Primary key, NOT Null, unique, foreign key, and check constraint.
/* the follwing constraint  are commonly used in SQL :
NOT NULL : ensure that a column cannot have a null value
UNIQUE : ensure that all value in a column are unique(different). always remember a table have a many unique constraints but only single primary key const allowed in table
PRIMARY KEY : a combination of not null and unique key constraint.
FOREIGN KEY : prevents action that would destroy links between tables
CHECK : ensures that the values in a columns satisfies a specific condtion */

create database company;
use company;

--  1. NOT NULL 

CREATE TABLE Employee (
    EmpID int NOT NULL,
    first_name varchar(20) ,
    last_name varchar(20) ,
    EmpAge int
);

desc Employee;

INSERT INTO Employee VALUES (NULL, 'Rahul', 'Sharma', 28); -- will show error Column 'EmpID' cannot be null	

INSERT INTO Employee VALUES (102, NULL, 'Patel', 25);
INSERT INTO Employee VALUES (103, 'Amit', 'Verma', 32);
INSERT INTO Employee VALUES (104, 'Sneha', 'Kulkarni', 29);
INSERT INTO Employee VALUES (105, 'Rohan', 'Deshmukh', 24);

select * from Employee;

--  2. UNNIQUE

CREATE TABLE Employee1 (
    EmpID int NOT NULL,
    UNIQUE (EmpID),
    first_name varchar(20) ,
    last_name varchar(20) 
);

desc Employee;

INSERT INTO Employee1 VALUES (NULL, 'Amit', 'Verma');
INSERT INTO Employee1 VALUES (101, 'Sneha', 'Kulkarni');
INSERT INTO Employee1 VALUES (102, 'Rohan', 'Deshmukh');
INSERT INTO Employee1 VALUES (103, 'Amit', 'Verma');

select * from Employee1;

-- 3. CHECK 

CREATE TABLE Employee2 (
    EmpID int NOT NULL,
    first_name varchar(20) ,
    last_name varchar(20),
    EmpAge int,
    Check(EmpAge > 20)
);

desc Employee2;

INSERT INTO Employee2 VALUES (102, NULL, 'Patel', 25);
INSERT INTO Employee2 VALUES (103, 'Amit', 'Verma', 32);
INSERT INTO Employee2 VALUES (104, 'Sneha', 'Kulkarni', 29);
INSERT INTO Employee2 VALUES (105, 'Rohan', 'Deshmukh', 24);
INSERT INTO Employee2 VALUES (106, 'Kavya', 'Shinde', 15);

update Employee2 set first_name = 'Yash' where EmpID = 102;
DELETE FROM Employee2  WHERE EmpID = 102 AND first_name IS NULL;

select * from Employee2;

-- alter table Employee2 add column salary int;
alter table Employee2 add column salary int, add check(salary >= 5000);

SET salary = CASE EmpID -- update multiple values in single column
    WHEN 102 THEN 15000
    WHEN 103 THEN 22000
    WHEN 104 THEN 30000
    WHEN 105 THEN 18000
    ELSE salary
END;
desc Employee2;

show create table Employee2;
alter table Employee2 drop check employee2_chk_2;  -- delete a check in existing table 

update Employee2 set salary = 4000 where EmpID = 102;

-- 4. PRIMARY KEY 

CREATE TABLE Employee3 (
    EmpID int NOT NULL,
    first_name varchar(20) ,
    last_name varchar(20),
    EmpAge int,
    Check(EmpAge > 20),
    primary key(EmpID)
);

desc Employee3

INSERT INTO Employee3 VALUES (101, 'Amit', 'Verma', 32);
INSERT INTO Employee3 VALUES (102, 'Sneha', 'Kulkarni', 29);
INSERT INTO Employee3 VALUES (103, 'Rohan', 'Deshmukh', 24);
INSERT INTO Employee3 VALUES (104, 'Kavya', 'Shinde', 22);

select * from Employee3;

-- 5. FOREIGN KEY



CREATE TABLE Employee4 (
    EmpID int PRIMARY  KEY,
    first_name varchar(20) ,
    last_name varchar(20),
    EmpAge int,
    salary int
);

desc Employee4;

INSERT INTO Employee4 VALUES (101, 'Rahul', 'Sharma', 28, 3500);
INSERT INTO Employee4 VALUES (102, 'Priya', 'Patel', 25, 4200);
INSERT INTO Employee4 VALUES (103, 'Amit', 'Verma', 32, 5000);
INSERT INTO Employee4 VALUES (104, 'Sneha', 'Kulkarni', 29, 3800);
INSERT INTO Employee4 VALUES (105, 'Rohan', 'Deshmukh', 24, 2800);

select * from Employee4;
-- to allow naming and defining a check constraint on multiple columns

UPDATE Employee4 
SET salary = 5000 
WHERE salary < 5000;

alter table Employee4 add constraint chk_EmpAge_salary
check(EmpAge > 20 and salary >= 5000);

show create table Employee4;