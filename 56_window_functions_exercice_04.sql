SELECT
    film_id,
	title,
	length,
	DENSE_RANK() OVER (ORDER BY length DESC) AS rank
FROM film
ORDER BY
    rank ASC,
	title ASC
;