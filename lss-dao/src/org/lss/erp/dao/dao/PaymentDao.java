package org.lss.erp.dao.dao;

import java.util.Date;
import java.util.List;

import org.lss.erp.entity.Payments;
import org.lss.erp.entity.PaymentsType;
import org.springframework.stereotype.Component;


/**
 * @author Mansoor Ahmed
 * @version 1.0
 * 
 */

@Component
public interface PaymentDao {
	
	public PaymentsType findPaymentsTypeByName(String name);
	public List<Payments> findPaymentsByClassNameAndSection(String classId, String sec);
	public List<Payments> findPaymentsForAllSections(String classId);
	public List<Payments> findPaymentsForAllClasses(String sectionId);
	public List<Payments> findPaymentsHistoryForStudent(int studentId);
	public List<Payments> getPaidfeerecord(Date fromDate, Date toDate);
	public List<Payments> getUnPaidfeerecord(Date fromDate, Date toDate);
}
