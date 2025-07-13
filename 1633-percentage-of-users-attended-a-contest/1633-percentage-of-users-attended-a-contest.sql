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
Appraoch
1. Created a main base where I plotted the contest ids from register table against all user ids in the Users.

2. For every contest id, calculated the unique user ids using the prev cte 'main'

3. Calculated the total users from the users table.

4. In 'final' cte again created an outer join to plot the total users against every record. The number is going to be same for all records.

5. Calculated the percentage and filtered those rows where contest ids can be null.

*/