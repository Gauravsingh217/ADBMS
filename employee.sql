create database organization;
use organization;

create table employee (empid int not null primary key,
 first_name varchar(15), last_name varchar(15) , gender char, 
 Role varchar(15),dept varchar(10), manager_id varchar(10));

desc employee;

 insert into employee values(2, 'kim','hen','f','team leader','hr','m2');
insert into employee values (3, 'ravi', 'kumar','m','manager','president','m3');

select * from employee;
insert into employee values(1, 'john','allen', 'm', 'team leader','manager' ,'m1');

select * from employee;

select distinct role from employee order by role;

select * from employee where role = 'president' and dept = 'hr'; 

select * from employee where role = 'team leader' or role = 'manager';

select * from employee where gender = 'm' or manager_id = 'm1';

select * from employee where role in('president', 'manager');
select * from employee where role in('president','manager');

select * from employee where role not in('president','team leader'
);
select * from employee;
update employee set experience = 8 where empid = 1;
update employee set experience = 10 where empid = 3;
update employee set experience = 15 where empid = 2;


select * from employee where experience between 8 and 15;
select * from employee where experience between 6 and 14;
select * from employee where experience= 6 or experience= 14;
select * from employee where experience= 8 or experience= 15;

select * from employee where last_name like 'h%';
select * from employee order by experience limit 8;

insert into employee values(7,'asha','joshi','f','president','m4',null);
select * from employee;

select * from employee where manager_id is null;
select * from employee where experience is null;
