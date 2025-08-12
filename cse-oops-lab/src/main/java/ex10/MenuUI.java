package ex10;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.Menu;
import javafx.scene.control.MenuBar;
import javafx.scene.control.MenuItem;
import javafx.scene.layout.VBox;
public class MenuUI extends Application {  
    @Override  
    public void start(Stage primaryStage) throws Exception 
    {  
      	Menu newmenu = new Menu("File");
     	 Menu newmenu2 = new Menu("Edit");
      	MenuItem m1 = new MenuItem("Open");
       	MenuItem m2 = new MenuItem("Save");
       	MenuItem m3 = new MenuItem("Exit");
          	MenuItem m4 = new MenuItem("Cut");
          	MenuItem m5 = new MenuItem("Copy");
          	MenuItem m6 = new MenuItem("Paste");
         	 newmenu.getItems().add(m1);
          	newmenu.getItems().add(m2);
          	newmenu.getItems().add(m3);
          	newmenu2.getItems().add(m4);
         	 newmenu2.getItems().add(m5);
          	newmenu2.getItems().add(m6);
          	MenuBar newmb = new MenuBar();
          	newmb.getMenus().add(newmenu);
          	newmb.getMenus().add(newmenu2);      
          	Label l = new Label("\t\t\t\t\t\t  + "You have selected no menu items");
          	EventHandler<ActionEvent> event = new EventHandler<ActionEvent>() {
  	public void handle(ActionEvent e)
  	{
      		l.setText("\t\t\t\t\t\t" + ((MenuItem)e.getSource()).getText() + 
                                                     " menu item selected");
}
};
m1.setOnAction(event);
m2.setOnAction(event);
m3.setOnAction(event);
m4.setOnAction(event);
m5.setOnAction(event);
m6.setOnAction(event);
VBox box = new VBox(newmb,l);        
Scene scene = new Scene(box,400,200);  
primaryStage.setScene(scene);  
       primaryStage.setTitle("JavaFX Menu");  
       primaryStage.show();  
     }
    public static void main(String[] args) {
        Application.launch(args);
    }
}
