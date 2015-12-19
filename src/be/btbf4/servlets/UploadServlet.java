package be.btbf4.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import be.btbf4.actions.SongAction;
import be.btbf4.actions.SongArtistAction;
import be.btbf4.entities.Song;
import be.btbf4.entities.SongArtist;

@WebServlet("/UploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2,	// 2MB 
				 maxFileSize=1024*1024*10,		// 10MB
				 maxRequestSize=1024*1024*50)	// 50MB
public class UploadServlet extends HttpServlet {

	/**
	 * Name of the directory where uploaded files will be saved, relative to
	 * the web application directory.
	 */
	private static final String SAVE_DIR = "uploadFiles";
	
	/**
	 * handles file upload
	 */
	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		// gets absolute path of the web application
		String appPath = request.getServletContext().getRealPath("");
		// constructs path of the directory to save uploaded file
		//String savePath = appPath + File.separator + SAVE_DIR;
		
		String savePath = "C://Users//Pat";
		
		//----- Keep a copy of the request ----
			HttpServletRequest requestcopy =request;
		//--------------------------------------
		
		// creates the save directory if it does not exists
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		
		
	//try{	
		//System.out.println(request.getParts().isEmpty());
		
		/**for (Part part : request.getParts()) {
		Part part = request.getPart("file");
			String fileName = extractFileName(part);
			String lepathfinal=savePath + File.separator + fileName;
			part.write(savePath + File.separator + fileName);
			
			System.out.println("lepathfinal: " +lepathfinal);
			System.out.println("file name: "+fileName);
		}*/
	
	//}
	//catch(Exception e){e.printStackTrace();}
		

		FileItemFactory factory = new DiskFileItemFactory();

		// Set factory constraints
		// factory.setSizeThreshold(yourMaxMemorySize);
		// factory.setRepository(yourTempDirectory);

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload( factory );
		// upload.setSizeMax(yourMaxRequestSize);

		// Parse the request
		List<FileItem> uploadItems = new ArrayList<FileItem>();
		
		try {
			uploadItems = upload.parseRequest(request);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String fieldName="";
		String value="";
		
		//---
			String title ="";
			String year ="";
			String duration ="";
			String songPrice ="";
			String genre ="";
			//String artistname ="";
			String file ="";
		//---
		
		for( FileItem uploadItem : uploadItems )
		{
		  if( uploadItem.isFormField() )
		  {
			  fieldName = uploadItem.getFieldName();
			  value = uploadItem.getString();
		    System.out.println("FieldName = "  + fieldName +" && Value = " + value );
		    
		    if(fieldName.equals("title")){title=value; savePath += "\\"+value+".mp4";}
		    if(fieldName.equals("year"))year = value;
		    if(fieldName.equals("duration"))duration = value;
		    if(fieldName.equals("songPrice"))songPrice = value;
		    if(fieldName.equals("genre"))genre = value;
		   // if(fieldName.equals("artistname"))artistname = value;
		   // if(fieldName.equals("songU"))file = value;

		   // savePath += "\\test.mp4";
		    
		  }
		  else
		  { 
			byte[] bFile =  uploadItem.get();
			  //convert array of bytes into file
			
			System.out.println("savePath: "+savePath);
		    FileOutputStream fileOuputStream = new FileOutputStream(savePath); 
		    fileOuputStream.write(bFile);
		    fileOuputStream.close();
		  }
		}
		
		request.setAttribute("title", title);
		request.setAttribute("year", year);
		request.setAttribute("duration", duration);
		request.setAttribute("songPrice", songPrice);
		request.setAttribute("genre", genre);
		//request.setAttribute("artistname", artistname);
		request.setAttribute("songURL", savePath);
		//request.setAttribute("title", title);
		
		SongAction.addSong(request);
		//----------liste des songs et songartists ------------------------------------------------
		
		List <Song> songs = SongAction.getSongs();
		request.setAttribute("songs", songs);
		
		List <SongArtist> sgarts = SongArtistAction.getSongArtists();
		request.setAttribute("songartists", sgarts);
		
		//----------message de succès--------------------------------------------------------------
		request.setAttribute("message", "Upload has been done successfully!");
		
		String success = "<div class=\"alert alert-success\">	<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button> <h4>Success</h4>Upload has been done successfully</div>";	
		
		request.setAttribute("success", success);
		//----------fin message de succes----------------------------------------------------------------
		
		getServletContext().getRequestDispatcher("/WEB-INF/jsp/song-list.jsp").forward(request, response);
		
	}

	/**
	 * Extracts file name from HTTP header content-disposition
	 */
	/*private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length()-1);
			}
		}
		return "";
	}*/
}