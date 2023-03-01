/*Análises do banco de dados de uma empresa de filmes

----------------PRIMEIRA QUERY-----------------------
  
  Nome dos filmes com a nota acima da média:
*/

create view melhores_notas as
SELECT
	F.titulo,
    A.nota
from filmes F 
INNER JOIN alugueis A 
on F.id_filme = A.id_filme
WHERE A.nota >= (SELECT AVG(NOTA) FROM alugueis)
ORDER BY A.nota;


/*
  ----------------SEGUNDA QUERY-----------------------
  
  Quantidade de atores por nacionalidade
*/
create view nacio_atores as 
select 
	nacionalidade,
	count(nome_ator) as quantidade_atores
from atores
group by nacionalidade
order by nacionalidade;


 
 /*
 ----------------TERCEIRA QUERY-----------------------
 
 Quantidades de alugueis por ano e mês
 */
 create view periodo_alugueis as 
select 
	year(data_aluguel) as ano,
    month(data_aluguel) as mês,
    count(id_aluguel) as quantidade_aluguel
from alugueis
group by year(data_aluguel), month(data_aluguel)
order by year(data_aluguel), month(data_aluguel);


/*
 ----------------QUARTA QUERY-----------------------
 
Alugueis por região
*/
create view alugues_regioes as 
select 
	C.regiao,
    COUNT(A.id_aluguel) AS Qtde_alugueis
from alugueis A  
inner join clientes C
on C.id_cliente = A.id_cliente
GROUP BY C.regiao
ORDER BY  COUNT(A.id_aluguel) DESC;


/*
 ----------------QUINTA QUERY-----------------------
 
Os 10 filmes mais alugados
*/
create view melhores_filmes as 
select 
	F.titulo,
    F.ano_lancamento,
    count(A.id_aluguel) AS Qtde_alugado
from filmes F 
INNER JOIN alugueis A 
ON F.id_filme = A.id_filme
group by F.titulo
ORDER BY  count(A.id_aluguel) DESC
LIMIT 10;

	























 