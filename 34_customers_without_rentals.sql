SELECT
    c.first_name AS first_name,
	c.last_name AS last_name,
	c.email AS email
FROM customer AS c
WHERE customer_id NOT IN(
    SELECT customer_id
	FROM rental
)
ORDER BY
    last_name ASC,
	first_name ASC
;