1.
SELECT sub3.rep, sub2.region, sub2.max_sales
FROM
	(SELECT region,MAX(total_sales) max_sales
		FROM (
			SELECT s.name rep,r.name region, SUM(total_amt_usd) total_sales
		  FROM region r
		  JOIN sales_reps s
		  ON s.region_id = r.id
		  JOIN accounts a
		  ON a.sales_rep_id = s.id
		  JOIN orders o
		  ON o.account_id = a.id
		  GROUP BY 1,2
			ORDER BY 3 DESC) sub1
	GROUP BY 1) sub2

JOIN
	(SELECT s.name rep,r.name region,
	SUM(total_amt_usd) total_sales
	FROM region r
	JOIN sales_reps s
	ON s.region_id = r.id
	JOIN accounts a
	ON a.sales_rep_id = s.id
	JOIN orders o
	ON o.account_id = a.id
	GROUP BY 1,2
	ORDER BY 3 DESC) sub3

ON sub2.region = sub3.region AND sub2.max_sales = sub3.total_sales


2.
SELECT r.name, COUNT(o.total_amt_usd) num_orders
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
HAVING SUM(o.total_amt_usd) =
	(SELECT MAX(total_sales)
	FROM
		(SELECT r.name, SUM(o.total_amt_usd) total_sales
		FROM region r
		JOIN sales_reps s
		ON s.region_id = r.id
		JOIN accounts a
		ON a.sales_rep_id = s.id
		JOIN orders o
		ON o.account_id = a.id
		GROUP BY 1) sub)


3.
SELECT COUNT(*)
FROM
(SELECT a.name
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
HAVING SUM(o.total) >
	(SELECT sum_total
	FROM
		(SELECT a.name, SUM(o.total) sum_total
		FROM accounts a
		JOIN orders o
		ON o.account_id = a.id
		GROUP BY 1
		HAVING SUM(o.standard_qty) =
			(SELECT MAX(standard_qty_sum)
				FROM
				(SELECT a.name, SUM(o.standard_qty) standard_qty_sum
				FROM accounts a
				JOIN orders o
				ON o.account_id = a.id
				GROUP BY 1) sub)) sub2)) sub3

4.
SELECT a.name, w.channel
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
JOIN orders o
ON o.account_id = a.id
GROUP BY 1,2
HAVING SUM(o.total_amt_usd ) =
		SELECT MAX(total_usd)
		FROM
		(SELECT a.name, SUM(o.total_amt_usd) total_usd
		FROM accounts a
		JOIN orders o
		ON o.account_id = a.id
		GROUP BY 1) sub1


5.
SELECT AVG(total_spent) avg_total_spent
FROM
  (SELECT a.name, SUM(o.total_amt_usd) total_spent
  FROM accounts a
  JOIN orders o
  ON o.account_id = a.id
  GROUP BY 1
  ORDER BY 2 DESC
  LIMIT 10) sub1

6.
