SELECT
    c.first_name AS prenom,
	c.last_name AS nom,
	SUM(p.amount) AS total_amount,
	CASE
	    WHEN SUM(p.amount) >= 150 THEN 'VIP'
		WHEN SUM(p.amount) >= 100 THEN 'Regular'
		ELSE 'Occasional'
	END AS activity
FROM customer AS c
LEFT JOIN payment AS p USING (customer_id)
GROUP BY
    c.first_name,
	c.last_name
ORDER BY
    total_amount DESC,
	c.last_name ASC
;

