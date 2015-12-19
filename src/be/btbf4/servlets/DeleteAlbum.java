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

import be.btbf4.actions.AlbumAction;
import be.btbf4.entities.Album;
import be.btbf4.entities.User;

/**
 * Servlet implementation class DeleteAlbum
 */
@WebServlet("/DeleteAlbum")
public class DeleteAlbum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAlbum() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User Iuser = (User)session.getAttribute("Iuser");
		
		if(Iuser!=null && Iuser.getRole().getRole().equals("administrateur"))
		{	
			System.out.println("Logged User = " + Iuser.getFirstName() + " | UserRole = " +Iuser.getRole().getRole());
			
			//deleter le user choisi
			String idstr = request.getParameter("albumID");
			
			AlbumAction.deleteAlbum(idstr);
			
			//Aller chercher les users pour les repasser à user-list.jsp
			List <Album> arts = new ArrayList<Album> ();
			
			//usrs = UserAction.getUsers();
			arts = AlbumAction.getAlbums();
			
			request.setAttribute("albums", arts);
			 
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/album-list.jsp").forward(request, response);
		}
		else{
			response.sendRedirect(request.getContextPath() + "/Home");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
