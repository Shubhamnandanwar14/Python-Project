create table employee_table
(
employee_id int identity(1,1),
first_name varchar(20),
last_name varchar(20),
salary int,
joining_date date,
department varchar(20),
)

select*from employee_table

insert into employee_table values('ankita','arora',100000,'2022-02-14','HR')
insert into employee_table values('veena','verma',80000,'2011-06-15','admin')
insert into employee_table values('vishal','singhal',300000,'2020-02-16','HR')
insert into employee_table values('sushanth','singh',500000,'2020-02-17','Admin')
insert into employee_table values('bhupal','bhati',500000,'2011-06-18','Admin')
insert into employee_table values('dheeraj','diwan',200000,'2011-06-19','Account')
insert into employee_table values('karan','kumar',75000,'2020-01-14','Account')
insert into employee_table values('chandrika','chauhan',90000,'2011-04-15','Admin')


create table employee_bonus_table
(
employee_ref_id int,
bonus_amount int,
bonus_date date,
)

select*from employee_bonus_table

insert into employee_bonus_table values (1,5000,'2020-02-16')
insert into employee_bonus_table values (2,3000,'2011-06-16')
insert into employee_bonus_table values (3,4000,'2020-02-16')
insert into employee_bonus_table values (1,45000,'2020-02-16')
insert into employee_bonus_table values (2,35000,'2011-02-16')


create table employee_title_table 
(
employee_ref_id int,
employee_title varchar(20),
affective_date date
)

select*from employee_title_table

insert into employee_title_table values (1,'manager','2016-02-2')
insert into employee_title_table values (2,'executive','2016-06-11')
insert into employee_title_table values (8,'executive','2016-06-11')
insert into employee_title_table values (5,'manager','2016-06-11')
insert into employee_title_table values (4,'asst manager','2016-06-11')
insert into employee_title_table values (7,'executive','2016-06-11')
insert into employee_title_table values (6,'lead','2016-06-11')
insert into employee_title_table values (3,'lead','2016-06-11')


1.
 select first_name as employee_name from employee_table 

2
select upper(last_name) from employee_table 

3.
select distinct(department) from employee_table

4.
select substring (last_name,1,3)from employee_table

5. 
select distinct(department) , len('department') from employee_table

6 
select CONCAT(first_name,' ',last_name) as emp_name from employee_table


7
select * from employee_table order by first_name asc
select * from employee_table order by first_name desc

8.
select*from employee_table order by department desc,first_name asc

9.
select*from employee_table where first_name='veena'------its error-------

10.
select*from employee_table where department='admin'

11.
select*from employee_table where first_name like 'v%'

12.
select*from employee_table where salary between 100000 and 500000

13.
Select * from employee_table where year(JOINING_DATE) = 2020 and month(JOINING_DATE) = 2;

14.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM employee_table 
WHERE employee_id IN 
(SELECT employee_id FROM employee_table
WHERE Salary BETWEEN 50000 AND 100000);

16.
SELECT DISTINCT W.FIRST_NAME, T.employee_title
FROM employee_table W
INNER JOIN employee_title_table T
ON W.employee_id = T.employee_ref_id
AND T.employee_title in ('Manager')


17
SELECT employee_title, affective_date, COUNT(*)
FROM employee_title_table
GROUP BY employee_title, affective_date
HAVING COUNT(*) > 1;

18.
SELECT * FROM employee_table WHERE MOD (employee_id,2) <> 0

19.
SELECT * INTO EMPLOYEEtable FROM employee_table;------------------clone table-----------------
select*from EMPLOYEEtable

20.
select *from employee_table where salary=(select Max(salary) from employee_table);---------------------highest salary---------------

20.
select distinct top 2 salary from employee_table order by Salary desc ---------------------top 2 highest salary-----------

22.
Select max(Salary) from employee_table
where Salary not in (Select max(Salary) from employee_table)----------------------second highest salary------------

23.
SELECT *FROM employee_table WHERE employee_id <= (SELECT count(employee_id)/2 from employee_table)-------------------50% data----------

24.
SELECT DEPARTMENT, COUNT(employee_id) as 'Number of Workers' FROM employee_table GROUP BY DEPARTMENT HAVING COUNT(employee_id) < 4;


25.
SELECT department, COUNT(*) FROM employee_table GROUP BY department;--------no. of employee in department wise----------


26.
SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from employee_table group by DEPARTMENT) as TempNew 
Inner Join employee_table t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary;


27.
SELECT FIRST_NAME, SALARY from employee_table WHERE SALARY=(SELECT max(SALARY) from employee_table);


28.
SELECT department,AVG(SALARY) AS 
AVERAGE_SALARY FROM employee_table GROUP BY department;

29.



30.
select first_name , last_name from employee_table
