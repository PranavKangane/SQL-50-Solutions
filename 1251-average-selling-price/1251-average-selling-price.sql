# Write your MySQL query statement below

with main as(
SELECT A.*, B.PRICE, (A.units * B.PRICE) AS 'Total'
FROM UnitsSold A
JOIN Prices B
ON A.product_id = B.product_id
AND A.purchase_date BETWEEN B.start_date AND B.end_date
),
secondbase as(
select product_id, sum(units) as units, sum(Total) as total
from main 
group by product_id
),
final as (
select product_id, round((total / units),2) as average_price
from secondbase
)
select distinct a.product_id, ifnull(b.average_price,0) as average_price
from Prices a
left join final b
on a. product_id = b.product_id


/*
Approach
1. Plotted the prices against all the product ids in the unitssold table using the following consition:
    - Same product id
    - Purchase date should be between start date and end date of prices table

2. Calculated the total amount for each record using (units * price) columns
3. Grouped the rows based on the price id column to get sum of units and sum of total
4. In final part, calculated the average using total price and total sum columns and using the rounding function.
*/