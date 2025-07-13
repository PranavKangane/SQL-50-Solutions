# Write your MySQL query statement below

select id, movie, description, rating
from cinema
where id % 2 = 1
and description <> 'boring'
order by rating desc

/*
Approach
1. Filtered rows based on ids which are odd using the modulo operation to get remainder as 1 and Description which is not boring.

*/

