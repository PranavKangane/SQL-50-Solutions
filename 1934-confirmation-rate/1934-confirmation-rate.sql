# Write your MySQL query statement below

WITH ATTEMPTS AS (
select user_id, count(*) as 'total_attempt'
from Confirmations
group by user_id
),
CONFIRMATION AS (
select user_id, count(*) as 'Confirmations'
from Confirmations
WHERE action = 'confirmed'
group by user_id
),
final as (
SELECT A.user_id, ifnull(B.Confirmations,0) as Confirmations,
ifnull(c.total_attempt,0) as total_attempt
from Signups a
left join CONFIRMATION b
on a.user_id = b.user_id
left join ATTEMPTS c
on a.user_id = c.user_id
)

SELECT user_id, IFNULL(ROUND((Confirmations /total_attempt),2),0) AS confirmation_rate
FROM FINAL



/*
Approach
1. Calculated the total attempts in the first cte using the confirmation table.
2. Calculated the total confirmations in the second cte using the confirmation table using the filter of action = confirmed
3. Joined both the ctes to Signups using Left join because we want to show data for all user ids
4. Calculated the confirmation rate using round and ifnull functions to convert values to 0

*/