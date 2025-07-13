# Write your MySQL query statement below

WITH CTE AS(
SELECT A.customer_id, A.visit_id, B.transaction_id, B.amount
FROM Visits A
LEFT JOIN Transactions B
ON A.visit_id = B.visit_id
WHERE B.transaction_id IS NULL
)
SELECT customer_id, COUNT(DISTINCT visit_id) AS count_no_trans
FROM CTE
GROUP BY customer_id;



/*
Approach

Flow will be Customer ID -> Vist ID -> Transaction ID
We need to figure out those visit ids against which we do not have any transaction ids.

Hence, taking all the values from Visits table left joining it with Transactions table and filtering them in a way where we get null transactions.


Once we get the base table comprising of visit ids, cus ids, transactions ids and amount, we will group them based on customer ids to find the distinct count of visit ids.
*/