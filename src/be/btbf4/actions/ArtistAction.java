package be.btbf4.actions;

import java.util.List;

import javax.persistence.EntityManager;


import javax.servlet.http.HttpServletRequest;
import be.btbf4.entities.Artist;
//import be.btbf4.entities.Artist;
import be.btbf4.entities.ArtistType;
//import be.btbf4.entities.Editor;
//import be.btbf4.entities.Genre;
import be.btbf4.repositories.ArtistRepository;
import be.btbf4.utils.EmFactory;

public class ArtistAction {

public static List<Artist> getArtists(){
		
		EntityManager em = EmFactory.createEm();
		ArtistRepository ar = new ArtistRepository(em);
		List<Artist> la = ar.findAll();
		
		if (em.isOpen()){
			em.close();
		}
		
		return la;
	}
	
	public static Artist getOneArtist(int ArtistID){
		
		EntityManager em = EmFactory.createEm();
		ArtistRepository ar = new ArtistRepository(em);
		Artist a = ar.find(ArtistID);
		
		if (em.isOpen())
		{
			em.close();
		}
		
		return a;
	}
	
	public static void setArtist(Artist Artist) {

		EntityManager em = EmFactory.createEm();
		ArtistRepository ar = new ArtistRepository(em);
		em.getTransaction().begin();
		try {

			ar.update(Artist);
			em.getTransaction().commit();

		} catch (Exception e) {
			System.out.println("Persist exception for deleteArtist :" +e);
			if(em.getTransaction().isActive())
				em.getTransaction().rollback();
		}

//		if (em.isOpen()) {
//			em.close();
		finally {
		    em.close();
		}
		

	}
	
	public static void updateArtist(HttpServletRequest request) {

		Artist artist = ArtistAction.getOneArtist(Integer.parseInt(request
				.getParameter("artistID")));
		System.out.println("id Artist: " + request.getParameter("Artist") + "| Title" + artist.getName());

		//Change artist data
		artist.setName(request.getParameter("name"));
		
		
		//Change Artist type
		Integer atid = Integer.parseInt(request.getParameter("label"));			
		ArtistType general = ArtistTypeAction.getOneArtistType(atid);
		ArtistType at = artist.getArtisttype();
		at.setIdArtistType(atid);
		at.setLabel(general.getLabel());
		artist.setArtisttype(at);

		//Save changes	
		ArtistAction.setArtist(artist);

	}
	
	public static void deleteArtist(String ArtistID) {
		
		Artist Artist = ArtistAction.getOneArtist(Integer.parseInt(ArtistID));
		EntityManager em = EmFactory.createEm();
		ArtistRepository ar = new ArtistRepository(em);
		em.getTransaction().begin();
		try {

			ar.delete(Artist);
			em.getTransaction().commit();

		} catch (Exception e) {
			System.out.println("Persist exception for deleteArtist :" +e);
			if(em.getTransaction().isActive())
				em.getTransaction().rollback();
		}

		finally {
		    em.close();
		}

	}
	
	public static void addArtist(HttpServletRequest request){
		Artist artist = new Artist();
	

		artist.setName(request.getParameter("name"));
			
		//artist.setArtisttype((ArtistType) request.getAttribute("artisttype"));
		
		
		//ArtistType at = artist.getArtisttype();
		
		//at.setLabel(request.getParameter("label"));

		Integer arttypeID = Integer.parseInt(request.getParameter("label"));
		
		ArtistType at = ArtistTypeAction.getOneArtistType(arttypeID);
		
		//Song sg = SongAction.getOneSong(songid.intValue());

		////////System.out.println(arttypeID);
		
				
		
		artist.setArtisttype(at);
		//artist.setArtisttype(request.);
		//ArtistType at = new ArtistType();
		//at.setLabel(request.getParameter("label"));
				
		System.out.println("ArtistTypeID: " + at.getIdArtistType() + "| Name:" + artist.getName());
		
		ArtistAction.insertArtist(artist);

	}
	
	public static void insertArtist(Artist artist) {
		
		EntityManager em = EmFactory.createEm();
		ArtistRepository ar = new ArtistRepository(em);
		em.getTransaction().begin();
		
		try {		
			ar.persist(artist);
		
			em.getTransaction().commit();
			System.out.println("after commit");

		} catch (Exception e) {
			System.out.println("Persit Exception from InsertArtist :" +e);
			if(em.getTransaction().isActive())
				em.getTransaction().rollback();
	           
		}

		finally {
		    em.close();
		}

	}

	public static Artist getOneArtist(String name) {
		
		EntityManager em = EmFactory.createEm();
		ArtistRepository ar = new ArtistRepository(em);
		Artist a = ar.findOneBy("name", name);
		
		if (em.isOpen())
		{
			em.close();
		}
		
		return a;
	}

	public static List<Artist> getArtistsSorted(String field) {
		
		EntityManager em = EmFactory.createEm();
		ArtistRepository ar = new ArtistRepository(em);
		List<Artist> la = ar.findAllSorted(field);
		
		if (em.isOpen()){
			em.close();
		}
		
		return la;
	}

}
