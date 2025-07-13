# Write your MySQL query statement below


SELECT B.unique_id, A.NAME
FROM Employees A
LEFT JOIN EmployeeUNI B
ON A.ID = B.ID


/*
Approach
1. Joining Employee table with EmployeeUNI using the ID column present in both    
2. Left join because we need to fetch all rows from Employee table and it will automically show the null values wherever the unique_id is not given.
*/