SELECT
    film.title AS titre,
	language.name langue
FROM film
LEFT JOIN language
ON film.language_id = language.language_id
ORDER BY
    langue ASC,
	titre ASC
;