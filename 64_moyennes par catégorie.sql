SELECT
    c.name AS category,
	COUNT(fc.film_id) AS nums_film,
	ROUND(AVG(f.length),2) AS mean_duration,
	ROUND(AVG(f.rental_rate),2) AS mean_location
FROM category AS c
LEFT JOIN film_category AS fc USING (category_id)
LEFT JOIN film AS f USING(film_id)
GROUP BY
    c.name
HAVING COUNT(fc.film_id) >= 20
ORDER BY mean_duration DESC;
