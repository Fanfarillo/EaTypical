package logic.controller.guicontroller.Web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletConfirmMessage extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String b1 = req.getParameter("home");
		String b2 = req.getParameter("manageMenu");
		String b3 = req.getParameter("sponsorRestaurant");
		String b4 = req.getParameter("back");
		String b5 = req.getParameter("Done");
		String b6 = req.getParameter("Discard");
		String b7 = req.getParameter("keep");
		
		if(b1!=null) {
			
			req.getRequestDispatcher("HomePageOwner.jsp").forward(req, resp);
			System.out.print("home");
		}
		if(b2!=null) {
			req.getRequestDispatcher("RestaurantMenuview.jsp").forward(req, resp);
			System.out.print("manageMenu");
		}
		if(b3!=null) {
			req.getRequestDispatcher("CreatingRestaurantView.jsp").forward(req, resp);
			System.out.print("sponsor");
		}
		if(b4!=null) {
			req.getRequestDispatcher("RestaurantMenuview.jsp").forward(req, resp);
			System.out.print("back");
		}
		if(b5!=null) {
			
			//implementa collegamento logica applicativa
			req.getRequestDispatcher("RestaurantMenuview.jsp").forward(req, resp);
			System.out.print("done");
		}
		if(b6!=null) {
			//implementa collegamento logica applicativa
			req.getRequestDispatcher("RestaurantMenuview.jsp").forward(req, resp);
			System.out.print("discard");
		}
		if(b7!=null) {
			//implementa collegamento logica applicativa
			req.getRequestDispatcher("RestaurantMenuview.jsp").forward(req, resp);
			System.out.print("keep");
		}
		
	}

}