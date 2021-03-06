/**
 * Sample Skeleton for 'SchedulingView.fxml' Controller Class
 */

package logic.controller.guicontroller.scheduleatrip;

import logic.controller.applicationcontroller.ScheduleTrip;
import logic.controller.guicontroller.SchedulingBaseGuiController;
import logic.engineeringclasses.bean.scheduletrip.BeanOutputSchedule;
import logic.engineeringclasses.others.BeanConverter;
import logic.engineeringclasses.others.Session;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.control.Button;
import javafx.scene.control.Label;

public class ControllerGuiScheduling extends SchedulingBaseGuiController {
	
	private String schedulingPage = "/logic/view/standalone/scheduleatrip/SchedulingView.fxml";
	private String tripSettingsPage = "/logic/view/standalone/scheduleatrip/TripSettingsView.fxml";
	private String savedMessage = "Scheduling saved successfully.";
	
	public ControllerGuiScheduling(String city, BeanOutputSchedule[] scheduling, Session bs) {
		super(bs);
		this.city=city;
		this.scheduling=scheduling;
	}
	
	public ControllerGuiScheduling(String city, BeanOutputSchedule[] scheduling, String errorMessage, Session bs) {
		super(bs);
		this.city=city;
		this.scheduling=scheduling;
		this.errorMessage=errorMessage;
	}

    @FXML // ResourceBundle that was given to the FXMLLoader
    private ResourceBundle resources;

    @FXML // URL location of the FXML file that was given to the FXMLLoader
    private URL location;

    @FXML // fx:id="changeSettingsButton"
    private Button changeSettingsButton; // Value injected by FXMLLoader

    @FXML // fx:id="nomeUtenteLabel"
    private Label nomeUtenteLabel; // Value injected by FXMLLoader

    @FXML // fx:id="generateNewSchedulingButton"
    private Button generateNewSchedulingButton; // Value injected by FXMLLoader

    @FXML // fx:id="saveSchedulingButton"
    private Button saveSchedulingButton; // Value injected by FXMLLoader

    @FXML // fx:id="errorLabel"
    private Label errorLabel; // Value injected by FXMLLoader

    @FXML // fx:id="savedLabel"
    private Label savedLabel; // Value injected by FXMLLoader
    
    @FXML
    void generateNewScheduling(ActionEvent event) throws IOException {
    	for(int i=0; i<this.scheduling.length; i++) {
    		this.scheduling[i].setRestFromList();
    	}    	
    	FXMLLoader loader=new FXMLLoader(getClass().getResource(this.schedulingPage));
    	loader.setControllerFactory(c -> new ControllerGuiScheduling(this.city, this.scheduling, bs));
    	Parent root=loader.load();
    	myAnchorPane.getChildren().setAll(root);   
    }

    @FXML
    void goBackToTripSettingsPage(ActionEvent event) throws IOException {
    	FXMLLoader loader=new FXMLLoader(getClass().getResource(this.tripSettingsPage));
    	loader.setControllerFactory(c -> new ControllerGuiTripSettings(this.city, bs));
    	Parent root=loader.load();
    	myAnchorPane.getChildren().setAll(root);   
    }

    @FXML
    void saveScheduling(ActionEvent event) throws IOException {
    	try {
    		ScheduleTrip scheduleTrip = new ScheduleTrip();
    		scheduleTrip.saveScheduleTrip(this.convertedScheduling, this.bs.getUser().getUsername());
    		savedLabel.setText(savedMessage);
    	}
    	
    	catch(Exception e) {
    		e.printStackTrace();
    		
    		FXMLLoader loader=new FXMLLoader(getClass().getResource(this.schedulingPage));
    		loader.setControllerFactory(c -> new ControllerGuiScheduling(this.city, this.scheduling, "An unknown error occurred. Please, try again later.", bs));
    		Parent root=loader.load();
    		myAnchorPane.getChildren().setAll(root);
    	}
    	
    }

    @FXML // This method is called by the FXMLLoader when initialization is complete
    void initialize() {
        assert changeSettingsButton != null : "fx:id=\"changeSettingsButton\" was not injected: check your FXML file 'SchedulingView.fxml'.";
        assert nomeUtenteLabel != null : "fx:id=\"nomeUtenteLabel\" was not injected: check your FXML file 'SchedulingView.fxml'.";
        assert generateNewSchedulingButton != null : "fx:id=\"generateNewSchedulingButton\" was not injected: check your FXML file 'SchedulingView.fxml'.";
        assert saveSchedulingButton != null : "fx:id=\"saveSchedulingButton\" was not injected: check your FXML file 'SchedulingView.fxml'.";
        assert errorLabel != null : "fx:id=\"errorLabel\" was not injected: check your FXML file 'SchedulingView.fxml'.";
        assert savedLabel != null : "fx:id=\"savedLabel\" was not injected: check your FXML file 'SchedulingView.fxml'.";
        
        BeanConverter converter = new BeanConverter();
        this.convertedScheduling = converter.convertDataType(this.scheduling, this.city);
        
        if(this.bs.getUser()!=null)
        	nomeUtenteLabel.setText(this.bs.getUser().getUsername());
        else
        	nomeUtenteLabel.setText("Not logged");
        cittaLabel.setText(this.city);
        errorLabel.setText(this.errorMessage);
        
        commonInitializeOperations();        
        tabella.setItems(ol);
        
    }
    
}
