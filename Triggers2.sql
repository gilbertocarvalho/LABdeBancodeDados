create database bdPromocaodaEmpresadeprodutosAlimenticios

use bdPromocaodaEmpresadeprodutosAlimenticios

create  table tbCliente(

   Codigo int ,
   Nome varchar(50)

   primary key(Codigo)

)
create table Venda(

   Codigo_Venda int 
   , Codigo_Cliente int 
   ,Valor_Total smallmoney

   primary key(Codigo_Venda)

   foreign key(Codigo_Cliente) references Cliente(Codigo)
)

create table Pontos(
      
	  Codigo_Cliente int
	  , Total_Pontos float
	  
	  primary key (Codigo_Cliente)
	      
      foreign key(Codigo_Cliente) references Cliente
	     
)

insert into Cliente(Codigo,Nome) values (1,'patricio')

insert into Venda(Codigo_Venda,Codigo_Cliente,Valor_Total) values (1,1,12.90)

 insert into Venda(Codigo_Venda,Codigo_Cliente,Valor_Total) values (2,1,13.90)

 insert into Venda(Codigo_Venda,Codigo_Cliente,Valor_Total) values (5,1,13.90)

 insert into Venda(Codigo_Venda,Codigo_Cliente,Valor_Total) values (4,1,13.90)

 insert into Venda(Codigo_Venda,Codigo_Cliente,Valor_Total) values (9,1,13.90)
 select*from Venda
 ------------------------------------
create  trigger alterarVenda

 on Venda

 instead of update
 as
 select top(1) * from Venda 
-------------------------------------
 create trigger registroPontos
 on Venda
 after insert
 as
 if(exists(select*from Pontos where Codigo_Cliente=(select Codigo_Cliente from inserted)))
  begin 
   update Pontos set Total_Pontos = Total_Pontos+((select Valor_Total from inserted)*0.10)
   end
   else
   begin
   insert into Pontos(Codigo_Cliente,Total_Pontos) values ((select Codigo_Cliente from inserted), (select Valor_Total from inserted)*0.10)
   end
----------------------------------------------
   create trigger ganharpremio
   on Pontos
   after insert ,update
   as 
   if((select Total_Pontos from Pontos) >1)
    select 'você ganhou um premio'
	-----------------------------
   select * from Pontos

   select Valor_Total from inserted


   





  

