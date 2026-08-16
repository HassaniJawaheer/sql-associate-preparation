SELECT
    title,
	rating,
	rental_duration,
	length
FROM film
WHERE
    rating IN ('G', 'PG', 'PG-13')
	AND rental_duration <> 3
	AND (length > 150 OR length < 60)
ORDER BY
    rating ASC,
	length DESC,
	title ASC
;
	