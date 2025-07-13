# Write your MySQL query statement below


SELECT DISTINCT AUTHOR_ID AS ID
FROM VIEWS
WHERE AUTHOR_ID = VIEWER_ID
ORDER BY AUTHOR_ID

/*
Appraoch
1. Author viewing his own article will have the same ID in both columns. Hence viewer id and author id are same.
*/