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
 * Servlet implementation class SearchByArtist
 */
@WebServlet("/SearchByArtist")
public class SearchByArtist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchByArtist() {
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
			request.setAttribute("logged", true);
		}
		else{
			
			request.setAttribute("logged", false);
		}
		String letter = request.getParameter("letter");
		//int num = Integer.parseInt(request.getParameter("num"));
		//--------------------------------------------------------------------------------------
		//List <Artist> arts = ArtistAction.getArtists();
		List <Artist> arts = ArtistAction.getArtistsSorted("name");
		
		if(letter!=null)
		{
			if(!request.getParameter("letter").equals("BA"))
				{
					request.setAttribute("letter",letter);
				
					arts=selectionner(arts, letter);
				}
		}
		else//by default
		{
		  request.setAttribute("letter","BA");
		
		}
		//---------------------------------------------------------------------------------------
		
				double max =Math.ceil(arts.size()/8);
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
				
		
		  request.setAttribute("listeartistes", arts);
		

			request.setAttribute("user", Iuser);
			
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/artists2.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	  private List<Artist> selectionner(List<Artist> arts, String letter){
	    	
	    	List<Artist> temp = new ArrayList<Artist>();
	    	
	    	for( Artist a : arts ){
	    		
	    		if(a.getName().startsWith(letter))
	    			temp.add(a);
	    	}
	    	
	    	return temp;
	    }

}
