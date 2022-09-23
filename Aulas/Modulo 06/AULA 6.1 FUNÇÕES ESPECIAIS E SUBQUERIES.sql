#---- FUNÇÕES DE AGREGAÇÃO ----
/* COMANDOS: 
-> COUNT: Contagens de registro de uma consulta, ou seja, quantidade de informações registradas
-> SUM: Soma de valores
-> AVG: Média de valores
-> MAX: Valor Máximos retornados pela consulta
-> MIN: Valor minimos retornados pela consulta
*/

#---- ESTRUTURAS ----

#-> COUNT
SELECT COUNT(*) FROM funcionarios;

#-> SUM
SELECT SUM(salario) FROM funcionarios;

#-> AVG
SELECT AVG(salario) FROM funcionarios;

#-> MAX
SELECT MAX(salario) FROM funcionarios;

#-> MIN
SELECT MAX(salario) FROM funcionarios;

/* OBS:
-> Da para se aplicar essas funções mesmo o enunciado pedindo um filtro de seleção, ou seja

Se o enunciado pedir a soma dos salarios acima de 1500 ficaria:
SELECT SUM(salario) FROM funcionarios WHERE salario > 1500;

Ou se pedisse a soma dos salarios do Departamento de Recursos Humanos, ficaria:
SELECT SUM(salario) FROM funcionarios WHERE departamento = 'Recursos Humanos'; 

Ou ate mesmo se pedisse a Media dos salarios do Departamento de TI, ficaria: 
SELECT AVG(salario) FROM funcionarios WHERE departamento = 'TI';

Ou se pedisse a quantidade de pessoas que estão desempregadas, ficaria:
SELECT COUNT(pessoas) FROM cidadoes WHERE emprego is NULL;

E assim por diante.
*/


#---- FUNÇÕES DE PAGINAÇÃO ----
/* COMANDOS:
-> DISTINCT: Traz do banco lista de valores eliminando repetições, para 
nao trazer valores duplicados
-> ORDER BY: Ordena os resultados baseado nas colunas informadas
-> LIMIT: Limita quantos registros eu quero que me o SQL venha me retornar
-> OFFSET: Indica quantos registros devem ser avançados na busca
>>> COMBINAÇÕES DESSES COMANDOS SÃO PERMITIDAS <<<
*/

#---- ESTRUTURAS ----

#-> DISTINCT
SELECT DISTINCT(departamento) FROM funcionarios;
/* Irá retornar a lista de departamentos que cada funcionario exerce na empresa, 
eliminando as duplicações
*/

#-> ORDER BY
/* Essa Ordenação pode ser crescente ou decrescente, ASC = Crescente DESC = Decrescente
Se nenhuma ordem for especificada a estrtura assume a Ordem Crescente automaticamente
*/
SELECT * FROM funcionarios ORDER BY salario DESC;
SELECT * FROM funcionarios ORDER BY salario; 

#-> LIMIT
SELECT * FROM funcionarios LIMIT 2;
/* Irá retornar o registro dos 2 Primeiros funcionarios da tabela, pois especifiquei 2
Ao lado de LIMIT */ 

#-> OFFSET
SELECT * FROM funcionarios LIMIT (N) OFFSET (Q);
/* Irá retornar N's numeros de registros dos funcionarios da tabela, exceto os Q's primeiros */


#---- FUNÇÕES DE AGRUPAMENTO ----
/* COMANDOS: 
-> GROUP BY: Agrupamento de registros por categoria
-> HAVING: Filtro de seleção para agrupamentos
*/

#---- ESTRUTURAS ----

#-> GROUP BY
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento;
/* Ela irá trazer o nome do departamento e a média do salarial desse departamento uma vez que foi
feito um agrupamento de resultados no final da expressao SQL do tipo "GROUP BY departamento".

Porém daria também para se obter a soma dos funcionarios de cada departamento 
Ou também o salario máximo e minimo de cada departamento,

E assim por diante
*/

#-> HAVING
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1500;
/* Esse comando irá exibir na tela o Departamento que contem a média salarial acima de 1500 

O mesmo poderia ser feito se eu quisesse exibir na tela o Departamento que contem a media de
Funcionarios maior que 10 pessoas, ficaria: 
SELECT departamento, COUNT(nome) FROM funcionarios GROUP BY departamento HAVING COUNT(nome) > 10;

E assim por diante*/
/* OBS:
A diferenca do HAVING pro WHERE é que o HAVING é utilizado para filtrar registros 
categorizados (agrupados)

O WHERE faz o filtro dos registros direto
*/



#---- SUBQUERIES ----
/* Ele é utilizado para fazer a realização de consultas com filtro de seleção baseado em uma lista
ou outra selecao

Pode-se ultilizar os parametros: IN ou NOT IN 

Ex:
*/
SELECT nome FROM funcionarios WHERE departamento IN ('MARKETING', 'TI');
/* Essa expressao SQL irá voltar os nomes das pessoas que trabalham nos departamento de MARKETING ou TI */
/* OBS: 
É possivel fazer um SELECT dentro de outro SELECT utilizando essa estrutura, exemplo: 

Retorne os nomes dos funcionarios que trabalham em um departamento que contenha a media salarial
maior que 1500: */
SELECT nome AS 'Funcionarios' FROM funcionarios WHERE departamento IN 
(SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1500);
