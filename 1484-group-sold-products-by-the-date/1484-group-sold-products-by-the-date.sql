# Write your MySQL query statement below


SELECT sell_date, COUNT(DISTINCT product) AS num_sold,
GROUP_CONCAT(DISTINCT product ORDER BY PRODUCT SEPARATOR ',') AS products
FROM Activities
GROUP BY sell_date

