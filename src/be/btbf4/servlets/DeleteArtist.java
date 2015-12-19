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

import be.btbf4.actions.ArtistAction;

import be.btbf4.entities.Artist;

import be.btbf4.entities.User;

/**
 * Servlet implementation class DeleteArtist
 */
@WebServlet("/DeleteArtist")
public class DeleteArtist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteArtist() {
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
			String idstr = request.getParameter("artistID");
			
			ArtistAction.deleteArtist(idstr);
			
			//Aller chercher les users pour les repasser à user-list.jsp
			List <Artist> arts = new ArrayList<Artist> ();
			
			//usrs = UserAction.getUsers();
			arts = ArtistAction.getArtists();
			
			request.setAttribute("artists", arts);
			 
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/artist-list.jsp").forward(request, response);
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
