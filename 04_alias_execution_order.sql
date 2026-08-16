SELECT
    title,
	replacement_cost - rental_rate AS difference
FROM film
-- WHERE difference > 15 ne marche pas car WHERE est executer avant SELECT
WHERE  replacement_cost - rental_rate > 15;