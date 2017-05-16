package org.lss.erp.Controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.lss.erp.Beans.AddInvoiceBean;
import org.lss.erp.dao.dao.PaymentDao;
import org.lss.erp.dao.dao.StatefulDaoSupport;
import org.lss.erp.entity.Invoice;
import org.lss.erp.entity.Payments;
import org.lss.erp.entity.PaymentsPaymentsType;
import org.lss.erp.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Mansoor Ahmed
 * 
 */

@Controller
@Transactional
public class PaymentController {

	@Autowired
	StatefulDaoSupport statfulDao;
	
	@Autowired
	PaymentDao paymentDao;

	//REST Method
	@RequestMapping(value="/addinvoice", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public void getallstudentsby(@RequestBody Invoice invoice) {
		System.out.print("junaid"); 

	}

	@RequestMapping(value="/createstudentpayment", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView addinvoice(@ModelAttribute Invoice invoice, @ModelAttribute AddInvoiceBean bean) {
		
		ModelAndView model= new ModelAndView("createStudentPayment");
		
		if(bean.getStudentId()==0){
			model.addObject("errorMsg", " Student cannot be empty.");
			return model;
		}
		
		Student student=statfulDao.findById(Student.class, bean.getStudentId());
		
		List<PaymentsPaymentsType> ppt=new ArrayList<PaymentsPaymentsType>();
		invoice.getPayment().setStudent(student);
		
		if(bean.getAnnualFee()!=null){
			ppt.add(new PaymentsPaymentsType(invoice.getPayment(), paymentDao.findPaymentsTypeByName(bean.getAnnualFee())));
		}
		
		if(bean.getExamFee()!=null){
			ppt.add(new PaymentsPaymentsType(invoice.getPayment(), paymentDao.findPaymentsTypeByName(bean.getExamFee())));
		}
		
		if(bean.getMonthlyFee()!=null){
			ppt.add(new PaymentsPaymentsType(invoice.getPayment(), paymentDao.findPaymentsTypeByName(bean.getMonthlyFee())));
		}
		
		statfulDao.save(invoice.getPayment());
		statfulDao.save(invoice);
		statfulDao.saveEntities(ppt);
		
		model.addObject("successMsg", "Invoice Added Successfully");
		return model;
	}
	
	@RequestMapping(value="/getpaymentbyclass/{classId}/{section}", method=RequestMethod.GET)
	public ModelAndView getpaymentbyclass(@PathVariable String classId, @PathVariable String section) {
		
		ModelAndView model = new ModelAndView("_studentPaymentByClassAndSection");
		
		if(classId.equals("all") && section.equals("all")){
			model.addObject("payments", statfulDao.findAll(Payments.class));
			return model;
		}
		
		if(!classId.equals("all") && section.equals("all")){
			model.addObject("payments",	paymentDao.findPaymentsForAllSections(classId));
			return model;
		}
		
		if(!section.equals("all") && classId.equals("all")){
			model.addObject("payments",	paymentDao.findPaymentsForAllClasses(section));
			return model;
		}
		
		model.addObject("payments", paymentDao.findPaymentsByClassNameAndSection(classId, section));
		return model;
	}
	
	@RequestMapping(value="/studentpayments", method=RequestMethod.GET)
	public ModelAndView studentpayments() {
		ModelAndView model= new ModelAndView("studentPayments");
		model.addObject("payments", statfulDao.findAll(Payments.class));
		return model;
	}
	
	//findPaymentsHistoryForStudent
	@RequestMapping(value="/viewpaymentshistory/{id}", method=RequestMethod.GET)
	public ModelAndView studentpayments(@PathVariable int id) {
		ModelAndView model= new ModelAndView("_paymentHistoryModal");
		model.addObject("paymentsHistory", paymentDao.findPaymentsHistoryForStudent(id));
		return model;
	}
	
	@RequestMapping(value="/takepayment/{id}", method=RequestMethod.GET)
	public ModelAndView takePayment(@PathVariable int id) {
		ModelAndView model= new ModelAndView("_takePaymentModal");
		model.addObject("payment", statfulDao.findById(Payments.class, id));
		return model;
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value="/takepayment", method=RequestMethod.POST)
	public ModelAndView takepayment(@ModelAttribute Payments payment, @RequestParam Date invoiceDate) {
		
		ModelAndView model= new ModelAndView("studentPayments");
		
		Payments paymentFromDb=statfulDao.findById(Payments.class, payment.getId());
		int amountPaid=paymentFromDb.getAmountPaid();
		if(paymentFromDb!=null){
			
			//add new amount paid
			amountPaid=amountPaid+payment.getAmountPaid();
			paymentFromDb.setAmountPaid(amountPaid);
			paymentFromDb.getInvoice().setDate(invoiceDate);
			paymentFromDb.setStatus(payment.isStatus());
			
			model.addObject("payments", statfulDao.findAll(Payments.class));
			model.addObject("successMsg", "Payment updated successfully!");
			return model;
		}
		
		model.addObject("errorMsg", "Something went wrong, please try again.");
		return model;
	}
	
}
