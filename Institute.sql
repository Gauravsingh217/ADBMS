CREATE DATABASE IF NOT EXISTS Institute;
USE Institute;

CREATE TABLE Staff (
    staff_id INT ,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    DOB DATE,
    dept_id INT
);

CREATE TABLE Department (
    dept_id INT,
    dept_name VARCHAR(20),
    dept_location VARCHAR(20)
);

/* It displays the schema structure of that table. */

DESC Staff;
DESC Department;

/* Add columns to a existing table */

ALTER TABLE Staff ADD Location varchar(15);
ALTER TABLE Staff ADD Joining_year int;
ALTER TABLE Staff ADD age int, ADD contact_no int(10);
ALTER TABLE Staff ADD (age int, contact_no int(10));
DESC Staff;

/* Change  the data type of a column in an existing table */

ALTER TABLE Staff MODIFY first_name TEXT;
DESC Staff;

/* Drop column from an existing table */

ALTER TABLE Staff DROP COLUMN Contact_no;
DESC Staff;

/* Change the size of datatype */

ALTER TABLE Staff MODIFY last_name VARCHAR(50);
ALTER TABLE Staff MODIFY first_name VARCHAR(50);
DESC Staff;

/* Create a foreign key constraint between two tables. */

ALTER TABLE Staff ADD PRIMARY KEY(staff_id);
ALTER TABLE Department ADD PRIMARY KEY(dept_id);

ALTER TABLE Staff ADD FOREIGN KEY(dept_id)
REFERENCES Department(dept_id);

DESC Staff;
DESC Department;

/* Drop a primary key constraint from existing table. */

ALTER TABLE Department DROP PRIMARY KEY;
DESC Department;

/* Drop a foreign key constraint from existing table */

ALTER TABLE Staff ADD CONSTRAINT FK_staff_department FOREIGN KEY (dept_id) REFERENCES Department(dept_id);
ALTER TABLE Staff DROP FOREIGN KEY FK_staff_department;
DESC Staff;

/* rename a table */

ALTER TABLE Staff RENAME STAFF;
DESC STAFF;
-- OR
RENAME TABLE STAFF TO Staff1;
DESC Staff1;
