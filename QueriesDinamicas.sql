 create database EntradaeSaida

use EntradaeSaida

create table Produto(
           
		    codigo int not null, 

			nome varchar(70) not null,
			 
			valor smallmoney not null

			primary  key (codigo)


)


create  table Entrada(

Codigo_Transacao int  not null,
Codigo_Produto   int  not null,
Quantidade       int not null,
Valor_Total      smallmoney not null
 

primary key  (Codigo_Transacao,codigo_Produto)

foreign key  (Codigo_Produto) references Produto(codigo )


)

create   table Saida(

Codigo_Transacao int  not null,
Codigo_Produto   int  not null,
Quantidade       int not null,
Valor_Total      smallmoney not null

primary key  (Codigo_Transacao,Codigo_Produto)

foreign key  (Codigo_Produto) references Produto(codigo )


)
 insert into Produto values(151,'sapato',15.70)

 select*from Produto

 create  procedure registro(@tipo char(1),@codigo_transacao int, @codigo_produto int,@quantidade int,@valor smallmoney)
  as

          

     if exists(select codigo from Produto where codigo=@codigo_produto)
	 begin
				if(@tipo = 'e')
						begin
						 insert into Entrada(Codigo_Transacao,Codigo_Produto,quantidade,Valor_Total) values (@codigo_transacao,@codigo_produto,@quantidade,@valor)
						 end
				else if(@tipo = 's')   
					   begin 
						insert into Saida(Codigo_Transacao,Codigo_Produto,quantidade,Valor_Total) values (@codigo_transacao,@codigo_produto,@quantidade,@valor)
						end

        end
		else
	           raiserror('codigo invalido',16,1)
			



			 


			select*from Saida
		 exec registro 'e',121,121,334,22.39


  

    
	 
	   
