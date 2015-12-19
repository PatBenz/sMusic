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
import be.btbf4.actions.ArtistAction;
import be.btbf4.actions.GenreAction;
import be.btbf4.entities.Album;
import be.btbf4.entities.Artist;
import be.btbf4.entities.Genre;
import be.btbf4.entities.User;

/**
 * Servlet implementation class SongCatalog
 */
@WebServlet("/Catalog")
public class Catalog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Catalog() {
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
		
			String letter = request.getParameter("letter");
			//int num = Integer.parseInt(request.getParameter("num"));
			//--------------------------------------------------------------------------------------
			//List <Album> albs = AlbumAction.getAlbums();
			List <Album> albs = AlbumAction.getAlbumsSorted("title");
			
			if(letter!=null)
			{
				if(!request.getParameter("letter").equals("BA"))
					{
						request.setAttribute("letter",letter);
					
						albs=selectionner(albs, letter);
					}
			}
			else//by default
			{
			  request.setAttribute("letter","BA");
			
			}
			//---------------------------------------------------------------------------------------
			
					double max =Math.ceil(albs.size()/8);
					max+=1;
					//entier supérieur
					request.setAttribute("max", max);
					
					//si dépasse max
					if(request.getParameter("num")!=null){
						int num = Integer.parseInt(request.getParameter("num"));
						if(num > max) 
							num=(int) max;
						if(num < 1) 
							num = 1;
						request.setAttribute("num",num);
					}
					else
					  request.setAttribute("num",1);
					
					//passe liste d'obj
				
				request.setAttribute("user", Iuser);
				request.setAttribute("logged", true);
					
				request.setAttribute("lalbums", albs);
		}
		else{
			
			String letter = request.getParameter("letter");
			//int num = Integer.parseInt(request.getParameter("num"));
			//--------------------------------------------------------------------------------------
			//List <Album> albs = AlbumAction.getAlbums();
			List <Album> albs = AlbumAction.getAlbumsSorted("title");
			
			if(letter!=null)
			{
				if(!request.getParameter("letter").equals("BA"))
					{
						request.setAttribute("letter",letter);
					
						albs=selectionner(albs, letter);
					}
			}
			else//by default
			{
			  request.setAttribute("letter","BA");
			
			}
			//---------------------------------------------------------------------------------------
			
					double max =Math.ceil(albs.size()/8);
					max+=1;
					//entier supérieur
					request.setAttribute("max", max);
					
					//si dépasse max
					if(request.getParameter("num")!=null){
						int num = Integer.parseInt(request.getParameter("num"));
						if(num > max) 
							num=(int) max;
						if(num < 1) 
							num = 1;
						request.setAttribute("num",num);
					}
					else
					  request.setAttribute("num",1);
					
					//passe liste d'obj
				
				request.setAttribute("user", Iuser);
				request.setAttribute("logged", false);
					
				request.setAttribute("lalbums", albs);
			
			
			//response.sendRedirect(request.getContextPath() + "/Home");
		}
		
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/catalog2.jsp").forward(request, response);;
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	  private List<Album> selectionner(List<Album> albs, String letter){
	    	
	    	List<Album> temp = new ArrayList<Album>();
	    	
	    	for( Album a : albs ){
	    		
	    		if(a.getTitle().startsWith(letter))
	    			temp.add(a);
	    	}
	    	
	    	return temp;
	    }

}
