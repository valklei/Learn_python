use shop;

-- Задача 1: Вывести города, где средняя цена заказа больше 1000

SELECT avg(AMT) as avgprice, city FROM shop.ORDERS
left join SELLERS
on ORDERS.SELL_ID = SELLERS.SELL_ID
group by CITY
having avgprice > 1000;

SELECT avg(AMT) as avgprice, city FROM shop.ORDERS
left join SELLERS
on ORDERS.SELL_ID = SELLERS.SELL_ID
group by CITY
having avgprice > 1000;
    
-- Задача 2: Найти месяцы, в которых количество заказов превышает 2

SELECT count(*) count_or, MONTH(ODATE) as month_or FROM shop.ORDERS
group by month_or
having count_or > 2;
    
-- Задача 3: Найти продавцов, чья средняя сумма заказа превышает среднюю сумму заказа всех продавцов

SELECT avg(AMT) as avgprice, ORDERS.SELL_ID, SELLERS.SNAME FROM shop.ORDERS
left join SELLERS
on ORDERS.SELL_ID = SELLERS.SELL_ID
group by ORDERS.SELL_ID
having avgprice > (SELECT avg(AMT) FROM shop.ORDERS);

select s.SNAME, sum(AMT)
from SELLERS as s 
join ORDERS as o
on s.SELL_ID = o.SELL_ID
group by s.SNAME
having sum(AMT) > (select avg(AMT)
from ORDERS);


-- Задача 4: Найти клиентов, которые сделали заказы только в одном месяце года 2022

-- Задача 4: Найти клиентов, которые сделали заказы только в одном месяце года 2022
select year(o.odate) y, date_format(o.odate, '%Y-%m') m_date, o.CUST_ID, count(*) cn
from ORDERS o, CUSTOMERS c
where o.CUST_ID = c.CUST_ID and year(o.odate) = 2022
group by y, m_date, o.CUST_ID 
having cn = 1;
    
-- Задача 5: Найти продавцов, которые выполнили больше всего заказов в одном месяце

-- Задача 6: Найти города, где сумма заказов превышает среднюю сумму заказов по всем городам
                         
-- Задача 7: Найти клиентов с минимальным рейтингом в каждом городе
 










