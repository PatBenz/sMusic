package be.btbf4.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import be.btbf4.actions.ArtistAction;
import be.btbf4.actions.ArtistTypeAction;
import be.btbf4.actions.SongAction;
import be.btbf4.entities.Artist;
import be.btbf4.entities.ArtistType;
import be.btbf4.entities.Song;
import be.btbf4.entities.User;

/**
 * Servlet implementation class AddArtist
 */
@WebServlet("/AddArtist")
public class AddArtist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddArtist() {
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
			
			//String param = request.getParameter("label");
			
			//Integer atid = Integer.parseInt(request.getParameter("label"));
			
		//	Artist
			
			//Song sg = SongAction.getOneSong(songid.intValue());
			//SongAction.addSong(request);
			
			//request.setAttribute("song", sg);
			
			List <ArtistType> ats = ArtistTypeAction.getArtistTypes();
			request.setAttribute("arttypes", ats);
			
			
			
			List <Artist> arts = ArtistAction.getArtists();
			request.setAttribute("artists", arts);
			
			 
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/artist-add.jsp").forward(request, response);
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
		
		if(Iuser!=null && Iuser.getRole().getRole().equals("administrateur"))
		{	
			System.out.println("Logged User = " + Iuser.getFirstName() + " | UserRole = " +Iuser.getRole().getRole());
			//String param = request.getParameter("usrid");
			
////////			Integer arttypeID = Integer.parseInt(request.getParameter("label"));
			
			//Song sg = SongAction.getOneSong(songid.intValue());
			
////////			System.out.println(arttypeID);
//			
//			ArtistType at = ArtistTypeAction.getOneArtistType(arttypeID);
//			
//			request.setAttribute("artisttype", at);
			
			ArtistAction.addArtist(request);
			
			List <Artist> arts = ArtistAction.getArtists();
			request.setAttribute("artists", arts);
			
			String error = "<div class=\"alert alert-success\">	<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button> <h4>Success</h4>The operation completed successfully</div>";
			
			
			//String error = "<p style=\"color:red;\">Veuillez remplir tous les champs de ce formulaire avant de le soumettre!</p>";
			
			request.setAttribute("success", error);
			 
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/artist-list.jsp").forward(request, response);
		}
		else{
			response.sendRedirect(request.getContextPath() + "/Home");
		}
	}

}
