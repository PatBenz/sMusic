package be.btbf4.repositories;

import javax.persistence.EntityManager;

import be.btbf4.dao.GenericDaoJpaImpl;
import be.btbf4.entities.Song;

public class SongRepository extends GenericDaoJpaImpl<Song, Integer> {
	public SongRepository(){};
	
	public SongRepository(EntityManager em){
		this.entityManager = em;
	}
}
