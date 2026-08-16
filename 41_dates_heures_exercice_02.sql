SELECT
    DATE_PART('year', r.rental_date) AS year,
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(*) AS total_locations
FROM rental AS r
INNER JOIN customer AS c USING (customer_id)
GROUP BY
    DATE_PART('year', r.rental_date),
    c.customer_id
HAVING COUNT(*) >= 20
ORDER BY
    year ASC,
    total_locations DESC,
    c.last_name ASC;