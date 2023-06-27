SELECT mun.nome, mun.ibge7, rep.ano, imrs.desc, imrs.valor as resultado, SUM(rep.vl_emp)/pop.qnt AS emp_per_cap, SUM(rep.vl_pg)/pop.qnt AS pg_per_cap
	
FROM public."MUNICIPIO" AS mun
	JOIN public."REPASSE" AS rep
		ON rep.ibge6 = mun.ibge6
	JOIN public."IMRS" AS imrs
		ON imrs.ibge7 = mun.ibge7
		AND imrs.ano = rep.ano
	JOIN public."POPULACAO" AS pop
		ON pop.ibge7 = mun.ibge7
		AND pop.ano = rep.ano
	
WHERE imrs.desc = 'Taxa bruta de mortalidade'
OR imrs.desc = 'Proporção da população atendida pela Estratégia de Saúde da Família'
AND mun.ibge7 = 3100104
	
GROUP BY mun.nome, mun.ibge7, rep.ano, imrs.desc, imrs.valor, pop.qnt
ORDER BY mun.nome, rep.ano