# Write your MySQL query statement below

SELECT A.NAME, B.BONUS
FROM EMPLOYEE A
LEFT JOIN BONUS B
ON A.EMPID = B.EMPID
WHERE B.BONUS IS NULL OR B.BONUS < 1000


/*
Approach
1. Left join Employee with Bonus because we want all records from left side.
2. Filtering on records where no bonus is present or bonus is less than 1000

*/