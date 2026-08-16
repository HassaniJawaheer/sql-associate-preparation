SELECT
    title,
	rental_rate,
	CAST(rental_rate AS INTEGER) AS rental_rate_int,
	ROUND(CAST(rental_rate AS NUMERIC), 1) AS rental_rate_rounded
FROM film
ORDER BY title ASC