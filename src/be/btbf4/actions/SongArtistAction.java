package be.btbf4.actions;


import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;

import be.btbf4.entities.Artist;
import be.btbf4.entities.ArtistType;
import be.btbf4.entities.Song;
import be.btbf4.entities.SongArtist;
import be.btbf4.repositories.SongArtistRepository;

import be.btbf4.utils.EmFactory;

public class SongArtistAction {
	
public static List<SongArtist> getSongArtists(){
		
		EntityManager em = EmFactory.createEm();
		SongArtistRepository sar = new SongArtistRepository(em);
		List<SongArtist> lsa = sar.findAll();
		
		if (em.isOpen()){
			System.out.println("CLOSED!");
			em.close();
		}
		
		return lsa;
	}
	
	public static SongArtist getOneSongArtist(int idSongArtist){
		
		EntityManager em = EmFactory.createEm();
		SongArtistRepository sar = new SongArtistRepository(em);
		SongArtist s = sar.find(idSongArtist);
		
		if (em.isOpen())
		{
			System.out.println("CLOSED!");
			em.close();
		}
		
		return s;
	}
	
	/** A faire, à faire, à faire*/
	public static void addSongArtist(HttpServletRequest request){
		
		SongArtist sa = new SongArtist();
	
		//Set Song data
		Integer songid = Integer.parseInt(request.getParameter("songID"));
		
		Song song = SongAction.getOneSong(songid);
		
		String name = request.getParameter("artistname");
		Artist art = ArtistAction.getOneArtist(name);
		//
		System.out.println("songID: " + request.getParameter("songID") + "| Title" + song.getTitle());
		
		//Set Artist: OK
		//----- new code--->
		//TODO: Editor; Artist & Genre OK.
		//----end new code--->
		
		
		if(art!=null){
			
			sa.setArtist(art);
			sa.setSong(song);
		}
		else{
			art = new Artist();
			
			if(name!="") 
				art.setName("UNKNOWN!");
					
			ArtistType general = ArtistTypeAction.getOneArtistType(1);
			
			art.setArtisttype(general);
			
			ArtistAction.insertArtist(art);
			
			sa.setArtist(art);
			sa.setSong(song);
			
		}
		
//		//Change Genre:Ok
//		Integer atid = Integer.parseInt(request.getParameter("genre"));			
//		Genre general = GenreAction.getOneGenre(atid);
//				
//		song.setGenre(general);
		
		SongArtistAction.insertSongArtist(sa);

	}


	
	public static void insertSongArtist(SongArtist sa) {
		
		EntityManager em = EmFactory.createEm();
		SongArtistRepository ur = new SongArtistRepository(em);
		em.getTransaction().begin();
		
		try {		
			ur.persist(sa);
		
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

	public static SongArtist getOneSongArtist(Song song) {
		
		EntityManager em = EmFactory.createEm();
		SongArtistRepository sar = new SongArtistRepository(em);
		SongArtist s = sar.findOneBy("song", song+"");
		
		if (em.isOpen())
		{
			System.out.println("CLOSED!");
			em.close();
		}
		
		return s;
	}

	public static void deleteSongArtist(HttpServletRequest request) {
		
		Song song = SongAction.getOneSong(Integer.parseInt(request.getParameter("songID")));
		EntityManager em = EmFactory.createEm();
		SongArtistRepository sr = new SongArtistRepository(em);
		em.getTransaction().begin();
		
		
		//System.out.println("nous sommes ici1");
		String[] arts = request.getParameterValues("artistname");
		//System.out.println("Tableau d'artistes = " + arts.length);
		//String[] albs = request.getParameterValues("albumtitle");
		
		if(arts!=null)
		{
			for(int i=0;i<arts.length;i++){
				//out.println(Integer.parseInt(a[i])); //If integer
				//Artist a = ArtistAction.getOneArtist(arts[i]);
				
				//SongArtist sa = SongArtistAction.getOneSongArtist(song);
				List<SongArtist> lsa = SongArtistAction.getSongArtists();
				System.out.println(" In da looooooop " +  arts[i]);
				//System.out.println(sa.getArtist());
				for (SongArtist sa : lsa) {
					//em.getTransaction().begin();
					
					if ((sa.getArtist().getIdArtist() == Integer
							.parseInt(arts[i]))&& sa.getSong().getIdSong()==song.getIdSong()) {

						try {
							
							sr.delete(sa);
							em.getTransaction().commit();
						
						} catch (Exception e) {

							System.out
									.println("Persist exception for deleteSongArtist :"
											+ e);
							if (em.getTransaction().isActive())
								em.getTransaction().rollback();
						}

						
					}
					if (!em.getTransaction().isActive())
						em.getTransaction().begin();
				}
			}
		}
		
		if (em.isOpen()) {
			System.out.println("CLOSED!");
			em.close();
		}
		
	}
	
}
