#---- RELACIONAMENTO DE TABELAS ----


#---- Parametro JOIN ----
SELECT * FROM T1 JOIN T2 ON T1.FK = T2.PK; /* FK = CHAVE ESTRANGEIRA // PK = CHAVE PRIMARIA 
(qual campo da T1 é igual ou se relaciona com o campo da T2 */


#---- Inner Join ----
/* combina todas as linhas da primeira tabela com as linhas da segunda tabela
(des de que as combinacoes satisfacam as condicoes descritas na sintaxe)
EX: */
SELECT * FROM pessoas JOIN veiculos ON pessoas.cpf = veiculos.cpf;
/* (volta todas as informacoes da tabela veiculo e pessoas onde cpf da tabela pessoas for igual ao cpf da 
tabela veiculos)
(EXIBE O CAMPO 2 VEZES) */


#---- Equi Join ----
/* Similar o Inner Join porém as chaves devem conter o mesmo nome
(forma simplificada de fazer o inner join quando tem as chaves de mesmo nome)
EX: */
SELECT * FROM pessoas JOIN veiculos USING (cpf);
/* (voltar todas as infos das tabelas pessoas e veiculos usando como parametro cpf)
(NAO EXIBE O CAMPO 2 VEZES) */


#---- Non Equi Join ----
/* Relacionamento sem nenhum campo em comum
EX: */
SELECT p.nome, p.salario, s.faixa FROM pessoas p INNER JOIN salarios s ON p.salario BETWEEN s.inicio AND s.fim;
/* retorne o nome o salario e a faixa (faixa = setor que trabalha, ex: programador) da tabela pessaoas e salarios 
apelidados de P e S onde o salario (p.salario) esteja entre (between) os valores dos campos inicio (s.inicio) e
fim (s.fim) */


#---- Left Join (Outer Join, Left Outer Join) ----
/* Indica que as Linhas da tabela a esquerda (quando apresentadas no parametro join) aparecerão no resultado mesmo as
linhas que nao satisfacam as condicoes dos relacionamentos
EX: */
SELECT * FROM pessoas p LEFT JOIN veiculos v ON p.cpf = v.cpf;
/* Irá trazer uma combinacao das pessoas cadastradas e dos seus veiculos (que estao cadastrados por meio de seus CPFs)
assim como funciona com o INNER JOIN, porem com a diferença que será exibido no resultado final as pessoas que nao contem
nenhum veiculo cadastrado em seu CPF */


#---- Right Join (ou Right Outer Join) ----
/* Similar ao Left Join, porem indicará as linhas (ou registros) da tabela a direita que irá aparecer no resultado
(mesmo que nao atenda as condicoes especificadas do relacionamento)
EX: */
SELECT * FROM pessoas p RIGHT JOIN veiculos v ON p.cpf = v.cpf;
/* Teremos todos os resultados da tabela veiculos (porque se encontra ao lado direito do comando JOIN) mesmo que nao 
possua um dono cadastrado */


#---- Full Join (ou Full Outer Join) ----
/* Combinacao do Left Join com o Right Join e tras a combinacao da primeira e da segunda tabela mesmo se os campos
satisfazerem ou não as condições previamente estabelecidas na sintaxe
EX: */
SELECT * FROM pessoas FULL JOIN veiculos ON pessoas.cpf = veiculos.cpf;
/* O resultado sera todos os registros das tabelas tendo ou nao um relacionamento dessas tabelas 
(SEM REPETIR OS REGISTROS QUE ATENDEM AS ESPECIFICACOES DO RELACIONAMENTO EM QUESTAO) */


#---- Self Join ----
/* Relacionamento de uma tabela com ela mesma */
SELECT a.nome, b.nome AS indicação FROM pessoas a JOIN pessoas b ON a.indicado = b.cpf
/* Irá voltas o nome da pessoa que comprou algo e da pessoa que indicou relacionando a tebela com ela mesmo */


#---- VISAO ----
/* Essa relação não faz parte de um modelo lógico, ela deixa o acesso virtual para o usuario, ela é boa pois economiza
espaço em disco para apresentar as mesmas informações, outro beneficio é que a expressão SQL fica armazenada no banco de 
dados caso a aplicação tenha 10 ou 20 momentos que faça o uso dessa expressão basta alterar 1 vez na formula da visão no 
banco de dados a expressao dela 

-> Para criar uma visao deve se utilizar o comando: 
CREATE VIEW Nome AS ExpressaoSQL;

-> Para alterar: 
ALTER VIEW Nome Propriedade; (Pode-se utilizar a exclusão e uma nova criação de visões também)

-> Para excluir: 
DROP VIEW Nome; (SOMENTE A ESTRUTURA DA VISAO É DELETADA, os dados permanecem intactos em suas respectivas tabelas)
*/