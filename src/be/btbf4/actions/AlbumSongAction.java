package be.btbf4.actions;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;

import be.btbf4.entities.Album;
import be.btbf4.entities.AlbumSong;
import be.btbf4.entities.Song;
import be.btbf4.repositories.AlbumSongRepository;
import be.btbf4.utils.EmFactory;

public class AlbumSongAction {

	public static List<AlbumSong> getOneAlbumSongs(String idAlbum) {
		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("btbf4");
		EntityManager em = emf.createEntityManager();
		AlbumSongRepository asr = new AlbumSongRepository(em);
		List<AlbumSong> las = new ArrayList<AlbumSong>();

		try {
			las = asr.findBy("album", idAlbum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}

		return las;

	}

	public static List<AlbumSong> getAlbumSongs() {

		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("btbf4");
		EntityManager em = emf.createEntityManager();
		AlbumSongRepository asr = new AlbumSongRepository(em);
		List<AlbumSong> las = new ArrayList<AlbumSong>();

		try {
			las = asr.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return las;
	}

	public static AlbumSong getOneAlbumSong(int idAlbumSong) {

		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("btbf4");
		EntityManager em = emf.createEntityManager();
		AlbumSongRepository asr = new AlbumSongRepository(em);
		AlbumSong as = new AlbumSong();

		try {
			as = asr.find(idAlbumSong);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}

		return as;
	}

	public static void setAlbumSong(AlbumSong albumSong) {

		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("btbf4");
		EntityManager em = emf.createEntityManager();
		AlbumSongRepository asr = new AlbumSongRepository(em);

		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				asr.update(albumSong);
				t.commit();
			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				if (t.isActive())
					t.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			em.close();
		}

	}

	/** A faire, à faire, à faire */
	public static void addAlbumSong(HttpServletRequest request) {

		AlbumSong as = new AlbumSong();

		// Set Song data
		Integer songid = Integer.parseInt(request.getParameter("songID"));
		Song song = SongAction.getOneSong(songid);

		String title = request.getParameter("albumtitle");
		Album alb = AlbumAction.getOneAlbum(title);

		Integer trackNum = Integer
				.parseInt(request.getParameter("tracknumber"));
		//
		System.out.println("songID: " + request.getParameter("songID")
				+ "| Title" + song.getTitle());

		// Set Artist: OK
		// ----- new code--->
		// TODO: Editor; Artist & Genre OK.
		// ----end new code--->

		if (alb != null) {

			as.setAlbum(alb);
			as.setSong(song);
			as.setTrackNumber(trackNum);
		} else {
			alb = new Album();

			if (title != "")
				alb.setTitle("UNKNOWN!");

			// ArtistType general = ArtistTypeAction.getOneArtistType(1);

			// alb.setArtisttype(general);

			AlbumAction.insertAlbum(alb);

			as.setAlbum(alb);
			as.setSong(song);

		}

		AlbumSongAction.insertAlbumSong(as);

	}

	private static void insertAlbumSong(AlbumSong as) {

		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("btbf4");
		EntityManager em = emf.createEntityManager();
		AlbumSongRepository ur = new AlbumSongRepository(em);

		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				ur.persist(as);
				t.commit();
				System.out.println("after commit");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				System.out.println("Persist exception for deleteAlbumSong :");
				if (t.isActive())
					t.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}

	}

	public static void deleteAlbumSong(HttpServletRequest request) {

		Song song = SongAction.getOneSong(Integer.parseInt(request
				.getParameter("songID")));
		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("btbf4");
		EntityManager em = emf.createEntityManager();
		AlbumSongRepository sr = new AlbumSongRepository(em);

		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				String[] albs = request.getParameterValues("albumtitle");
				if (albs != null) {
					for (int i = 0; i < albs.length; i++) {
						List<AlbumSong> lsa = AlbumSongAction.getAlbumSongs();
						System.out.println(" In da looooooop " + albs[i]);
						for (AlbumSong sa : lsa) {
							if ((sa.getAlbum().getIdAlbum() == Integer
									.parseInt(albs[i]))
									&& sa.getSong().getIdSong() == song
											.getIdSong()) {

								try {
									sr.delete(sa);
									t.commit();

								} catch (Exception e) {
									e.printStackTrace();
									System.out
											.println("Persist exception for deleteSongArtist :"
													+ e);
								} finally {
									if (t.isActive())
										t.rollback();
								}
							}
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (t.isActive())
					t.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}

	}
}
