SELECT * FROM world.country;

# 2. Выведите список стран с языками, на которых в них говорят.

SELECT name, Language
FROM world.country  as wc
inner join world.countrylanguage as wcl
on wc.code = wcl.CountryCode;

# 3. Выведите список городов с их населением и названием стран

SELECT world.city.Name, world.city.Population, world.country.name
FROM world.city 
inner join world.country 
on world.city.CountryCode = world.country.Code;

# 4.Выведите список городов в South Africa

SELECT world.city.Name as City, world.country.name as Country
FROM world.city 
inner join world.country 
on world.city.CountryCode = world.country.Code and world.country.name = 'South Africa';

# 5. Выведите список стран с названиями столиц. 

SELECT world.country.Name as Country, world.city.Name as Capital
FROM world.country
inner join world.city
on world.country.Capital = world.city.ID;


# 6. Измените запрос 4 таким образом, чтобы выводилось население в столице. 

SELECT world.country.name as Country, world.city.Name as Capital, world.city.Population  
FROM world.city 
inner join world.country 
on world.country.Capital = world.city.ID and world.country.name = 'South Africa';

# 7. Напишите запрос, который возвращает название столицы United States

SELECT world.country.name as Country, world.city.Name as Capital  
FROM world.city 
inner join world.country 
on world.country.Capital = world.city.ID and world.country.name = 'United States';

# 8. Используя базу hr_data.sql, вывести имя, фамилию и город сотрудника.

SELECT hr.employees.first_name, hr.employees.last_name, hr.locations.city
FROM hr.employees 
inner join hr.departments
on hr.employees.department_id = hr.departments.department_id
inner join hr.locations
on hr.departments.location_id = hr.locations.location_id;

# 9. Используя базу hr_data.sql, вывести города и соответствующие городам страны

SELECT hr.locations.city, hr.countries.country_name
FROM hr.locations
inner join hr.countries
on hr.locations.country_id = hr.countries.country_id;


















SELECT emp.first_name, emp.last_name, man.manager_id, man.first_name, man.last_name
FROM hr.employees as emp
inner join hr.employees as man
on emp.manager_id = man.employee_id;













select
employees.first_name,
employees.last_name,
departments.department_name
from employees 
right join departments 
on employees.department_id = departments.department_id;
 