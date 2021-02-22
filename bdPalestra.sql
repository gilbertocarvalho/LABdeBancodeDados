


create database dbPalestra

use dbPalestra

create table Curso(
 Codigo_Curso int not null
 , Nome varchar (70) not null
 ,Sigla  varchar (10 ) not null
 primary key (Codigo_Curso)
)


create table Aluno(

    Ra char(7) not null
	, Nome varchar(250) not null
	,Codigo_Curso int not null
	, primary key (Ra)
	, foreign key (Codigo_Curso) references Curso(Codigo_Curso)

)

create table Palestrante(

       Codigo_Palestrante int identity(1,1)
       ,Nome varchar(250) not null
	   ,Empresa varchar(100) not null
	   ,primary key (Codigo_Palestrante)

)

create table Palestra(
    Codigo_Palestra int identity(1,1)
	,Titulo  varchar(max) not null
	,Carga_Horaria int not null
	,Data datetime not null 
	,Codigo_Palestrante int not null
	,primary key (Codigo_Palestra)
	,foreign key (Codigo_Palestrante) references Palestrante(Codigo_Palestrante)


)

create table Alunos_Inscritos(

             Ra char(7) not null
			 ,Codigo_Palestra  int not null

			, primary key(Ra ,Codigo_Palestra)
			, foreign key (Ra) references Aluno(Ra)
			, foreign key (Codigo_Palestra) references Palestra(Codigo_Palestra)
)

create table Nao_Alunos(

          RG varchar (9) not null
		  ,Orgao_Esp char(5) not null
		  ,Nome  varchar(250) not null
		  ,primary key (RG , Orgao_Esp)


)

select*from Nao_Alunos
create table Nao_Alunos_Inscritos(
              
			  Codigo_Palestra int not null
			  ,RG varchar(9) not null
			  ,Orgao_Esp char(5) not null


			 ,primary key (Codigo_Palestra, RG , Orgao_Esp)
			  , foreign key (Codigo_Palestra) references Palestra(Codigo_Palestra)
			  ,foreign key (RG,Orgao_Esp) references Nao_Alunos(RG,Orgao_Esp)



)

insert Curso(Codigo_Curso,Nome,Sigla) values ('222','Pedagogia','pdg')



insert into ALuno (Ra,Nome,Codigo_Curso) values('111','alexandre','222')


insert into Palestrante(Nome,Empresa) values ('daniel','unilever')

insert into Palestra(Titulo,Carga_Horaria,Data,Codigo_Palestrante) values ('brasil','4','20/4/2020','1')

insert into Alunos_Inscritos(Ra,Codigo_Palestra) values ('111','1')

insert into Nao_Alunos(RG,Orgao_Esp,Nome)  values('232332332','sssp','Rafael')

insert into Nao_Alunos(RG,Orgao_Esp,Nome)  values('999999999','sssp','Abelardo')


insert into Nao_Alunos_Inscritos(Codigo_Palestra,RG,Orgao_Esp) values('1','232332332','sssp')

insert into Nao_Alunos_Inscritos(Codigo_Palestra,RG,Orgao_Esp) values('1','999999999','sssp')

create view vListadePresenca as

select Aluno.Ra as 'Num_Documento',Aluno.Nome as 'Nome_Pessoa',Titulo as 'Titulo_Palestra',Palestrante.Nome as 'Nome_Palestrante',Carga_Horaria , Data from Alunos_Inscritos

   inner join Aluno on Aluno.Ra = Alunos_Inscritos.Ra

   inner join Palestra on Palestra.codigo_Palestra = Alunos_Inscritos.Codigo_Palestra

   inner join Palestrante on Palestrante.Codigo_Palestrante = Palestra.Codigo_Palestrante

union
select concat (Nao_Alunos.RG ,' ('+ Nao_Alunos.Orgao_Esp + ')') as 'Num_Documento',Nao_Alunos.Nome as 'Nome_Pessoa', Titulo as 'Titulo_Palestra', Palestrante.Nome  as 'Nome_Palestrante',Carga_Horaria, Data from Nao_Alunos_Inscritos
 
    inner join Nao_Alunos on Nao_Alunos.RG= Nao_Alunos_Inscritos.RG and Nao_Alunos.Orgao_Esp = Nao_Alunos_Inscritos.Orgao_Esp

	inner join Palestra on Palestra.Codigo_Palestra = Nao_Alunos_Inscritos.Codigo_Palestra

	inner join Palestrante on  Palestrante.Codigo_Palestrante = Palestra.Codigo_Palestrante
	

          select*from vListadePresenca order by Nome_Pessoa