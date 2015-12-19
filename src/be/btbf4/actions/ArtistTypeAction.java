package be.btbf4.actions;

import java.util.List;

import javax.persistence.EntityManager;

import be.btbf4.entities.Artist;
import be.btbf4.entities.ArtistType;
import be.btbf4.repositories.ArtistRepository;
import be.btbf4.repositories.ArtistTypeRepository;
import be.btbf4.utils.EmFactory;

public class ArtistTypeAction {

	
	public static List<ArtistType> getArtistTypes() {

		EntityManager em = EmFactory.createEm();
		ArtistTypeRepository atr = new ArtistTypeRepository(em);
		List<ArtistType> lat = atr.findAll();

		if (em.isOpen()) {
			em.close();
		}

		return lat;
	}

	public static ArtistType getOneArtistType(int artistTypeID) {

		EntityManager em = EmFactory.createEm();
		ArtistTypeRepository atr = new ArtistTypeRepository(em);
		ArtistType a = atr.find(artistTypeID);

		if (em.isOpen()) {
			em.close();
		}

		return a;
}

	public static ArtistType getOneArtistType(String label) {
		
		EntityManager em = EmFactory.createEm();
		ArtistTypeRepository atr = new ArtistTypeRepository(em);
		ArtistType a = atr.findOneBy("label", label);

		if (em.isOpen()) {
			em.close();
		}

		return a;
		
	}
}
