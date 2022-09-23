#---- ALTERANDO TABELAS ----

#Alter table nomeDaTabela change column nome novoNomeDaColuna eoNovoTipoDeDado;
ALTER TABLE funcionarios CHANGE COLUMN nome nome_func varchar (50) not null;
ALTER TABLE funcionarios CHANGE COLUMN nome_func nome varchar (50) not null;


#CRIACAO DE INDICES
#create index nomeDaColuna on nomeDaTabela (nomeDaColuna); 
CREATE INDEX departametos ON funcionarios (departamento);
CREATE INDEX nome ON funcionarios (nome(6)); #ordena mediante aos 6 primeiros caracteres de nome



#---- MANIPULACAO DE TABELAS ----
#INSERT SINTAX: INSERT INTO tabela VALUE (valores);
#EX:
#inserindo na tabela pessoas o nome fabio e o cpf
INSERT INTO pessoas VALUES ('FABIO' '111.111.111-11');
INSERT INTO pessoas (nome, cpf) VALUE ('FABIO' '111.111.111-11');

#SELECT SINTAX: SELECT campos FROM tabela 
#EX:
#retorna TUDO da tabela pessoas
SELECT * FROM pessoas;
#retorna o CAMPO nome da tabela pessoas
SELECT nome FROM pessoas;

#UPDATE SINTAX: UPDATE tabela SET campo = valor
#EX:
UPDATE pessoas SET nome = 'FABIO NOGUEIRA';

#DELETE SINTAX: DELETE FROM tabela;
#EX:
DELETE FROM pessoas; 



#---- UTILIZAÇÃO DO WHERE NA MANIPULACAO DE TABELAS ----
#SELECT SINTAX  = SELECT campos FROM tabela WHERE condicao;
#EX: 
#volta todos os campos da tabela pessoa quem tem o cpf igual à '111.111.111-11'
SELECT * FROM pessoas WHERE cpf = '111.111.111-11';
#volta os nomes que estao no campo nome da tabela pessoas quem tem a idade maior que 20
SELECT nome FROM pessoas WHERE idade > 20;

#UPDATE SINTAX  = UPDATE tabela SET campos = valor WHERE condicao
#EX: 
UPDATE pessoas SET nome = 'FABIO' WHERE cpf = '111.111.111-11';
UPDATE pessoas SET idade = 25 WHERE nome = 'FÁBIO';

#DELETE SINTAX = DELETE FROM tabela WHERE condicao
#EX: 
#deleta da tabela pessoas quem tem o cpf igual a '111.111.111-11'
DELETE FROM pessoas WHERE cpf = '111.111.111-11';
#deleta da tabela pessoas quem tem o nome igual a fabio
DELETE FROM pessoas WHERE nome = 'FABIO';



#---- GERANDO APELIDOS PARA A TABELA ----
#SELECT SINTAX = SELECT campos FROM tabela apelido
#EX:
#seleciona na tabela pessoas (que é o apelido da tabela_um) os nomes dessa tabela
SELECT pessoas.nome FROM tabela_um pessoa;

#---- GERANDO APELIDO PARA UM CAMPO DE UMA TABELA ----
#SINTAX: SELECT campo AS apelido FROM...
#EX:
#dando o apelido nomeTBPessoas para o campo nome que esta na tabela pessoas
SELECT nome AS nomeTBPessoas FROM pessoas;

#---- UNINDO SELECOES (UNION / UNION ALL) ----
#SINTAX: SELECT... UNION SELECT...;
#EX:
#unindo tudo da tabela pessoas com tudo da tabela funcionarios
SELECT * FROM pessoas UNION SELECT * FROM funcionarios;
#---> UNION = nao retorna registros duplicados;
#---> UNION ALL = retorna registos duplicados;