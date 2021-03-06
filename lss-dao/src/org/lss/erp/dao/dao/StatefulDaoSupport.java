package org.lss.erp.dao.dao;

import java.util.Collection;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public interface StatefulDaoSupport{ 
	
	    public void save(Object entity); 
	    public void merge(Object entity); 
	    public void saveOrUpdate(Object entity); 
	    public void delete(Object entity); 
	    public void deleteEntities(Collection<?> entities);
		void saveEntities(List<?> entities); 
	    public <T> T findById(Class<T> type, final int id); 
	    public <T> List<T> findAll(Class<T> type) ;
    }