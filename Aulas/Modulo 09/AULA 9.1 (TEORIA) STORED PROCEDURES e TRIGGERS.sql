#---- Store Procedures e Triggers----
/* Ambos são blocos de código sql armazenados no banco */


#----Store Procedures ----
/* 
-> Store Procedures
Esse nome é dado ao recurso que possibilita
armazenar no servidor de Banco de dados
codigos SQL que podem ser executados em um 
determinado momento, traduzindo para o português
significa: Procedimentos Armazenados 

Vantagens:
-> Centralização: Centralizam o codigo e o procedimento
em questão;

-> Segurança: É possivel restringir a interação de
diversos desenvolvedores com o banco por meio do
Store Procedures, e toda a informação que seja necessária
pro DB ela deve ser feita, a solicitação do uso, por meio 
do S.P. evitando a execução de codigos mal desenvolvidos
ou mal intensionados;

-> Performance/Velocidade: Por se tratar de um bloco de codigo
acaba-se trazendo + performance e + velocidade, pois diminui
o tráfego de informações na rede e os códigos são executados
de uma vez só;

-> Suporte a transações: Pode-se garantir que toda a operação seja
executada ou caso algum erro ocorra, que nenhuma ação seja salva
no DB de maneira inconsistente fazendo com que nenhuma operação seja
executada pela metade (STORE PROCEDURES são complementos de transações).

*/

/* ESTRUTURA: 

Para se criar uma S.P. deve-se utilizar a estrutura: 
-> CREATE PROCEDURE (Nome);
 
Para chamar uma S.P.:
-> CALL (Nome);
ou
-> EXECUTE (Nome);

Para excluir uma S.P.:
-> DROP PROCEDURE (Nome);

*/



#---- TRIGGERS ----
/* 
-> Triggers:
São eventos que disparam codigos SQL armazenados no servidor sem a 
necessidade de uma chamada especifica para esses codigos
mas sim iniciados a partir de uma situação que seja disparado no 
servidor, eventos especificos (horarios programados e etc).

As vantagens das Triggers são as mesmas dos S.P., porem são 
auto iniciados a partir de determinadas situações que ocorre
no banco de dados

TIPOS DE TRIGGERS:

-> BEFORE INSERNT:
Executa codigo antes que um registro seja inserido na tabela;

-> BEFORE UPDRATE:
Executa um codigo antes que um registro seja atualizado na tabela;

-> BEFORE DELETE:
Executa um codigo antes que um determinado registro seja excluido na 
tabela;

-> AFTER INSERT: 
Executa um codigo depois de uma inserção de registro;

-> AFTER UPDATE:
Executa um codigo após uma atualização;

-> AFTER DELETE:
Executa um codigo após um determinado registro ser deletado;

-> TEMPORAIS: 
Executa um codigo após um evento temporal (De tempos em tempos).

*/

/* ESTRUTURA: 

Para se criar um Trigger deve-se utilizar a estrutura:
-> CREATE TRIGGER (Nome) (Tipo) ON (Tabela);

E para excluir: 
-> DROP TRIGGER (Nome);

*/
