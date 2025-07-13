# Write your MySQL query statement below

with base as (
SELECT id, student AS 'Org', LEAD(student,1) OVER (ORDER BY ID) AS 'Next', 
lag(student,1) over(order by ID) as 'Prev'
from Seat
),
second as (
SELECT ID, Org, CASE
WHEN ID % 2 = 0 THEN Prev
WHEN ID % 2 = 1 THEN Next
end as student
from base
)
select ID, 
CASE WHEN
STUDENT IS NULL THEN Org
else Student
end as student
from second
order by 1

