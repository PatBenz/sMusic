package be.btbf4.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import be.btbf4.actions.AlbumAction;
import be.btbf4.actions.AlbumSongAction;
import be.btbf4.entities.Album;
import be.btbf4.entities.AlbumSong;
import be.btbf4.entities.Song;

/**
 * Servlet implementation class AlbumSongs
 */
@WebServlet("/AlbumSongs")
public class AlbumSongs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlbumSongs() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Album album = new Album();
		
		album = AlbumAction.getOneAlbum(Integer.parseInt(request.getParameter("idAlbum")));
		
		System.out.println("Album = " + album);
		
		request.setAttribute("album", album);
		List<AlbumSong> asongs = AlbumSongAction.getOneAlbumSongs(request.getParameter("idAlbum"));
		
		System.out.println("Liste AlbumSong = " + asongs);
		
		request.setAttribute("asongs", asongs);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/album-songs.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
