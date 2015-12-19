package be.btbf4.repositories;

import javax.persistence.EntityManager;

import be.btbf4.dao.GenericDaoJpaImpl;
import be.btbf4.entities.Genre;
//import be.btbf4.entities.ArtistType;

public class GenreRepository extends GenericDaoJpaImpl<Genre, Integer>{

	public GenreRepository(){};
	
	public GenreRepository(EntityManager em){
		this.entityManager = em;
	}
	
}
