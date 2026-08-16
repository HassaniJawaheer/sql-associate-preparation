SELECT
    title,
	rental_rate,
	length
FROM film
WHERE film_id IN (
    SELECT film_id
	FROM film_category AS fc
	INNER JOIN category AS c USING (category_id)
	WHERE c.name = 'Family'
)
ORDER BY
    length DESC,
	title ASC
;