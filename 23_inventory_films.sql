SELECT
    inventory_id,
	title
FROM film
INNER JOIN inventory USING (film_id)
ORDER BY
    title ASC,
	inventory_id ASC
;