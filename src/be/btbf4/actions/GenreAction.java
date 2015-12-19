package be.btbf4.actions;

import java.util.List;

import javax.persistence.EntityManager;



import javax.servlet.http.HttpServletRequest;

import be.btbf4.entities.Genre;
import be.btbf4.repositories.GenreRepository;
import be.btbf4.utils.EmFactory;

public class GenreAction {

	public static List<Genre> getGenres() {
		EntityManager em = EmFactory.createEm();
		GenreRepository atr = new GenreRepository(em);
		List<Genre> lat = atr.findAll();

		if (em.isOpen()) {
			em.close();
		}

		return lat;
	}

	public static Genre getOneGenre(Integer atid) {
		
		EntityManager em = EmFactory.createEm();
		GenreRepository atr = new GenreRepository(em);
		Genre a = atr.find(atid);

		if (em.isOpen()) {
			em.close();
		}

		return a;
	}

	public static void addGenre(HttpServletRequest request) {
		
		Genre g = new Genre();
		
		g.setLabel(request.getParameter("label"));			
		
		GenreAction.insertGenre(g);
		
	}

	private static void insertGenre(Genre g) {
		
		EntityManager em = EmFactory.createEm();
		GenreRepository ar = new GenreRepository(em);
		em.getTransaction().begin();
		
		try {		
			ar.persist(g);
		
			em.getTransaction().commit();
			System.out.println("after commit");

		} catch (Exception e) {
			System.out.println("Persit Exception from InsertGenre :" +e);
			if(em.getTransaction().isActive())
				em.getTransaction().rollback();
	           
		}

		finally {
		    em.close();
		}
		
	}

	public static void updateGenre(HttpServletRequest request) {
		
		Genre artist = GenreAction.getOneGenre(Integer.parseInt(request
				.getParameter("genreID")));
		System.out.println("id Artist: " + request.getParameter("Artist") + "| Title" + artist.getLabel());

		//Change editor data
		artist.setLabel(request.getParameter("label"));
		
		
		//Change Artist type
//		Integer atid = Integer.parseInt(request.getParameter("label"));			
//		ArtistType general = ArtistTypeAction.getOneArtistType(atid);
//		ArtistType at = artist.getArtisttype();
//		at.setIdArtistType(atid);
//		at.setLabel(general.getLabel());
//		artist.setArtisttype(at);

		//Save changes	
		GenreAction.setGenre(artist);
		
	}

	private static void setGenre(Genre artist) {
		
		EntityManager em = EmFactory.createEm();
		GenreRepository ar = new GenreRepository(em);
		em.getTransaction().begin();
		try {

			ar.update(artist);
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

	public static void deleteGenre(String idstr) {
		
		Genre g = GenreAction.getOneGenre(Integer.parseInt(idstr));
		EntityManager em = EmFactory.createEm();
		GenreRepository ar = new GenreRepository(em);
		em.getTransaction().begin();
		try {

			ar.delete(g);
			em.getTransaction().commit();

		} catch (Exception e) {
			System.out.println("Persist exception for deleteGenre :" +e);
			if(em.getTransaction().isActive())
				em.getTransaction().rollback();
		}

		finally {
		    em.close();
		}
		
	}

}
