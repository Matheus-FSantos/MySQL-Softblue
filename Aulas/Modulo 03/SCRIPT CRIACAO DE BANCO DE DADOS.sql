CREATE DATABASE curso_sql;
USE curso_sql;

CREATE TABLE funcionarios (
	#nome do campo, tipo do campo, e opcionais
    id int unsigned not null auto_increment,
    nome varchar(45) not null,
	salario double not null default '0',
    departamento varchar (45) not null,
    PRIMARY KEY (id) #avisando que a chave primaria é ID
);

CREATE TABLE veiculos (
	id int unsigned not null auto_increment, #id dos carros
    funcionario_id int unsigned default null, #chave estrangeira (deve ser do mesmo tipo)
    veiculo varchar (45) not null default '',
    placa varchar (10) not null default '',
    PRIMARY KEY (id),
    #constraint nome foreign key (nomeDaChave) references nomeDaTabela (nome da chave primaria da tabela)
    CONSTRAINT fk_veiculos_funcionarios FOREIGN KEY (funcionario_id) REFERENCES funcionarios (id)
);

CREATE TABLE salarios (
	faixa varchar (45) not null,
    inicio double not null,
    fim double not null,
    PRIMARY KEY (faixa)
);


#---- ALTERANDO TABELAS ----

#Alter table nomeDaTabela change column nome novoNomeDaColuna eoNovoTipoDeDado;
ALTER TABLE funcionarios CHANGE COLUMN nome nome_func varchar (50) not null;
ALTER TABLE funcionarios CHANGE COLUMN nome_func nome varchar (50) not null;


#CRIACAO DE INDICES
#create index nomeDaColuna on nomeDaTabela (nomeDaColuna); 
CREATE INDEX departametos ON funcionarios (departamento);
CREATE INDEX nome ON funcionarios (nome(6)); #ordena mediante aos 6 primeiros caracteres de nome