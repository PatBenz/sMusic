package be.btbf4.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import be.btbf4.actions.AlbumSongAction;
import be.btbf4.actions.SongAction;
import be.btbf4.actions.SongArtistAction;
import be.btbf4.entities.AlbumSong;
import be.btbf4.entities.Song;
import be.btbf4.entities.SongArtist;
import be.btbf4.entities.User;

/**
 * Servlet implementation class SongList
 */
@WebServlet("/Associations")
public class Associations extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Associations() {
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
					
				
				List <AlbumSong> sgalbs = AlbumSongAction.getAlbumSongs();
				request.setAttribute("songalbums", sgalbs);
			
				List <SongArtist> sgarts = SongArtistAction.getSongArtists();
				request.setAttribute("songartists", sgarts);
			
				List <Song> songs = SongAction.getSongs();
				request.setAttribute("songs", songs);
				//  request.setAttribute("count", 0);
					
				  this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/associations.jsp").forward(request, response);
												
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
