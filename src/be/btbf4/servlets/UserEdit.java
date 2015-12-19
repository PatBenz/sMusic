package be.btbf4.servlets;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import be.btbf4.actions.UserAction;
import be.btbf4.entities.User;

/**
 * Servlet implementation class UserEdit
 */
@WebServlet("/UserEdit")
public class UserEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserEdit() {
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
			 
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/user-edit.jsp").forward(request, response);
		}
		else{
			response.sendRedirect(request.getContextPath() + "/Home");
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
			System.out.println("Logged User = " + Iuser.getFirstName() + " | UserRole = " +Iuser.getRole().getRole());
			
			UserAction.updateUser(request);
			
			//String param = request.getParameter("usrid");
			
			Integer userid = Integer.parseInt(request.getParameter("userID"));
			
			User usr = UserAction.getOneUser(userid);
			
						
			request.setAttribute("user", usr);
			
			
			String error = "<div class=\"alert alert-success\">	<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button> <h4>Success</h4>The operation completed successfully</div>";
			
			
			//String error = "<p style=\"color:red;\">Veuillez remplir tous les champs de ce formulaire avant de le soumettre!</p>";
			
			request.setAttribute("success", error);
			 
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/user-profile.jsp").forward(request, response);
		}
		else{
			response.sendRedirect(request.getContextPath() + "/Home");
		}
		
		
	}
}
