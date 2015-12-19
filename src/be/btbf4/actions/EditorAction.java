package be.btbf4.actions;

import java.util.List;
import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import be.btbf4.entities.Editor;
import be.btbf4.repositories.EditorRepository;
import be.btbf4.utils.EmFactory;

public class EditorAction {

	public static List<Editor> getEditors() {


		EntityManager em = EmFactory.createEm();
		EditorRepository atr = new EditorRepository(em);
		List<Editor> lat = atr.findAll();

		if (em.isOpen()) {
			em.close();
		}

		return lat;
		
	}

	public static void addEditor(HttpServletRequest request) {
		
		Editor Editor = new Editor();
		
		Editor.setLabel(request.getParameter("label"));			
		
		EditorAction.insertEditor(Editor);
		
	}

	public static void insertEditor(Editor Editor) {
		
		EntityManager em = EmFactory.createEm();
		EditorRepository ar = new EditorRepository(em);
		em.getTransaction().begin();
		
		try {		
			ar.persist(Editor);
		
			em.getTransaction().commit();
			System.out.println("after commit");

		} catch (Exception e) {
			System.out.println("Persit Exception from InsertEditor :" +e);
			if(em.getTransaction().isActive())
				em.getTransaction().rollback();
	           
		}

		finally {
		    em.close();
		}
		
	}

	public static void deleteEditor(String idstr) {
		
		Editor Editor = EditorAction.getOneEditor(Integer.parseInt(idstr));
		EntityManager em = EmFactory.createEm();
		EditorRepository ar = new EditorRepository(em);
		em.getTransaction().begin();
		try {

			ar.delete(Editor);
			em.getTransaction().commit();

		} catch (Exception e) {
			System.out.println("Persist exception for deleteEditor :" +e);
			if(em.getTransaction().isActive())
				em.getTransaction().rollback();
		}

		finally {
		    em.close();
		}
		
	}

	public static Editor getOneEditor(int editID) {
		
		EntityManager em = EmFactory.createEm();
		EditorRepository ar = new EditorRepository(em);
		Editor a = ar.find(editID);
		
		if (em.isOpen())
		{
			em.close();
		}
		
		return a;
	}

	public static void updateEditor(HttpServletRequest request) {
		
		Editor artist = EditorAction.getOneEditor(Integer.parseInt(request
				.getParameter("editorID")));
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
		EditorAction.setEditor(artist);
		
	}

	private static void setEditor(Editor artist) {
		
		EntityManager em = EmFactory.createEm();
		EditorRepository ar = new EditorRepository(em);
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

	public static Editor getOneEditor(String label) {
		
		EntityManager em = EmFactory.createEm();
		EditorRepository ar = new EditorRepository(em);
		Editor a = ar.findOneBy("label", label);
		
		if (em.isOpen())
		{
			em.close();
		}
		
		return a;
	}



}
