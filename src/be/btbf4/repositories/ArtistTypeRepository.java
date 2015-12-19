package be.btbf4.repositories;

import javax.persistence.EntityManager;

import be.btbf4.dao.GenericDaoJpaImpl;
import be.btbf4.entities.Artist;
import be.btbf4.entities.ArtistType;

public class ArtistTypeRepository extends GenericDaoJpaImpl<ArtistType, Integer>{

	public ArtistTypeRepository(){};
	
	public ArtistTypeRepository(EntityManager em){
		this.entityManager = em;
	}
	
}
