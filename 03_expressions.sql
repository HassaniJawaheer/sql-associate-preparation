SELECT
    title,
	rental_rate,
	replacement_cost,
	replacement_cost - rental_rate AS difference
FROM film;