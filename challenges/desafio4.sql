SELECT DISTINCT user.nome_pessoa_usuaria AS 'pessoa_usuaria', 
    IF(MAX(hist.data_reproducao > "2021-01-01 00:00:00"), 'Ativa', 'Inativa') AS 'status_pessoa_usuaria'
FROM SpotifyClone.usuario AS user
INNER JOIN SpotifyClone.historico AS hist ON user.pessoa_usuaria_id = hist.user_id
GROUP BY pessoa_usuaria
order by pessoa_usuaria;