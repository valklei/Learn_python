-- Подключиться к базе данных world
use world;
-- 2. Вывести население в каждой стране. Результат содержит два поля: CountryCode, sum(Population). 
-- Запрос по таблице city.
SELECT CountryCode, sum(Population) FROM world.city
group by CountryCode;

-- 3. Изменить запрос выше так, чтобы выводились только страны с населением более 3 млн человек. 
SELECT CountryCode, sum(Population) as SP FROM world.city
group by CountryCode
having SP > 3000000;

-- 4. Сколько всего записей в результате?

select count(*) from (SELECT CountryCode, sum(Population) as SP FROM world.city
group by CountryCode
having SP > 3000000) as t;


-- 5. Поменять запрос выше так, чтобы в результате вместо кода страны выводилось ее название. 
-- Подсказка: нужен join таблиц city и country по полю CountryCode.
 SELECT city.CountryCode, country.Name, sum(city.Population) as SP FROM world.city
 inner join world.country
 on city.CountryCode = country.code
group by CountryCode
having SP > 3000000;

-- 6. Вывести количество городов в каждой стране (CountryCode, amount of cities). 
-- Подсказка: запрос по таблице city и группировка по CountryCode.

SELECT CountryCode, count(*) as acities  FROM world.city
group by CountryCode;
 
-- 7. Поменять запрос так, чтобы вместо кодов стран, было названия стран. 

SELECT country.Name, count(*) as acities  FROM world.city
inner join world.country
on city.CountryCode = country.Code
group by CountryCode;



-- 8. Поменять запрос так, чтобы выводилось среднее количество городов в стране. 
-- Подсказка: разделите задачу на несколько подзадач. 
-- Например, сначала вывести код страны и количество городов в каждой стране.  
-- Затем сделать join получившегося результата с запросом, 
-- где высчитывается среднее от количества городов. 
-- Потом добавить join, который добавит имена стран, вместо кода. 
-- -- 
SELECT  avg(count(*)) as acities  FROM world.city
group by CountryCode;

-- Разобьем запросы на части:

-- 1. Вывести код страны и количество городов в каждой стране.

-- 2. Получить среднее количество городов в стране.

-- 3. Объединить результаты с именами стран.