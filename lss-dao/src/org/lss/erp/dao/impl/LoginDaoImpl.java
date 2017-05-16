package org.lss.erp.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.lss.erp.dao.dao.LoginDao;
import org.lss.erp.entity.User;
import org.lss.erp.entity.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


@Component
@Transactional
public class LoginDaoImpl implements LoginDao {

	
	@Autowired
	private SessionFactory hibernateSessionFactory;
	
	public SessionFactory getHibernateSessionFactory() {
		return hibernateSessionFactory;
	}

	public void setHibernateSessionFactory(SessionFactory hibernateSessionFactory) {
		this.hibernateSessionFactory = hibernateSessionFactory;
	}	
	
	@Override
	public User findByUserName(String email) {
		
		User user=(User) getHibernateSessionFactory().getCurrentSession().createQuery("From User where email=:email")
				.setParameter("email", email)
				.uniqueResult();
		return user;
	}

	@Override
	public User GetUserIdByName(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserRole> getUserRolesByName(String username) {
	return getHibernateSessionFactory().getCurrentSession().createQuery("From UserRole where user.email=:email")
				.setParameter("email", username).list();
	}

}