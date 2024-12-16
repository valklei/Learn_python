-- OVER() используется с оконными функциями, такими как:

-- Агрегирующие функции: SUM(), AVG(), MIN(), MAX(), COUNT()
-- Ранжирующие функции: ROW_NUMBER(), RANK(), DENSE_RANK()
-- Функции доступа к строкам: LAG(), LEAD(), FIRST_VALUE(), LAST_VALUE()

-- Компоненты оконной функции:
-- Оконная функция:
-- Само вычисление, например: SUM(), AVG(), ROW_NUMBER(), RANK(), LAG(), LEAD().

-- Ключевое слово OVER():
-- Указывает, как применять функцию к окну строк. Внутри OVER() можно использовать:

-- PARTITION BY — разделяет строки на группы (окна).
-- ORDER BY — определяет порядок строк внутри окна.
-- Границы окна (ROWS или RANGE) — задают диапазон строк для вычислений.


-- Нумерация строк ROW_NUMBER()
-- Возвращает порядковый номер каждой строки в пределах группы
SELECT employee_id, department_id, salary,
       ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num
FROM employees;


-- Ранжирование строк RANK()
-- Присваивает ранг строкам. Если несколько строк имеют одинаковое значение, они получают одинаковый ранг, а следующий ранг пропускается
SELECT employee_id, department_id, salary,
       RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dep_rank
FROM employees;

-- Ранжирование строк DENSE_RANK()
-- Присваивает ранг строкам, но в отличие от RANK(), при одинаковых значениях не пропускает следующие ранги.
-- Пример: для каждого департамента выводим ранг сотрудников по зарплате, при этом если несколько сотрудников имеют одинаковую зарплату,
-- они получают одинаковый ранг, но следующий ранг не пропускается.
SELECT employee_id, department_id, salary,
       DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dep_dense_rank
FROM employees;


-- Разбиение на группы NTILE()
-- Функция NTILE() делит строки на заданное количество групп и присваивает каждой строке номер группы.
-- Пример: для каждого департамента делим сотрудников на 4 группы по зарплатам и выводим номер группы.
SELECT employee_id, department_id, salary,
       NTILE(4) OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_quartile
FROM employees;

-- --------------------------------------------------------------

-- Сумма по окну SUM()
-- Рассчитывает общую зарплату по каждой группе
SELECT employee_id, department_id, salary,
       SUM(salary) OVER (PARTITION BY department_id) AS total_salary_department
FROM employees;

-- Скользящее среднее AVG()
-- Вычисляет среднюю зарплату для текущей и двух предыдущих строк
SELECT employee_id, hire_date, salary,
       AVG(salary) OVER (ORDER BY hire_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM employees;

-- Вычисляет среднюю зарплату для текущей и предыдущей и следующих строк
SELECT employee_id, hire_date, salary,
       AVG(salary) OVER (
           ORDER BY hire_date ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
       ) AS moving_avg
FROM employees;

-- Вычисляет среднюю зарплату по департаменту для текущей и предыдущей и следующих строк
SELECT employee_id, hire_date, department_id, salary,
       AVG(salary) OVER (
           PARTITION BY department_id ORDER BY hire_date ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
       ) AS moving_avg
FROM employees;

-- ------------------------------------------------

-- 1. LAG() — Доступ к предыдущей строке
-- Функция LAG() позволяет получить значение из предыдущей строки в пределах окна.
-- Пример: для каждого сотрудника находим разницу в зарплатах между текущим и предыдущим сотрудником
SELECT employee_id, hire_date, salary,
       salary - LAG(salary) OVER (ORDER BY hire_date) AS salary_diff
FROM employees;


-- 2. LEAD() — Доступ к следующей строке
-- Функция LEAD() позволяет получить значение из следующей строки в пределах окна.
-- Пример: для каждого сотрудника находим разницу в зарплатах между текущим сотрудником и следующим
SELECT employee_id, hire_date, salary,
       LEAD(salary) OVER (ORDER BY hire_date) - salary AS salary_diff
FROM employees;


-- 3. FIRST_VALUE() — Получение первого значения в окне
-- Функция FIRST_VALUE() возвращает значение первой строки в окне.
-- Пример: для каждого департамента выводим самую низкую зарплату в рамках департамента.
SELECT employee_id, department_id, salary,
       FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary) AS min_salary_in_dept
FROM employees;


-- 4. LAST_VALUE() — Получение последнего значения в окне
-- Функция LAST_VALUE() возвращает значение последней строки в окне.
-- Пример: для каждого департамента выводим максимальную зарплату в рамках департамента.
SELECT employee_id, department_id, salary,
       LAST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS max_salary_in_dept
FROM employees;


-- 5. Пример с комбинацией всех
-- В этом запросе используются все четыре функции окон (LAG, LEAD, FIRST_VALUE, LAST_VALUE) для вычисления различных данных о зарплатах для каждого департамента.
SELECT employee_id, department_id, salary,
       LAG(salary) OVER (PARTITION BY department_id ORDER BY salary) AS previous_salary,
       LEAD(salary) OVER (PARTITION BY department_id ORDER BY salary) AS next_salary,
       FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary) AS min_salary,
       LAST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS max_salary
FROM employees;

