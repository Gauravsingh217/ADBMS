CREATE DATABASE TCL;

USE TCL;

CREATE TABLE Orders (
	order_id INT PRIMARY KEY,
    customer_name VARCHAR (100),
    status VARCHAR(50)
    );
    
DESC Orders;

SET autocommit=0;

-- start transaction;

BEGIN;

INSERT INTO orders VALUES (101, 'Geet', 'Pending');
INSERT INTO orders VALUES (102, 'Bob', 'Pending');

select * from Orders;

update orders set customer_name='Raj' where order_id=102;

rollback;

INSERT INTO orders VALUES (101, 'Geet', 'Pending');
INSERT INTO orders VALUES (102, 'Bob', 'Pending');

commit;

update orders set customer_name='Raj' where order_id=102;

savepoint sp1;

rollback;

update orders set status='Shipped' where order_id=102;

savepoint sp2;

rollback to savepoint sp1;

select * from orders;

rollback to savepoint sp1;

delete from orders where order_id = 102;

savepoint sp3;

select * from orders;

rollback;

rollback to savepoint sp2;

select * from orders;

show databases;