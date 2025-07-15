with allproducts AS (
select distinct product_id
from Products
)

, recentdate as (
SELECT product_id, MAX(change_date) AS 'Recent'
from Products
where change_date <= '2019-08-16'
group by product_id
)

, post16 as (
SELECT product_id, MAX(change_date) AS 'After16'
from Products
where change_date > '2019-08-16'
group by product_id
)
, mainbase as (
SELECT A.product_id, B.Recent, C.After16
FROM allproducts a
left join recentdate b
on a.product_id = b.product_id
left join post16 c
on a.product_id = c.product_id
)
, shortlisted as (
SELECT product_id, CASE
WHEN Recent IS NULL THEN After16 
WHEN After16 IS NULL THEN Recent
WHEN Recent < After16 THEN RECENT
END AS 'change_date'
from mainbase
)
select a.product_id, case
when a.change_date <= '2019-08-16' then b.new_price
when a.change_date > '2019-08-16' then 10
end as price
from shortlisted a
join Products b
on a.product_id = b.product_id
and a.change_date = b.change_date
order by 1




