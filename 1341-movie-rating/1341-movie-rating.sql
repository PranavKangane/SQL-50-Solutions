WITH movie AS (
    SELECT user_id, COUNT(DISTINCT movie_id) AS MovieCount
    FROM MovieRating
    GROUP BY user_id
),
FIRST_RESULT AS (
    SELECT u.name AS results
    FROM Users u
    JOIN movie m ON u.user_id = m.user_id
    ORDER BY m.MovieCount DESC, u.name
    LIMIT 1
),
movierating AS (
    SELECT movie_id, AVG(rating) AS avg_rating
    FROM MovieRating
    WHERE YEAR(created_at) = 2020 AND MONTH(created_at) = 2
    GROUP BY movie_id
),
secondresult AS (
    SELECT m.title AS results
    FROM Movies m
    JOIN movierating r ON m.movie_id = r.movie_id
    ORDER BY r.avg_rating DESC, m.title
    LIMIT 1
)
SELECT results FROM FIRST_RESULT
UNION ALL
SELECT results FROM secondresult;
