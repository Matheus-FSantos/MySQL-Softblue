USE curso_sql;

SHOW ENGINES; #Para verificar qual mecanismo que suporta transações

#Tabela para fazer transações
CREATE TABLE contas_bancarias (
	id int unsigned not null auto_increment,
    titular varchar(45) not null,
    saldo double not null,
    PRIMARY KEY (id)
) engine = InnoDB;
/* OBS:
Deve-se utilizar o ENGINE = InnoDB sempre que deseja 
criar uma tabela que terá suporte a transação, pois 
esse mecanismo, ATUALMENTE, suporta transações
*/


INSERT INTO contas_bancarias (titular, saldo) VALUES ('André', 1000), 
('Carlos', 2000);
SELECT * FROM contas_bancarias;


START TRANSACTION;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
ROLLBACK; #Anula toda transação


START TRANSACTION;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
COMMIT; #Confirma a transação e atualiza os valores na tabela
/* OBS:
Após um commit os dados da transação já estará disponível para fazer outras
transações novas. 
*/
