SELECT
    f.title AS title,
	l.name AS language,
	f.length AS duration,
	CASE
	    WHEN f.length < 60 THEN 'Short'
		WHEN f.length BETWEEN 60 AND 120 THEN 'Medium'
		ELSE 'Long'
	END AS duration_category
FROM film AS f
LEFT JOIN language AS l USING (language_id)
ORDER BY
    duration DESC,
	title ASC
;
    

