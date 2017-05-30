package org.lss.erp.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.lss.erp.dao.dao.StudentDao;
import org.lss.erp.entity.Student;
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
public class StudentDaoImpl implements StudentDao{

	@Autowired
	private SessionFactory hibernateSessionFactory;
	
	
	public SessionFactory getHibernateSessionFactory() {
		return hibernateSessionFactory;
	}

	public void setHibernateSessionFactory(SessionFactory hibernateSessionFactory) {
		this.hibernateSessionFactory = hibernateSessionFactory;
	}	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Student> findStudentsByName(String name) {

		Criteria crit=getHibernateSessionFactory().getCurrentSession().createCriteria(Student.class);
		crit.add(Restrictions.like("name", name).ignoreCase());
		return crit.list();
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Student> findStudentsByRollNo(String rollNo) {
		Criteria crit=getHibernateSessionFactory().getCurrentSession().createCriteria(Student.class);
		crit.add(Restrictions.eq("rollNumber", rollNo));
		return crit.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Student> findAllActiveStudents() {
		Criteria crit=getHibernateSessionFactory().getCurrentSession().createCriteria(Student.class);
		crit.add(Restrictions.eq("status", true));
		return crit.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Student> findStudentsByClassNameAndSection(String classId, String sec) {
		Session session= getHibernateSessionFactory().getCurrentSession();
		Query query= session.createQuery("From Student where studentClass =:classId and section =:sec");
		query.setParameter("classId", classId);
		query.setParameter("sec", sec);
		List<Student> list=query.list();
		return list;
	}

	@Override
	public int countAllStudents() {
		Criteria crit=getHibernateSessionFactory().getCurrentSession().createCriteria(Student.class);
		return (int) crit.setProjection(Projections.rowCount()).uniqueResult();
	}

}
