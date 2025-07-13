# Write your MySQL query statement below

SELECT B.product_name, A.year, A.PRICE
FROM Sales A
JOIN Product B
ON A.product_id = B.product_id


