SELECT 
    title,
    length,
    rental_rate,
    rating
FROM film
WHERE
    length BETWEEN 90 AND 120
    AND rental_rate > 2.99
    AND (rating = 'PG' OR rating = 'PG-13')
ORDER BY
    length DESC,
    title ASC;