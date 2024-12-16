with MAX_life as (select LifeExpectancy as life from country order by LifeExpectancy desc limit 1)
select  Name, LifeExpectancy, life, life - LifeExpectancy as life_diff  
from country, MAX_life
where LifeExpectancy is not null;

with MAX_life as (select LifeExpectancy as life from country order by LifeExpectancy desc limit 1)
select  Name, LifeExpectancy, life, life - LifeExpectancy as life_diff  
from country
cross join MAX_life
where LifeExpectancy is not null;


SELECT
 co.Code,
 co.Name,
 co.LifeExpectancy,
 MAX(co.LifeExpectancy) OVER () AS MaxLifeExpectancy,
 co.LifeExpectancy - MAX(co.LifeExpectancy) OVER () AS
LifeExpectancyDifference
FROM country co;


-- Найти страны с населением выше среднего по всему миру.
WITH AveragePopulation AS (
    SELECT AVG(Population) AS avg_population
    FROM country
)
SELECT Name, Population
FROM country, AveragePopulation
WHERE country.Population > AveragePopulation.avg_population
;






select c.ID, c.Name, c.Population, c.CountryCode, 
    sum(c.Population) over (partition by c.CountryCode) sum_Population_country,
	round(c.Population / sum(c.Population) over (partition by c.CountryCode) * 100, 2) percent_city
from city c;



select new_c.*, dense_rank() over (partition by new_c.CountryCode order by new_c.percent_city) rank_sum_Population_country  from 
	(select c.ID, c.Name, c.Population, c.CountryCode, 
    sum(c.Population) over (partition by c.CountryCode) sum_Population_country,
	round(c.Population / sum(c.Population) over (partition by c.CountryCode) * 100, 2) percent_city
from city c) new_c;



