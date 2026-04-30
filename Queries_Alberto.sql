USE Spotify_proyect;

-- Que artista tiene canciones energeticas pero a la vez tristes, melacolicas

SELECT a.artist,
	CASE
		WHEN nrgy >= 70 THEN 'Intensa'
        WHEN nrgy < 40 THEN 'Tranquila'
        ELSE 'Moderada'
        END AS intensity,
        COUNT(DISTINCT top.title) AS total_songs 
FROM artist AS a
	LEFT JOIN top50_country AS top
		ON a.artist_id = top.artist_id
WHERE top.val < 50
GROUP BY a.artist, intensity
HAVING intensity = 'Intensa'
ORDER BY total_songs DESC
LIMIT 10;

-- que canciones son las The Weekend con esas caracteristicas

SELECT DISTINCT top.title
FROM artist AS a
	LEFT JOIN top50_country AS top
		ON a.artist_id = top.artist_id
WHERE top.val < 50 and a.artist = 'The Weeknd' and top.nrgy >= 70;

-- en que paises han sido top esas canciones the The Weeknd 

SELECT c.country
FROM country AS c
	LEFT JOIN top50_country AS top
    ON c.country_id = top.country_id
WHERE top.title IN ('Blinding Lights','Heartless')
GROUP BY c.country;

-- Cuales son los generos mas escuchados a nivel mundial

SELECT DISTINCT g.genre
FROM genre AS g
LEFT JOIN top50_country AS top
on g.genre_id = top.genre_id
LEFT JOIN country AS c
on c.country_id = top.country_id
WHERE c.country = 'world' 
GROUP BY g.genre;

-- 
SELECT genre 