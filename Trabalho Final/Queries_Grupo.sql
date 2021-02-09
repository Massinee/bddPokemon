/*1- selecionar técnincas que tenham força acima de 100,mostre ID ,força e nome das técnicas */
SELECT FORCA,NOME_TECNICA,ID_TECNICA FROM tecnicas
WHERE FORCA >= 100;


/*2-liste os nomes dos tecnicas que começam começam com S,velocidade maior que 1 e ordene pela velocidade  */
SELECT * FROM TECNICAS
WHERE NOME_TECNICA LIKE 'S%'
having velocidade > 1
order by velocidade;

/*3- Liste os treinadores que são líderes de ginásio ,seus nomes  e títulos */
SELECT treinador.NOME ,FK_TREINADOR_IDTREINADOR as ID_Treinador,TITULO   FROM LIDER_DE_GINASIO
JOIN TREINADOR
ON IDTREINADOR = FK_TREINADOR_IDTREINADOR;

/*4- Mostrar os pokemons que estão registrados na Pokedex de ID= 1 e a data de seu registro  */
select pokemon.NOME,FK_POKEDEX_SERIAL_NUMBER AS ID_Pokedex ,DATAREGISTRO_POKEMON from registro_pokemon
join pokemon 
on FK_POKEMON_IDPOKEMON =IDPOKEMON
where FK_POKEDEX_SERIAL_NUMBER  = 1;



/*5-Quais sãos os tipos de pokemons selvagens(sem treinador) e  quantos tem de cada tipo  */
select TIPO ,COUNT(*)from pokemon 
where IDPOKEMON NOT IN (SELECT FK_POKEMON_IDPOKEMON as IDPOKEMON FROM POSSUI_POKEMON)
group by pokemon.TIPO;



		
