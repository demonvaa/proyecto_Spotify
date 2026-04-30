-- (Cuales son los 10 paises donde suenan mas canciones del ToP 50 )
SELECT 
    title,
    COUNT(DISTINCT country_id) AS num_paises
FROM top50_country
GROUP BY title
HAVING COUNT(DISTINCT country_id) > 1
ORDER BY num_paises DESC
LIMIT 20;

-- Top 1 género por país (el dominante)
SELECT
pais,
genero AS genero_dominante
FROM (
    SELECT 
        c.country AS pais,
        g.genre AS genero,
        ROW_NUMBER() OVER(
            PARTITION BY c.country
            ORDER BY COUNT(*) DESC
        ) AS rn
	FROM top50_country t
	JOIN country c ON t.country_id = c.country_id
	JOIN genre g ON t.genre_id = g.genre_id
	GROUP BY c.country, g.genre
) AS subconsulta
WHERE rn =1
ORDER BY pais, genero DESC


