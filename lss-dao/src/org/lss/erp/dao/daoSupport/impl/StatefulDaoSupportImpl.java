package org.lss.erp.dao.daoSupport.impl;

import java.util.Collection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.lss.erp.dao.dao.StatefulDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional
public class StatefulDaoSupportImpl implements StatefulDaoSupport{

	@Autowired
	private SessionFactory hibernateSessionFactory;

	public SessionFactory getHibernateSessionFactory() {
		return hibernateSessionFactory;
	}

	public void setHibernateSessionFactory(SessionFactory hibernateSessionFactory) {
		this.hibernateSessionFactory = hibernateSessionFactory;
	}

	@Override
	public void save(Object entity) {
		getHibernateSessionFactory().getCurrentSession().save(entity);
		
	}

	@Override
	public void merge(Object entity) {
		getHibernateSessionFactory().getCurrentSession().merge(entity);
	}

	@Override
	public void saveOrUpdate(Object entity) {
		getHibernateSessionFactory().getCurrentSession().saveOrUpdate(entity);
	}

	@Override
	public void delete(Object entity) {
		getHibernateSessionFactory().getCurrentSession().delete(entity);
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> T findById(Class<T> type, int id) {
		return  (T) getHibernateSessionFactory().getCurrentSession().get(type, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> findAll(Class<T> type) {
		Criteria crit=getHibernateSessionFactory().getCurrentSession().createCriteria(type);
		return crit.list();
	}
	
	@Override
	public void deleteEntities(Collection<?> entities) {
		Session session = getHibernateSessionFactory().getCurrentSession();
		for (Object entity : entities) {
			session.delete(entity);
		}		
	}
	@Override
	public void saveEntities(List<?> entities) {
		Session session = getHibernateSessionFactory().getCurrentSession();
		for (Object entity : entities) {
			session.saveOrUpdate(entity);
		}
	}
}