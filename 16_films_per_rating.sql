SELECT
    rating,
	COUNt(*) AS count_rating
FROM film
GROUP BY rating
ORDER BY count_rating DESC;