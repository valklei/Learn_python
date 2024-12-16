-- 2. Вывести информацию о каждом заказе и максимальную сумму заказа в том же месяце для каждой
-- строки.


SELECT *, max(amt) over(partition by month(odate)) FROM shop.ORDERS;

SELECT *, sum(amt) over(partition by month(odate)) as sum_amt, 
round(amt /  sum(amt) over(partition by month(odate)) * 100, 2) as `part %`
FROM shop.ORDERS;

-- sum(coalesce(o.AMT,0))
-- ifnull
-- Вывести список продавцов с указанием общей суммы их продаж. Отсортировать продавцов по
-- убыванию суммы продаж.
select ORDERS.*, SELLERS.SNAME, SELLERS.CITY, sum(coalesce(AMT,0)) over(partition by SELLERS.SELL_ID) as sum_amt from SELLERS
left join ORDERS on SELLERS.SELL_ID = ORDERS.SELL_ID;

-- 5. Вывести топ-2 продавцов с самой высокой средней суммой заказа. 

select distinct  SELLERS.SNAME  ,ORDERS.SELL_ID,
avg(AMT) over(partition by ORDERS.SELL_ID ) as avg_sell_id
 from ORDERS
 join SELLERS
on SELLERS.SELL_ID = ORDERS.SELL_ID
order by avg_sell_id desc 
limit 2
;

-- Посчитать изменение зарплаты по каждой группе отдельно отслеживая job_id
SELECT employee_id, first_name, last_name, job_id, salary, department_id, 
SUM(salary) OVER (PARTITION BY department_id order by job_id) AS total
FROM employees;

SELECT employee_id, first_name, last_name, job_id, salary, department_id, 
count(salary) OVER (PARTITION BY department_id order by job_id) AS total
FROM employees;

SELECT employee_id, first_name, last_name, job_id, salary, department_id, 
ROW_NUMBER() OVER() AS order_num
FROM employees;

SELECT employee_id, first_name, last_name, job_id, salary, department_id, 
RANK() OVER(order by salary) AS order_rank, 
ROW_NUMBER() OVER() AS order_num
FROM employees;

SELECT employee_id, first_name, last_name, job_id, salary, department_id, 
DENSE_RANK() OVER(order by salary) AS order_dense_rank
FROM employees;

SELECT employee_id, first_name, last_name, job_id, salary, department_id, 
NTILE(4) OVER(order by salary) AS groups_rank, 
ROW_NUMBER() OVER() AS order_num
FROM employees;

SELECT employee_id, first_name, last_name, job_id, salary, department_id, 
ROW_NUMBER() OVER(partition by department_id) AS order_num
FROM employees;



SELECT employee_id, first_name, last_name, job_id, salary, department_id, 
DENSE_RANK() OVER(partition by department_id order by salary) AS order_rank, 
ROW_NUMBER() OVER(partition by department_id) AS order_num
FROM employees;

-- произведите ранжирование департаментов по средней зарплате
SELECT   salary, department_id, 
DENSE_RANK() OVER(partition by department_id order by salary) AS order_rank
FROM employees;

# Разбейте сотрудников на 2 равные группы по зарплате salary и выведите номер группы
# для каждого сотрудника
# Разбейте сотрудников на группы по отделам и внутри каждого отдела распределите
# их на три равные части по зарплате.
