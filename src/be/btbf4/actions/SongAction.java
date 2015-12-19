package be.btbf4.actions;


//import java.text.DecimalFormat;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import be.btbf4.entities.Artist;
import be.btbf4.entities.ArtistType;
import be.btbf4.entities.Genre;
import be.btbf4.entities.Song;
import be.btbf4.entities.SongArtist;
import be.btbf4.repositories.SongRepository;
import be.btbf4.utils.EmFactory;

public class SongAction {
	
	private static final int MEMORY_THRESHOLD = 0;
	private static final long MAX_FILE_SIZE = 0;
	private static final long MAX_REQUEST_SIZE = 0;
	private static final String UPLOAD_DIRECTORY = "Dawnlodez";

	public static List<Song> getSongs(){
		
		EntityManager em = EmFactory.createEm();
		SongRepository sr = new SongRepository(em);
		List<Song> ls = sr.findAll();
		
		if (em.isOpen()){
			em.close();
		}
		
		return ls;
	}
	
	public static Song getOneSong(int songID){
		
		EntityManager em = EmFactory.createEm();
		SongRepository sr = new SongRepository(em);
		Song s = sr.find(songID);
		
		if (em.isOpen())
		{
			em.close();
		}
		
		return s;
	}
	
	public static void setSong(Song song) {

		EntityManager em = EmFactory.createEm();
		SongRepository sr = new SongRepository(em);
		em.getTransaction().begin();
		try {

			sr.update(song);
			em.getTransaction().commit();

		} catch (Exception e) {
			System.out.println("Persist exception for deleteSong :" +e);
			if(em.getTransaction().isActive())
				em.getTransaction().rollback();
		}

		finally {
		    em.close();
		}

	}
	
	public static void updateSong(HttpServletRequest request) {

		Song song = SongAction.getOneSong(Integer.parseInt(request
				.getParameter("songID")));
		System.out.println("id song: " + request.getParameter("song") + "| Title" + song.getTitle());

		song.setTitle(request.getParameter("title"));
		song.setDuration(request.getParameter("duration"));
		song.setSongPrice(Double.parseDouble(request.getParameter("songPrice")));			
		//song.setTrackNumber(Integer.parseInt(request.getParameter("trackNumber")));
		song.setYear(Integer.parseInt(request.getParameter("year")));	
		song.setSongURL(request.getParameter("songURL"));
		
	//	SongArtist sa = SongArtistAction.getOneSongArtist(song);
		//Change Artist: OK
				//----- new code--->
				//TODO: Editor; Artist & Genre OK.
				//----end new code--->
				String name = request.getParameter("artistname");
				Artist art = ArtistAction.getOneArtist(name);
				
				if(art!=null){
					//Artist a = album.getArtist();
					//sa.setArtist(art);
					//sa.setSong(song);
					//song.setArtist(art);
				}
				else{
					art = new Artist();
					art.setName("UNKNOWN!");
							
					ArtistType general = ArtistTypeAction.getOneArtistType(1);
					
					art.setArtisttype(general);
					
					ArtistAction.insertArtist(art);
					
					//album.setArtist(art);
					
				}
		
		
		//Change Genre:Ok
		Integer atid = Integer.parseInt(request.getParameter("genre"));			
		Genre general = GenreAction.getOneGenre(atid);
		
		Genre g = song.getGenre();
		g.setIdGenre(atid);
		g.setLabel(general.getLabel());
		
		song.setGenre(g);
		
			
		SongAction.setSong(song);

	}
	
	public static void deleteSong(String songID) {
		
		Song song = SongAction.getOneSong(Integer.parseInt(songID));
		EntityManager em = EmFactory.createEm();
		SongRepository sr = new SongRepository(em);
		em.getTransaction().begin();
		try {

			sr.delete(song);
			em.getTransaction().commit();

		} catch (Exception e) {
			System.out.println("Persist exception for deleteSong :" +e);
			if(em.getTransaction().isActive())
				em.getTransaction().rollback();
		}

		finally {
		    em.close();
		}

	}
	
	public static void addSong(HttpServletRequest request){
		Song song = new Song();
	
		song.setTitle((String) request.getAttribute("title"));
		//System.out.println("title:"+ request.getParameter("title"));
		song.setDuration((String) request.getAttribute("duration"));
		//System.out.println("songPrice:"+ request.getParameter("songPrice"));
		song.setSongPrice(Double.parseDouble((String) request.getAttribute("songPrice")));
		//song.setTrackNumber(Integer.parseInt(request.getParameter("trackNumber")));
		song.setYear(Integer.parseInt((String) request.getAttribute("year")));
		song.setSongURL((String) request.getAttribute("songURL"));
		/*
		//Set Song data-------------------------------------------------------------
		song.setTitle(request.getParameter("title"));
		System.out.println("title:"+ request.getParameter("title"));
		song.setDuration(request.getParameter("duration"));
		System.out.println("songPrice:"+ request.getParameter("songPrice"));
		song.setSongPrice(Double.parseDouble(request.getParameter("songPrice")));
		//song.setTrackNumber(Integer.parseInt(request.getParameter("trackNumber")));
		song.setYear(Integer.parseInt(request.getParameter("year")));
		song.setSongURL(request.getParameter("songURL"));
		//-------------------------------------------------------------------*/
		
		//System.out.println("songID: " + request.getParameter("songID") + "| Title" + song.getTitle());
		
		//SongArtist sa = new SongArtist();
		
		//Set Artist: OK
		//----- new code--->
		//TODO: Editor; Artist & Genre OK.
		//----end new code--->
		
		//String name = (String) request.getAttribute(("artistname"));
		//Artist art = ArtistAction.getOneArtist(name);
		/*if(art!=null){
			
			sa.setArtist(art);
			sa.setSong(song);
			//Artist a = album.getArtist();
			//song.setArtist(art);
		}
		else{
			art = new Artist();
			art.setName("UNKNOWN!");
					
			ArtistType general = ArtistTypeAction.getOneArtistType(1);
			
			art.setArtisttype(general);
			
			ArtistAction.insertArtist(art);
			
			sa.setArtist(art);
			sa.setSong(song);
			
		}*/
		
		//Change Genre:Ok
		Integer atid = Integer.parseInt((String) request.getAttribute(("genre")));			
		Genre general = GenreAction.getOneGenre(atid);
		
//		Genre g = song.getGenre();
//		g.setIdGenre(atid);
//		g.setLabel(general.getLabel());
		
		song.setGenre(general);
		
		SongAction.insertSong(song);
		//SongArtistAction.insertSongArtist(sa);

	}
	
	private static void insertSong(Song song) {
		
		EntityManager em = EmFactory.createEm();
		SongRepository ur = new SongRepository(em);
		em.getTransaction().begin();
		
		try {		
			ur.persist(song);
		
			em.getTransaction().commit();
			System.out.println("after commit");

		} catch (Exception e) {
			System.out.println("Persit Exception from InsertSong :" +e);
			if(em.getTransaction().isActive())
				em.getTransaction().rollback();
	           
		}
		finally {
		    em.close();
		}

	}

	public static void uploadFile(HttpServletRequest request, HttpServletResponse response, ServletContext servletContext) throws IOException {
		 // checks if the request actually contains upload file
        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }
 
        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);
 
        // constructs the directory path to store upload file
        // this path is relative to application's directory
        String uploadPath = servletContext.getRealPath("")
                + File.separator + UPLOAD_DIRECTORY;
        
        System.out.println("uploadPath: "+uploadPath);
         
        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
 
        try {
            // parses the request's content to extract file data
           /** @SuppressWarnings("unchecked")*/
            List<FileItem> formItems = upload.parseRequest((RequestContext) request);
 
            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
 
                        // saves the file on disk
                        item.write(storeFile);
                        request.setAttribute("message",
                            "Upload has been done successfully!");
                    }
                }
            }
        } catch (Exception ex) {
            request.setAttribute("message",
                    "There was an error: " + ex.getMessage());
        }
        // redirects client to message page
       // getServletContext().getRequestDispatcher("/message.jsp").forward(
         //       request, response);
		
	}

	/*public static List<Artist> getArtists(String songID) {
		
		EntityManager em = EmFactory.createEm();
		SongArtistRepository sar = new SongArtistRepository(em);
		List<SongArtist> ls = sar.findBy("Song_songID", songID);
		
		if (em.isOpen()){
			em.close();
		}
		
		return ls;
	}*/


	
	
	

}
