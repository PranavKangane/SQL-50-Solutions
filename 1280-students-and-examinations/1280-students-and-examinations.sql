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

