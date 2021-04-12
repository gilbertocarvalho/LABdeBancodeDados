package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class BancoPaulistao2019 {
    

    public boolean SortearGrupos(){

               Connection conexaocomBanco = Conexao.getConexao();
                
               CallableStatement executar = null;

              try{

                String sql = "exec sorteartimes ";

                 executar = conexaocomBanco.prepareCall(sql);

                 executar.execute();
                 
                 executar.close();

                
                   return true;

              }catch(SQLException e){

                System.out.println(e.getMessage());
              }finally{
 
                Conexao.fechar(conexaocomBanco);
              }

                return false;
    }

   

public boolean SortearRodadas(){

  Connection conexaocomBanco = Conexao.getConexao();
   
  CallableStatement executar = null;

 try{

   String sql = "exec sortearrodadas"; 

    executar = conexaocomBanco.prepareCall(sql);

    executar.execute();
    
    executar.close();

   
      return true;

 }catch(SQLException e){

   System.out.println(e.getMessage());
 }finally{

   Conexao.fechar(conexaocomBanco);
 }

   return false;
}

public List<String> GetTimesdoGrupo(char letra){

   List<String> listadetimes = new ArrayList<String>();

  Connection conexaocomBanco = Conexao.getConexao();
   
  CallableStatement executar = null;

 try{

   String sql = "exec timesdogrupo " + letra ; 

     

    executar = conexaocomBanco.prepareCall(sql);

    executar.execute();

    ResultSet retorno = executar.getResultSet();
    
    while(retorno.next()){

            listadetimes.add(retorno.getString("NomeTime"));

    } 
    
    executar.close();

   
      return listadetimes;

 }catch(SQLException e){

   System.out.println(e.getMessage());
 }finally{

   Conexao.fechar(conexaocomBanco);
 }

   return null;
}

public List<Model.Partida> GetRodada(LocalDate data){

  List<Model.Partida> listadepartidas = new ArrayList<Model.Partida>();


  Connection conexaocomBanco = Conexao.getConexao();
   
  CallableStatement executar = null; 

 try{
   
   String sql = "{call rodadadodia (?)}" ;  

   System.out.println(sql);
     
   executar = conexaocomBanco.prepareCall(sql);

      executar.setDate(1, Date.valueOf(data));
         

    

    executar.execute();

    ResultSet retorno = executar.getResultSet();
    
    while(retorno.next()){

          Model.Partida partida = new Model.Partida();

          System.out.println(partida.getTimeA()+ "socorro");

            partida.setTimeA(retorno.getString("TimeA") + " ");
            partida.setTimeB(retorno.getString("TimeB") + " ");
            partida.setData(retorno.getDate("data").toLocalDate());

            listadepartidas.add(partida);

    }
    
    executar.close();

   

   
      return listadepartidas;

 }catch(SQLException e){

   System.out.println(e.getMessage());
 }finally{

   Conexao.fechar(conexaocomBanco);
 }

   return null;
}


}
