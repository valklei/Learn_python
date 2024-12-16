SELECT * FROM world.city;

-- Создайте SQL запрос, который позволяет вывести информацию о населении стран из таблицы city в
-- двух столбцах: 'CountryCode' и 'Население', где 'Население' представляет собой
-- суммарное количество жителей всех городов в каждой стране.
SELECT CountryCode, SUM(Population) AS Население
FROM city
GROUP BY CountryCode;

-- 1_extra Сравнить полученное население с указанным населением по странам.

SELECT CountryCode, SUM(Population) AS Население
FROM city
GROUP BY CountryCode;