SELECT
    rating,
	SUM(replacement_cost) AS sum_repl_cost
FROM film
GROUP BY rating
ORDER BY sum_repl_cost DESC
;