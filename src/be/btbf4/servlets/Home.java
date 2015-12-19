package be.btbf4.servlets;

import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;




import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import be.btbf4.entities.Cart;
import be.btbf4.entities.User;

//import be.btbf4.actions.AlbumAction;
//import be.btbf4.entities.Album;

/**
 * Servlet implementation class Home
 */
@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
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
		       // response.setContentType("text/html;charset=UTF-8");
		       		        
		       /* Cart shoppingCart;
		        shoppingCart = (Cart) session.getAttribute("cart");
		        
		        if(shoppingCart == null){
		          
		        	shoppingCart = new Cart();
		        	session.setAttribute("cart", shoppingCart);
		        }*/
					
				request.setAttribute("user", Iuser);
				request.setAttribute("logged", true);	
				this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/home.jsp").forward(request, response);
		}
		else{
		//	request.setAttribute("user", Iuser);
			request.setAttribute("logged", false);
			//response.sendRedirect(request.getContextPath() + "/Home");
			
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/home.jsp").forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
