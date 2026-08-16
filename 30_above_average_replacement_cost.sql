SELECT
    title,
	replacement_cost
FROM film
WHERE replacement_cost > (
    SELECT AVG(replacement_cost) FROM film
    )
ORDER BY
    replacement_cost DESC,
	title ASC
;