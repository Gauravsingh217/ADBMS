-- DML Commands

create database college;
use college;

create table Employee(
    EmpID int, 
    first_name varchar(20), 
    last_name varchar(20), 
    EmpAge int, 
    Empzone varchar(10)
);

desc Employee;

INSERT INTO Employee VALUES (101, 'Rahul', 'Sharma', 28, 'North'); -- single row insertion syntax
INSERT INTO Employee VALUES (102, 'Priya', 'Patel', 25, 'West');
INSERT INTO Employee VALUES (103, 'Amit', 'Verma', 32, 'East');
INSERT INTO Employee VALUES (104, 'Sneha', 'Kulkarni', 29, 'South');
INSERT INTO Employee VALUES (105, 'Rohan', 'Deshmukh', 24, 'West');

SELECT * FROM Employee;

INSERT INTO Employee (EmpID, first_name, last_name, EmpAge, Empzone) VALUES  -- Multiple rows insertion syntax
(201, 'Aarav', 'Joshi', 26, 'East'),
(202, 'Ananya', 'Mehta', 31, 'North'),
(203, 'Vikram', 'Shinde', 27, 'Central'),
(204, 'Pooja', 'Nair', 34, 'West'),
(205, 'Aditya', 'Chavan', 23, 'South');

SELECT * FROM Employee;

update Employee set Empzone = 'West' where EmpID = 101;  -- update single values
update Employee set last_name = 'Shinde' where EmpID = 104;  
update Employee set first_name = 'Amit' where EmpID = 101;

update Employee set EmpAge = 25, Empzone = 'West' where EmpID = 102;  -- update multiple values
update Employee set EmpAge = 28, Empzone = 'North' where EmpID = 103;  

SELECT * FROM Employee;

delete from Employee where EmpID = 103; -- delete a rows

SELECT * FROM Employee;

select EmpID, first_name from Employee;  -- to show only specific data

truncate Employee;  -- delete all the rows from table



