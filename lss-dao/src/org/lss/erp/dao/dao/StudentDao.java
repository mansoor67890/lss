package org.lss.erp.dao.dao;

import java.util.List;

import org.lss.erp.entity.Payments;
import org.lss.erp.entity.Student;
import org.springframework.stereotype.Component;

@Component
public interface StudentDao {

	public List<Student> findStudentsByName(String name);
	public List<Student> findStudentsByRollNo(String rollNo);
	public List<Student> findAllActiveStudents();
	List<Student> findStudentsByClassNameAndSection(String classId, String sec);
	public int countAllStudents();
}
