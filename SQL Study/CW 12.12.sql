--  1. Вывести количество самолетов каждой модели.
-- 2. Вывести количество самолетов по странам.
-- 3. Вывести количество trips для каждого типа лайнера.

select count(*) as numbers, model_name from airliners group by model_name;

select count(*) as numbers, country from airliners group by country;

SELECT count(*), model_name from trips as tr
left join airliners as a
on tr.airliner_id = a.id
group by model_name;




-- 4. Вывести id билетов, цену билета и среднюю стоимость билета (таблица tickets).
SELECT trip_id, count(id) FROM tickets group by trip_id; 

-- 5. Вывести среднюю стоимость билета в каждом классе обслуживания (service_class).
SELECT trip_id, count(id) , RANK() OVER (ORDER BY COUNT(id) DESC) AS rank_ticket 
FROM tickets group by trip_id;

 

-- 6. Вывести список поездок (trips) по убыванию количество билетов для каждой поездки.


-- 7. Изменить предыдущий запрос так, чтобы выводился ранк каждой поездки в зависимости от
-- количества билетов в ней.

 
 select trip_code, count(*) from tickets
 left join trips
 on tickets.trip_id = trips.id
 group by trip_code
 order by count(*) desc;


-- 7. Изменить предыдущий запрос так, чтобы выводился ранк каждой поездки в зависимости от количества билетов в ней.
-- 8. Вывести поездку с самым большим количеством билетов.

-- 9. Вывести поездку с третьим по количеству билетов.
-- 10. Вывести список билетов с именами пассажиров, а также названием модели авиалайнера.
-- 11. Вывести среднее количество билетов у каждого клиента

-- Вывести список поездок (trips) по убыванию количество билетов для каждой поездки.

select trip_code, count(*) 
from tickets as t
left join trips as tr
on t.trip_id = tr.id
group by trip_code
order by count(*) desc;  

-- Изменить предыдущий запрос так, чтобы выводился ранк каждой поездки в зависимости от количества билетов в ней.

select trip_code, count(*), dense_rank() over(order by count(*) desc) as rang
from tickets as t
left join trips as tr
on t.trip_id = tr.id
group by trip_code
order by count(*) desc;
-- 9. Вывести поездку с третьим по количеству билетов.
select * 
    from( select 
dense_rank() over (order by count(id) desc) as order_rank ,
trip_id as trips_ , 
count(id) as count_trips 
from tickets
group by trip_id ) as rank_tickets
where order_rank = 3 ;

-- Найти среднее значение по каждой продаже и её  соседних продаж , расчитать разницу между ними

select ORDER_ID, AMT, 
avg(amt) over(order by ORDER_ID ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING),
avg(amt) over(order by ORDER_ID ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) - amt,
avg(amt) over(order by ORDER_ID ROWS BETWEEN 1 PRECEDING AND current row),
lag(amt, 1, 0) over(order by ORDER_ID),
lead(amt, 1, 0) over(order by ORDER_ID)
from ORDERS;

select trip_code, 
count(*), 
dense_rank() over(order by count(*) desc) as rang
from tickets as t
left join trips as tr
on t.trip_id = tr.id
group by trip_code
order by count(*) desc;

select * from
(select trip_code, 
count(*), 
dense_rank() over(order by count(*) desc) as rang
from tickets as t
left join trips as tr
on t.trip_id = tr.id
group by trip_code
order by count(*) desc) a
where a.rang < 3;