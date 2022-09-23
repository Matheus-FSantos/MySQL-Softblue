USE curso_sql;

SELECT * FROM funcionarios; 
SELECT * FROM veiculos;

SELECT * FROM funcionarios f INNER JOIN veiculos v ON v.funcionario_id = f.id;
/* (irá retornar a relacao da tabela funcionarios e veiculos onde funcionario_id
for igual ao id na tabela funcionario) */


SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.funcionario_id = f.id;
/* (Irá trazer todos os registros da tabela a esquerda e fará o relacionamento com a direita mesmo que
nao tenha dados relacionados) */

SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;
/* (Irá trazer todos os registros da tabela a direita e fará o relacionamento com a esquerda mesmo que
nao tenha dados relacionados) */

#---- CRIANDO UM FULL JOIN ----
SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.funcionario_id = f.id
UNION
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;

#---- Equi Join ----
CREATE TABLE cpfs (
	id int unsigned not null,
    cpf varchar (14) not null,
    PRIMARY KEY (id),
	CONSTRAINT fk_cpf FOREIGN KEY (id) REFERENCES funcionarios (id)
);

INSERT INTO cpfs (id, cpf) VALUES (1, '111.111.111-11');
INSERT INTO cpfs (id, cpf) VALUES (2, '222.222.222-22');
INSERT INTO cpfs (id, cpf) VALUES (3, '333.333.333-33');
INSERT INTO cpfs (id, cpf) VALUES (5, '555.555.555-55');

SELECT * FROM cpfs;

SELECT * FROM funcionarios f INNER JOIN cpfs c ON f.id = c.id;
SELECT * FROM funcionarios JOIN cpfs USING (id);
#Pode-se utilizar INNER JOIN para fazer esse relacionamento na estrutura EQUI JOIN, EX:
SELECT * FROM funcionarios INNER JOIN cpfs USING (id);
#Irá relacionar as tabelas funcionarios e cpfs de acordo com o id utilizando o metodo Equi Join

#---- Self Join ----
CREATE TABLE clientes (
	id int unsigned not null auto_increment,
    nome varchar (45) not null,
    quem_indicou int unsigned,
    PRIMARY KEY (id),
    CONSTRAINT fk_quem_indicou FOREIGN KEY (quem_indicou) REFERENCES clientes (id)
);

INSERT INTO clientes (id, nome, quem_indicou) VALUES (1,'ANDRÉ',NULL);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (2, 'SAMUEL', 1);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (3, 'CARLOS', 2);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (4, 'ANTONIO', 1);
SELECT * FROM clientes; 
SELECT a.nome AS CLIENTE, b.nome AS INDICAÇÃO FROM clientes a JOIN clientes b ON a.quem_indicou = b.id;
#Irá realizar um Self Join

#---- RELACIONAMENTO DE 3 OU MAIS TABELAS ----
SELECT * FROM funcionarios 
INNER JOIN veiculos ON veiculos.funcionario_id = funcionarios.id 
INNER JOIN cpfs ON cpfs.id = funcionarios.id;

#---- VISOES ----

CREATE VIEW Funcionarios_A AS SELECT * FROM funcionarios WHERE salario >= 1700;
SELECT * FROM Funcionarios_A;
UPDATE funcionarios SET salario = 1500 WHERE id = 3;

DROP VIEW Funcionarios_A;
CREATE VIEW funcionarios_a  AS SELECT * FROM funcionarios WHERE salario > 1200;
SELECT * FROM funcionarios_a;