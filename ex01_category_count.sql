SELECT 
    category.name AS category,
	COUNT(film_category.category_id) AS film_count
FROM film_category
LEFT JOIN category
ON category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY 
    film_count DESC,
	category ASC
;
