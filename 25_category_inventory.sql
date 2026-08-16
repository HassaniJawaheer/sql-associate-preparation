SELECT
    category.name AS category,
    COUNT(inventory.film_id) AS count
FROM category
LEFT JOIN film_category USING (category_id)
LEFT JOIN inventory USING (film_id)
GROUP BY category.name
ORDER BY
    count DESC,
    category ASC;