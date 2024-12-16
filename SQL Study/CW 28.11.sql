SELECT * FROM airport.airliners;
-- 1. Выведите количество лайнеров в каждом году.
-- 2. Выведите количество лайнеров в каждом году с годами, где количеством лайнеров больше 

SELECT production_year, count(*) FROM airport.airliners
group by production_year;

SELECT production_year, count(*) as cnt FROM airport.airliners
group by production_year
having cnt > 1;

-- 3. Выведите список client_id, amount_of_tickets (таблица tickets), который содержит айди клиентов и
-- количество билетов у каждого.
-- 4. Выведите только тех клиентов, у которых больше 2 билетов. 

-- 5. Измените запрос так, чтобы вместо айди клиентов выводились их имена (join с таблицей clients).


use airport; 
SELECT clients.name , count(*) as ticket FROM airport.tickets
left join clients on clients.id = client_id
group by clients.name
having ticket > 2;

 select client_id, count(*) as amount_of_tickets
from tickets
group by client_id;

select client_id, count(*) as amount_of_tickets
from tickets
group by client_id
having amount_of_tickets > 2;

-- Измените запрос так, чтобы вместо айди клиентов выводились их имена (join с таблицей clients).

select c.name, t.client_id, count(*) as amount_of_tickets
from tickets as t
join clients as c
on t.client_id = c.id
group by t.client_id
having amount_of_tickets > 2;

-- 6. Выведите среднюю стоимость билетов в каждом сервисном классе. 
SELECT avg(price), service_class FROM airport.tickets
group by service_class;

SELECT avg(price) as a, service_class FROM airport.tickets
group by service_class
having a > 50000;

-- 7. Выведите список самых популярных аэропортов отправления (trips departures). 
-- 7. 1 трех популярных
-- 7.2 с самым большим количеством

 

select departure,count(*) as cnt
from trips
group by departure
having cnt =
(  
	select count(*) as cnt
	from trips
	group by departure
	order by cnt desc
	limit 1
 ) ;
 
 
 select * from
(select departure, count(*) as cnt
from trips group by departure) as t
inner join 
(  
	select DISTINCT count(*) as cnt
	from trips
	group by departure
	order by cnt desc
	LIMIT 3
 ) as n
 on t.cnt = n.cnt;
 
 
 -- Выведите список моделей лайнеров и их количество, но только для моделей, 
 -- произведённых после 2010 года и имеющих более одного экземпляра.
-- Найдите годы, в которые было выпущено более 2 лайнеров, 
-- и выведите год и среднюю дальность полёта для этих лайнеров. 
select a.production_year, avg(a.range)
from airliners a
group by a.production_year
having count(*) > 2;