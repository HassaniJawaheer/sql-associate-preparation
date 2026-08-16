SELECT
    inventory_id
FROM inventory
EXCEPT
SELECT
    inventory_id
FROM rental
ORDER BY
    inventory_id ASC
;