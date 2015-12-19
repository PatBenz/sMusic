package be.btbf4.actions;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;

import be.btbf4.entities.Album;
import be.btbf4.entities.Artist;
import be.btbf4.entities.ArtistType;
import be.btbf4.entities.Editor;
import be.btbf4.entities.Genre;
import be.btbf4.repositories.AlbumRepository;
import be.btbf4.utils.EmFactory;

public class AlbumAction {

	public static List<Album> getAlbums() {

		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("btbf4");
		EntityManager em = emf.createEntityManager();
		AlbumRepository ar = new AlbumRepository(em);
		List<Album> la = new ArrayList<Album>();

		try {
			la = ar.findAll();
		}catch (Exception e){
			e.printStackTrace();
		} finally {
			em.close();
		}
		return la;
	}

	public static List<Album> getAlbumsSorted(String field) {

		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("btbf4");
		EntityManager em = emf.createEntityManager();
		AlbumRepository ar = new AlbumRepository(em);
		List<Album> la = new ArrayList<Album>();

		try {
			la = ar.findAllSorted(field);
		}catch (Exception e){
			e.printStackTrace();
		} finally {
			em.close();
		}
		return la;
	}

	public static List<Album> getAlbumsByGenre(Genre genre) {

		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("btbf4");
		EntityManager em = emf.createEntityManager();
		AlbumRepository ar = new AlbumRepository(em);

		System.out.println("idGenre: " + String.valueOf(genre.getIdGenre()));

		List<Album> la = new ArrayList<Album>();

		try {
			la = ar.findBy("genre", String.valueOf(genre.getIdGenre()));
		}catch (Exception e){
			e.printStackTrace();
		} finally {
			em.close();
		}
		return la;
	}

	public static Album getOneAlbum(int albumID) {

		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("btbf4");
		EntityManager em = emf.createEntityManager();
		AlbumRepository ar = new AlbumRepository(em);
		Album a = new Album();
		try {
			a = ar.find(albumID);
			
		} catch (Exception e){
			e.printStackTrace();
		} finally {

			em.close();
		}

		return a;
	}

	public static void setAlbum(Album album) {

		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("btbf4");
		EntityManager em = emf.createEntityManager();
		AlbumRepository ar = new AlbumRepository(em);

		try {
			EntityTransaction t = em.getTransaction();
			try {

				t.begin();
				ar.update(album);
				t.commit();
			
			}catch (Exception e){
				e.printStackTrace();

			} finally {
				System.out.println("Persist exception for deleteAlbum :");
				if (t.isActive())
					t.rollback();
			}
		}catch (Exception e){
			e.printStackTrace();

		} finally {
			em.close();
		}

	}

	public static void updateAlbum(HttpServletRequest request) {

		Album album = AlbumAction.getOneAlbum(Integer.parseInt(request
				.getParameter("albumID")));
		System.out.println("id album: " + request.getParameter("album")
				+ "| Title: " + album.getTitle());

		// Change album data
		album.setTitle(request.getParameter("title"));
		album.setImageURL(request.getParameter("imageURL"));
		album.setPrice(Float.parseFloat(request.getParameter("price")));
		album.setYear(Integer.parseInt(request.getParameter("year")));

		// Change Artist: OK
		// ----- new code--->
		// TODO: Editor; Artist & Genre OK.
		// ----end new code--->

		String name = request.getParameter("artistname");
		Artist art = ArtistAction.getOneArtist(name);
		if (art != null) {
			// Artist a = album.getArtist();
			album.setArtist(art);
		} else {
			art = new Artist();
			art.setName("UNKNOWN!");

			ArtistType general = ArtistTypeAction.getOneArtistType(1);

			art.setArtisttype(general);

			ArtistAction.insertArtist(art);

			album.setArtist(art);

		}

		// Change Editor
		String label = request.getParameter("editorlabel");
		Editor edit = EditorAction.getOneEditor(label);
		if (edit != null) {
			// Artist a = album.getArtist();
			album.setEditor(edit);
		} else {
			edit = new Editor();
			edit.setLabel("UNKNOWN!");

			// ArtistType general = ArtistTypeAction.getOneArtistType(1);
			// a.setArtisttype(general);
			EditorAction.insertEditor(edit);

			album.setEditor(edit);
		}

		/*
		 * Editor editor = album.getEditor();
		 * editor.setLabel(request.getParameter("editor"));
		 * album.setEditor(editor);
		 */

		// Change Genre:Ok
		Integer atid = Integer.parseInt(request.getParameter("genre"));
		Genre general = GenreAction.getOneGenre(atid);

		Genre g = album.getGenre();
		g.setIdGenre(atid);
		g.setLabel(general.getLabel());

		album.setGenre(g);

		// Save album
		AlbumAction.setAlbum(album);

	}

	public static void deleteAlbum(String albumID) {

		Album album = AlbumAction.getOneAlbum(Integer.parseInt(albumID));
		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("btbf4");
		EntityManager em = emf.createEntityManager();
		AlbumRepository ar = new AlbumRepository(em);
		try {
			EntityTransaction t = em.getTransaction();
			try {

				t.begin();
				ar.delete(album);
				t.commit();
				
			}catch (Exception e){
				e.printStackTrace();

			} finally {
				System.out.println("Persist exception for deleteAlbum :");
				if (t.isActive())
					t.rollback();
			}
			
		}catch (Exception e) {
			e.printStackTrace();

		} finally {
			em.close();
		}

	}

	public static void addAlbum(HttpServletRequest request) {
		Album album = new Album();

		// Set album data
		album.setTitle(request.getParameter("title"));
		album.setImageURL(request.getParameter("imageURL"));
		album.setPrice(Float.parseFloat(request.getParameter("price")));
		album.setYear(Integer.parseInt(request.getParameter("year")));

		// Set Artist: OK
		// ----- new code--->
		// TODO: Editor; Artist & Genre OK.
		// ----end new code--->

		String name = request.getParameter("artistname");
		Artist art = ArtistAction.getOneArtist(name);
		if (art != null) {
			// Artist a = album.getArtist();
			album.setArtist(art);
		} else {
			art = new Artist();
			art.setName("UNKNOWN!");

			ArtistType general = ArtistTypeAction.getOneArtistType(1);

			art.setArtisttype(general);

			ArtistAction.insertArtist(art);

			album.setArtist(art);

		}

		/*
		 * Artist artist = album.getArtist();
		 * artist.setName(request.getParameter("label"));
		 * 
		 * ArtistType at = artist.getArtisttype();
		 * at.setLabel(request.getParameter("label")); artist.setArtisttype(at);
		 * album.setArtist(artist);
		 */

		// Set Editor
		String label = request.getParameter("editorlabel");
		Editor edit = EditorAction.getOneEditor(label);
		if (edit != null) {
			// Artist a = album.getArtist();
			album.setEditor(edit);
		} else {
			edit = new Editor();
			edit.setLabel("UNKNOWN!");

			// ArtistType general = ArtistTypeAction.getOneArtistType(1);
			// a.setArtisttype(general);
			EditorAction.insertEditor(edit);

			album.setEditor(edit);
		}

		/*
		 * Editor editor = album.getEditor();
		 * editor.setLabel(request.getParameter("editor"));
		 * album.setEditor(editor);
		 */

		/*
		 * Editor editor = album.getEditor();
		 * editor.setLabel(request.getParameter("label"));
		 * album.setEditor(editor);
		 */

		// Change Genre:Ok
		Integer atid = Integer.parseInt(request.getParameter("genre"));
		Genre general = GenreAction.getOneGenre(atid);

		/*
		 * Genre g = new Genre(); g.setIdGenre(atid);
		 * g.setLabel(general.getLabel());
		 */

		album.setGenre(general);

		/*
		 * Genre genre = album.getGenre();
		 * genre.setLabel(request.getParameter("label")); album.setGenre(genre);
		 */

		// Enregistrer l'image
		// File file = new File(request.getParameter("imageURL"));

		AlbumAction.insertAlbum(album);

	}

	public static void insertAlbum(Album album) {

		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("btbf4");
		EntityManager em = emf.createEntityManager();
		AlbumRepository ar = new AlbumRepository(em);

		try {
			EntityTransaction t = em.getTransaction();
			try {

				t.begin();
				ar.persist(album);
				t.commit();
				
			}catch (Exception e){
				e.printStackTrace();

			} finally {
				System.out.println("Persist exception for deleteAlbum :");
				if (t.isActive())
					t.rollback();
			}
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			em.close();
		}

	}

	public static Album getOneAlbum(String name) {

		EntityManager em = EmFactory.createEm();
		AlbumRepository ar = new AlbumRepository(em);
		Album a = new Album();

		try {
			a = ar.findOneBy("title", name);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}

		return a;
	}

}
