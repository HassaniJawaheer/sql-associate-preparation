WITH film_inventories AS (
    SELECT
	    film_id,
		film.title AS title,
		COUNT(*) AS stock_count
	FROM inventory
	INNER JOIN film USING (film_id)
	GROUP BY
	    film_id,
		film.title
)

SELECT
    *
FROM film_inventories
WHERE stock_count > (
    SELECT AVG(stock_count) FROM film_inventories
)
ORDER BY
    stock_count DESC,
	title ASC
;