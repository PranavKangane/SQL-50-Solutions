# Write your MySQL query statement below

WITH COMPARE AS (
SELECT ID,recordDate, TEMPERATURE, LAG(TEMPERATURE) OVER (ORDER BY recordDate) AS PREV_TEMP,
LAG(recordDate) OVER (ORDER BY recordDate) AS PREV_DATE
FROM Weather
ORDER BY recordDate
)
SELECT ID
FROM COMPARE 
WHERE TEMPERATURE > PREV_TEMP 
AND DATEDIFF(recordDate,PREV_DATE) = 1


/*
Creating the base first comprising of id, record date, temp, prev temp using lag function , prev temp using lag temp which are ordered by record date.

Filtering out ids based on the following condition:
1. The temperature > Prev Temp
2. The difference in days between record date and previous record date is 1

*/