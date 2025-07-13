# Write your MySQL query statement below
SELECT (
select num
from MyNumbers
WHERE num >= 0
group by num
having count(*) = 1
order by 1 desc
limit 1
) AS num