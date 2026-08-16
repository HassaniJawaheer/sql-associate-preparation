SELECT
    c.first_name AS first_name,
    c.last_name AS last_name,
    COUNT(r.rental_id) AS total_location,
    CASE
        WHEN COUNT(r.rental_id) >= 30 THEN 'Frequent'
        WHEN COUNT(r.rental_id) BETWEEN 15 AND 29 THEN 'Regular'
        ELSE 'Occasional'
    END AS rental_status
FROM customer AS c
LEFT JOIN rental AS r USING (customer_id)
GROUP BY
    c.first_name,
    c.last_name
ORDER BY
    total_location DESC,
    last_name ASC;
;