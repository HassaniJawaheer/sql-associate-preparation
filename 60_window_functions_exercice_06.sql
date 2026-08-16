SELECT
    title,
	length,
	NTILE(4) OVER (ORDER BY length DESC) AS group
FROM film;