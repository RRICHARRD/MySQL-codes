insert into clientes values 
					(null,'Fernando Lima','m', 'sp', '1995-12-01'),
					(null,'Mayara da Silva','f', 'am', '1553@07@19'),
					(null,'Joyce Homeworhf','f', 'sc', '19980310'),
					(null,'Solano Miquel','m', 'rj', '1985-11-30'),
					(null,'Larissa Manoela','f', 'sc', '19870403'),
					(null,'Jão Carlos','m', 'sp', '1984-10-26'),
					(null,'Mister Potato head','m', 'am', '1996-03-30'),
					(null,'Barbie girl','m', 'rj', '1996-02-06'),
					(null,'India dos Inkas','m', 'rj', '1783@07@19'),
					(null,'Ana Miriã','m', 'sp', '1965@12@12');
                    
				
-- SELECT HOW TO USE THEM

-- Lembrando que tudo isso em select também pode ser utilizado com update e delete

select * from clientes;

select  nomeCliente, dataNascimento from clientes; -- esse dados da tabela inteira
select  nomeCliente, nomeCliente,dataNascimento from clientes; -- é comum usar uma coluna duas vezes, mas a segunda com um preço acrescido em 20% por exemplo
select  *, dataNascimento from clientes; -- mas o * tem que ser o primeiro

-- definindo um apelido para as colunas, as pode ser omitido, mas boas práticas exigem 
select nomeCliente as 'Nome do Cliente', 
	   dataNascimento  as 'nascimento' -- nome simples pode tirar as áspas, mas boas práticas exigem utilizar
       from clientes;
       
-- Mais uma crição de coluna "falsa"
select nomeCliente as 'Nome do cliente',
		dataNascimento as 'Nascimento', 
		idCliente * 100 as 'Salario',
        'Brasileiro' as 'Nascionalidade' -- outra forma de criar uma coluna falsa
		from clientes;
        
        
-- DESCENDENTE -> O PRÓXIMO VÊM ANTES(DO MAIOR PARA O MENOR), ASCENDENTE -> O PRÓXIMO VÊM DEPOIS(DO MENOR PARA O MAIOR)
-- ordenação, maior ladrão de performance do sistema
select * from clientes order by ufNascimento; -- ordenado via ufNascimento em ordem alfabética
select * from clientes order by ufNascimento, dataNascimento; -- ordenado via ufNascimento em ordem alfabética e em dataNascimento
select * from clientes order by ufNascimento asc, dataNascimento desc; -- ordenado de forma ascendente af, e descendente o nascimento
select * from clientes order by ufNascimento desc, dataNascimento desc;

select * from clientes order by 4 asc, 5 desc; -- melhor nunca utlizar isso

select nomeCliente as 'Nome do cliente',
		dataNascimento as 'Nascimento', 
		idCliente * 100 as 'Salario',
        'Brasileiro' as 'Nascionalidade' 
		from clientes
        order by Nascimento; -- preferível utilizar o nome do campo, em union é melhor usar apelido, próximo arquivos.
        
-- trazendo as três primeiras linhas        
select * from clientes limit 3;   
select * from clientes limit 0, 3;  -- aponta para o zero é trás os três seguintes, se fosse 4 no lugar do 0 traria 5, 6 e 7        
select * from clientes limit 4, 6; -- vai trazer as próximas 6 linhas, 5, 6, 7, 8, 9, 10, não significa ser a mesma chave primária


-- filtrando resultados
select * from clientes where idCliente = 3; -- traz examente o cliente com id igual a 3
select * from clientes where ufNascimento = 'rj';

select * from clientes where idCliente <> 3; -- traz todos menos o registro 3
select * from clientes where ufNascimento != 'rj'; -- tras todos menos o que tem rj

select * from clientes where idCliente > 10; 
select * from clientes where idCliente >= 10; 

select * from clientes where idCliente < 10; 
select * from clientes where idCliente <= 10; 

select * from clientes where idCliente < 10 and ufNascimento <> 'sp'; 
select * from clientes where idCliente < 10 or ufNascimento <> 'sp'; 
select * from clientes where idCliente < 10 or ufNascimento = 'sp'; 
