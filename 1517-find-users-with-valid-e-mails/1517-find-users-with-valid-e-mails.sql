SELECT *
FROM Users
WHERE 
  RIGHT(mail, 13) = '@leetcode.com'
  AND LEFT(mail, LENGTH(mail) - 13) REGEXP '^[A-Za-z][A-Za-z0-9._-]*$'
  and ASCII(right(mail,3)) BETWEEN 97 AND 122
