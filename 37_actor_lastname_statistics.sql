SELECT
    last_name,
	COUNT(last_name) AS nbs_actor,
	length(last_name)
FROM actor
GROUP BY
    last_name
HAVING 
    COUNT(last_name) >= 2
ORDER BY
    nbs_actor DESC,
	last_name ASC
;
	