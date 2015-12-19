package be.btbf4.actions;

import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;

import be.btbf4.entities.Role;
import be.btbf4.entities.User;
import be.btbf4.repositories.UserRepository;
import be.btbf4.utils.EmFactory;

public class UserAction {

	public static List<User>getUsers(){
		//voici un commentaire bidon.
		EntityManager em = EmFactory.createEm();
		UserRepository ur = new UserRepository(em);
		List<User> lu = ur.findAll();
		
		if (em.isOpen()){
			em.close();
		}
		
		return lu;
	}
	
	public static List<User>getNonAdminUsers(){
		//voici un commentaire bidon.
		EntityManager em = EmFactory.createEm();
		UserRepository ur = new UserRepository(em);
		List<User> lu = ur.findBy("role", "2");
		
		if (em.isOpen()){
			em.close();
		}
		
		return lu;
	}
	
//	public static List<User>get(){
//		//voici un commentaire bidon.
//		EntityManager em = EmFactory.createEm();
//		UserRepository ur = new UserRepository(em);
//		List<User> lu = ur.findBy("role", "2");
//		
//		if (em.isOpen()){
//			em.close();
//		}
//		
//		return lu;
//	}
//	

	public static User getOneUser(int userID){
		
		EntityManager em = EmFactory.createEm();
		UserRepository ur = new UserRepository(em);
		User u = new User();
		em.getTransaction().begin();
		try {

			u = ur.find(userID);
			em.getTransaction().commit();

		} catch (Exception e) {
			System.out.println("Persist exception for deleteUser :" +e);
			if(em.getTransaction().isActive())
				em.getTransaction().rollback();
		}
		
		
		finally {
		    em.close();
		}
		
		return u;
	}
	
	public static void setUser(User user) {

		EntityManager em = EmFactory.createEm();
		UserRepository ur = new UserRepository(em);
		em.getTransaction().begin();
		try {
			
			System.out.println("user's last name:"+  user.getLastName());
			ur.update(user);
			em.getTransaction().commit();

		} catch (Exception e) {

			if(em.getTransaction().isActive())
				em.getTransaction().rollback();

			System.out.println("Persist exception for deleteUser :" +e);
			if(em.getTransaction().isActive())
				em.getTransaction().rollback();

		}

		finally {
		    em.close();
		}
	}
	
	public static void updateUser(HttpServletRequest request) {

		User user = UserAction.getOneUser(Integer.parseInt(request
				.getParameter("userID")));
		System.out.println("id user: " + request.getParameter("userID") + "| Name" + user.getUsername());

		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setEmail(request.getParameter("email"));
		user.setFirstName(request.getParameter("firstname"));
		user.setLastName(request.getParameter("lastname"));
		user.setPhoneNumber(request.getParameter("phonenumber"));
		Role role = new Role();
		//Default Role = "User"
		role.setRoleID(2);
		user.setRole(role);
			
		UserAction.setUser(user);

	}
	
	public static void updateAdmin(HttpServletRequest request) {

		User user = UserAction.getOneUser(Integer.parseInt(request
				.getParameter("userID")));
		System.out.println("id user: " + request.getParameter("userID") + "| Name" + user.getUsername());

		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setEmail(request.getParameter("email"));
		user.setFirstName(request.getParameter("firstname"));
		user.setLastName(request.getParameter("lastname"));
		user.setPhoneNumber(request.getParameter("phone"));
		Role role = new Role();
		//Default Role = "User"
		role.setRoleID(1);
		user.setRole(role);
			
		UserAction.setUser(user);

	}
	
	
	public static User findOneByUname(String field, String value){
		
		EntityManager em = EmFactory.createEm();
		UserRepository ur = new UserRepository(em);
		
		return ur.findOneBy(field, value);
	}
	
	public static void deleteUser(String userID) {
		
		User user = UserAction.getOneUser(Integer.parseInt(userID));
		EntityManager em = EmFactory.createEm();
		UserRepository ur = new UserRepository(em);
		em.getTransaction().begin();
		try {

			ur.delete(user);
			em.getTransaction().commit();

		} catch (Exception e) {
			System.out.println("Persist exception for deleteUser :" +e);
			if(em.getTransaction().isActive())
				em.getTransaction().rollback();
		}

		finally {
		    em.close();
		}

	}
	
	public static void addUser(HttpServletRequest request){
		User user = new User();
		
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setEmail(request.getParameter("email"));
		
		user.setFirstName(request.getParameter("firstname"));
		user.setLastName(request.getParameter("lastname"));
		user.setPhoneNumber(request.getParameter("phone"));
		Role role = new Role();
		//Default Role = "User"
		role.setRoleID(2);
		user.setRole(role);
		
		System.out.println("userID: " + request.getParameter("userID") + "| Name" + user.getUsername());
		
		UserAction.insertUser(user);
		
		
	}
	
	private static void insertUser(User user) {
		// TODO Auto-generated method stub
		EntityManager em = EmFactory.createEm();
		UserRepository ur = new UserRepository(em);
		
		System.out.println("User Role After Definition :"+ user.getRole().getRoleID());
		em.getTransaction().begin();
		
		try {		
			ur.persist(user);
		
			em.getTransaction().commit();
			System.out.println("after commit");

		} catch (Exception e) {
			System.out.println("Persit Exception from InsertUser :" +e);
			if(em.getTransaction().isActive())
				em.getTransaction().rollback();
	           
		}

		finally {
		    em.close();
		}

	}
}
