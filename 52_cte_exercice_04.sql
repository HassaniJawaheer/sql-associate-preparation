WITH film_inventories AS (
    SELECT
        f.film_id,
        f.title,
        COUNT(i.inventory_id) AS stock_count
    FROM film AS f
    INNER JOIN inventory AS i
        USING (film_id)
    GROUP BY
        f.film_id,
        f.title
),
films_location AS (
    SELECT
        fi.film_id,
        fi.title,
        fi.stock_count,
        COUNT(r.rental_id) AS rental_count
    FROM film_inventories AS fi
    INNER JOIN inventory AS i
        USING (film_id)
    INNER JOIN rental AS r
        USING (inventory_id)
    GROUP BY
        fi.film_id,
        fi.title,
        fi.stock_count
)

SELECT
    film_id,
    title,
    stock_count,
    rental_count
FROM films_location
WHERE rental_count > 30
ORDER BY
    rental_count DESC,
    title ASC;