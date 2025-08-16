package ex10;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.RadioButton;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

import static javafx.application.Application.launch;

public class MCTest extends Application {
    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("Test Question 1");
        Label labelfirst = new Label("What is 10 + 20?");
        Label labelresponse = new Label();
        Button button = new Button("Submit");
        RadioButton radio1, radio2, radio3, radio4;
        radio1 = new RadioButton("10");
        radio2 = new RadioButton("20");
        radio3 = new RadioButton("30");
        radio4 = new RadioButton("40");

        ToggleGroup question1 = new ToggleGroup();
        radio1.setToggleGroup(question1);
        radio2.setToggleGroup(question1);
        radio3.setToggleGroup(question1);
        radio4.setToggleGroup(question1);

        button.setDisable(true);
        radio1.setOnAction(e -> button.setDisable(false));
        radio2.setOnAction(e -> button.setDisable(false));
        radio3.setOnAction(e -> button.setDisable(false));
        radio4.setOnAction(e -> button.setDisable(false));

        button.setOnAction(e ->
        {
            if (radio3.isSelected()) {
                labelresponse.setText("Correct answer");
                button.setDisable(true);
            } else {
                labelresponse.setText("Wrong answer");
                button.setDisable(true);
            }
        });
        VBox layout = new VBox(5);
        layout.getChildren().addAll(labelfirst, radio1, radio2, radio3, radio4, button, labelresponse);
        Scene scene1 = new Scene(layout, 400, 250);
        primaryStage.setScene(scene1);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
