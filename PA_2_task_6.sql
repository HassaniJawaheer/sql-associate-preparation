WITH film_revenue AS (
    SELECT
        f.film_id,
        f.title,
        c.name AS category,
        COUNT(DISTINCT r.rental_id) AS rental_count,
        COALESCE(SUM(p.amount), 0) AS total_revenue
    FROM film AS f
    INNER JOIN film_category AS fc
        ON f.film_id = fc.film_id
    INNER JOIN category AS c
        ON fc.category_id = c.category_id
    LEFT JOIN inventory AS i
        ON f.film_id = i.film_id
    LEFT JOIN rental AS r
        ON i.inventory_id = r.inventory_id
    LEFT JOIN payment AS p
        ON r.rental_id = p.rental_id
    GROUP BY
        f.film_id,
        f.title,
        c.name
),

film_category_avg AS (
    SELECT
        *,
        AVG(total_revenue) OVER (
            PARTITION BY category  
        ) AS category_avg_film_revenue
    FROM film_revenue
)

SELECT
    film_id,
    title,
    category,
    rental_count,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(category_avg_film_revenue, 2) AS category_avg_film_revenue,
    ROUND(
        total_revenue - category_avg_film_revenue,
        2
    ) AS revenue_above_category_avg
FROM film_category_avg
WHERE
    total_revenue > category_avg_film_revenue
    AND total_revenue >= 100.00
ORDER BY
    revenue_above_category_avg DESC,
    film_id ASC;

	