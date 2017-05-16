package org.lss.erp.Controller;
//package org.supplier.erp.Controller;
//
//import org.cpc.erp.dao.ProfileDao;
//import org.cpc.erp.entity.Employee;
//import org.cpc.erp.entity.User;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//import org.supplier.erp.Beans.ResetPasswordBean;
//
///**
// * @author ME
// * 
// */
//@Controller
//public class AccountController {
//	@Autowired
//	ProfileDao profileDao;
//
//	@RequestMapping(value= "/register", method = RequestMethod.POST , consumes= "application/json")
//	@ResponseBody
//	public ResponseEntity<?> RegisterUser(@RequestBody Employee user){
//		String email=user.getEmail();
//		return null;
//	}
//
//	@RequestMapping(value= "/register", method = RequestMethod.GET)
//	public String RegisterUser(){
//		return "signup";
//	}
//
//	@RequestMapping(value= "/resetCred", method = RequestMethod.POST)
//	public ModelAndView ResetpwdPost(@RequestParam String email, @RequestParam String nicNo){
//		ModelAndView model= new  ModelAndView();
//		model.setViewName("resetpasswordform");
//		User user= profileDao.getUserByEmail(email);
//		if(user!=null){
//			String nic=user.getEmployee().getEmployeeDetails().getNic();
//			if(nic.equals(nicNo)){
//				model.addObject("user", user);
//				return model;
//			}else{
//				model.setViewName("error");
//				return model;
//			}
//		}else{
//			model.addObject("msg", "User does not exist!");
//			model.setViewName("error");
//			return model;
//		}
//	}
//
////	@RequestMapping(value= "/resetpasssubmit", method = RequestMethod.POST)
////	public ModelAndView resetpasssubmit(@ModelAttribute ResetPasswordBean bean){
////		ModelAndView model= new  ModelAndView();
////		
////		
////		if(!bean.getPassword1().equalsIgnoreCase(bean.getPassword2())){
////			model.addObject("msg","Passwords donot match!");
////			model.setViewName("error");
////			return model;
////		}
////		if(bean.getPassword1().isEmpty() || bean.getPassword2().isEmpty()){
////			model.addObject("msg","Passwords cannot be empty!");
////			model.setViewName("error");
////			return model;
////		}
////		
//////		User user= profileDao.getuserbyId();
//////		if(user!=null){
//////			user.setPassword(pass1);
//////			profileDao.saveEntity(user);
//////			model.addObject("msg", "Password Changed successfully!");
//////			model.setViewName("success");
//////			return model;
//////		}
////		model.addObject("msg", "Oops..\n Something went wrong!");
////		model.setViewName("error");
////		return model;
////	}
//}