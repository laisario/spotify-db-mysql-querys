SELECT art.name AS 'artista', 
	alb.album AS 'album'
    FROM SpotifyClone.artistas AS art
JOIN SpotifyClone.albuns AS alb ON art.artista_id = alb.artista_id AND art.name = 'Elis Regina'
ORDER BY album;