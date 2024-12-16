### CTE (Common Table Expression)

-- CTE – это временные результаты запроса, которые можно использовать в основном SQL-запросе. 
-- Они определяются с помощью ключевого слова `WITH` и существуют только в рамках одного запроса.

### Синтаксис

-- WITH cte_name (column1, column2, ...) AS (
--     SELECT ...
-- )
-- SELECT ...
-- FROM cte_name;



### Примеры

-- Найти максимальную зарплату в каждом отделе.**

WITH DepartmentMaxSalaries AS (
    SELECT department_id, MAX(salary) AS max_salary
    FROM employees
    GROUP BY department_id
)
SELECT department_id, max_salary
FROM DepartmentMaxSalaries;



-- Найти всех сотрудников, у которых зарплата больше средней по отделу.**

WITH DepartmentAverageSalary AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
),
AboveAverageEmployees AS (
    SELECT e.first_name, e.last_name, e.salary, e.department_id
    FROM employees e
    INNER JOIN DepartmentAverageSalary d
    ON e.department_id = d.department_id
    WHERE e.salary > d.avg_salary
)
SELECT last_name, salary, department_id
FROM AboveAverageEmployees;
