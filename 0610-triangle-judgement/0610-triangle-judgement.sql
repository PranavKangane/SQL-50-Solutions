# Write your MySQL query statement below


SELECT X, Y, Z, 
CASE
WHEN X + Z > Y  AND X + Y > Z  AND Y + Z > X THEN 'Yes'
ELSE 'No'
END AS 'Triangle'
from Triangle