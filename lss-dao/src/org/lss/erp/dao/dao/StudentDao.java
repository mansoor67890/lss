package org.lss.erp.dao.dao;

import java.util.List;

import org.lss.erp.entity.Student;
import org.springframework.stereotype.Component;


/**
 * @author Mansoor Ahmed
 * @version 1.0
 * 
 */

@Component
public interface StudentDao {

	public List<Student> findStudentsByName(String name);
	public List<Student> findStudentsByRollNo(String rollNo);
	public List<Student> findAllActiveStudents();
	List<Student> findStudentsByClassNameAndSection(String classId, String sec);
	public int countAllStudents();
}
