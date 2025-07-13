# Write your MySQL query statement below

WITH MAINBASE AS (
SELECT *
FROM STUDENTS, SUBJECTS
),
exam_given as (
SELECT student_id,subject_name, COUNT(*) AS 'attended_exams'
FROM Examinations
GROUP BY student_id,subject_name
)
SELECT A.* , IFNULL(B.attended_exams,0) AS attended_exams
FROM MAINBASE A
LEFT JOIN exam_given B
ON A.student_id = B.student_id
AND A.subject_name = B.subject_name
ORDER BY 1,2,3,4 DESC



/*
Approach
1. Main base will have ALl students and subjects against their name irrespective if they have taken the exam or not. This is created using cross join. 
4 RECORDS from students and 3 from subjects will generate (4*3) records.

2. Exam given CTE will calculate the total exam given by a student based count of student id, subject name as a group


3. Will combine Main base with exam given using left join because we want to display info for all student. 

4. Replacing records with null values with 0 using IFNULL function in select statement

5. Sorting based on ids, name, subject and then exams given in desc order.


*/
