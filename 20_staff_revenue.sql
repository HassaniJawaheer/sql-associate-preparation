SELECT
    staff_id,
	COUNT(*) AS count_payment,
	SUM(amount) AS total_amount
FROM payment
GROUP BY staff_id
ORDER BY
    total_amount DESC,pas de skill 
	count_payment DESC
;