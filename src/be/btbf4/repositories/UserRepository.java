package be.btbf4.repositories;

import javax.persistence.EntityManager;

import be.btbf4.dao.GenericDaoJpaImpl;
import be.btbf4.entities.User;

public class UserRepository extends GenericDaoJpaImpl<User, Integer>{

	public UserRepository(){};
	
	public UserRepository(EntityManager em){
		this.entityManager = em;
	}
	
}
