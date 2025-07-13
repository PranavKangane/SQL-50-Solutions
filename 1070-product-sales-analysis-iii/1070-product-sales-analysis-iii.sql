# Write your MySQL query statement below

WITH CTE AS (
SELECT product_id, MIN(YEAR) AS 'first_year'
FROM Sales
GROUP BY product_id
)

SELECT A.*, b.quantity, b.price
from CTE a
join Sales b
on a.product_id = b.product_id
and a.first_year = b.YEAR