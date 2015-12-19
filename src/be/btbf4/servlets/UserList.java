package be.btbf4.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import be.btbf4.actions.UserAction;
import be.btbf4.entities.User;

/**
 * Servlet implementation class UserList
 */
@WebServlet("/UserList")
public class UserList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		User Iuser = (User)session.getAttribute("Iuser");
		
		if(Iuser!=null && Iuser.getRole().getRole().equals("administrateur"))
		{
			System.out.println("Logged User = " + Iuser.getFirstName() + " | UserRole = " +Iuser.getRole().getRole());
					
			//String param = request.getParameter("usrid");
			
			Integer param = Integer.parseInt(request.getParameter("param"));
			
			 
	
			switch (param)
			{
			  case 1:
				  
				  List <User> usrs = UserAction.getNonAdminUsers();
				  request.setAttribute("users", usrs);
				  request.setAttribute("count", 0);
					
				  this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/user-list.jsp").forward(request, response);
				 
			    break;
			    
			  case 2:
				  
				  List <User> users = UserAction.getNonAdminUsers();
				  request.setAttribute("count", 0);
					
				  this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/user-search.jsp").forward(request, response);
				 
			    break;
			    
			  case 3:
				  
				  
			    
				break;
			    
			  default:
				  System.out.println("Pas possible. Il y a un problème");
			}
									
	
		
		}
		else{
			response.sendRedirect(request.getContextPath() + "/Home");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		User usr = UserAction.findOneByUname("username", request.getParameter("username"));
		
		int count = 1;
		
		if(usr!=null){
			
			count=1;
			request.setAttribute("user", usr);
		}
		else
		{
			count=0;
			
		}
			
		request.setAttribute("count", count);
		  
			
		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/user-search.jsp").forward(request, response);

		
	}

}
