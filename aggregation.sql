1.
SELECT a.name,o.occurred_at
FROM accounts a
JOIN orders o
ON o.account_id = a.id
ORDER BY occurred_at

2.
SELECT o.total_amt_usd, a.name
FROM orders o
JOIN accounts a
ON o.account_id = a.id

3.
SELECT w.occurred_at,w.channel,a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
ORDER BY occurred_at DESC

4.
SELECT w.channel,COUNT(w.channel)
FROM web_events w
GROUP BY w.channel;

5.
SELECT a.primary_poc,w.occurred_at
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
ORDER BY w.occurred_at
LIMIT 1;

6.
SELECT a.name,MIN(o.total_amt_usd) smallest
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY name
ORDER BY smallest

7.
SELECT r.name,COUNT(s.name) num_reps
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
GROUP BY r.name
ORDER BY num_reps;

1.
SELECT a.name account,AVG(o.standard_amt_usd) avg_standard,
		AVG(o.gloss_amt_usd) avg_gloss,AVG(poster_amt_usd) avg_poster
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY account

2.
SELECT a.name account,AVG(o.standard_qty) avg_standard,
		AVG(o.gloss_qty) avg_gloss,AVG(o.poster_qty) avg_poster
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY account

3.
SELECT s.name rep,w.channel,COUNT(w.channel)
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
JOIN sales_reps s
ON a.sales_rep_id = s.id
GROUP BY w.channel,s.name;

4.
SELECT r.name region,w.channel,COUNT(w.channel)
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN web_events w
ON w.account_id = a.id
GROUP BY region,channel;
