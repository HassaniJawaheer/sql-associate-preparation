SELECT
    customer_id,
	first_name,
	last_name,
	SUM(amount) AS total_amount,
	RANK() OVER (ORDER BY SUM(amount) DESC) AS rank
FROM customer AS c
INNER JOIN payment AS p USING (customer_id)
GROUP BY
    customer_id
ORDER BY
   rank ASC,
   customer_id ASC
;