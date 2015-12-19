package be.btbf4.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import be.btbf4.actions.AlbumAction;
import be.btbf4.actions.ArtistAction;
import be.btbf4.actions.EditorAction;
import be.btbf4.actions.GenreAction;
import be.btbf4.entities.Album;
import be.btbf4.entities.Artist;
import be.btbf4.entities.Editor;
import be.btbf4.entities.Genre;
import be.btbf4.entities.User;

/**
 * Servlet implementation class AlbumEdit
 */
@WebServlet("/AlbumEdit")
public class AlbumEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlbumEdit() {
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
			
			Integer albumid = Integer.parseInt(request.getParameter("albumID"));
			
			Album art = AlbumAction.getOneAlbum(albumid.intValue());
			
			request.setAttribute("album", art);
			
			//On transfert tous les genres
			List <Genre> gens = GenreAction.getGenres();
			request.setAttribute("genres", gens);
			
			//On transfers tous les artistes
			List <Artist> arts = ArtistAction.getArtists();
			request.setAttribute("artists", arts);
			
			List <Editor> edits = EditorAction.getEditors();
			request.setAttribute("editors", edits);
			
			
			 
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/album-edit.jsp").forward(request, response);
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
			
			
			
			AlbumAction.updateAlbum(request);
			
			//String param = request.getParameter("usrid");
			
		//	Integer userid = Integer.parseInt(request.getParameter("artistID"));
			
			List <Album> arts = AlbumAction.getAlbums();
			
			request.setAttribute("albums", arts);
			
			
			String error = "<div class=\"alert alert-success\">	<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button> <h4>Success</h4>The operation completed successfully</div>";
			
			
			//String error = "<p style=\"color:red;\">Veuillez remplir tous les champs de ce formulaire avant de le soumettre!</p>";
			
			request.setAttribute("success", error);
			 
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/album-list.jsp").forward(request, response);
		}
		else{
			response.sendRedirect(request.getContextPath() + "/Home");
		}
	}

}
