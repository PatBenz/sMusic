package be.btbf4.servlets;

import java.io.IOException;



//import java.io.PrintWriter;  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 

import be.btbf4.actions.UserAction;
import be.btbf4.entities.Cart;
import be.btbf4.entities.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
          
        String usrname=request.getParameter("username");  
        String password=request.getParameter("password");  
         
             	
    	User usr = UserAction.findOneByUname("username", usrname);
    	//System.out.println(usr.getUsername());
    	//UserAction.deleteUser(usr);
    	
    	String pw= usr.getPassword();

        
        //---- --------------------------------
        
        
        if(password.equals(pw))//if user is in db
        {
        	//System.out.println("Welcome, "+usrname);
        	HttpSession session=request.getSession();  
	        session.setAttribute("Iuser",usr);
	        
        	
        	if(usr.getRole().getRole().equals("administrateur"))// if the user is an admin
	        {
	        
        		//request.setAttribute("user", usr);
		       // request.setAttribute("logged", true);	
	        	this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/home-admin.jsp").forward(request, response);
	        
	        }
        	else
        	{// if the user is not an admin
	          
    	        session.setAttribute("Iuser",usr);
        		
        		Cart shoppingCart;
        		//shoppingCart = (Cart) session.getAttribute("cart");
        		
        		shoppingCart = new Cart();
                session.setAttribute("cart", shoppingCart);
        		
        		 
        		
		      //  System.out.println(session.getId());
		        
		        request.setAttribute("user", usr);
		        request.setAttribute("logged", true);
		        this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/home.jsp").forward(request, response);
        	}
        }
        
        else{//if username not found in db
        	
           // System.out.println("Sorry, username or password error!");  
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").include(request, response);  
        }  
         
      
	}
}



