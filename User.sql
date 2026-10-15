create database User;

show databases;

use user;

create table Customer(
	Custidi int,
    Custname varchar (15),
    City varchar (10),
    Product varchar (15),
    Price int
);

desc Customer;

INSERT INTO Customer (Custidi, Custname, City, Product, Price)
VALUES
(1, 'Pranav', 'Pune', 'Laptop', 45000),
(2, 'Rahul', 'Mumbai', 'Mobile', 15000),
(3, 'Amit', 'Latur', 'Keyboard', 1200);

select * from customer;

ALTER TABLE Customer
ADD PRIMARY KEY (Custidi);

ALTER TABLE Customer
RENAME COLUMN Custidi TO Custid;

select Custid,Custname,city from Customer;

select * from customer where custid=1 or custid=3;

create table CloneTable as select * from customer;

select * from CloneTable;

drop table CloneTable;

select custname, product, price from customer where price>15000;

select custname, city from customer;

select custname, product from customer where price>15000;

select * from customer where city='Mumbai';

/* Sorting data using Order by single column*/

select * from customer order by price;

select * from customer order by price desc;

/* Sorting data order by multiple columns*/

select * from customer order by city, price;

select * from customer order by price, city;

select * from customer order by city desc, price asc;

/* Single-row fuctions*/
/* Case Conversation functions*/

select upper(custname), lower(product) from customer where custid<3; /* uppercase and lower case function*/

select upper(custname), lower(product) from customer;

alter table customer add column Custlast_name varchar(15);

update customer set Custlast_name = 'Hasnale' where Custid=1;
update customer set Custlast_name = 'Dacoit' where Custid=2;
update customer set Custlast_name = 'Tyagi' where Custid=3;

/* Concat two column*/

select concat(custname,' ',Custlast_name) as FullName from customer;

/* use of SUBSTR(Substring) and INSTR() function*/

select * from customer;

select substr(custname,1,3) from customer;
select substr(custname,1,0) from customer;
select substr(custname,0,3) from customer;
select substr(custname,1,1) from customer;

/* substring query*/

select instr(custname,'a') as position from customer;

INSERT INTO Customer (Custid, Custname, City, Product, Price)
VALUES
(4, 'Aayush', 'Pune', 'Laptop', 85000),
(5, 'Gaurav', 'Nanded', 'PowerBank', 1000);

select substr(Custname,1,2),
instr(Custname,'a') from customer;






