# Write your MySQL query statement below

with feb20 as (
SELECT A.*, B.unit, B.order_date
FROM Products A
JOIN Orders B
ON A.product_id = B.product_id
AND YEAR(B.order_date) = '2020'
AND MONTH(B.order_date) = '02'
)

SELECT product_name, SUM(unit) AS unit
FROM feb20
GROUP BY product_name
HAVING SUM(unit) >= 100