SELECT
    a.first_name AS first_name,
    a.last_name AS last_name,
    COUNT(fa.film_id) AS num_films
FROM actor AS a
LEFT JOIN film_actor AS fa USING (actor_id)
GROUP BY
    a.actor_id,
    a.first_name,
    a.last_name
HAVING COUNT(fa.film_id) > (
    SELECT AVG(num_film)
    FROM (
        SELECT
            actor_id,
            COUNT(film_id) AS num_film
        FROM film_actor
        GROUP BY actor_id
    ) AS actor_totals
)
ORDER BY
    num_films DESC,
    last_name ASC,
    first_name ASC;
	