# Write your MySQL query statement below

SELECT (
SELECT DISTINCT SALARY AS 'SecondHighestSalary'
FROM EMPLOYEE
ORDER BY 1 DESC
LIMIT 1
OFFSET 1
) AS SecondHighestSalary