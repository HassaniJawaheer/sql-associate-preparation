SELECT
    c.name AS category,
    ROUND(AVG(f.length), 2) AS mean_duration,
    ROUND(
        CAST(
            PERCENTILE_CONT(0.5)
                WITHIN GROUP (ORDER BY f.length)
            AS NUMERIC
        ),
        2
    ) AS median_duration
FROM category AS c
INNER JOIN film_category AS fc USING (category_id)
INNER JOIN film AS f USING (film_id)
GROUP BY c.name
HAVING COUNT(f.film_id) >= 20
ORDER BY median_duration DESC;