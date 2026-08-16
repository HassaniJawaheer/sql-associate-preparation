SELECT
    c.name,
    UPPER(LEFT(c.name, 3)) AS code,
    COUNT(*) AS film_count
FROM category AS c
JOIN film_category AS fc USING (category_id)
GROUP BY
    c.category_id,
    c.name
ORDER BY
    film_count DESC,
    c.name ASC;