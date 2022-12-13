1.
SELECT s.name rep,COUNT(a.name) num_account
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
GROUP BY rep
HAVING COUNT(a.name) > 5
ORDER BY num_account DESC


2.
SELECT account_id,COUNT(account_id) orders_num
FROM orders
GROUP BY account_id
HAVING COUNT(account_id) > 20
ORDER BY orders_num DESC

3.
SELECT account_id,COUNT(account_id) orders_num,a.name
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY account_id,a.name
HAVING COUNT(account_id) > 20
ORDER BY orders_num DESC
LIMIT 1;

4.
SELECT a.name,SUM(o.total_amt_usd) total_usd
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY a.name
HAVING SUM(o.total_amt_usd) > 30000

5.
SELECT a.name,SUM(o.total_amt_usd) total_usd
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY a.name
HAVING SUM(o.total_amt_usd) < 1000

6.
SELECT a.name,SUM(o.total_amt_usd) total_usd
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY a.name
ORDER BY total_usd DESC
LIMIT 1;


7.
SELECT a.name,SUM(o.total_amt_usd) total_usd
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY a.name
ORDER BY total_usd
LIMIT 1;


8.
SELECT a.name,w.channel,COUNT(w.channel) num_times
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
GROUP BY a.name,w.channel
HAVING w.channel = 'facebook'
AND COUNT(w.channel) > 6
ORDER BY num_times DESC


9.
SELECT a.name,w.channel,COUNT(w.channel) num_times
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
GROUP BY a.name,w.channel
HAVING w.channel = 'facebook'
ORDER BY num_times DESC
LIMIT 1;


10.
SELECT channel,COUNT(channel) num_times
FROM web_events
GROUP BY channel
ORDER BY num_times DESC
