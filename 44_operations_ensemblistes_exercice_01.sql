SELECT
    first_name,
    last_name,
    'Customer' AS person_type
FROM customer
UNION
SELECT
    first_name,
    last_name,
    'Staff' AS person_type
FROM staff
ORDER BY
    last_name ASC,
    first_name ASC,
    person_type ASC
;