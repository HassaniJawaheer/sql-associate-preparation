SELECT
    f.title,
    COUNT(r.rental_id) AS completed_rentals,
    AVG(r.return_date - r.rental_date) AS avg_rental_duration
FROM film AS f
INNER JOIN inventory AS i USING (film_id)
INNER JOIN rental AS r USING (inventory_id)
WHERE r.return_date IS NOT NULL
GROUP BY
    f.film_id,
    f.title
HAVING COUNT(r.rental_id) >= 10
ORDER BY
    avg_rental_duration DESC,
    f.title ASC;