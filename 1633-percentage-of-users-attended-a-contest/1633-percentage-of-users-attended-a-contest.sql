# Write your MySQL query statement below

with main as (
select a.*, b.contest_id
from Users a
left join Register b
on a.user_id = b.user_id
), secondbase as(
select contest_id, count(distinct user_id) as 'uniqueusers'
from main
group by contest_id
),
totalusers as (
select count(user_id) as 'totalusers'
from Users
),
final as (
select *
from secondbase,totalusers
)

SELECT contest_id, ROUND((uniqueusers / totalusers)*100,2) AS 'percentage'
FROM FINAL
WHERE contest_id IS NOT NULL
ORDER BY 2 DESC, 1


/*


*/