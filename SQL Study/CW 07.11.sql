select department_id, count(employee_id) as employees_cnt
from employees
group by department_id;

select count(employee_id), e.department_id, d.department_name
from hr.employees e
left join departments d
on  e.department_id = d.department_id
group by e.department_id;

-- 3. Найти количество сотрудников у каждого менеджера. Вывести manager_id и employees_cnt



-- 4. Найти количество сотрудников у каждого менеджера. 
-- Вывести manager_id и employees_cnt, а также вывести first_name, last_name менеджера