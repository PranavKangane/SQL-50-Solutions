# Write your MySQL query statement below


WITH EMPLOYEEINFO AS (
SELECT reports_to, COUNT(DISTINCT employee_id) AS 'TOTALEMP', SUM(age) AS 'TOTALAGE'
FROM Employees
WHERE reports_to is not null
GROUP BY reports_to
HAVING COUNT(DISTINCT employee_id) >= 1
)

SELECT A.employee_id, A.NAME, B.TOTALEMP AS 'reports_count', ROUND(B.TOTALAGE/B.TOTALEMP) AS average_age
FROM Employees A
JOIN EMPLOYEEINFO B
ON A.employee_id = B.reports_to
ORDER BY 1