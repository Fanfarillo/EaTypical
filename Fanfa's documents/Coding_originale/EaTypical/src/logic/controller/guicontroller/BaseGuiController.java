package logic.controller.guicontroller;
import java.io.IOException;


import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.control.Button;
import javafx.scene.layout.AnchorPane;
import logic.engineeringclasses.others.SizedStack;

//Base Graphic Controller: every view page has a back button and a home button
public class BaseGuiController {
    
	@FXML
    protected AnchorPane myAnchorPane;
	
    @FXML
    protected Button backButton;
    
    @FXML
    protected Button homeButton;
	
	@FXML
    void goHomePage(ActionEvent event) throws IOException {			//The Home Page button onAction method
		//To Do
    	System.out.print("Home\n");
    	SizedStack.getSizedStack().push("/logic/view/standalone/ChooseRestaurant/ItalianViewCity.fxml");
    	FXMLLoader loader=new FXMLLoader(getClass().getResource("/logic/view/standalone/ChooseRestaurant/ItalianViewCity.fxml"));
    	Parent root=loader.load();
    	myAnchorPane.getChildren().setAll(root);
    }

    @FXML
    void goToBackPage(ActionEvent event) throws IOException {		//The Back Button onAction method
    	//To Do
    	String page=SizedStack.getSizedStack().pop();
    	System.out.print("Back\n");
    	
    	FXMLLoader loader=new FXMLLoader(getClass().getResource(page));
    	Parent root=loader.load();
    	myAnchorPane.getChildren().setAll(root);
    }

}