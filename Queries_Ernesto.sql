-- (Cuales son los 10 paises donde suenan mas canciones del ToP 50 )
SELECT 
    t.title,
    a.artist, 
    COUNT(DISTINCT t.country_id) AS num_paises
FROM top50_country t
JOIN artist a ON t.artist_id = a.artist_id
GROUP BY t.title, a.artist
HAVING COUNT(DISTINCT t.country_id) > 1
ORDER BY num_paises DESC
LIMIT 20;

-- Media de bailabilidad por artista  
SELECT 
	AVG(t.dnce) AS dnce_media,
    a.artist,
    g.genre
FROM top50_country t
JOIN artist a ON t.artist_id = a.artist_id
JOIN genre g ON g.genre_id = t.genre_id
GROUP BY a.artist, g.genre
ORDER BY dnce_media DESC;




