create database basicjoin;

use basicjoin;

create table employees(employee_id int primary key, ename varchar(40));

desc employees;

insert into employees (employee_id, ename)
values (101, 'raghav'),
	   (102, 'aayush'),
       (103, 'pranav'),
       (104, 'rohan'),
       (105, 'prachi');
       
select * from employees;

create table projects(
      project_id int primary key,
      pname varchar(40),
      employee_id int,
      foreign key(employee_id)
      references employees(employee_id));
      
      desc projects;
      
      insert into projects(project_id, pname,employee_id) 
      values(1,'srushti',101),
			(2,'aayush',102),
            (3,'rudransh',103),
            (4,'rohan',104),
            (5,'prachi',105);
            
	select * from projects;
    
    -- inner join 
    -- only matching records will display from employee and projects tables
    
    select * from employees
    join projects
    on employees.employee_id = projects.employee_id;
    
    -- fetch the employee name and project name they belong to
    
    select e.ename, p.pname from employees e
    inner join projects p
    on e.employee_id = p.employee_id;
    
	select e.ename, p.pname from projects p
    right join employees e
    on e.employee_id = p.employee_id;
    
  select e.employee_id , e.ename, p.pname from employees e
  left join projects p
  on e.employee_id = p.employee_id;
  
  insert into projects values(6,'project6',106);
  insert into projects values(7,'project57',107);
  
  
  
  -- full outer join using union
  -- display all matching and non matching data from both tables
  
  select  * from employees
  left join projects
  on employees.employee_id = projects.employee_id
  union
  select * from employees
  left join projects
  on employees.employee_id = projects.employee_id;
  
  select employees.ename , projects.pname from employees
  left join projects on employees.employee_id = projects.employee_id
  where projects.employee_id is null;
