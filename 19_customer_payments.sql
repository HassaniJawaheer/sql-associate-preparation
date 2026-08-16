SELECT
    customer_id,
	SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id
ORDER BY
    total_amount DESC,
	customer_id ASC
;