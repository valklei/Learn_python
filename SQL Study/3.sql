SELECT employee_id, first_name, last_name, salary,
if(salary > 10000, 1, if(salary < 10000, 0, NULL))
as salary_group
from hr.employees