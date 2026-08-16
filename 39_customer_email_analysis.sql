SELECT
    UPPER(LEFT(c.last_name, 1)) AS initial,
    COUNT(DISTINCT c.customer_id) AS nb_clients,
    COUNT(r.rental_id) AS total_locations
FROM customer AS c
LEFT JOIN rental AS r USING (customer_id)
GROUP BY
    UPPER(LEFT(c.last_name, 1))
HAVING COUNT(DISTINCT c.customer_id) >= 10
ORDER BY
    total_locations DESC,
    initial ASC;
	