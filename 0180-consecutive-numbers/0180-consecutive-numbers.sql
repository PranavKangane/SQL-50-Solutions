# Write your MySQL query statement below

WITH CTE AS (
SELECT ID, NUM, LEAD(NUM,1) OVER(ORDER BY ID) AS 'Secondnum', LEAD(NUM,2) OVER(ORDER BY ID) AS 'ThirdNumber'
FROM Logs
)

SELECT DISTINCT NUM AS ConsecutiveNums
FROM CTE
WHERE NUM = Secondnum
AND NUM = ThirdNumber