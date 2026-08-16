SELECT
    customer.first_name AS first_name,
	customer.last_name AS last_name,
	payment.amount AS amount
FROM customer
INNER JOIN payment
ON payment.customer_id = customer.customer_id
ORDER BY
    last_name ASC,
	first_name ASC
;