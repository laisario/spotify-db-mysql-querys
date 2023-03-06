SELECT COUNT(DISTINCT cancoes.cancao) AS 'cancoes', COUNT(DISTINCT artist.name) AS 'artistas', COUNT(DISTINCT alb.album) AS 'albuns'
FROM SpotifyClone.cancoes AS cancoes
INNER JOIN SpotifyClone.artistas AS artist ON cancoes.artista_id = artist.artista_id
INNER JOIN SpotifyClone.albuns AS alb ON alb.artista_id = artist.artista_id;