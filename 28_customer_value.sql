SELECT
    c.first_name AS first_name,
    c.last_name AS last_name,
    COUNT(p.payment_id) AS num_payment,
    SUM(p.amount) AS total_amount,
    CASE
        WHEN SUM(p.amount) >= 175 THEN 'Gold'
        WHEN SUM(p.amount) >= 125 THEN 'Silver'
        ELSE 'Bronze'
    END AS customer_value
FROM customer AS c
LEFT JOIN payment AS p USING (customer_id)
GROUP BY
    c.first_name,
    c.last_name
ORDER BY
    CASE
        WHEN SUM(p.amount) >= 175 THEN 1
        WHEN SUM(p.amount) >= 125 THEN 2
        ELSE 3
    END,
    total_amount DESC,
    last_name ASC;
;
	
    


