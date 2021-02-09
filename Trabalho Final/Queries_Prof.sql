/* 1 - Liste a quantidade de Pokemons por nivel */

SELECT
nivel AS N�vel, COUNT(*) as Quantidade  FROM pokemon
GROUP BY nivel ORDER BY nivel;


/* 2 - Liste o id do treinador, sua idade, seu nome, além do id e do nome
dos Pokemons sob responsabilidade do treinador. */

select idtreinador as ID_Treinador, 
idade as Idade, treinador.nome as Nome, 
idpokemon as ID_Pokemon, pokemon.nome as Pokemon 
from treinador
join  possui_pokemon on
idtreinador = FK_TREINADOR_IDTREINADOR
join pokemon on
FK_POKEMON_IDPOKEMON = IDPOKEMON;


/* 3 - Liste a quantidade de enfermeiras alocadas em cada Centro Pokemon. */

SELECT
emprega.fk_centro_pokemon_idcentro as ID_Centro_Pokemon,
centro_pokemon.ENDERECO as Centro_Pokemon,
COUNT(*) as Qtd_Enfermeiras
FROM emprega
JOIN centro_pokemon ON
idcentro = fk_centro_pokemon_idcentro
GROUP BY emprega.fk_centro_pokemon_idcentro;


/* 4 - Liste o id e o nome de cada Pokemon que tenha dado entrada no
Centro Pokemon, bem como o número de dias de tratamento. */

SELECT fk_pokemon_idpokemon as ID_Pokemon, 
(select pokemon.nome from pokemon where pokemon.idpokemon = fk_pokemon_idpokemon) as Pokemon, 
DATEDIFF (dt_saida, dt_entrada) as Dias_de_Tratamento FROM tratamento;


/* 5 - Liste o id e o nome do treinador mais velho. */

select idtreinador as ID_Treinador, nome as Nome from treinador
where idade = (select max(idade) from treinador);