1.
SELECT r.name region,s.name rep,a.name account
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
AND r.name = 'Midwest'
JOIN accounts a
ON a.sales_rep_id = s.id

2.
SELECT r.name region,s.name rep,a.name account
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
AND r.name LIKE 'S%'
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY account

3.
SELECT r.name region,s.name rep,a.name account
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
AND s.name LIKE '% K%'
AND r.name = 'Midwest'
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY account

4.
SELECT r.name region,a.name account,(o.total_amt_usd/(o.total+0.01)) AS unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
AND o.standard_qty > 100

5.
SELECT r.name region,a.name account,(o.total_amt_usd/(o.total+0.01)) AS unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
AND o.standard_qty > 100
AND o.poster_qty > 100
ORDER BY unit_price


6.
SELECT r.name region,a.name account,(o.total_amt_usd/(o.total+0.01)) AS unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
AND o.standard_qty > 100
AND o.poster_qty > 100
ORDER BY unit_price DESC


7.
SELECT DISTINCT account_id,channel
FROM web_events
ORDER BY account_id


8.
SELECT o.occurred_at,a.name,o.total,o.total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON o.account_id = a.id
AND o.occurred_at BETWEEN '2015-01-01' AND '2015-12-31'
