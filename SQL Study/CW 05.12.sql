SELECT * FROM airport.airliners;
-- 1. Вывести список model_name всех самолетов (airliners) и количество всех самолетов в таблице.
select model_name, count(*) over () from airliners;
select distinct model_name, count(*) over() as t_aircaft
from airliners;
-- 2. Изменить предыдущий запрос таким образом, чтобы для каждого типа самолетов (model_name)
-- выводилось количество самолетов этого типа. Подсказка: добавить partition by model_name в over().
select distinct model_name, 
count(id) over (partition by model_name) as count_plane_model 
from airliners;

-- 3. Работаем с таблицей tickets. Написать запрос, который выводит список client_id и количество
-- билетов у каждого клиента.
select client_id, count(*) over(partition by client_id) from tickets;
-- 4. Изменить запрос таким образом, чтобы вместо client_id выводилось имя клиента из таблицы clients.
select distinct(clients.name), count(*) over(partition by client_id) from tickets
left join clients
on tickets.client_id = clients.id;
select
client_id, count(*) as count_tickets from tickets
group by client_id;
select
client_id, name, count(*) as count_tickets from tickets t
join clients c on c.id= t.client_id
group by client_id;

-- 5. Вывести список сервисных классов со средней стоимостью билета в каждом классе.

select service_class, avg(price)
from tickets
group by service_class;

-- 6. Вывести список сервисных классов со средней ценой в каждой классе и ранком каждого класса в
-- зависимости от средней цены в сервисном классе.
select service_class, avg(price) , dense_rank() over(order by avg(price) desc)  
from tickets
group by service_class;
-- 7. Вывести количество билетов для каждой поездки.

select trip_id, count(*) from tickets
group by trip_id;
-- 8. Вывести топ 2 поездок (trips) по их средней стоимости. Поездка может состоять из нескольких
-- перелетов (поэтому на каждую поездку может приходиться больше одного билета).

select trip_id, count(*) from tickets
group by trip_id;

select trip_id, count(*)
from tickets 
group by trip_id;

select * from 
(select trip_id, avg(price), dense_rank() over(order by avg(price) desc) as r
from tickets
group by trip_id) as ranked
where r <= 2;

-- Произведите ранжирование департаментов по средней зарплате.

select departments.department_id, round(coalesce(avg(salary), 0), 1), dense_rank() over(order by avg(salary) desc) as r_salary
from departments
left join employees
on departments.department_id = employees.department_id
group by departments.department_id;

-- Выведите топ-3 сотрудников с наивысшей зарплатой в каждом департаменте.

-- Выведите топ-3 сотрудников с наивысшей зарплатой в каждом департаменте.

select * from (
select department_id, first_name, last_name, salary, 
dense_rank() over (partition by department_id order by salary desc) rn_salary
from employees) f
where rn_salary <= 3;
