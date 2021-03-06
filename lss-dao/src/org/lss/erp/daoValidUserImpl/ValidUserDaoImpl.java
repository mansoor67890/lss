package org.lss.erp.daoValidUserImpl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.lss.erp.daoValidUser.ValidUserDao;
import org.lss.erp.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Mansoor Ahmed
 * @version 1.0
 * 
 */

@Component
@Transactional
public class ValidUserDaoImpl implements ValidUserDao {
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public boolean isValidUser(String email, String pass)  {
		return true;

	}

	@Override
	public User findByUserName(String username) {
		Session session = getSessionFactory().getCurrentSession();
		String qry = "FROM User emp where emp.email = :username";
		Query query = session.createQuery(qry);
		query.setParameter("username", username);
		User emp1=(User) query.list().get(0);
		return emp1;
	}
	
}