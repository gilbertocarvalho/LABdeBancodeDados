package View;

import javafx.beans.property.ReadOnlyStringWrapper;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.GridPane;

public class TelaGrupos {
    
  public GridPane getGrid(){

    GridPane gp = new GridPane();
 
   

   Telainicial.AdicionarColunas(gp, 'c', 7,30,15,30,18);

   Telainicial.AdicionarColunas(gp, 'l', 20,30,10,30,10);

    TableView<String> tabelaA = new TableView<>();

    TableColumn<String,String> nome = new TableColumn<>("nome");

    TableColumn grupoA = new TableColumn("grupo A");

    nome.setPrefWidth(190);

    grupoA.setPrefWidth(190);

   grupoA.getColumns().add(nome);

    tabelaA.getColumns().add(grupoA);

    Control.Controller cc = new Control.Controller();

    ObservableList<String> listadetimesA = FXCollections.observableList(cc.GetTimesdoGrupoA());

     tabelaA.setItems(listadetimesA);

    nome.setCellValueFactory(data -> new ReadOnlyStringWrapper(data.getValue()));;

   gp.add(tabelaA,1,1);

   TableView<String> tabelaB = new TableView();

   TableColumn<String,String> nomeB = new TableColumn("nome");

   TableColumn grupoB = new TableColumn("grupo B");

   nomeB.setPrefWidth(190);

   grupoB.setPrefWidth(190);

  grupoB.getColumns().add(nomeB);

   tabelaB.getColumns().add(grupoB);

   ObservableList<String> listadetimesB = FXCollections.observableList(cc.GetTimesdoGrupoB());

   tabelaB.setItems(listadetimesB);

   nomeB.setCellValueFactory(data -> new ReadOnlyStringWrapper(data.getValue()));;

   gp.add(tabelaB,3,1);

   TableView<String> tabelaC = new TableView();

   TableColumn<String,String> nomeC = new TableColumn("nome");

   TableColumn grupoC = new TableColumn("grupo C");

   nomeC.setPrefWidth(190);

   grupoC.setPrefWidth(190);

  grupoC.getColumns().add(nomeC);

   tabelaC.getColumns().add(grupoC);

   ObservableList<String> listadetimesC = FXCollections.observableList(cc.GetTimesdoGrupoC());


   tabelaC.setItems(listadetimesC);

   nomeC.setCellValueFactory(data -> new ReadOnlyStringWrapper(data.getValue()));;

     gp.add(tabelaC,1,3);

     
   TableView<String> tabelaD = new TableView();

   TableColumn<String,String> nomeD = new TableColumn("nome");

   TableColumn grupoD = new TableColumn("grupo D");



   nomeD.setPrefWidth(190);

   grupoD.setPrefWidth(190);

  grupoD.getColumns().add(nomeD);

   tabelaD.getColumns().add(grupoD);

   ObservableList<String> listadetimesD = FXCollections.observableList(cc.GetTimesdoGrupoD());

   tabelaD.setItems(listadetimesD);

   nomeD.setCellValueFactory(data -> new ReadOnlyStringWrapper(data.getValue()));;

   gp.add(tabelaD,3,3);

   return gp;
  }


}
