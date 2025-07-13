# Write your MySQL query statement below

SELECT NAME
FROM CUSTOMER
WHERE coalesce(referee_id,0) <> 2

#Coalesce is used for replacing all null values with 0
