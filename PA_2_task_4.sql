WITH rental_payment AS (
        SELECT
	        r.rental_id,
            r.inventory_id,
		    p.amount,
		    TO_CHAR(p.payment_date, 'YYYY-MM') AS month
	    FROM rental AS r
	    INNER JOIN payment AS p USING(rental_id)
	    WHERE r.return_date IS NOT NULL
	),
	rental_film AS (
        SELECT
		    r.rental_id,
			i.film_id,
			c.name AS category
		FROM rental AS r
		INNER JOIN inventory AS i USING (inventory_id)
		INNER JOIN film_category
		ON i.film_id = film_category.film_id
		INNER JOIN category AS c
		ON c.category_id = film_category.category_id
	),
	ass_table AS (
        SELECT
		    rp.rental_id,
			rf.film_id,
			rp.month,
			rf.category,
			rp.amount
		FROM rental_payment AS rp
		INNER JOIN rental_film AS rf
		ON rp.rental_id = rf.rental_id
	)
	
SELECT
    month,
	category,
    COUNT(DISTINCT rental_id) AS rental_count,
	ROUND(SUM(amount),2) AS total_revenue,
	ROUND(AVG(amount),2) AS avg_payment
FROM ass_table
GROUP BY
    month,
	category
HAVING ROUND(SUM(amount),2) >= 150.00
ORDER BY
    month ASC,
	total_revenue DESC,
	category ASC
;