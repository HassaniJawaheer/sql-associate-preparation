SELECT
    first_name,
	last_name,
	email
FROM customer
WHERE
    first_name LIKE 'A%'
	AND last_name ILIKE '%SON%'
	AND email LIKE '%.org'
ORDER BY
    last_name ASC,
	first_name ASC
;
	
    