1.
SELECT DATE_PART('year',occurred_at), SUM(total_amt_usd) total_sales
FROM orders o
GROUP BY 1
ORDER BY 2 DESC;

/*
rough work - to find the orders for 2017
SELECT DATE_PART('year',occurred_at),total_amt_usd
FROM orders
GROUP BY 1,2
HAVING DATE_PART('year',occurred_at) = 2017
*/

5.
SELECT a.name,DATE_TRUNC('month',o.occurred_at),SUM(o.gloss_amt_usd) gloss_amt
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY 1,2
HAVING a.name = 'Walmart'
ORDER BY 3 DESC;
