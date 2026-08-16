WITH client_total_amount AS (
    SELECT
        customer_id,
        SUM(amount) AS total_amount
    FROM payment
    GROUP BY customer_id
),
customer_types AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        cta.total_amount,
        CASE
            WHEN cta.total_amount >= 180 THEN 'VIP'
            ELSE 'Regular'
        END AS customer_type
    FROM customer AS c
    INNER JOIN client_total_amount AS cta USING (customer_id)
)

SELECT
    customer_id,
    first_name,
    last_name,
    total_amount,
    customer_type
FROM customer_types
WHERE customer_type = 'VIP'
ORDER BY
    total_amount DESC,
    last_name ASC;