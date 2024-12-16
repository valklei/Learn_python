SELECT * FROM hr.employees;

-- Найти количество сотрудников у каждого менеджера. Вывести manager_id и
-- employees_cnt

select distinct(manager_id), count(employee_id) over (partition by manager_id)  from employees;

-- 2. Работаем с базой World. Выведите седьмой по густонаселенности город.


select * from (select name, Population, dense_rank() over(order by Population desc) as PN from city) as PPP
where PN = 7;

select "city_7", Name, Population from city 
order by Population desc
limit 1 offset 6;

SELECT * FROM world.city;
select Name, CountryCode, Population from world.city order by Population desc limit 1 offset 6;


WITH SellerAverage AS (
SELECT sname, AVG(O.amt) AS avg_amt
FROM shop.ORDERS O
LEFT JOIN SELLERS SL ON O.sell_id = SL.sell_id
WHERE EXTRACT(MONTH FROM O.odate) = 3
GROUP BY sname
),
MaxMinAverage AS (
SELECT 
MAX(avg_amt) AS max_avg_amt,
MIN(avg_amt) AS min_avg_amt
FROM SellerAverage
)
SELECT sname, avg_amt
FROM SellerAverage
CROSS JOIN MaxMinAverage
WHERE avg_amt = max_avg_amt OR avg_amt = min_avg_amt;

WITH MonthlyHires AS (
SELECT DATE_FORMAT(hire_date, "%Y-%m") AS mon_year, COUNT(*) AS cnt
FROM employees
GROUP BY mon_year
),
MaxHires AS (
SELECT MAX(cnt) AS max_cnt
FROM MonthlyHires
)
SELECT mon_year, cnt
FROM MonthlyHires
CROSS JOIN MaxHires
WHERE cnt = max_cnt;

-- Определить у кого в третьем месяце были самые большие и маленькие средние продажи


-- Определите месяцы, в которых было нанято максимальное количество сотрудников.

-------------------------------------------------------------------------------------------------

-- 3. Выведите название города, население и максимальное население для каждого
-- города

select name, Population from city order by Population desc;

select Name, Population, max(Population) OVER () AS max_pop
from city;

-- 4. Напишите запрос для определения разницы в продолжительности жизни между
-- текущей страной и страной с самой высокой продолжительностью жизни.
select Name, LifeExpectaLifeExpectancyncy, max(LifeExpectancy) OVER () AS max_life
from country;

with MAX_life as (select LifeExpectancy as life from country order by LifeExpectancy desc limit 1)
select  Name, LifeExpectancy, life, life - LifeExpectancy as life_diff  
from country, MAX_life
where LifeExpectancy is not null;

-- 5. Выполните ранжирование стран по средней численности населения
select ci.Name, avg(ci.Population), co.Population, co.Population - avg(ci.Population) as diff_pop, dense_rank () over (order by avg(ci.Population) desc), 
co.Name from city ci
left join country as co 
on ci.CountryCode = co.Code
group by CountryCode;

-- На основании предыдущего запроса выведите топ 5 стран по средней численности
-- населения 

SELECT name, Population, dense_rank() over(order by Population desc) FROM world.country limit 5;

select * from 
(select ci.Name as city_name, avg(ci.Population), co.Population, co.Population - avg(ci.Population) as diff_pop, 
dense_rank () over (order by avg(ci.Population) desc) as des_pop, 
co.Name from city ci
left join country as co 
on ci.CountryCode = co.Code
group by CountryCode) pop_ran
 where des_pop <= 5; --

-- Найти страны с населением выше среднего по всему миру.
-- Решить с помощью with

select avg(Population) from country;

with average_pop as (select round(avg(Population), 0) as AP from country)
select code, name, Population, AP, Population - AP as diff 
from country, average_pop
where Population > AP
order by Population desc;

 -- Напишите запрос для определения доли населения города от общей численности
-- населения страны и проведите ранжирование городов в пределах каждой страны:

select Name, CountryCode, Population, sum(Population) over(partition by CountryCode ) as sum_pop,
Population / sum(Population) over(partition by CountryCode ) *100
from city;
