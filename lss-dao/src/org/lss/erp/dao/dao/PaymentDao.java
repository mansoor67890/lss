package org.lss.erp.dao.dao;

import java.util.List;

import org.lss.erp.entity.Payments;
import org.lss.erp.entity.PaymentsType;
import org.springframework.stereotype.Component;

/**
 * @author Mansoor Ahmed
 * 
 */

@Component
public interface PaymentDao {
	
	public PaymentsType findPaymentsTypeByName(String name);
	public List<Payments> findPaymentsByClassNameAndSection(String classId, String sec);
	public List<Payments> findPaymentsForAllSections(String classId);
	public List<Payments> findPaymentsForAllClasses(String sectionId);
	public List<Payments> findPaymentsHistoryForStudent(int studentId);
	
}
