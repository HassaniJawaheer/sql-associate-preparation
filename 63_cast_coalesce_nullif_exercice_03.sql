SELECT
    title,
	rental_rate,
	replacement_cost,
	ROUND(replacement_cost::NUMERIC / NULLIF(rental_rate::NUMERIC, 0), 2) AS ratio_rate
FROM film
ORDER BY title