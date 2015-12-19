package be.btbf4.repositories;

import javax.persistence.EntityManager;

import be.btbf4.dao.GenericDaoJpaImpl;
import be.btbf4.entities.Album;

public class AlbumRepository extends GenericDaoJpaImpl<Album, Integer>{

	public AlbumRepository(){};
	
	public AlbumRepository(EntityManager em){
		this.entityManager = em;
	}
	
}
