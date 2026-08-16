SELECT
    customer_id,
	first_name,
	last_name,
	COUNT(payment_id) AS nums_payment,
	ROUND(AVG(amount),2) AS mean_amount,
	ROUND(STDDEV(amount),2) AS stddev,
	ROUND(VARIANCE(amount),2) AS variance
FROM customer AS c
INNER JOIN payment AS p USING (customer_id)
GROUP BY
    customer_id,
	first_name,
	last_name
HAVING COUNT(payment_id) >= 20
ORDER BY stddev DESC;