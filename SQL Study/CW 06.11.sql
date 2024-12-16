SELECT * FROM hr.employees;
#1) Используя базу hr_data.sql, найти самую высокую зарплату.
#2) Найти количество сотрудников.
#3) Найти имя и фамилию сотрудника с самой высокой зарплатой.
#4) Найти среднюю зарплату по компании.
#5) Найти сотрудников, у которых зарплата меньше средней зарплаты по компании.

select max(salary) from hr.employees;

select count(*) from hr.employees;

select first_name, last_name from hr.employees where salary = (select max(salary) from hr.employees);

select avg(salary) from hr.employees;

select first_name, last_name, salary from hr.employees where salary < (select avg(salary) from hr.employees);

#6) Найти общее количество департаментов.
#7) Найти количество департаментов, в которых никто не работает.
#8) Найти среднюю зарплату в департаменте с id 90.
#9) Найти самую большую зарплату среди сотрудников, работающих в департаментах с id 70 и 80.
#10) Найти количество сотрудников из департамента с айди 100, которые зарабатывают более 5000.
#11) Найти количество сотрудников из департамента с айди 60, которые зарабатывают больше
#средней зарплаты по компании.


SELECT count(*) FROM hr.departments;
select count(*)
FROM hr.departments
left join hr.employees
on departments.department_id = employees.department_id where employees.employee_id is null;

select department_id, count(employee_id)
from employees
group by department_id;

select
d.department_id, d.department_name,
count(e.employee_id)
from employees e
join departments d
on e.department_id=d.department_id
group by d.department_id;

select
d.department_id, d.department_name,
count(e.employee_id)
from employees e
join departments d
on e.department_id=d.department_id
group by d.department_id;