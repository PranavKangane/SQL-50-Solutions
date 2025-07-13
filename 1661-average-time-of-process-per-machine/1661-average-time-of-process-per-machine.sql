# Write your MySQL query statement below
with startactivity as (
select machine_id, process_id, timestamp
from Activity
where activity_type = 'start' 
)
, endactivity as (
select machine_id, process_id, timestamp
from Activity
where activity_type = 'end' 
), BASE AS (
select a.machine_id, b.process_id, ROUND(b.timestamp - a.timestamp, 3) as totaltime
from startactivity a
join endactivity b
on a.machine_id = b.machine_id
and a.process_id = b.process_id
), FINAL AS(
SELECT machine_id, COUNT(DISTINCT process_id) AS PROCESS, SUM(totaltime) AS TOTAL
FROM BASE
GROUP BY machine_id
)
SELECT machine_id, ROUND((TOTAL / PROCESS),3) AS processing_time
FROM FINAL


/*
Approach
1. We will divide the table into two mini tables -start and end activity tables.
2. Start table will have all records with activity type as start
3. End table will have all records with activity type as end
4. Make a. base table where we join both tables using machine id and process id and calculate the difference in timestamp
5. The next base table will comprise of machine id, count of unique processes it has and total of the timestamp
6. Using the next base, we will calculate the average of each machine id

*/