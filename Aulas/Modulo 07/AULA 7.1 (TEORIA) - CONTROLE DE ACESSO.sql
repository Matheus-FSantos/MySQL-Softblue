#---- CONTROLE DE ACESSO ----
/* Controle de acesso é uma forma de garantir que
somente pessoas autorizadas possam realizar ações
com os dados

NIVEIS DE ACESSO:
-> Banco de dados
-> Tabelas
-> Colunas
-> Registros

NIVEIS DE AÇÕES:
-> Gerenciar estruturas (Quem pode criar estruturas)
-> Gerenciar dados
-> Ler dados (Quem pode ler dados)
*/

/* ESTRUTURAS 

-> CREATE USER (Nome) - Cria um usuário
-> DROP USER (Nome) - Deleta um usuário
-> GRANT - Habilita acessos
-> REVOKE - Revoga acessos

Para Habilitar um acesso a um usuário deve-se utilizar a estrutura: 
GRANT (Ação) ON (Estrutura) TO (Usuário);
OBS: O Usuario que irá receber acesso ao DB deverá ter sido criado anteriormente

Para Revogar um acesso a um usuário deve-se utilizar a estrutura:
REVOKE (Ação) ON (Estrutura) FROM (Usuário);

Principais ações: 
-> ALL (Representa todas elas)
-> SELECT
-> INSERT
-> UPDATE
-> DELETE

Principais estruturas:
-> TABLE
-> VIEW
-> SEQUENCE
*/