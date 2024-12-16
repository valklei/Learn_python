SELECT * FROM hr.employees where hire_date like ('%2005%');
SELECT * FROM employees WHERE date_format(hire_date, '%Y') = 2005;
 SELECT STR_TO_DATE('21,5,2013','%d,%m,%Y') as dttm;
SELECT STR_TO_DATE('2017-03-13T14:39:01.123','%Y-%m-%dT%H:%i:%s.%f') as dttm;

SELECT NOW();
SELECT DATE_FORMAT(NOW(), '%Y_%m_%dT%H:%i:%s') as formatted_date;
SELECT DATE_FORMAT(NOW(), '%d.%m.%y %I%p:%i:%s') as formatted_date;
SELECT DATE_FORMAT('2024-11-20 14:39:43', '%d.%m.%y %I%p:%i:%s') as formatted_date;

SELECT DATEDIFF('2023-01-02', '2023-01-01') as diff_date;
SELECT DATEDIFF('2023-01-02', '2023-01-02') as diff_date;
SELECT DATEDIFF('2023-01-01', '2023-04-02') as diff_date;

SELECT TIMESTAMPDIFF(MONTH,'2003-02-01','2003-05-01');
SELECT TIMESTAMPDIFF(YEAR,'2002-05-01','2001-01-01');
SELECT TIMESTAMPDIFF(MINUTE,'2003-02-01','2003-05-01 12:05:55');

SELECT NOW() + INTERVAL 3 DAY;
SELECT NOW() - INTERVAL 1 WEEK;

SELECT * FROM employees WHERE hire_date > NOW() - INTERVAL 1 MONTH;

SELECT * FROM employees WHERE hire_date between NOW() - INTERVAL 1 MONTH and NOW();

SELECT weekday('2009-05-19');
SELECT weekday(NOW());

SELECT LAST_DAY('2009-05-18');
SELECT * FROM hr.employees;

SELECT * FROM hr.employees
where hire_date between "2005-01-01" and "2005-12-31";

SELECT *, DATE_FORMAT(hire_date, '%Y') as form_date 
FROM hr.employees
where DATE_FORMAT(hire_date, '%Y') = 2005
order by hire_date;

-- 1. Определите кого из сотрудников приняли на работу в пятницу
SELECT * FROM hr.employees
where WEEKDAY(hire_date) = 4;
-- пн 0, вт 1 ... вс 6
SELECT * FROM hr.employees
where dayofweek(hire_date) = 6;
-- вс 1, пн 2, вт 3 ... сб 7
SELECT * FROM hr.employees
where dayofweek(hire_date) = "Friday";

SELECT *, 
last_day(hire_date) + interval 1 day + interval 3 month as probation_date 
FROM hr.employees;

-- '2016-06-04'
-- '2016-06-30' last_day
-- '2016-07-01' + interval 1 day
-- '2016-10-01' + interval 3 month