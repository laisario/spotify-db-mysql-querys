SELECT art.name AS 'artista', 
	alb.album AS 'album',
    COUNT(art_s.user_id) AS 'pessoas_seguidoras'
FROM SpotifyClone.artistas AS art
JOIN SpotifyClone.albuns AS alb ON art.artista_id = alb.artista_id
JOIN SpotifyClone.artista_seguidores AS art_s ON alb.artista_id = art_s.artista_id
GROUP BY album, artista
ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;