SELECT
    address,
	address2,
	district,
	postal_code
FROM address
WHERE
    address2 IS NULL
	AND postal_code IS NOT NULL
	AND (district ILIKE 'A%' OR district ILIKE 'B%')
ORDER BY
    district ASC,
	address ASC
;