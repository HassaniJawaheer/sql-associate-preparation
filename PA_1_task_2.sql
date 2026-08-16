SELECT
    customer_id,
	staff_id,
	ROUND(AVG(amount),2) AS avg_payment,
	MAX(amount) AS max_payment
FROM payment
GROUP BY
    customer_id,
	staff_id
;