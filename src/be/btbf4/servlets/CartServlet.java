package be.btbf4.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import be.btbf4.actions.AlbumAction;
import be.btbf4.entities.Album;
import be.btbf4.entities.Cart;
import be.btbf4.entities.CartItem;
import be.btbf4.entities.User;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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
			response.setContentType("text/html;charset=UTF-8");
	        //HttpSession session = request.getSession();
	        Cart shoppingCart;
	        shoppingCart = (Cart) session.getAttribute("cart");
	        
	        if(shoppingCart == null){
		          shoppingCart = new Cart();
		          session.setAttribute("cart", shoppingCart);
		        }
	        
	       // HashMap<String, Integer> items = shoppingCart.getCartItems();
	        List<CartItem> items = shoppingCart.getCartItems();
	        
	        
	       /* for(String key: items.keySet()){
	            System.out.println("Key: "+key+" - items.get :"+"$"+items.get(key)+"</td></tr>");
	        }*/
	        request.setAttribute("items", items);
	        request.setAttribute("cart", shoppingCart);
	        
	        request.setAttribute("user", Iuser);
			request.setAttribute("logged", true);
			
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/cart.jsp").forward(request, response);
		}
		else{
			request.setAttribute("user", Iuser);
			request.setAttribute("logged", false);
			//response.sendRedirect(request.getContextPath() + "/Home");
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/cart.jsp").forward(request, response);

			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User Iuser = (User)session.getAttribute("Iuser");
		
		if(Iuser!=null && Iuser.getRole().getRole().equals("utilisateur"))
		{	
		        response.setContentType("text/html;charset=UTF-8");
		        //HttpSession session = request.getSession();
		        
		        Cart shoppingCart;
		        shoppingCart = (Cart) session.getAttribute("cart");
		        
		        if(shoppingCart == null){
		          
		        	shoppingCart = new Cart();
		        	session.setAttribute("cart", shoppingCart);
		        }
		        
		        String name = request.getParameter("name");
		        
		        Double price = Double.parseDouble(request.getParameter("price"));
		        
		     //   int p = (int) (price/price);//temporaire! à changer!
		        //int p = price.
		        
		        shoppingCart.addToCart(name, price); //Tu ajoutes au cart.
		       
		        session.setAttribute("cart", shoppingCart);
		       
		        
		        request.setAttribute("user", Iuser);
				request.setAttribute("logged", true);
		        
		     
		        List <Album> albs = AlbumAction.getAlbumsSorted("title");
		        request.setAttribute("lalbums", albs);
        
        //this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/catalog2.jsp").forward(request, response);
		        response.sendRedirect(request.getContextPath() + "/Catalog");
		
		}
		else{
			request.setAttribute("user", Iuser);
			request.setAttribute("logged", false);
			response.sendRedirect(request.getContextPath() + "/Home");
			
		}
	
	}
}
