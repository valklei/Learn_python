




select 
SUM(Population * LifeExpectancy) AS weighted_sum_LE,
SUM(Population) AS total_population
from country;

WITH TotalStats AS (select 
SUM(Population * LifeExpectancy) AS weighted_sum_LE,
SUM(Population) AS total_population
from country )
SELECT 
Name as CountryName, 
LifeExpectancy,
round(AVG(LifeExpectancy) OVER() ,2) AS avg_LE,
round((SELECT weighted_sum_LE / total_population FROM TotalStats) ,2) AS avg_LE_sum
FROM country;

with RankedCountries as (
select
country.Name as CountryName,
country.LifeExpectancy as LifeExpectancy,
rank() over(order by country.LifeExpectancy desc) as rank_
from country)
select
CountryName,LifeExpectancy
from
RankedCountries
where rank_ = 3;








# world
# 1. Выбрать города, занимающие первое место по населению в своих странах 
# и превышающих среднее население по всем городам.
elect * from
(select 
ci.Name City, 
co.Name Country, 
ci.Population, 
round(avg(ci.Population) over ()) avg_population,  
dense_rank () over (partition by co.Name order by ci.Population) as rank_pop  
from city ci
left join country co
on ci.CountryCode = co.Code) s
where s.Population > avg_population and rank_pop=1;

# hr
# 2. Для каждого региона region_name выведите страны 
# и их ранжирование (от большего к меньшему) по количеству сотрудников, работающих в этих странах



# airport
#  3. Найти поездки, где количество билетов больше среднего по всем поездкам.
with tickets_by_trip as (
      select trip_id , count(id) as count_tick 
	  from tickets 
      group by trip_id ) ,
avg_count_tick as (
	  select avg(count_tick) as avg_count_tick
	from tickets_by_trip )
 select * from  tickets_by_trip   
 where count_tick > ( select avg_count_tick from avg_count_tick );
    
    
    with tickets_by_trip as (
      select trip_id , count(id) as count_tick 
	  from tickets 
      group by trip_id ) 
  
	  select avg(count_tick) as avg_count_tick
	from tickets_by_trip 
 ;

# 4. Вывести пассажиров, которые купили больше среднего количества билетов.