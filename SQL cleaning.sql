1.
SELECT RIGHT(a.website,4) AS domain, COUNT(*) num_companies
FROM accounts a
GROUP BY 1
ORDER BY 2 DESC;

2.
SELECT LEFT(a.name,1) AS letter, COUNT(*) num_companies
FROM accounts a
GROUP BY 1
ORDER BY 2 DESC;

3.
SELECT primary_poc,LEFT(primary_poc, STRPOS(primary_poc,' ') - 1) first_name,
		RIGHT(primary_poc, LENGTH(primary_poc) - (STRPOS(primary_poc,' ') - 1)) last_name
FROM accounts

4.
SELECT name, LEFT(name, STRPOS(name,' ') - 1) first_name, RIGHT(name, LENGTH(name) - STRPOS(name,' ')) last_name
FROM sales_reps
