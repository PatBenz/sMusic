package be.btbf4.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import be.btbf4.actions.UserAction;
import be.btbf4.entities.Cart;
import be.btbf4.entities.CartItem;
import be.btbf4.entities.User;

/**
 * Servlet implementation class Checkout
 */
@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User Iuser = (User)session.getAttribute("Iuser");
	
		if(Iuser!=null && Iuser.getRole().getRole().equals("utilisateur"))
		{	
			System.out.println("Logged User = " + Iuser.getFirstName() + " | UserRole = " +Iuser.getRole().getRole());
			//String param = request.getParameter("usrid");
			
			Integer userid = Integer.parseInt(request.getParameter("usrid"));
			
			User usr = UserAction.getOneUser(userid.intValue());
			request.setAttribute("user", usr);
			
			Cart shoppingCart = (Cart) session.getAttribute("cart");
			session.setAttribute("cart", shoppingCart);
			
			List<CartItem> items = shoppingCart.getCartItems();
			request.setAttribute("items", items);
			
			request.setAttribute("logged", true);
			 
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/checkout.jsp").forward(request, response);
		}
		
		else{
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
