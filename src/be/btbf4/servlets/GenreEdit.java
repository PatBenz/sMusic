package be.btbf4.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import be.btbf4.actions.GenreAction;
import be.btbf4.entities.Genre;
import be.btbf4.entities.User;

/**
 * Servlet implementation class GenreEdit
 */
@WebServlet("/GenreEdit")
public class GenreEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenreEdit() {
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
			//String param = request.getParameter("usrid");
			
			Integer artistid = Integer.parseInt(request.getParameter("genreID"));
			
			Genre art = GenreAction.getOneGenre(artistid.intValue());
			
			request.setAttribute("genre", art);
			
			
			
			
//			List <ArtistType> ats = ArtistTypeAction.getArtistTypes();
//			request.setAttribute("arttypes", ats);
			
			
			 
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/genre-edit.jsp").forward(request, response);
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
			
			GenreAction.updateGenre(request);
			
			//String param = request.getParameter("usrid");
			
		//	Integer userid = Integer.parseInt(request.getParameter("artistID"));
			
			List <Genre> arts = GenreAction.getGenres();
			
			request.setAttribute("genres", arts);
			
			
			String error = "<div class=\"alert alert-success\">	<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button> <h4>Success</h4>The operation completed successfully</div>";
			
			
			//String error = "<p style=\"color:red;\">Veuillez remplir tous les champs de ce formulaire avant de le soumettre!</p>";
			
			request.setAttribute("success", error);
			 
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/genre-list.jsp").forward(request, response);
		}
		else{
			response.sendRedirect(request.getContextPath() + "/Home");
		}
	}

}
