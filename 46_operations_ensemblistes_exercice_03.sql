SELECT
    last_name
FROM actor

INTERSECT

SELECT
    last_name
FROM customer

ORDER BY
    last_name ASC
;