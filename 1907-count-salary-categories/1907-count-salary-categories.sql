# Write your MySQL query statement below
with cte as (
SELECT account_id, income, CASE
WHEN income < 20000 THEN 'Low Salary'
WHEN income >= 20000 and income <= 50000 then 'Average Salary'
WHEN income > 50000 then 'High Salary'
end as category
from Accounts
),
accounts as (
SELECT category, count(account_id) as 'accounts_count'
from cte 
group by category
)
, categories as (
select distinct category
from cte
)




, CATBASE AS (
SELECT 'Low Salary' AS CATEGORY
UNION
SELECT 'Average Salary' as CATEGORY
UNION
SELECT 'High Salary' as CATEGORY
)

select a.*, ifnull(b.accounts_count,0) as accounts_count
from CATBASE a
left join accounts b
on a.category = b.category