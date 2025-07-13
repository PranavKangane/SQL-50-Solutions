# Write your MySQL query statement below

SELECT NAME, population, area
FROM World
where area >= 3000000
or population >= 25000000

/*
Apppraoch
1. Filtering on area greater than 3000000 and population greater than 25000000
*/