-- 7
SELECT * FROM hr.employees
where department_id = '90';
-- 8
SELECT * FROM hr.employees
where salary > 5000;
-- 9
SELECT * FROM hr.employees
where last_name like 'L%';
-- 10
SELECT * FROM hr.locations
where location_id = 1700;
-- 11
SELECT * FROM hr.countries
where country_id like 'US';
-- 12
SELECT salary FROM hr.employees
where first_name = 'Lex' and last_name = 'De Haan';
-- 13
SELECT * FROM hr.employees
where job_id = 'FI_ACCOUNT' and salary < 8000;
-- 14
SELECT * FROM hr.employees
where last_name like '%_kk_%' or last_name like '%_ll_%';

