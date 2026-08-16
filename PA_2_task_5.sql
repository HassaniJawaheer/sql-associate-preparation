WITH customer_spending AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', payment_date)::date AS month,
        SUM(amount) AS spending
    FROM payment
    GROUP BY
        customer_id,
        DATE_TRUNC('month', payment_date)::date
),

customer_bound_month AS (
    SELECT
        customer_id,
        MIN(month) AS min_month,
        MAX(month) AS max_month
    FROM customer_spending
    GROUP BY customer_id
),

customer_month AS (
    SELECT
        customer_id,
        generate_series(
            min_month,
            max_month,
            INTERVAL '1 month'
        )::date AS month
    FROM customer_bound_month
),

complete_customer_spending AS (
    SELECT
        cm.customer_id,
        cm.month,
        COALESCE(cs.spending, 0) AS spending
    FROM customer_month AS cm
    LEFT JOIN customer_spending AS cs
        ON cm.customer_id = cs.customer_id
        AND cm.month = cs.month
),

sliding_customer_spending AS (
    SELECT
        customer_id,
        month,
        spending,
        LEAD(month, 1) OVER (
            PARTITION BY customer_id
            ORDER BY month
        ) AS month_2,
        LEAD(spending, 1) OVER (
            PARTITION BY customer_id
            ORDER BY month
        ) AS spending_month_2,
        LEAD(month, 2) OVER (
            PARTITION BY customer_id
            ORDER BY month
        ) AS month_3,
        LEAD(spending, 2) OVER (
            PARTITION BY customer_id
            ORDER BY month
        ) AS spending_month_3
    FROM complete_customer_spending
)

SELECT
    customer_id,
    TO_CHAR(month, 'YYYY-MM') AS month_1,
    ROUND(spending, 2) AS spending_month_1,
    TO_CHAR(month_2, 'YYYY-MM') AS month_2,
    ROUND(spending_month_2, 2) AS spending_month_2,
    TO_CHAR(month_3, 'YYYY-MM') AS month_3,
    ROUND(spending_month_3, 2) AS spending_month_3
FROM sliding_customer_spending
WHERE
    spending < spending_month_2
    AND spending_month_2 < spending_month_3
ORDER BY
    customer_id,
    month_1;