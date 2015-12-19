package be.btbf4.dao;

import java.io.Serializable;
import java.util.List;

public interface GenericDao<T, PK extends Serializable> 
{
	T persist(T t);
	T find(PK id);
	T update(T t);
	T findOneBy(String field, String value);
	List<T> findAll();
	List<T> findBy(String field, String value);
	void delete(T t);
}