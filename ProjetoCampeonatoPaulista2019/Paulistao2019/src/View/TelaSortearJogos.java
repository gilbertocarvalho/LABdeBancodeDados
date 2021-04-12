package View;

import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.control.Button;
import javafx.scene.layout.GridPane;
public class TelaSortearJogos implements EventHandler<ActionEvent>{
    
    private  Button btnSortear;
    private  GridPane gridInterna;

    public  GridPane getGrid(){

              
       gridInterna = new GridPane();
                    
       
      
        Telainicial.AdicionarColunas(gridInterna,'c',30,40,30);

        Telainicial.AdicionarColunas(gridInterna, 'l',60,10,30);

         btnSortear = new Button("Sortear Jogos");

        btnSortear.setPrefWidth(20000);

        btnSortear.setPrefHeight(20000);

         btnSortear.setOnAction(this);

        gridInterna.add(btnSortear, 1, 1);

        return gridInterna;
       }

    @Override
    public void handle(ActionEvent event) {
        // TODO Auto-generated method stub
        
        if(event.getTarget().equals(btnSortear)){

         Control.Controller controlador = new Control.Controller();

          controlador.SortearRodadas();
        }

    }











}
