# Write your MySQL query statement below

WITH CTE1 AS (
SELECT MONTH(trans_date) as month, year(trans_date) AS 'year',
CONCAT(year(trans_date),'-',LPAD(MONTH(trans_date),2,0)) AS 'MONTHDATE',
country,
count(id) AS total_transactions,
sum(amount) as total_amount
from Transactions
group by MONTH(trans_date),year(trans_date), country
order by 2,1
)

, approvedtransactions as (
SELECT MONTH(trans_date) as month, year(trans_date) AS 'year',
CONCAT(year(trans_date),'-',LPAD(MONTH(trans_date),2,0)) AS 'MONTHDATE',
country,
count(id) AS approvedtrans,
sum(amount) as approvedamount
from Transactions
WHERE state = 'approved'
group by MONTH(trans_date),year(trans_date), country
order by 2,1
)


SELECT A.MONTHDATE AS month,
A.country,
A.total_transactions AS trans_count,
IFNULL(B.approvedtrans,0) AS approved_count,
A.total_amount AS trans_total_amount,
IFNULL(B.approvedamount,0) AS approved_total_amount
FROM CTE1 A
LEFT JOIN approvedtransactions B
ON A.MONTHDATE = B.MONTHDATE
AND A.country <=> B.country