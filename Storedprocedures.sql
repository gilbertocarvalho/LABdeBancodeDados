create database Cadastro

use Cadastro

create table Pessoa(

           cpf char(11)  not null
		   , nome varchar(80) not null
		   primary key (cpf)
)



create  procedure sp_inserepesssoa(@CPF CHAR(11), @NOME VARCHAR(80),@SAIDA VARCHAR(80)) as
    
	declare @tamanho as int;
	
	declare @resultado as int;

	set @saida = 'cadastro não pode ser concluido'

	set @resultado = 0;
	 set @tamanho = 10;
	

	--select  substring(@cpf,12-@tamanho,1) 


	 while @tamanho > 1
	  begin

			   set  @resultado = (cast(substring(@cpf,11-@tamanho,1) as int)* @tamanho)+@resultado;

			   set @tamanho = @tamanho  - 1;

	   end

	   set @resultado =  (@resultado*10)%11;

	   if(@resultado = 10)
	         set @resultado = 0; 

        if(@resultado = (cast(SUBSTRING(@cpf,11-@tamanho,1)as int)))
		begin 
		     
              set @tamanho = 11;
              set @resultado=0;
              while @tamanho > 1
				begin

					set  @resultado = (cast(substring(@cpf,12-@tamanho,1) as int)* @tamanho)+@resultado;

					set @tamanho = @tamanho  - 1;

				end
			   
			   set @resultado =  (@resultado*10)%11;

			   if(@resultado = 10)
					 set @resultado = 0; 

				if(@resultado = (cast(SUBSTRING(@cpf,11,1)as int)))
				  begin
				  if((CAST(@CPF as bigint)%11111111111)<>0)
				   begin
					if(LEN(@NOME)>0)
						begin 
							insert into Pessoa(cpf,nome) values (@cpf,@nome)
							set @SAIDA = 'pessoa cadastrada'
					end
					else
			    begin
			    
			       raiserror('preencha o campo nome',16,1)
		       end
				end
				else
			begin
			    
			   raiserror('cpf invalido',16,1)
		   end
			end
			else
			begin
			    
			   raiserror('cpf invalido',16,1)
		   end
		end
		else
			begin
			    
			   raiserror('cpf invalido',16,1)
		   end
		 
		    
		

	select  @saida




    
        




 
 EXEC sp_inserepessoa '48056782087','',''  

 select*from Pessoa

 ---------------------------------------------------------------------------------------------------

 create database Academia

   create  table Aluno(

      codigo_aluno int       identity(1,1),
	  Nome varchar(60) not null,
	  primary key (codigo_aluno)


   )

   create   table  Atividade(

            codigo int not null identity(1,1),
			Descricao varchar(70) not null, 
			IMC decimal(7,2) not null,  

			primary key (codigo)


   )
 
  create   table AtividadesAluno(
      codigo_Aluno int not null, 
	  Altura decimal(7,2) not null,
	  Peso decimal(7,2) not null,
	  IMC decimal(7,2) not null,
	  Atividade int not null,

	  primary key (codigo_Aluno),
	  foreign key (Atividade) references Atividade(codigo)
	    



  )

  insert into Atividade(descricao,imc) values('Corrida+Step',18.5);

  insert into Atividade(descricao,imc) values('Biceps+Costas+Pernas',24.9);

  insert into Atividade(descricao,imc) values('Esteira+Biceps+Costas+Pernas',29.9);

  insert into Atividade(descricao,imc) values('Bicicleta+Biceps+Costas+Pernas',34.9);

  insert into Atividade(descricao,imc) values('Esteira + Bicicleta',39.9);


  select top(1) codigo from Atividade where imc>40


  create    procedure sp_alunoatividades(@codigo int,@Nome varchar(20),@altura decimal(7,2), @peso decimal(7,2))
  as
  declare @imc as decimal(7,2);
	  
	  declare @atividade as int;
   if(@codigo is null and @Nome is not null and @altura is not null and @peso is not null)
    begin
	 insert into Aluno(nome) values (@nome);
	  
	  select 'passou'	 
	  set @imc = (@peso/(@altura*@altura));

	 if(@imc>40)
	          begin
	    set @atividade = 5;
	   end
	    else
		begin
		 set @atividade = (select top(1) codigo from Atividade where imc>@imc);
		 end

		 
	 insert into AtividadesAluno(codigo_Aluno,Altura,Peso,IMC,Atividade) 
	 values ((select codigo_Aluno from Aluno where nome=@nome),@altura,@peso,@imc,@atividade)

	 end
	 else 
	 if(@codigo is not null and @Nome is not null and @altura is not null and @peso is not null)
	     begin
		   if((select nome from Aluno where codigo_aluno=@codigo) is not null)
		   begin
		
	  set @imc = (@peso/(@altura*@altura));

	 if(@imc>40)
	          begin
	    set @atividade = 5;
	   end
	    else
		begin
		 set @atividade = (select top(1) codigo from Atividade where imc>@imc);
		 end

		    update AtividadesAluno set altura=@altura , peso=@peso , imc=@imc , Atividade=@atividade where codigo_aluno=@codigo
		   end
		   end
   
   exec sp_alunoatividades 7, '777cc66666c' , 1.80 ,100.0;

   select* from AtividadesAluno


	 

	 