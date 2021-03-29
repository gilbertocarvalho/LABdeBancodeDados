create database funcionariodependente
go
use funcionariodependente 

create table Funcionario(

                codigo int
				,nome varchar(60)
				,Salario smallmoney

			primary key(codigo)

)

create table Dependente(

                codigo_funcionario int
				,nome_dependente varchar(50)
				,salario_dependente smallmoney

				primary key(codigo_funcionario,nome_dependente)

				foreign key (codigo_Funcionario) references Funcionario(codigo) 

)
insert into funcionario(codigo,nome,salario) values(111,'dddd',2500.00)

insert into  Dependente values(111,'ddggfg',1500.00)

create  function     tabelafuncionariodependente()
returns table
as
return
(

select nome as nome_funcionario,nome_dependente,salario as salario_funcionario,salario_dependente from funcionario
inner join   dependente on dependente.codigo_funcionario = Funcionario.codigo
)

create  function somarsalario(@codigo int)

returns int
as
begin

 declare @salario smallmoney
 
 set @salario  = (select salario from funcionario where codigo=@codigo)
 
 

  set @salario = @salario +  (select sum(salario_dependente) from dependente where codigo_funcionario =@codigo)
  return @salario


end


select*from tabelafuncionariodependente()

select dbo.somarsalario(111) as somasalario


----------------------------------------------

create database vendacomcpf

go

use  vendacomcpf

create   table cliente (
 cpf  char(11)
 ,nome varchar(50)
 ,telefone char(9)
 ,email varchar(80)
  
  primary key(cpf)
)

insert into cliente values ('11111111111','alexandre','123456789','alexandre@ddddd.com')

insert into cliente values ('22222222222','gulherme','123456789','guilherme@ddddd.com')


create  table Produto(

codigo int
, nome varchar(50)
,descricao varchar(80)
,valor_unitario smallmoney

primary key (codigo)

)

insert into Produto(codigo,nome,descricao,valor_unitario) values (1,'banana','fruta',2.00)
insert into Produto(codigo,nome,descricao,valor_unitario) values (2,'caju','fruta',2.00)
create  table venda(

Cpf_cliente char(11)
,codigo_produto int
,quantidade  int

,data date

primary key (cpf_cliente,codigo_produto,data)

foreign key (cpf_cliente) references cliente(cpf)

,foreign key (codigo_produto) references produto(codigo)

)
insert into venda values('22222222222',2,4,'21/09/2020')
create function tabelavendacomnomes()
returns table
as
return(

   select cliente.nome as nome_cliente,produto.nome as nome_produto, quantidade , quantidade*valor_unitario as 'valor_total'from Venda
   inner join cliente on cliente.cpf = venda.cpf_cliente
   inner join produto on produto.codigo = venda.codigo_produto
  


)

select*from tabelavendacomnomes()

create   function ultimacompra(@cpf char(11))
returns smallmoney
as
begin


declare @valor smallmoney


 set @valor = (select sum(quantidade*Produto.valor_unitario) as 'valor ultima compra' from venda
inner join produto on produto.codigo = venda.codigo_produto 
 where data=(select max(data) from venda) and cpf_cliente=@cpf  group by cpf_cliente)

 return @valor
end

select dbo.ultimacompra('11111111111') as 'valor ultima compra'











