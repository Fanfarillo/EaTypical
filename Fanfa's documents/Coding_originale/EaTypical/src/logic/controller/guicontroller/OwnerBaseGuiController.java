package logic.controller.guicontroller;

import java.io.IOException;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.control.Button;
import logic.controller.guicontroller.managemenu.ControllerGuiRestaurantMenuView;
import logic.controller.guicontroller.sponsoryourrestaurant.ControllerGuiCreatingRestaurant;
import logic.engineeringclasses.others.Session;

public abstract class OwnerBaseGuiController extends BaseGuiController {

	
	protected OwnerBaseGuiController(Session bs) {
		super(bs);
	}
	@FXML
	public Button manageMenuButton; 

	@FXML
	public Button sponsorRestaurantButton;
	
	
	
	@FXML
	void goToManageMenu(ActionEvent e) throws IOException {
		FXMLLoader loader = new FXMLLoader(getClass().getResource("/logic/view/standalone/managemenu/RestaurantMenuView.fxml"));
		loader.setControllerFactory(c -> new ControllerGuiRestaurantMenuView(bs));
    	Parent rootParent = loader.load();
    	myAnchorPane.getChildren().setAll(rootParent);
	}
	
	@FXML
	void goToSponsorRestaurant(ActionEvent e) throws IOException {
		FXMLLoader loader = new FXMLLoader(getClass().getResource("/logic/view/standalone/sponsoryourrestaurant/CreatingRestaurantView.fxml"));
		loader.setControllerFactory(c -> new ControllerGuiCreatingRestaurant(bs));
    	Parent rootParent = loader.load();
    	myAnchorPane.getChildren().setAll(rootParent);
	}

    
}





