
select name
from Employee
where id in (

select managerId
from Employee
group by managerId
having count(*) >=5
)


/*
Approach
1. Calculated the manager ids having count more than 5.
2. Fetched the name of the managers using the ids received from the subquery.
*/