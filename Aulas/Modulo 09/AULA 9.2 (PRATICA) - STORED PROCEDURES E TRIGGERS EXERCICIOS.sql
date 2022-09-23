USE curso_sql;

CREATE TABLE pedidos (
	id int unsigned not null auto_increment,
    descricao varchar(100) not null,
    valor double not null default '0',
    pago varchar(3) not null default 'Não', 
    PRIMARY KEY (id)
);

SELECT * FROM pedidos;

INSERT INTO pedidos (descricao, valor) 
VALUES ('TV', 3000), ('Geladeira', 1400), ('DVD Player', 300);



#Criando um Store Procedure:
/* OBS:
Deve-se utilizar o código: SET SQL_SAFE_UPDATES = 0; 
para conseguir modificar itens da tabela inteira, por isso
deve-se utilizar esse código quando for criar uma Store P.
*/
CALL limpa_pedidos();


#Utilizando Triggers:
CREATE TABLE estoque(
	id int unsigned not null auto_increment,
    descricao varchar(50) not null,
    quantidade int not null,
    PRIMARY KEY (id)
);

#Criando Triggers:
CREATE TRIGGER gatilho_limpa_pedidos #(CREATE TRIGGER (Nome do trigger))
BEFORE INSERT #(Tipo do trigger)
ON estoque #(ON (Tabela))
FOR EACH ROW #(> Para cada linha <)
CALL limpa_pedidos; #(CALL S.P.)

/* CODIGO ACIMA LADO A LADO E EXPLICAÇÃO: 

-> CREATE TRIGGER gatilho_limpa_pedidos BEFORE INSERT ON estoque FOR EACH ROW CALL limpa_pedidos;

Ou seja: Depois de cada inserção na tabela pedido ele chamará a STORE PROCEDURE limpa_pedidos 
(que limpa todos pedidos da tabela pedidos em que está como 'Não' na coluna pago).
*/


INSERT INTO pedidos (descricao, valor) VALUES ('TV', 3000), ('Geladeira', 1400), ('DVD Player', 300);
SELECT * FROM pedidos;

INSERT INTO estoque (descricao, quantidade) VALUES ('Fogão', 5);
SELECT * FROM estoque;


UPDATE pedidos SET pago = 'Sim' WHERE id = 8;
INSERT INTO estoque (descricao, quantidade) VALUES ('Forno', 3);