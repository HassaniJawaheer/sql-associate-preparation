WITH client_total_depenses AS (
    SELECT
        customer_id,
        c.first_name,
        c.last_name,
        SUM(amount) AS total_amount
    FROM payment
    INNER JOIN customer AS c USING (customer_id)
    GROUP BY
        customer_id,
        c.first_name,
        c.last_name
)

SELECT
    customer_id,
    first_name,
    last_name,
    total_amount
FROM client_total_depenses
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM client_total_depenses
)
ORDER BY
    total_amount DESC,
    last_name ASC;