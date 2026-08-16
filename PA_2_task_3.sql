WITH total_customer_payment AS (
    SELECT
	    c.customer_id,
		c.store_id,
		ROUND(COALESCE(SUM(p.amount), 0),2) AS total_spent
	FROM customer AS c
	LEFT JOIN payment AS p USING (customer_id)
	GROUP BY
	    c.customer_id
    ),
    avg_total_customer_spent_store AS (
	    SELECT
		    store_id,
			ROUND(AVG(total_spent),2) AS store_avg_customer_spent
		FROM total_customer_payment
		GROUP BY store_id
    )


SELECT
    tab1.customer_id,
	tab2.store_id,
	tab1.total_spent,
	tab2.store_avg_customer_spent,
	ROUND(tab1.total_spent - tab2.store_avg_customer_spent, 2) AS difference_from_store_avg
FROM total_customer_payment AS tab1
INNER JOIN avg_total_customer_spent_store AS tab2 USING(store_id)
WHERE ROUND(tab1.total_spent - tab2.store_avg_customer_spent, 2) > 0
ORDER BY
    difference_from_store_avg DESC,
	tab1.customer_id ASC
;	