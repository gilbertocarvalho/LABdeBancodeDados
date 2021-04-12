  create  database bdCampeonatoPaulista2019
use BdCampeonatoPaulista2019

create table Times(

          CodigoTime int identity(1,1)  not null
		  , NomeTime   varchar(50) not null
		  , cidade varchar(50) not null
		  ,estadio varchar(60) not null
		    
		   primary key(CodigoTime)

)
    
select * from times     

create  table Grupos(
                     
              Grupo char(1) not null
			  , CodigoTime int not null 

			  primary key (Grupo,CodigoTime)

			  foreign key (CodigoTime) references Times(CodigoTime)
					   
)
  
   
create  table  Jogos(
   
             CodigoTimeA int not null
			 ,CodigoTimeB int not null
			 ,GolsTimaA int 
			 ,GolsTimeB int 
			 ,Data smalldatetime 
			 
			 primary key   (CodigoTimeA , codigoTimeB , Data) 
			 
			  foreign key (CodigoTimeA) references Times(CodigoTime)

			  ,foreign key (CodigoTimeB) references Times(CodigoTime)



)

insert into Times(NomeTime,cidade,estadio) values('Corinthians',	 'São Paulo'	,	'Arena Corinthians')

insert into Times(NomeTime,cidade,estadio) values('Santos'	, 'Santos'  ,		'Vila Belmiro')

insert into Times(NomeTime,cidade,estadio) values('Palmeiras'	, 'São Paulo'		,'Allianz Parque')

insert into Times(NomeTime,cidade,estadio) values('São Paulo',	 'São Paulo'	,	'Morumbi')

insert into Times(NomeTime,cidade,estadio) values('Botafogo-SP'	, 'Ribeirão Preto'	,	'Santa Cruz')

insert into Times(NomeTime,cidade,estadio) values('Bragantino'	, 'Bragança Paulista'	,	'Nabi Abi Chedid')



insert into Times(NomeTime,cidade,estadio) values('Ferroviária'  ,	 'Araraquara'	,	'Fonte Luminosa')

insert into Times(NomeTime,cidade,estadio) values('Guarani'	, 'Campinas'	,'Brinco de Ouro da Princesa')

insert into Times(NomeTime,cidade,estadio) values('Ituano',	 'Itu' ,	'Novelli Júnior')

insert into Times(NomeTime,cidade,estadio) values('Mirassol', 'Mirassol'  ,		'José Maria de Campos Maia')

insert into Times(NomeTime,cidade,estadio) values('Novorizontino'	,'Novo Horizonte' ,	'Jorge Ismael de Biasi')

insert into Times(NomeTime,cidade,estadio) values('Oeste',	 'Barueri',	'Arena Barueri')



insert into Times(NomeTime,cidade,estadio) values('Ponte Preta', 'Campinas'	,	'Moisés Lucarelli')

insert into Times(NomeTime,cidade,estadio) values('Red Bull Brasil' ,	 'Campinas'  ,		'Moisés Lucarelli')


	  
insert into Times(NomeTime,cidade,estadio) values('São Bento'	, 'Sorocaba' ,		'Walter Ribeiro')
	
insert into Times(NomeTime,cidade,estadio) values('São Caetano'	, 'São Caetano do Sul'	,'Anacletto Campanella')
	


select*from Times

create  procedure sorteartimes
as
create  table #letra(
              codigo int identity(0,1)
              , letra char(1) not null 
			  primary key (codigo))



insert into #letra(letra) values('A') 

insert into #letra(letra) values('B')

insert into #letra(letra) values('C')

insert into #letra(letra) values('D')   

declare @codigo  int
   declare @contador int
  
   set @contador = 5
   while(@contador<17)
    begin
	    set @codigo =   cast(RAND()*12 as int)%cast(4.0 as int) 

		if((select count(grupo) from grupos where grupo=(select letra from  #letra where codigo=@codigo ))<3)  
		begin
		      insert into Grupos(CodigoTime,Grupo) values(@contador,(select letra from  #letra where codigo=@codigo))   
			  set  @contador = @contador +1
		end
	end

     set @contador = 1 


while((select count(letra) from #letra)>0)
 begin
   

   set @codigo =   cast(RAND()*12 as int)%cast(4.0 as int) 

	  if((select letra from  #letra where codigo=@codigo)is not null)
	  begin
			   insert into Grupos(CodigoTime,Grupo) values(@contador,(select letra from  #letra where codigo=@codigo))

			   delete from #letra where codigo=@codigo
     
			   set @contador = @contador+1
	   end

   end 

   ----------------------------
   exec sorteartimes

  select*from jogos

   delete from grupos
  
  ---------------------------
   

   create  procedure sortearrodadas as
  declare  @codigo int 

  declare @codigo2 int
  create   table #times(
                     
              Grupo char(1) not null
			  , CodigoTime int not null 
			    
			  primary key (Grupo,CodigoTime)

			
					   
)








  declare @contador int

 

  declare @rodada int

  set @rodada =1

  declare @data smalldatetime

  set @data = '20/01/2019'

  declare @auxdata int

  set @auxdata =3

   while(@rodada<13)
   begin
        insert into #times  select*from Grupos
		
		if(@rodada%2=0)
	      set @auxdata = 4


      set @contador = 0


	 
	 
	 declare @regulador int

	 set @regulador = 1
   while(@contador<14)
   begin
	    
	           set @codigo =    (select top 1 percent codigotime from #times order by newid())

	           set @codigo2 =   ( select top 1 percent codigotime from #times order by newid())

		
              if((exists(select (CodigoTime) from #Times where CodigoTime=@codigo)) and (exists(select (CodigoTime) from #Times where CodigoTime=@codigo2)))
			   begin 
			           if((select (Grupo) from #times where CodigoTime=@codigo) <> (select (Grupo) from #times where CodigoTime=@codigo2))
					   begin
					     
						 if((not exists(select (codigoTimeA)from Jogos where CodigoTimeA=@codigo and CodigoTimeB=@codigo2)) and (not exists(select (codigoTimeA)from Jogos where CodigoTimeA=@codigo2 and CodigoTimeB=@codigo)))
						 begin
					     insert into Jogos(codigoTimeA,codigoTimeB,data) values (@codigo,@codigo2,@data)

						

						 delete from #times where CodigoTime=@Codigo

						 delete from #times where CodigoTime=@codigo2


						 set @contador = @contador + 2
						 end
						
					   end
			   end

			   if(@regulador=2000)
			   begin
			     
			       delete from jogos where data = (@data)
				   set @regulador =0
				   set @contador = 0

				   
				   delete from #times
				    insert into #times  select*from Grupos
			   end
			    set  @regulador = @regulador  +1
			   end

			     insert into Jogos(codigoTimeA,codigoTimeB,data) values((select top(1) codigoTime from #times) , (select top(1) codigoTime from #times order by grupo desc),@data)

			    set @data = DATEADD(day,@auxdata,@data)
			        set @auxdata =3

		 
		 	   delete from #times
			   set @rodada = @rodada + 1

			

			   end

			   exec sortearrodadas



			    
			      

			   select*from grupos 

			   delete from jogos

			   delete from grupos
			    
				exec rodadadodia '2019-02-27'

			   select*from times



			   
			   -----------------------
			     

			  

				 create  procedure rodadadodia(@data date)
				 as
				   select  timeA.NomeTime as 'timeA', TimeB.NomeTime as 'timeB' , data from Jogos
			   inner join Times as timeA on  TimeA.CodigoTime = Jogos.codigoTimeA
			   inner join Times as TimeB on TimeB.CodigoTime = Jogos.CodigoTimeB
			    where data =@data


				exec rodadadodia '27/02/2019'

				(select count(codigoTimeA) from Jogos group by data  
				(select count(codigoTimeB) from Jogos group by CodigoTimeB)


				------------------------------------------------

				create    procedure TimesdoGrupo(@letra char(1))
				as
				select NomeTime from Grupos 
				inner join Times on Times.CodigoTime = Grupos.codigoTime
				where grupo=@letra

				exec TimesdoGrupo('B')


