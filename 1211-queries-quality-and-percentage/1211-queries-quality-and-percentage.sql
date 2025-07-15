# Write your MySQL query statement below
WITH TOTALQ AS (
SELECT query_name, COUNT(rating) AS 'Total'
FROM Queries
GROUP BY query_name
), 
Poor AS (
SELECT query_name, COUNT(rating) AS 'PoorQuery'
FROM Queries
WHERE rating < 3
GROUP BY query_name
)
, poorpercentage as (
SELECT A.query_name, ROUND(IFNULL(B.PoorQuery, 0) / A.Total * 100, 2) AS poor_query_percentage
from TOTALQ a
join Poor b
on a.query_name = b.query_name
)
, QUALITYRESULTS AS (
SELECT query_name, ROUND(AVG(rating/position),2) AS quality
FROM Queries
GROUP BY query_name
)

SELECT A.*, IFNULL(B.poor_query_percentage,0) AS poor_query_percentage
FROM QUALITYRESULTS A
LEFT JOIN poorpercentage B
ON A.query_name = B.query_name