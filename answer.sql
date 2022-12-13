SELECT accounts.name AS name, accounts.primary_poc, web_events.occurred_at occurred, web_events.channel channel
FROM accounts
JOIN web_events
ON accounts.id = web_events.account_id
WHERE name LIKE 'Walmart'


SELECT accounts.name company, sales_reps.name sales_rep, region.name region
FROM region
JOIN sales_reps
ON sales_reps.region_id = region.id
JOIN accounts
ON accounts.sales_rep_id = sales_reps.id
ORDER by company

SELECT r.name region,a.name account, o.total_amt_usd/(o.total+0.01) unit_price
FROM region r
JOIN sales_reps sr
ON sr.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = sr.id
JOIN orders o
ON o.account_id = a.id
