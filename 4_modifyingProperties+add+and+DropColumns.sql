use cursos;
describe cursos;
create table cursosVerao like cursos;

desc cursosVerao;
/*renomeando a tabela*/
alter table cursosVerao rename to cursosFerias;
desc cursosFerias;

/*adicionar coluna, after alguma coluna ou em first*/
alter table cursosFerias add column estacao varchar(20);
alter table cursosFerias add column test varchar(20) after descricao;
alter table cursosFerias add column whatever varchar(20) first;

/*modificar respectivamente atributo(14) e nome do campo(15)*/
alter table cursosFerias modify test2 int(5) unsigned zerofill not null;  /*0000 e o número*/
alter table cursosFerias change test2  novoNome int(5) unsigned zerofill not null;  

/*apagar colunas*/
alter table cursoFerias drop column testando;

/*apagar tabela*/
drop table cursoFerias;

/*apagar database*/
drop database cursos;