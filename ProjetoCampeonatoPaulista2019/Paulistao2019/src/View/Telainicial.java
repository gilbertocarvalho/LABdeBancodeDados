package View;

import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.event.EventType;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.layout.ColumnConstraints;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.RowConstraints;

public  class Telainicial implements EventHandler<ActionEvent>

{
         private  static Button btnSorteio;

         private GridPane gp;

        private Button btnSortearRodadas;

        private Button btnGrupos;

        private GridPane ultimatela;

        private Button btnRodadas;

         public  GridPane getGrid(){

            gp = new GridPane();
            
            ultimatela = new GridPane();
           gp.setGridLinesVisible(false);

         
           AdicionarColunas(gp,'c',5,25,70);
 
           AdicionarColunas(gp, 'l', 20,10,10,10,10,40);

            btnSorteio = new Button("Sortear grupos");

            btnSorteio.setPrefWidth(2000);
            
            btnSorteio.setPrefHeight(2000); 

            btnSorteio.setOnAction(this);
           gp.add(btnSorteio,1, 1);

           btnSortearRodadas = new Button("Sortear Jogos");

           btnSortearRodadas.setPrefWidth(2000);
           
           btnSortearRodadas.setPrefHeight(2000);

           btnSortearRodadas.setOnAction(this);
            gp.add(btnSortearRodadas,1, 2);




            btnGrupos = new Button("Grupos");

           btnGrupos.setPrefWidth(2000); 
           
           btnGrupos.setPrefHeight(2000);

          btnGrupos.setOnAction(this);
          gp.add(btnGrupos,1, 3);

          
          btnRodadas = new Button("Rodadas");


          btnRodadas.setPrefWidth(2000);
            
          btnRodadas.setPrefHeight(2000);
          
          btnRodadas.setOnAction(this);
           gp.add(btnRodadas,1,4);

           gp.add(ultimatela,0,0); 
           return gp;
         }


         
        public  static void AdicionarColunas(GridPane gp,char l,int... coluna){

          if(l=='c') {   
            for(int i=0;i<coluna.length;i++){
           ColumnConstraints cc = new ColumnConstraints();
            cc.setPercentWidth(coluna[i]);
          
            gp.getColumnConstraints().add(cc);
            }
          }else{
            
            for(int i=0;i<coluna.length;i++){ 
             RowConstraints r = new RowConstraints();
             r.setPercentHeight(coluna[i]);
             gp.getRowConstraints().add(r);
          }
        }

        }


        @Override
        public void handle(ActionEvent event) {
          // TODO Auto-generated method stub
          
              if(event.getTarget().equals(btnSorteio)){

                TelaSorteio sorteio = new  TelaSorteio();

               
                 
                ultimatela = sorteio.getGrid();
                gp.add(sorteio.getGrid(),2,0,1,7);

                gp.getChildren().remove(4);

                 
               


              }else if(event.getTarget().equals(btnSortearRodadas)){

               TelaSortearJogos sortearJogos = new TelaSortearJogos();

               gp.add(sortearJogos.getGrid(),2,0,1,7);

               gp.getChildren().remove(4);

              }else if(event.getTarget().equals(btnGrupos)){

                     TelaGrupos tGrupos = new TelaGrupos();

                  this.gp.getChildren().remove(4);

                  this.gp.add(tGrupos.getGrid(),2,0,1,7);
                 }else if(event.getTarget().equals(btnRodadas)){

                

                  
                   TelaRodada tRodada = new TelaRodada();


                   this.gp.getChildren().remove(4);

                   this.gp.add(tRodada.getGrid() ,2,0,1,7);
                   
                 }


        }


      
        }

