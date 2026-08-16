SELECT
    rental_id,
	customer_id,
	rental_date,
	return_date,
	EXTRACT(DAY FROM (return_date - rental_date)) AS rental_days
FROM rental
WHERE 
    return_date IS NOT NULL 
	AND EXTRACT(DAY FROM (return_date - rental_date)) > (
        SELECT
		    AVG(EXTRACT(DAY FROM (return_date - rental_date)))
		FROM rental
		WHERE return_date IS NOT NULL
	)
ORDER BY
    rental_days DESC,
	rental_id ASC
;