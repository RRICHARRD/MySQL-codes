CREATE DATABASE IF NOT EXISTS empresa;
CREATE TABLE IF NOT EXISTS clientes( 
									idCliente int not null primary key auto_increment, /*chame primária, é alto incremente pelo MySQL*/
									nomeCLiente varchar(100) not null, /*not null significa que é obrigatório*/ 
									sexoCliente enum('m', 'f'), 
									ufNascimento char(2), 
									dataNacimento date);
DESCRIBE clientes;

-- COMMENTS CAN BE WRITTEN BY TWO LINES AND ONE SPACE

alter table clientes drop dataNacimento; 
alter table clientes add column dataNascimento date after dataNacimento;

-- Inserindo informações dentro da tabela clientes, o que não é obrigatório eu não posso optar por não inserir nada 
INSERT INTO clientes (nomeCliente, sexoCliente, ufNascimento, dataNascimento)
				VALUES(
                'Alem Mar Paranhos', 'm', 'sp', '1995-05-30');

INSERT INTO clientes (nomeCliente, sexoCliente)				
				VALUES('Suzana Maria', 'f');

-- Posso especificar os valores na ordem que eu quiser
INSERT INTO clientes (sexoCliente, ufNascimento, nomeCliente)
					values(
						'm','rj','Antonio Carlos');


-- Inserindo tudo direto sem especificar onde estou adicinionando, nesse caso sou obrigado a passar valores para todos os campos, inclusive na ordem da tabela.
insert into clientes values (null,'Jussara Maria','f','sc', '2000-05-21');

insert into clientes values (null,'Jão Carlos','m', null, null);

-- adicionando vários registros de uma vez
insert into clientes(nomeCliente, sexoCliente)
				values
                ('Suzi Rego', 'f'),
                ('Ana Melo', 'f'),
                ('Jorge Freitas', 'm');

insert into clientes values 
					(null,'Luiz Fernandos','m', 'sp', 19951203), -- YYYY-MM-DD americano
					(null,'José Carlos','m', 'mt', '1990@12@09'),
					(null,'Jao Firmino','m', 'sc', '1555-12-26'),
					(null,'Miquel','m', 'sp', '2000-04-12');

-- O * traz todos os campos da tabela clientes
select * from clientes; 

-- Alterar informações da tabela 
-- Cuidado com os seguintes códigos, PRINCIPALMENTE o da linha 52 
update clientes set DataNascimento = '1999-12-20'; -- isso apaga a tabela do banco de dados INTEIRA, se fizer isso será demitido.
update clientes set ufNascimento = 'mg' where ufNascimento is null; -- Não funciona como o da linha 53, devido ao fato do safe update estar ligado, necessitando utilizar uma chave primária
/*Para desligar o safe mode, Edit -> Preferences -> Sql editor, lá no final, salvar sair da seção, depois entrar novamente*/
/*Toda muito cuidado com esses códigos, caso contrário você pode ser demitido*/

-- Utilize esse código 
update clientes set DataNascimento = '8888-7-06' where idCliente=1;
update clientes set DataNascimento = '8888-7-06', ufNascimento = 'am' where idCliente=1;

-- deletando registros da tabela, não dá para apagar campos específicos, nesse caso tem que atualizar, se for apagar tem que apagar o registro inteiro
/*Prestar muito mais atenção*/
delete from clientes where idCliente = 1;
delete from clientes where nomeCliente = 'Luiz'; -- esse só funciona com o safe update desligado
delete from clientes where dataNascimento is null; -- apaga tudo que é possui a data de nascimento null

-- Apagar a tabela inteira, demissão
delete from clientes; -- vai ser feito linha por linha, mas muito rápido
/*O DELETE FOI FEITO PARA NUNCA SER UTILIZADO, O IDEAL É MARCAR COMO APAGADO*/

-- Apaga a tabela e cria de novo vazio
truncate table clientes;