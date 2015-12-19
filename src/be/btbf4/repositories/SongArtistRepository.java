package be.btbf4.repositories;

import javax.persistence.EntityManager;

import be.btbf4.dao.GenericDaoJpaImpl;
import be.btbf4.entities.SongArtist;

public class SongArtistRepository extends GenericDaoJpaImpl<SongArtist, Integer> {
	
	public SongArtistRepository(){};
	
	public SongArtistRepository(EntityManager em){
		this.entityManager = em;
	}

}
