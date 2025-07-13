# Write your MySQL query statement below

WITH MAIN AS(
SELECT A.*, B.experience_years
FROM Project A
INNER JOIN Employee B
ON A.employee_id = B.employee_id
)

SELECT project_id, ROUND(SUM(experience_years)/ COUNT(DISTINCT employee_id),2) AS 
'average_years'
FROM MAIN
GROUP BY project_id


/*
Appraoch

1. Created main base comprising of all columns from ptoject table and experience_years from employee table using the employee_id matching key

2. Using the aggregate function calculated the average for each project.
*/