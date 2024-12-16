SELECT department_id, count(*) as cnt FROM hr.employees
group by department_id
having cnt > 10;

select employees.department_id, department_name, count(*) as cnt, sum(salary) as sum_s 
from employees 
left join departments
on employees.department_id = departments.department_id
group by employees.department_id
having cnt > 10 and sum_s > 200000;

select employees.department_id, department_name, count(*) as cnt, sum(salary) as sum_s 
from employees 
left join departments
on employees.department_id = departments.department_id
group by employees.department_id
having cnt > 10 or sum_s > 200000;

select department_id, max(salary) as max_salary from employees
group by department_id
having max_salary < 15000;

 -- 2. Найти сотрудников, у которых наибольшая зарплата в их департаменте.
 select department_id, salary as   from employees
group by department_id
having max_salary < 15000;