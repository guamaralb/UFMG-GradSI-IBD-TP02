SELECT mun.nome, mun.ibge7, rep.ano, munic.cd, pmunic.desc_adap, munic.resp, SUM(rep.vl_emp)/pop.qnt AS emp_per_cap, SUM(rep.vl_pg)/pop.qnt AS pg_per_cap
	
FROM public."MUNICIPIO" AS mun
	JOIN public."REPASSE" AS rep
		ON rep.ibge6 = mun.ibge6
	JOIN public."MUNIC" AS munic
		ON munic.ibge7 = mun.ibge7
		AND munic.ano = rep.ano
	JOIN public."PERGUNTAS_MUNIC" AS pmunic
		ON munic.cd = pmunic.cd
	JOIN public."POPULACAO" AS pop
		ON pop.ibge7 = mun.ibge7
		AND pop.ano = rep.ano
	
WHERE munic.cd = 'MSAU15'

GROUP BY mun.nome, mun.ibge7, rep.ano, munic.cd, pmunic.desc_adap, munic.resp, pop.qnt
ORDER BY mun.nome, rep.ano