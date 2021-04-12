package Control;

import java.time.LocalDate;
import java.util.List;

public class Controller {

         private DAO.BancoPaulistao2019 banco = new DAO.BancoPaulistao2019();


    public boolean SortearGrupos(){

           return banco.SortearGrupos();   
            

           
    }

    public boolean SortearRodadas(){

           return banco.SortearRodadas();

    }

   public List<String> GetTimesdoGrupoA(){

       return banco.GetTimesdoGrupo('A');
   }

   public List<String> GetTimesdoGrupoB(){
  
       return banco.GetTimesdoGrupo('B');
   }

   public List<String> GetTimesdoGrupoC(){
  
       return banco.GetTimesdoGrupo('C');
   }

   public List<String> GetTimesdoGrupoD(){
  
       return banco.GetTimesdoGrupo('D');
   }

   public List<Model.Partida> getRodada(LocalDate data){

        return  banco.GetRodada(data);
      

   }


}
