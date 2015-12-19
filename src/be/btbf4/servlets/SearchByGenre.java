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
import be.btbf4.actions.GenreAction;
import be.btbf4.entities.Album;
import be.btbf4.entities.Artist;
import be.btbf4.entities.Genre;
import be.btbf4.entities.User;

/**
 * Servlet implementation class SearchByGenre
 */
@WebServlet("/SearchByGenre")
public class SearchByGenre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchByGenre() {
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
			
		List <Genre> grs = GenreAction.getGenres();
		//request.setAttribute("genres", grs);
				
		List <Album> albs = AlbumAction.getAlbums();
		request.setAttribute("albums", albs);
  			
				//entier supérieur
				request.setAttribute("max", Math.ceil(grs.size()/5));
				
				//si pas de param de page page = 1 
				if(request.getParameter("num")!=null)
				  request.setAttribute("num",request.getParameter("num"));
				else
				  request.setAttribute("num",1);
				
				//passe liste d'obj
				request.setAttribute("listegenres", grs);
		
				request.setAttribute("user", Iuser);
				request.setAttribute("logged", true);
					
				this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/genre.jsp").forward(request, response);
												
		}
		else{
			
			
			
			List <Genre> grs = GenreAction.getGenres();
			//request.setAttribute("genres", grs);
					
			List <Album> albs = AlbumAction.getAlbums();
			request.setAttribute("albums", albs);
	  					
					//entier supérieur
					request.setAttribute("max", Math.ceil(grs.size()/5));
					
					//si pas de param de page page = 1 
					if(request.getParameter("num")!=null)
					  request.setAttribute("num",request.getParameter("num"));
					else
					  request.setAttribute("num",1);
					
					//passe liste d'obj
					request.setAttribute("listegenres", grs);
			
					request.setAttribute("user", Iuser);
					request.setAttribute("logged", false);
						
					this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/genre.jsp").forward(request, response);
						
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
