SELECT * FROM hr.employees;

-- 1. Посчитать количество менеджеров в каждом отделе у которых количество подчиненных больше 2.

SELECT count(manager_id), department_id
from (SELECT count(employee_id)as CNT, manager_id, department_id from employees
group by manager_id, department_id) d
where CNT > 2
group by department_id;

select count(*), salary 
from hr.employees
where salary > 15000;

select count(*), group_concat(salary order by salary separator '... ') as SL
from hr.employees
where salary > 15000;

-- 2 Вывестина одной строке каждого менеджера и всех его работников через запятую

SELECT count(manager_id), department_id
from (SELECT count(employee_id)as CNT, manager_id, department_id from employees
group by manager_id, department_id) d
where CNT > 2
group by department_id;


select managers.first_name, managers.last_name, managers.manager_id, 
group_concat(concat(empl.first_name," ", empl.last_name) order by empl.first_name, empl.last_name separator ', ')
FROM employees empl
inner join employees as managers
on empl.manager_id = managers.employee_id
group by empl.manager_id;

-- 1. Вывести все поездки (trips) с указанием названия airliner
-- 2. Вывести все билеты, с указанием имени клиента
-- 3. Вывести количество поездок по каждому airliner с указанием названия типа самолета
-- 4. Вывести количество пассажиров для каждой поездки
-- 5. Посчитать количество поездок для каждого типа airliner. Поменяйте запрос и использованием joins
-- так, чтобы выводилось название модели самолета.

select e.first_name, e.last_name, concat_ws(', ', e.first_name, e.last_name) concat_ws, concat(e.first_name, ', ', e.last_name) concat
from hr.employees e;


select e.department_id, group_concat(e.first_name, ' ' ,e.last_name order by e.first_name separator ', ')
from hr.employees e
group by e.department_id;