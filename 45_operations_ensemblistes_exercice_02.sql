SELECT
    DATE_TRUNC('hour', payment_date) AS event_time,
	customer_id,
	'Payment' AS event_type
FROM payment

UNION ALL

SELECT
    DATE_TRUNC('hour', rental_date) AS event_time,
	customer_id,
	'Rental' AS event_type
FROM rental
ORDER BY
    event_time ASC,
	customer_id ASC,
	event_type ASC
;