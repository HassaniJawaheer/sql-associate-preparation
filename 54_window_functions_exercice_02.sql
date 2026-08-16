SELECT
    customer_id,
	rental_id,
	rental_date,
	ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY rental_date) AS location
FROM rental
ORDER BY
    customer_id ASC,
	rental_date ASC
;