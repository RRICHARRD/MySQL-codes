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
