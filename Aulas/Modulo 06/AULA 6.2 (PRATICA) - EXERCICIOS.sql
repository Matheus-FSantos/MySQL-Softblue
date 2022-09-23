USE curso_sql;
SELECT * FROM funcionarios;

#-> Exemplos Utilizando COUNT
SELECT COUNT(*) AS 'Registros' FROM funcionarios;
SELECT COUNT(*) AS 'Registros' FROM funcionarios WHERE salario > 1500;
SELECT COUNT(*) AS 'Registros' FROM funcionarios WHERE salario > 1500 AND departamento = 'TI';
SELECT COUNT(nome) AS 'Registros' FROM funcionarios WHERE salario != 1500;


#-> Exemplos utilizando SUM
SELECT SUM(salario) AS 'Total' FROM funcionarios;
SELECT SUM(salario) AS 'Total' FROM funcionarios WHERE departamento = 'TI';

#-> Exemplos utilizando AVG
SELECT AVG(salario) AS 'Média' FROM funcionarios;
SELECT AVG(salario) AS 'Total' FROM funcionarios WHERE departamento = 'TI';

#-> Exemplos utilizando MAX
SELECT MAX(salario) AS 'Salario Max.' FROM funcionarios;
SELECT MAX(salario) AS 'Salario Max.' FROM funcionarios WHERE departamento = 'NARCOTICOS';

#-> Exemplos utilizando MIN
SELECT MIN(salario) AS 'Salario Min.' FROM funcionarios;
SELECT MIN(salario) AS 'Salario Min.' FROM funcionarios WHERE departamento = 'TI';



#-> Exemplos utilizando DISTINCT
SELECT DISTINCT(departamento) FROM funcionarios;
/* VOLTA OS DEPARTAMENTOS DA EMPRESA SEM REDUNDANCIAS */


#-> Exemplos utilizando ORDER BY
SELECT * FROM funcionarios ORDER BY nome ASC;
SELECT * FROM funcionarios ORDER BY nome DESC;

SELECT * FROM funcionarios ORDER BY salario ASC;
SELECT * FROM funcionarios ORDER BY salario DESC;

SELECT * FROM funcionarios ORDER BY departamento ASC;
SELECT * FROM funcionarios ORDER BY departamento ASC, salario ASC, nome ASC;
/* ORDEM DE ORDENAÇÃO: ORDENA PRIMEIRO OS DEPARTAMENTOS, DEPOIS OS SALARIOS E POR ULTIMOS OS NOMES */
SELECT * FROM funcionarios ORDER BY departamento DESC, salario ASC, nome ASC;


#-> Exemplos utilizando Limitação (LIMIT) de página
SELECT nome AS 'Nomes' FROM funcionarios LIMIT 2;

#-> OFFSET
SELECT nome AS 'Nomes' FROM funcionarios LIMIT 1, 2; #>>> Funciona como se fosse o OFFSET <<<
/* Pulará o primeiro registro do campo NOME dos funcionarios e exibira os próximos 2
Pois esta limitado a 2 depois da virgula*/
SELECT nome AS 'Nomes' FROM funcionarios LIMIT 2 OFFSET 1;


#-> Função de Agrupamento (GROUP BY, HAVING)
SELECT departamento AS 'Departamento', AVG(salario) 'Média' FROM funcionarios GROUP BY departamento;
SELECT departamento AS 'Departamento'FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1700;


#-> SubQueries
SELECT nome AS 'Nomes' FROM funcionarios WHERE departamento NOT IN 
(SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1700);
/* Irá apresentar os nomes dos pessoas que NÃO trabalham nos departamentos que tem a média salarial superior a 1700 */

SELECT nome AS 'Nomes' FROM funcionarios WHERE departamento IN 
(SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000);
/* Irá apresentar os nomes das pessoas que trabalham nos departamentos que contem a média salarial superior a 2000 */

SELECT salario AS 'Salarios' FROM funcionarios WHERE departamento NOT IN ('NARCOTICOS');
/* Irá retornar os nomes dos funcionários que NÃO trabalham no departamento de NARCOTICOS */
