# Write your MySQL query statement below

WITH CTE AS (
SELECT customer_id, COUNT(DISTINCT product_key) AS 'Countkey'
FROM Customer
GROUP BY customer_id
)
select customer_id
from CTE
where Countkey = (SELECT COUNT(Distinct product_key)
from Product )

