package logic.engineeringclasses.bean.managerestaurant;

public class BeanErrorDishAlreadyExists {

	private String nomePiatto;
	
	public BeanErrorDishAlreadyExists(String nomePiatto) {
		this.nomePiatto = nomePiatto;
	}

	public String getMess() {
		return "Il piatto ** "+nomePiatto+" ** gi� � stato inserito";
	}

	
	
}
