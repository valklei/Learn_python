select * from employees;

select count(*) as count from employees;
-- select employee_id, first_name, count(*) as count from employees; не валидное имя
select count(salary) from employees;
select count(commission_pct) from employees;

select sum(salary) from employees;
select sum(salary) from employees where department_id = 110;
select sum(commission_pct) from employees;
select sum(employee_id) from employees; -- не валидно суммировать id
select sum(last_name) from employees; -- не валидно суммировать текст

select max(salary) from employees;
select * from employees where department_id = 110;
select max(salary) from employees where department_id = 110;
select min(salary) from employees;

select avg(salary) as avg_salary from employees;
select avg(commission_pct) as avg_salary from employees;

select sum(commission_pct) as sum, count(commission_pct) as cnt, 
sum(commission_pct) / count(commission_pct) as avg, 
avg(commission_pct) as avg_salary from employees;


select 
	sum(commission_pct) as sum, 
	count(*) as cnt, 
	sum(commission_pct) / count(*) as avg, 
	avg(commission_pct) as avg_salary from employees;


select * from employees where salary = 24000;
select * from employees where salary = (select max(salary) from employees);







select * from employees order by salary limit 1;
select first_name, last_name, min(salary) from employees;
select max(salary) from employees;

select first_name, last_name, salary from employees 
where salary = (select max(salary) from employees)
or salary = (select min(salary) from employees);




SELECT *
FROM employees 
where department_id = 90;

SELECT avg(salary)
FROM employees 
where department_id = 90;

select department_id, count(employee_id), avg(salary)
from employees
group by department_id;

select
 e.employee_id,
 d.*
from employees e
 join departments d
 on e.department_id=d.department_id;
 
select
 d.department_id, d.department_name,
 count(e.employee_id)
from employees e
 join departments d
 on e.department_id=d.department_id
 group by d.department_name;

 
select
 d.department_id, d.department_name,
 count(e.employee_id)
from employees e
 join departments d
 on e.department_id=d.department_id
 group by d.department_id;

select
department_id,
max(salary) as max_salary
from hr.employees
group by department_id;

select
t1.FIRST_NAME,
t1.LAST_NAME, t1.department_id, max_salary
from hr.employees t1
inner join (
select
department_id,
max(salary) as max_salary
from hr.employees
group by department_id
) t2
on t1.department_id = t2.department_id
and t1.salary = t2.max_salary;

-- 1. Посчитайте количество людей на каждой позиции (job_id).
select job_id, count(*) from employees group by job_id;

-- 2. Выведите среднюю (максимальную, минимальную) зарплату по отделу.
select department_id, avg(salary) av, max(salary) max, min(salary) min
from employees
group by department_id;

-- Найти имена и фамилии сотрудников, их департамент и среднюю зарплату,
--  у которых зарплата больше средней в каждом
-- департаменте HR.EMPLOYEES
select
t1.FIRST_NAME,
t1.LAST_NAME, t1.department_id, avg_salary, salary
from hr.employees t1
inner join (
select
department_id,
avg(salary) as avg_salary
from hr.employees
group by department_id
) t2
on t1.department_id = t2.department_id
and t1.salary > t2.avg_salary;