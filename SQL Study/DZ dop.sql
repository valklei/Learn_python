USE airport;
-- 1. Вывести список всех клиентов, которые приобрели билеты для поездок со статусом "Arrived":

select name, status from clients
join 
(select trip_id, client_id, status from tickets
join trips
on tickets.trip_id = trips.id
where status = 'Arrived') as AR
on clients.id = AR.client_id;

-- 2. Вывести список всех клиентов с их возрастом и количеством приобретённых билетов:
select name, age, count(tickets.id) from clients
join tickets
on clients.id = tickets.client_id
group by clients.id;

-- 3. Посчитать среднюю цену билета для каждой поездки:


-- 4. Вывести количество клиентов для каждого авиалайнера:


-- 5. Вывести список всех поездок, на которых не было пассажиров:


-- 6. Выведите список всех клиентов и их соответствующих билетов (если они есть), а также билетов, которые не были куплены


-- 7. Выведите список всех пассажиров и авиалайнеров, на которых они летят, а также авиалайнеров, на которых нет пассажиров.



