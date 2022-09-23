#---- TRANSAÇÕES ----
/* Transações são um conjunto de operações a
serem realizadas no banco de dados

Elas podem conter algumas caracteristicas que 
garantam a qualidade da tansação, elas são 4
que são:
*/


#---- ACID ----
/* 
-> Atomicidade: Garante que toda transação seja
realizada ou por completo ou não sera realizada,
Nenhuma transação é realizada mais ou menos, 
ou pela metade sempre por completo;

-> Consistência: Garante que as regras impostas no 
modelo do banco não podem ser quebrada;

-> Isolamento: Garante que os dados que a transação
estiver manipulando devem ser travados para que outras
transações nao possam acessar-los durante a execução 
dessa primeira transação;

-> Durabilidade: Após concluir com sucesso as alterações
realizadas na transação, devem ser todas confirmadas e ficarem
disponíveis de forma permanente para a execução das próximas
transações.

*/

/* COMANDOS

-> START TRANSACTION: Inicia a transação;
-> COMMIT: Concretiza a tranzação;
-> ROLLBACK: Anula a transação 

*/
