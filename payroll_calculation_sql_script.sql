-- create a database named SQL basics:
create database sqlbasics;

-- select SQL basics:
use sqlbasics;

-- Write a query to create the employee and department tables:
Create table employee_datasets (
emp_id int not null primary key,
f_name varchar(20),
l_name varchar(20),
job_id varchar(10),
salary int,
manager_id varchar(20),
dept_id varchar(20));

describe employee_datasets;

create table department_datasets (
dept_id varchar(20) not null primary key,
dept_name varchar(30),
location varchar(45),
manager_id varchar(20),
elocation_id varchar(20));

describe department_datasets;

-- Write a query to insert values into the employee and department tables:
insert into employee_datasets (emp_id, f_name, l_name, job_id, salary, manager_id, dept_id)
values (101, 'Ankit', 'Jain', 'HP124', 200000, 2, 24),
(102, 'Sarvesh', 'Patel', 'HP123', 150000, 2, 24),
(103, 'Krishna', 'Gee', 'HP125', 500000, 5, 44),
(104, 'Rana', 'Gee', 'HP122', 250000, 3, 54),
(105, 'Soniya', 'Jain', 'HP121', 400000, 1, 22),
(106, 'Nithin', 'Kumar', 'HP120', 300000, 4, 34),
(107, 'Karan', 'Patel', 'HP126', 300001, 2, 34),
(108, 'Shilpa', 'Jian', 'HP127', 300001, 5, 24),
(109, 'Mukesh', 'Singh', 'HP128', 300001, 4, 44);

select * from employee_datasets;

insert into department_datasets (dept_id, dept_name, location, manager_id, elocation_id)
values (22, 'Administration', 'uk', 1, 218),
(24, 'Production', 'india', 2, 212),
(34, 'development', 'india', 4, 212),
(44, 'communication', 'usa', 5, 220),
(54, 'Maintenance', 'usa', 3, 220);

select *from department_datasets;

-- Write a query to create a view of the employee and department tables:
create view emp_1 as select emp_id, f_name, l_name, dept_name, location, salary from employee_datasets, department_datasets where salary>300000;

select * from emp_1;

-- Write a query to display the first and last names of every employee in the employee table whose salary is greater than the average salary of the employees listed in the SQL basics table:
select f_name, l_name from employee_datasets where salary > (select avg(salary) from employee_datasets);

-- Write a query to change the delimiter to //:
delimiter //

-- Write a query to create a stored procedure in the employee table for every employee whose salary is greater than or equal to 300,000:
drop procedure if exists salarys;
delimiter &&
create procedure salarys()
begin
select * from employee_datasets where salary>=300000;
end &&

-- Write a query to execute the stored procedure:
call salarys();

-- Write a query to create and execute a stored procedure with one parameter using the order by function in descending order of the salary earned:
delimiter &&
create procedure sort_desc_salary(in num int)
begin
select * from employee_datasets order by salary desc limit num;
end &&

call sort_desc_salary(5);