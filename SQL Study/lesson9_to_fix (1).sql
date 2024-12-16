-- to fix

-- select sname, max(AA)
-- from (SELECT avg(amt) as AA, ORDERS.SELL_ID, sname 
--  FROM shop.ORDERS
--  left join SELLERS as SL
--  on ORDERS.sell_id = SL.sell_id
--  where extract(month from odate) = 3
--  group by ORDERS.sell_ID) as SO 
--  union
--  select sname, min(AA)
-- from (SELECT avg(amt) as AA, ORDERS.SELL_ID, sname 
--  FROM shop.ORDERS
--  left join SELLERS as SL
--  on ORDERS.sell_id = SL.sell_id
--  where extract(month from odate) = 3
--  group by ORDERS.sell_ID) as SO;
--  
--  -- avg
--  SELECT avg(amt) as AA, ORDERS.SELL_ID, sname 
--  FROM shop.ORDERS
--  left join SELLERS as SL
--  on ORDERS.sell_id = SL.sell_id
--  where extract(month from odate) = 3
--  group by ORDERS.sell_ID;
--  
-- -------------------------------------------------------------
-- Определить у кого в третьем месяце были самые большие и маленькие средние продажи
SELECT sname, avg_amt
FROM (
    SELECT SL.sname, AVG(O.amt) AS avg_amt
    FROM shop.ORDERS O
    LEFT JOIN SELLERS SL ON O.sell_id = SL.sell_id
    WHERE EXTRACT(MONTH FROM O.odate) = 3
    GROUP BY SL.sname
) AS Subquery
WHERE avg_amt = (
	SELECT MAX(avg_amt) 
	FROM (
		SELECT AVG(amt) AS avg_amt
		FROM shop.ORDERS
		WHERE EXTRACT(MONTH FROM odate) = 3
		GROUP BY sell_id) AS MaxSub)
OR avg_amt = (
	SELECT MIN(avg_amt) 
	FROM (
		SELECT AVG(amt) AS avg_amt
		FROM shop.ORDERS
		WHERE EXTRACT(MONTH FROM odate) = 3
		GROUP BY sell_id) AS MinSub);
       
       
-- cte -----------------------------------------------------------
WITH SellerAverage AS (
    SELECT sname, AVG(O.amt) AS avg_amt
    FROM shop.ORDERS O
    LEFT JOIN SELLERS SL ON O.sell_id = SL.sell_id
    WHERE EXTRACT(MONTH FROM O.odate) = 3
    GROUP BY sname
),
MaxMinAverage AS (
    SELECT 
        MAX(avg_amt) AS max_avg_amt,
        MIN(avg_amt) AS min_avg_amt
    FROM SellerAverage
)
SELECT sname, avg_amt
FROM SellerAverage
CROSS JOIN MaxMinAverage
WHERE avg_amt = max_avg_amt OR avg_amt = min_avg_amt;




 
 -- ---------------------
 
--  Определите месяцы, в которых было нанято максимальное количество сотрудников.
SELECT * FROM
	(SELECT DATE_FORMAT(hire_date, "%Y-%m") AS mon_year, COUNT(*) CNT
	FROM employees
	GROUP BY mon_year
	ORDER BY CNT DESC) AS D
WHERE CNT = 
	(SELECT COUNT(*) CNT
	FROM employees
	GROUP BY DATE_FORMAT(hire_date, "%Y-%m")
	ORDER BY CNT DESC
	LIMIT 1);


-- cte
WITH MonthlyHires AS (
    SELECT DATE_FORMAT(hire_date, "%Y-%m") AS mon_year, COUNT(*) AS cnt
    FROM employees
    GROUP BY mon_year
),
MaxHires AS (
    SELECT MAX(cnt) AS max_cnt
    FROM MonthlyHires
)
SELECT mon_year, cnt
FROM MonthlyHires
CROSS JOIN MaxHires
WHERE cnt = max_cnt;


