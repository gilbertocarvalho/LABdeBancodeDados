package View;

import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;

public class TelaSorteio  implements EventHandler<ActionEvent>{
    
       private Button btnSortear;
    private Label lblstatus;

    public GridPane getGrid(){

              
        GridPane gridInterna = new GridPane();
               
        

         
      


        Telainicial.AdicionarColunas(gridInterna,'c',30,40,30);

        Telainicial.AdicionarColunas(gridInterna, 'l',50,10,10,30);

          lblstatus = new Label("Status:");

        gridInterna.add(lblstatus,1,1);

         btnSortear = new Button("Sortear Grupos");

        btnSortear.setPrefWidth(20000);

        btnSortear.setPrefHeight(20000);

         btnSortear.setOnAction(this);

        gridInterna.add(btnSortear, 1, 2);

        return gridInterna;
       }

    @Override
    public void handle(ActionEvent event) {
        // TODO Auto-generated method stub
        
        if(event.getTarget().equals(btnSortear)){

         Control.Controller controlador = new Control.Controller();

         if(controlador.SortearGrupos()){

            lblstatus.setText("Status: grupos foram sorteados com sucesso");
         };
        }

    }


}
