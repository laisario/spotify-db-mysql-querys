SELECT can.cancao AS 'cancao', COUNT(hist.cancao_id) AS "reproducoes"
FROM SpotifyClone.cancoes AS can
INNER JOIN SpotifyClone.historico AS hist ON can.cancoes_id = hist.cancao_id
GROUP BY hist.cancao_id
ORDER BY reproducoes DESC, cancao ASC LIMIT 2;