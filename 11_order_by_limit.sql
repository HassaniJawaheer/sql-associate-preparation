SELECT
    title,
	release_year,
	rental_rate,
	length
FROM film
ORDER BY
    rental_rate DESC,
	length ASC,
	title ASC
LIMIT 15;