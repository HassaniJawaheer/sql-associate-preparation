CREATE VIEW customer_payments AS
SELECT
    c.customer_id,
	c.first_name,
	c.last_name,
	COUNT(p.payment_id) AS num_payments,
	SUM(p.amount) AS total_paid
FROM customer AS c
INNER JOIN payment AS p USING(customer_id)
GROUP BY 
    customer_id,
	first_name,
	last_name
;
	