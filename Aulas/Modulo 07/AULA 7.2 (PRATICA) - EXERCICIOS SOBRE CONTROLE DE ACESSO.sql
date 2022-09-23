CREATE USER 'andre'@'localhost' IDENTIFIED BY 'milani123456';

/* OBS:
A estrutura padrão é: 

-> CREATE USER 'nome do usuario'@'local do IP' IDENTIFIED BY 'senha';

EX: CREATE USER 'andre'@'200.200.190.190' IDENTIFIED BY 'milani123456';

No ex acima o usuario André só irá se logar no banco se estiver no 
IP = 200.200.190.190, se não estiver nunca se logará mesmo tendo a senha

OBS: 
Se eu quiser criar um usuário que só terá acesso a partir de uma maquina
especifica, deve-se alterar o 'local' para 'localhost', ex:

-> CREATE USER 'André'@'localhost' IDENTIFIED BY 'milani123456';

A partir dai o usuário ANDRÉ so terá acesso ao DB se estiver utilizando a
maquina que foi criada o codigo


Se deseja fazer o contrario, onde deseja criar um usuário que poderá
acessar o DB de qualquer lugar onde estiver, independente do IP é só
substituir o 'local' por %, ex:

-> CREATE USER 'André'@'%' IDENTIFIED BY 'milani123456';

*/

GRANT ALL ON curso_sql.* TO 'andre'@'localhost';
/* OBS:
Deve-se utilizar os padrões informados no CREATE USER para GRANT ALL

*/