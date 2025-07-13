# Write your MySQL query statement below
with base as (
SELECT employee_id, count(distinct department_id) as 'Departments'
from Employee
group by employee_id
)
, onlyone as (
select a.employee_id, b.department_id
from base a
join Employee b
on a.employee_id = b.employee_id
where a.Departments = 1
),
multidep as (
select a.employee_id, b.department_id
from base a
join Employee b
on a.employee_id = b.employee_id
where a.Departments > 1
and b.primary_flag = 'Y'
)
SELECT A.*
FROM onlyone A
UNION ALL
SELECT B.*
FROM multidep B

