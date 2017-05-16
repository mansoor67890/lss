package org.lss.erp.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lss.erp.dao.dao.StudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/*
 * Get all pages... 
 * 
 * */

@Controller
@Transactional
public class ViewController {

	@Autowired
	private StudentDao studentDao;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String HomePage() {
		return "redirect:welcome";
	}
	
	@RequestMapping(value="/welcome", method=RequestMethod.GET)
	public String welcome() {
		return "welcome";
	}
	
	//studentinformation
	@RequestMapping(value="/studentinformation", method=RequestMethod.GET)
	public String studentInfo() {
		return "studentInformation";
	}
	
	@RequestMapping(value="/studentpromotion", method=RequestMethod.GET)
	public String studentPromotion() {
		return "studentPromotion";
	}
	
	//createStudentPayment
	@RequestMapping(value="/createstudentpayment", method=RequestMethod.GET)
	public String createStudentPayment() {
		return "createStudentPayment";
	}
	
	//paidFeeRecord
	@RequestMapping(value="/paidfeerecord", method=RequestMethod.GET)
	public String paidFeeRecord() {
		return "paidFeeRecord";
	}
	
	//unpaidFeeRecord
	@RequestMapping(value="/unpaidfeerecord", method=RequestMethod.GET)
	public String unpaidFeeRecord() {
		return "unpaidFeeRecord";
	}
	
	//totalFeeRecord
	@RequestMapping(value="/totalfeerecord", method=RequestMethod.GET)
	public String totalFeeRecord() {
		return "totalFeeRecord";
	}
	
	@RequestMapping(value="/contactus",method=RequestMethod.GET)
	public String Getcontactus() {
		return "contactUs";
	}
	
	@RequestMapping(value="/company", method=RequestMethod.GET)
	public String company() {
		return "company";
	}
	
	@RequestMapping(value= "/resetpassword", method = RequestMethod.GET)
	public String Resetpassword(){
		return "resetpassword";
	}
	
	@RequestMapping(value="/success",method=RequestMethod.GET)
	public  ModelAndView getSuccess(ModelAndView model) {
		model.setViewName("success");
		return model;
	}

	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/dashboard",method=RequestMethod.GET)
	public ModelAndView getDash() {
		ModelAndView model= new ModelAndView("dashBoard");
		model.addObject("studentCount", studentDao.countAllStudents());
		return model;
	}

	protected ModelAndView handleRequestInternal(HttpServletRequest  request, HttpServletResponse arg1) 
					throws Exception {
		if (request.isUserInRole("ROLE_USER")) {
			request.setAttribute("appendURL", "user");
			return new ModelAndView("user/home", "welcome ", null);
		}
		if (request.isUserInRole("ROLE_ADMIN")) {
			request.setAttribute("appendURL", "admin");
			return new ModelAndView("admin/home", "welcome ", null);
		}
		throw new Exception("No roles Detected");
	}
	
	
	
	@RequestMapping(value="/about",method=RequestMethod.GET)
	public String about() {
		return "about";
	}
	
	@RequestMapping(value="/privacy",method=RequestMethod.GET)
	public String privacy() {
		return "dummy";
	}
	
}
