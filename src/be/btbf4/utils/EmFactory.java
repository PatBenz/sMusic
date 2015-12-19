package be.btbf4.utils;

import javax.persistence.*;

public class EmFactory {
	
	public static EntityManager createEm(){
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("btbf4");
		EntityManager em = emf.createEntityManager();
		return em;
	}

}
