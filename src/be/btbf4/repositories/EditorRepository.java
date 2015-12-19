package be.btbf4.repositories;

import javax.persistence.EntityManager;

import be.btbf4.dao.GenericDaoJpaImpl;

import be.btbf4.entities.Editor;

public class EditorRepository  extends GenericDaoJpaImpl<Editor, Integer> {

	public EditorRepository(){};
	
	public EditorRepository(EntityManager em){
		this.entityManager = em;
	}

}
