package be.btbf4.servlets;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import be.btbf4.actions.ArtistAction;
import be.btbf4.actions.GenreAction;
import be.btbf4.actions.SongAction;
import be.btbf4.actions.SongArtistAction;
import be.btbf4.entities.Artist;
import be.btbf4.entities.Genre;
import be.btbf4.entities.Song;
import be.btbf4.entities.SongArtist;
import be.btbf4.entities.User;

/**
 * Servlet implementation class AddSong
 */
@WebServlet("/AddSong")
/*@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB*/
public class AddSong extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String SAVE_DIR = "uploadeeedFiles";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSong() {
        
        
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
			
			//Integer songid = Integer.parseInt(request.getParameter("songid"));
			
			//Song sg = SongAction.getOneSong(songid.intValue());
			//SongAction.addSong(request);
			
			//request.setAttribute("song", sg);
			
			//On transfert tous les songartists
			List <SongArtist> sgarts = SongArtistAction.getSongArtists();
			request.setAttribute("songartists", sgarts);
			//On transfert tous les genres
			List <Genre> gens = GenreAction.getGenres();
			request.setAttribute("genres", gens);
			
			List <Artist> arts = ArtistAction.getArtists();
			request.setAttribute("artists", arts);
			
			 
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/song-add.jsp").forward(request, response);
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
			
			//SongAction.addSong(request);
					
			List <Song> songs = SongAction.getSongs();
			request.setAttribute("songs", songs);
			
			List <SongArtist> sgarts = SongArtistAction.getSongArtists();
			request.setAttribute("songartists", sgarts);
				
			String error = "<div class=\"alert alert-success\">	<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button> <h4>Success</h4>The operation completed successfully</div>";	
							
			request.setAttribute("success", error);
			
			//------------------------Let's upload the file-----------------------------------------------------------
			
						
			// gets absolute path of the web application
	        String appPath = request.getServletContext().getRealPath("");
	        // constructs path of the directory to save uploaded file
	        String savePath = appPath + File.separator + SAVE_DIR;

			FileItemFactory factory = new DiskFileItemFactory();

			// Set factory constraints
			// factory.setSizeThreshold(yourMaxMemorySize);
			// factory.setRepository(yourTempDirectory);

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload( factory );
			// upload.setSizeMax(yourMaxRequestSize);

			// Parse the request
			List<FileItem> uploadItems = new ArrayList<FileItem>();
			
			 // creates the save directory if it does not exists
	        File fileSaveDir = new File(savePath);
	        	if (!fileSaveDir.exists()) {
	            fileSaveDir.mkdir();
	        }
	        /*for (Part part : request.getParts()) {
	            String fileName = extractFileName(part);
	            part.write(savePath + File.separator + fileName);
	          //  System.out.println("fileName = "  + fileName);
	            
	        }*/
	        	System.out.println("He's here!");
	        	System.out.println(request.getParts().isEmpty());
	        	
	        	for (Part part : request.getParts()) {
		            String fileName = extractFileName(part);
		            part.write(savePath + File.separator + fileName);
		          
		              System.out.println("fileName = "  + fileName);
		            }
	        	
	        	System.out.println("He's here now!");
	    /*    	
			try {
				uploadItems = upload.parseRequest(request);
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			
			for( FileItem uploadItem : uploadItems )
			{					            
			  if( uploadItem.isFormField() )
			  {
			    String fieldName = uploadItem.getFieldName();
			    String value = uploadItem.getString();
			    System.out.println("FieldName = "  + fieldName +" && Value = " + value );
			  }
			}*/
			//request.getRequestDispatcher("/WEB-INF/JSP/song-list.jsp").forward(request, response);
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/song-list.jsp").forward(request, response);
			
			//-------------------------------------------------------------------------------------------
			 
			/**this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/song-list.jsp").forward(request, response);*/
		}
		else{
			response.sendRedirect(request.getContextPath() + "/Home");
		}
	}
	
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }

}
