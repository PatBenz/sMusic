package be.btbf4.repositories;

import javax.persistence.EntityManager;

import be.btbf4.dao.GenericDaoJpaImpl;
import be.btbf4.entities.Artist;

public class ArtistRepository extends GenericDaoJpaImpl<Artist, Integer>{

	public ArtistRepository(){};
	
	public ArtistRepository(EntityManager em){
		this.entityManager = em;
	}
	
}
