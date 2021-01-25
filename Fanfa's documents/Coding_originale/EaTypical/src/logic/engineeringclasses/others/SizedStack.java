package logic.engineeringclasses.others;

import java.util.LinkedList;

//stack class that represent how the back button works
public class SizedStack {

	//private static SizedStack instance=null;
	private LinkedList<String> stack;
	private int maxSize=100;
	private int currentSize;
	private String firstPage;
	
	/*
	public SizedStack() {				//constructor of the SINGLETON class
		this.currentSize=0;
		this.stack=new LinkedList<>();
		this.firstPage="/logic/view/standalone/HomePageTouristView.fxml";
	}*/
	
	public SizedStack(boolean web) {		// (maybe) better constructor of the SINGLETON class
		this.currentSize=0;
		this.stack=new LinkedList<>();
		if(web)
			this.firstPage="HomePageTouristView.jsp";
		else
			this.firstPage="/logic/view/standalone/HomePageTouristView.fxml";
	}
	
	public void push(String page)			//push of a page in the stack 
	{
		if(this.currentSize==this.maxSize+1)
		{
			this.stack.removeFirst();
			this.currentSize--;
		}
		this.stack.addLast(page);
		this.currentSize++;
	}
	
	public String pop()						//pop of a page from the stack, last inserted or homepage if the stack is empty
	{
		if(this.currentSize<=1)
		{
			return firstPage;
		}
		this.currentSize--;
		this.stack.removeLast();
		return this.stack.getLast();
	}
	
	public String read()									//reading of a page from the stack
	{
		return this.stack.getLast();
	}
	
	/*
	public static synchronized SizedStack getSizedStack()	//the getter of the singleton instance
	{
		if(SizedStack.instance==null)
			SizedStack.instance=new SizedStack();
		return instance;
	}	*/
	
	/*
	public static synchronized SizedStack getSizedStack(boolean web)  // (maybe) a better getter of the singleton instance
	{
		if(SizedStack.instance==null)
			SizedStack.instance=new SizedStack(web);
		return instance;
	}
	*/
	public void setFirstPage(String page)
	{
		this.firstPage=page;
	}
	
	public void clearStack()
	{
		//instance.stack.clear();
		//anzichè svuotare la lista ne creo un'altra
		this.stack = new LinkedList<>();
		this.currentSize=0;
	}
	
}
