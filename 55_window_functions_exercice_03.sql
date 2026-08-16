SELECT
    film_id,
	title,
	length,
	RANK() OVER (ORDER BY length DESC) AS rank
FROM film
ORDER BY
    rank ASC,
	title ASC
;