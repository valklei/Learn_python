S-- 3. Объединить результаты с именами стран.
SELECT 
country.Name AS CountryName, 
city_count.CityCount, 
avg_city.AverageCityCount
FROM (
SELECT CountryCode, COUNT(*) AS CityCount
FROM city
GROUP BY CountryCode
) AS city_count
JOIN country ON city_count.CountryCode = country.Code
JOIN (
SELECT AVG(CityCount) AS AverageCityCount
FROM (
SELECT COUNT(*) AS CityCount
FROM city
GROUP BY CountryCode
) AS city_count_avg
) AS avg_city;

SELECT country.`Name`, country.`Code`, Count(*) AS amount_of_cities, AVGG
FROM city
LEFT JOIN country ON city.CountryCode = country.`Code`
INNER JOIN (
SELECT AVG(amount_of_cities) AS AVGG
FROM (SELECT Count(*) AS amount_of_cities FROM city GROUP BY CountryCode) AS NEW_TABLE
) AS AVERAGE -- ON TRUE
GROUP BY CountryCode;

select CountryCode, count(*) as cityCount,
(select avg(city_count) 
from 
(select count(*) as city_count 
from city 
group by CountryCode) 
as cityCount_)as avgCitys
from city
group by CountryCode
order by cityCount desc;
