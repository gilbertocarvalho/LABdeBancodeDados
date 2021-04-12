    package View;

 import java.time.LocalDate;

  import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.ColumnConstraints;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;


    


public class ClasseInicial   extends Application{


	public static void main(String[] args) {
		// TODO Auto-generated method stub

               launch(args);


            /*  DAO.BancoPaulistao2019 banco = new DAO.BancoPaulistao2019(); */

			// banco.SortearGrupos();  

			 // banco.SortearRodadas();



			  
         /*     banco.GetTimesdoGrupo('A'); */  
			   
		/* 	 banco.GetTimesdoGrupo('B');

			 banco.GetTimesdoGrupo('C');

			 banco.GetTimesdoGrupo('D');

			 
             LocalDate data = LocalDate.of(2019, 02, 27);

			 banco.GetRodada(data); */
	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		// TODO Auto-generated method stub
		             
                primaryStage.setTitle("Campeonato Paulista 2019");
                  
                

                GridPane grid = new GridPane();
                
              /*   grid.getColumnConstraints().add(new ColumnConstraints().setPercentWidth(20)); */

			    Telainicial tela = new Telainicial();

				primaryStage.setScene(new Scene (tela.getGrid(),900,600));
 
				primaryStage.show();
				


				  





				
	}

}
