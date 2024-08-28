-- 1 - Buscar o nome e ano dos filmes
select nome, ano from filmes;

-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
select nome, ano from filmes order by ano;

-- 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
-- Não foi necessário usar o nome todo do filme
select * from filmes where nome ilike '%de volta%'; -- sem case sensitive
select * from filmes where nome like '%De Volta%'; -- case sensitive

-- 4 - Buscar os filmes lançados em 1997
select * from filmes where ano = 1997;

-- 5 - Buscar os filmes lançados APÓS o ano 2000
select * from filmes where ano > 2000;

-- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
select * from filmes where duracao > 100 and duracao < 150 order by duracao;

-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
select ano, count(*) as quantidade from filmes group by ano order by quantidade desc; -- não foi possível ordenar pela
-- duração, pois não foi usado na agregação, e colocar esse campo lá produz um resultado equivocado


-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
select primeironome,ultimonome from atores where genero = 'M';

-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
select primeironome,ultimonome from atores where genero = 'F' order by primeironome;

-- 10 - Buscar o nome do filme e o gênero
select nome, genero from filmes as F join filmesgenero as FG on F.id = FG.idfilme join generos as G on G.id = FG.idgenero;

-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
select nome, genero from filmes as F join filmesgenero as FG on F.id = FG.idfilme join generos as G on G.id = FG.idgenero where genero like 'Mist%'; -- não é necessário escrever o nome todo
select nome, genero from filmes as F join filmesgenero as FG on F.id = FG.idfilme join generos as G on G.id = FG.idgenero where genero = 'Mistério';

-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
select nome, primeironome, ultimonome, papel from filmes as F join elencofilme as E on F.id = E.idfilme join atores as A on A.id = E.idator;
