1.
SELECT account_id,total_amt_usd,
      CASE WHEN total_amt_usd > 3000 THEN 'Large' ELSE 'Small'
      END AS level
FROM orders;

2.
SELECT total,
		CASE WHEN total >= 2000 THEN 'At least 2000'
        WHEN total >= 1000 AND total <= 1999 THEN 'Between 1000 and 2000'
        WHEN total < 1000 THEN 'Less than 1000'
        END AS category
FROM orders

3.
SELECT a.name, SUM(o.total_amt_usd) total_sales_of_all_orders,
      CASE WHEN SUM(o.total_amt_usd) > 200000 THEN 'greater than 200,000'
          WHEN SUM(o.total_amt_usd) <= 200000 AND SUM(o.total_amt_usd) >= 100000 THEN 'between 200,000 and 100,000'
          WHEN SUM(o.total_amt_usd) < 100000 THEN 'under 100,000'
          END AS level
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC;

4.
SELECT DATE_PART('year',o.occurred_at) order_year, a.name, SUM(o.total_amt_usd) total_sales_of_all_orders,
      CASE WHEN SUM(o.total_amt_usd) > 200000 THEN 'greater than 200,000'
          WHEN SUM(o.total_amt_usd) <= 200000 AND SUM(o.total_amt_usd) >= 100000 THEN 'between 200,000 and 100,000'
          WHEN SUM(o.total_amt_usd) < 100000 THEN 'under 100,000'
          END AS level
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1,2
HAVING DATE_PART('year',o.occurred_at) IN (2016, 2017)
ORDER BY 3 DESC;

5.
SELECT s.name,COUNT(o.*) num_orders, CASE WHEN COUNT(o.*) > 200 THEN 'top' ELSE 'not' END AS level
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
ORDER BY num_orders DESC;


6.
SELECT s.name, COUNT(o.*) num_orders, SUM(o.total_amt_usd) sum_sales,
        CASE WHEN COUNT(o.*) > 200 OR SUM(o.total_amt_usd) > 750000 THEN 'top'
            WHEN (COUNT(o.*) < 200 AND COUNT(o.*) > 150)  OR (SUM(o.total_amt_usd) <750000 AND SUM(o.total_amt_usd) >500000) THEN 'middle'
            ELSE 'low'
            END AS level
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
ORDER BY 4 DESC,3 DESC;
