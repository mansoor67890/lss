package org.lss.erp.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;
import org.lss.erp.dao.dao.PaymentDao;
import org.lss.erp.entity.Payments;
import org.lss.erp.entity.PaymentsType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Mansoor Ahmed
 * 
 */

@Component
@Transactional
public class PaymentDaoImpl implements PaymentDao {

	@Autowired
	private SessionFactory hibernateSessionFactory;
	
	
	public SessionFactory getHibernateSessionFactory() {
		return hibernateSessionFactory;
	}

	public void setHibernateSessionFactory(SessionFactory hibernateSessionFactory) {
		this.hibernateSessionFactory = hibernateSessionFactory;
	}	
	
	@Override
	public PaymentsType findPaymentsTypeByName(String name) {
		
		Criteria crit=getHibernateSessionFactory().getCurrentSession().createCriteria(PaymentsType.class);
		crit.add(Restrictions.eq("name", name));
		return (PaymentsType) crit.list().get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Payments> findPaymentsByClassNameAndSection(String classId, String sec) {
		Session session= getHibernateSessionFactory().getCurrentSession();
		
		Query query= session.createQuery("From Payments where student.studentClass =:classId and student.section =:sec");
		query.setParameter("classId", classId);
		query.setParameter("sec", sec);
		List<Payments> list=query.list();
		return list;
	}

	@Override
	public List<Payments> findPaymentsForAllSections(String classId) {
		Session session= getHibernateSessionFactory().getCurrentSession();
		
		Query query= session.createQuery("From Payments where student.studentClass =:classId");
		query.setParameter("classId", classId);
		List<Payments> list=query.list();
		return list;
	}
	
	@Override
	public List<Payments> findPaymentsForAllClasses(String sectionId) {
		Session session= getHibernateSessionFactory().getCurrentSession();
		Query query= session.createQuery("From Payments where student.section =:sectionId");
		query.setParameter("sectionId", sectionId);
		List<Payments> list=query.list();
		return list;
	}

	@Override
	public List<Payments> findPaymentsHistoryForStudent(int studentId) {
		Session session= getHibernateSessionFactory().getCurrentSession();
		Query query= session.createQuery("From Payments where student.id =:studentId");
		query.setParameter("studentId", studentId);
		List<Payments> list=query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Payments> getPaidfeerecord(Date fromDate, Date toDate) {
		Session session= getHibernateSessionFactory().getCurrentSession();
		Query query= session.createQuery("From Payments where invoice.date BETWEEN :fromDate AND :toDate and status=:status");
		query.setParameter("fromDate", fromDate);
		query.setParameter("toDate", toDate);
		query.setParameter("status", true);
		List<Payments> list=query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Payments> getUnPaidfeerecord(Date fromDate, Date toDate) {
		Session session= getHibernateSessionFactory().getCurrentSession();
		Query query= session.createQuery("From Payments where invoice.date BETWEEN :fromDate AND :toDate and status=:status");
		query.setParameter("fromDate", fromDate);
		query.setParameter("toDate", toDate);
		query.setParameter("status", false);
		List<Payments> list=query.list();
		return list;
	}
}
