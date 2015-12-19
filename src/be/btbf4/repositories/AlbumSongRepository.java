package be.btbf4.repositories;

import javax.persistence.EntityManager;

import be.btbf4.dao.GenericDaoJpaImpl;
import be.btbf4.entities.AlbumSong;

public class AlbumSongRepository extends GenericDaoJpaImpl<AlbumSong, Integer>{
	
	public AlbumSongRepository(){};
	
	public AlbumSongRepository(EntityManager em){
		this.entityManager = em;
	}

}
