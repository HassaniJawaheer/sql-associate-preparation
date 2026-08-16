SELECT
    first_name,
	last_name,
	rental_date
FROM customer
INNER JOIN rental USING (customer_id)
ORDER BY
    rental_date DESC,
	last_name ASC
;