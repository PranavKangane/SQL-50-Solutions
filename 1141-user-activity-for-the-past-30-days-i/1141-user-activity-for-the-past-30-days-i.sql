# Write your MySQL query statement below

SELECT 
  activity_date AS 'day', 
  COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE  activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date


/*
Approach

1. Need to find distinct users ids for each day
2. Filtered on the date because only 30 days period needs to be taken into consideration.

*/