package be.btbf4.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.validation.ConstraintViolationException;



public class GenericDaoJpaImpl<T, PK extends Serializable> implements GenericDao<T, PK> 
{
	protected Class<T> entityClass;

	@PersistenceContext
	protected EntityManager entityManager;
	
	/** 
     * Class constructor.
     */
	@SuppressWarnings("unchecked")
	public GenericDaoJpaImpl() 
	{
		ParameterizedType genericSuperclass = (ParameterizedType) getClass().getGenericSuperclass();
		this.entityClass = (Class<T>) genericSuperclass.getActualTypeArguments()[0];
	}
	
	/** 
	 * Use to set the entity manager.
     * @param em (required) EntityManager instance
     */
	public void setEntityManager(EntityManager em)
	{
		entityManager = em;
	}
	
	/** 
	 * Use to get the entity manager.
     * @return EntityManager instance
     */
	public EntityManager getEntityManager()
	{
		return entityManager;
	}
	
	/** 
	 * Use to save object to database.
     * @param t (required) an object to save
     * @throws ConstraintViolationException
     * @return The object saved
     */
	@Override
	public T persist(T t) 
	{
	    	
		this.entityManager.persist(t);
		
		return t;
	}
	
	/** 
	 * Use to get a typed object from database.
     * @param id (required) the PK from an object 
     * @return The object find
     */
	@Override
	public T find(PK id) 
	{
		return this.entityManager.find(entityClass, id);
	}
	
	/** 
	 * Use to update object from database.
     * @param t (required) an object to update
     * @throws ConstraintViolationException
     * @return The object updated
     */
	@Override
	public T update(T t) 
	{
		T r = null;

	    r = this.entityManager.merge(t);
	    
		return r;
	}
	
	/** 
	 * Use to findAll typed objects from database.
     * @return The list of objects find
     */
	@Override
	@SuppressWarnings("unchecked")
	public List<T> findAll()
	{
		return entityManager.createQuery("Select t from " + entityClass.getSimpleName() + " t").getResultList();
	}
	/*
	@SuppressWarnings("unchecked")
	public List<Album> findAllAlbumsSorted()
	{
		//return entityManager.createQuery("Select t from " + entityClass.getSimpleName() + " t"+" ORDER BY column_name ASC|DESC       ").getResultList();
		return entityManager.createQuery("Select t from " + entityClass.getSimpleName() + " t"+" ORDER BY title ASC").getResultList();
	}*/
	@SuppressWarnings("unchecked")
	public List<T> findAllSorted(String field)
	{
		//return entityManager.createQuery("Select t from " + entityClass.getSimpleName() + " t"+" ORDER BY column_name ASC|DESC       ").getResultList();
		return entityManager.createQuery("Select t from " + entityClass.getSimpleName() + " t"+" ORDER BY "+ field +" ASC").getResultList();
	}
	/*@SuppressWarnings("unchecked")
	public List<Album> findAllByGenreSorted(int id) {
		
		 return entityManager.createQuery("Select t from " + entityClass.getSimpleName() + " t where t." + field + " = '" + value +"'").getResultList();
	}*/
	/** 
	 * Use to find one typed object from database with criteria.
     * @param field (required) the object field you want to filter
     * @param value (required) the value the field should have
     * @return The object find
     */
	@Override
	@SuppressWarnings("unchecked")
	public T findOneBy(String field, String value)
	{
		List<T> t = entityManager.createQuery("Select t from " + entityClass.getSimpleName() + " t where t." + field + " = '" + value +"'").getResultList();
		
		if(!t.isEmpty())
		{
			return t.get(0);
		}
		else
		{
			return null;
		}
	}
	
	/** 
	 * Use to find objects from database with criteria.
     * @param field (required) the object field you want to filter
     * @param value (required) the value the field should have
     * @return The list of objects find
     */
	@Override
	@SuppressWarnings("unchecked")
	public List<T> findBy(String field, String value)
	{
		return entityManager.createQuery("Select t from " + entityClass.getSimpleName() + " t where t." + field + " = '" + value +"'").getResultList();
	}
	
	/** 
	 * Use to delete objects from database.
     * @param t (required) the object to delete
     */
	@Override
	public void delete(T t) 
	{
		t = this.entityManager.merge(t);
		this.entityManager.remove(t);
	}
	
	/** 
	 * Use to find objects constraint validation
     * @param t (required) the object to check
     * @return true if object is not valid, false if object is correct
     */

}
