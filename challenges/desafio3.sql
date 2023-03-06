SELECT user.nome_pessoa_usuaria AS 'pessoa_usuaria', 
	COUNT(hist.cancao_id) AS 'musicas_ouvidas',
	ROUND(SUM(duracao_segundos/60), 2) AS 'total_minutos'
FROM SpotifyClone.usuario AS user
INNER JOIN SpotifyClone.historico AS hist ON user.pessoa_usuaria_id = hist.user_id
INNER JOIN SpotifyClone.cancoes AS song ON hist.cancao_id = song.cancoes_id
GROUP BY user.nome_pessoa_usuaria
ORDER BY user.nome_pessoa_usuaria;