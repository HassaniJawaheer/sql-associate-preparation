SELECT
    c.customer_id AS customer_id,
	c.first_name AS first_name,
	c.last_name AS last_name,
	MIN(r.rental_date) AS date_first_location,
	MAX(r.rental_date) AS date_last_location,
	MAX(r.rental_date) - MIN(r.rental_date) AS delay_first_last_location,
	COALESCE(CAST(MAX(r.return_date) AS TEXT), 'Aucun retour enregistré') AS last_return_date,
	COUNT(*) AS total_locations
FROM customer AS c
INNER JOIN rental AS r USING (customer_id)
GROUP BY
    customer_id
HAVING COUNT(*) >= 20
ORDER BY
    total_locations DESC,
	last_name ASC,
	first_name ASC
;
	
