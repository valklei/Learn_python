 -- 1. Вывести текущую дату и время
 SELECT NOW();
 
 -- 2. Вывести текущий год и месяц
SELECT YEAR(NOW()), MONTH(NOW());

-- 3.Вывести текущее время
SELECT CURRENT_TIME;

-- 4. Вывести название текущего дня недели
SELECT DAYNAME(NOW());

-- 5. Вывести номер текущего месяца
SELECT MONTH(NOW());

-- 6. Вывести номер дня в дате “2020-03-18”
SELECT DAYOFWEEK(NOW());

-- 7. Подключиться к базе данных shop (которая находится на удаленном сервере).
use shop;

-- 8. Определить какие из покупок были совершены апреле (4-й месяц)
select ORDER_ID, ODATE from shop.ORDERS
where extract(month from odate) = 4;

-- 9. Определить количество покупок в 2022-м году
select count(ORDER_ID), extract(year from ODATE) from shop.ORDERS
where extract(year from odate) = 2022;

-- 10. Определить, сколько покупок было совершено в каждый день. 
-- Отсортировать строки в порядке возрастания количества покупок. 
-- Вывести два поля - дату и количество покупок
select ODATE, count(ORDER_ID) from shop.ORDERS
group by  ODATE
order by count(ORDER_ID);

-- 11. Определить среднюю стоимость покупок в апреле
select avg(AMT), ODATE from shop.ORDERS
where extract(month from odate) = 4; 