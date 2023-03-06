SELECT FORMAT(MIN(plan.valor_plano), 2) AS 'faturamento_minimo',
	CONVERT(MAX(plan.valor_plano), CHAR) AS 'faturamento_maximo',
  CONVERT(ROUND(AVG(plan.valor_plano), 2), CHAR) AS 'faturamento_medio',
  CONVERT(ROUND(SUM(plan.valor_plano), 2), CHAR) AS 'faturamento_total'
FROM SpotifyClone.planos AS plan
JOIN SpotifyClone.usuario AS user ON plan.planos_id = user.plano_id;