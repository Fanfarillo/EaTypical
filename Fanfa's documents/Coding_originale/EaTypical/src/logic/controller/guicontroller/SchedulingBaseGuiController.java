package logic.controller.guicontroller;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import logic.engineeringclasses.bean.scheduletrip.BeanOutputSchedule;
import logic.engineeringclasses.bean.scheduletrip.ConvertedBeanSchedule;
import logic.engineeringclasses.others.Session;

public abstract class SchedulingBaseGuiController extends UserBaseGuiController {
	protected ObservableList<ConvertedBeanSchedule> ol;
	
	protected String city;
	protected BeanOutputSchedule[] scheduling;
	protected ConvertedBeanSchedule[] convertedScheduling;
	protected String errorMessage="";
	
	protected SchedulingBaseGuiController(Session bs) {
		super(bs);
	}
	
    @FXML // fx:id="tabella"
    protected TableView<ConvertedBeanSchedule> tabella; // Value injected by FXMLLoader

    @FXML // fx:id="dateColumn"
    protected TableColumn<ConvertedBeanSchedule, String> dateColumn; // Value injected by FXMLLoader

    @FXML // fx:id="hourColumn"
    protected TableColumn<ConvertedBeanSchedule, String> hourColumn; // Value injected by FXMLLoader

    @FXML // fx:id="nameColumn"
    protected TableColumn<ConvertedBeanSchedule, String> nameColumn; // Value injected by FXMLLoader

    @FXML // fx:id="addressColumn"
    protected TableColumn<ConvertedBeanSchedule, String> addressColumn; // Value injected by FXMLLoader    

    @FXML // fx:id="avgPriceColumn"
    protected TableColumn<ConvertedBeanSchedule, String> avgPriceColumn; // Value injected by FXMLLoader

    @FXML // fx:id="avgVoteColumn"
    protected TableColumn<ConvertedBeanSchedule, String> avgVoteColumn; // Value injected by FXMLLoader
    
    @FXML // fx:id="cittaLabel"
    protected Label cittaLabel; // Value injected by FXMLLoader
    
    protected void commonInitializeOperations() {
        assert tabella != null : "fx:id=\"tabella\" was not injected: check your FXML file 'SchedulingView.fxml'.";
        assert dateColumn != null : "fx:id=\"dateColumn\" was not injected: check your FXML file 'SchedulingView.fxml'.";
        assert hourColumn != null : "fx:id=\"hourColumn\" was not injected: check your FXML file 'SchedulingView.fxml'.";
        assert nameColumn != null : "fx:id=\"nameColumn\" was not injected: check your FXML file 'SchedulingView.fxml'.";
        assert addressColumn != null : "fx:id=\"addressColumn\" was not injected: check your FXML file 'SchedulingView.fxml'.";
        assert avgPriceColumn != null : "fx:id=\"avgPriceColumn\" was not injected: check your FXML file 'SeeTripView.fxml'.";
        assert avgVoteColumn != null : "fx:id=\"avgVoteColumn\" was not injected: check your FXML file 'SeeTripView.fxml'.";
        assert cittaLabel != null : "fx:id=\"cittaLabel\" was not injected: check your FXML file 'SchedulingView.fxml'.";
        
        ol = FXCollections.observableArrayList();
        for(int i=0; i<this.convertedScheduling.length; i++) {
        	ol.add(this.convertedScheduling[i]);
        }
        dateColumn.setCellValueFactory(new PropertyValueFactory<ConvertedBeanSchedule, String>("strDate"));
        hourColumn.setCellValueFactory(new PropertyValueFactory<ConvertedBeanSchedule, String>("strHour"));
        nameColumn.setCellValueFactory(new PropertyValueFactory<ConvertedBeanSchedule, String>("name"));
        addressColumn.setCellValueFactory(new PropertyValueFactory<ConvertedBeanSchedule, String>("address"));
        avgPriceColumn.setCellValueFactory(new PropertyValueFactory<ConvertedBeanSchedule, String>("strAvgPrice"));
        avgVoteColumn.setCellValueFactory(new PropertyValueFactory<ConvertedBeanSchedule, String>("strAvgVote"));
    }  
    
}
