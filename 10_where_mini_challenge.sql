SELECT
    customer_id,
	first_name,
	last_name,
	email,
	active
FROM customer
WHERE
    active = 1
	AND (first_name ILIKE 'M%' OR first_name ILIKE 'S%')
	AND last_name NOT ILIKE '%son%'
	AND (email LIKE '%.org' OR email LIKE '%.com')
ORDER BY
    last_name ASC,
	first_name ASC
;