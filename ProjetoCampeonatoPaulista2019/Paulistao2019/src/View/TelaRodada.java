package View;

import java.time.LocalDate;

import Model.Partida;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.GridPane;

public class TelaRodada implements EventHandler<ActionEvent>{
    
 private Button btnpesquisar;
private DatePicker txtdata;

private Control.Controller cc = new Control.Controller();
private TableView<Partida> tabelarodada;

public GridPane getGrid(){

    GridPane gp = new GridPane();
                   
  

    
    Telainicial.AdicionarColunas(gp, 'c', 30,40,20,10);
    

    Telainicial.AdicionarColunas(gp, 'l', 24,5,1,40,30);

       

    tabelarodada = new TableView<Model.Partida>();

    

    TableColumn<Model.Partida,String> colunatimeA = new TableColumn<Model.Partida,String>("time A");
    
     colunatimeA.setCellValueFactory(new PropertyValueFactory<Model.Partida,String>("timeA"));


     





    TableColumn<Model.Partida,String> colunatimeB = new TableColumn<Model.Partida,String>("time B");

    colunatimeB.setCellValueFactory(new PropertyValueFactory<Model.Partida,String>("timeB"));

    TableColumn<Model.Partida,LocalDate> colunadata = new TableColumn<Model.Partida,LocalDate>("data");

    colunadata.setCellValueFactory(new PropertyValueFactory<Model.Partida,LocalDate>("data"));

    tabelarodada.getColumns().addAll(colunatimeA,colunatimeB,colunadata);


    

   gp.add(tabelarodada, 1,3);

     txtdata = new DatePicker();

   txtdata.setPrefWidth(2000  );


      gp.add(txtdata,1,1);

    btnpesquisar = new Button("pesquisar"  );

    btnpesquisar.setOnAction(this);
        
    gp.add(btnpesquisar,2,1);

   return gp;
    
}

@Override
public void handle(ActionEvent event) {
    // TODO Auto-generated method stub
    
         if(event.getTarget().equals(btnpesquisar)){

              System.out.println(txtdata.getValue());

              ObservableList<Model.Partida> lPartidas = FXCollections.observableArrayList(cc.getRodada(txtdata.getValue()));

              tabelarodada.setItems(lPartidas);
         }


}


}
