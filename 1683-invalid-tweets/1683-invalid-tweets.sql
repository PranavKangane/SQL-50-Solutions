# Write your MySQL query statement below

select tweet_id
from Tweets
where length(content) > 15

/*
Approach
1. Filtering the tweet based on length of content column
*/