package org.lss.erp.Controller;
//package org.supplier.erp.Controller;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.cpc.erp.entity.Employee;
//import org.cpc.erp.entity.User;
//import org.springframework.security.authentication.AnonymousAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//@Controller
//public class LoginController  {
//	
//	@RequestMapping("/403")
//	public ModelAndView getAccessDenied() {
//		Authentication auth = SecurityContextHolder.getContext()
//				.getAuthentication();
//		String username = "";
//		if (!(auth instanceof AnonymousAuthenticationToken)) {
//			UserDetails userDetail = (UserDetails) auth.getPrincipal();
//			username = userDetail.getUsername();
//		}
//		return new ModelAndView("403", "username", username);
//	}
//	
//	@RequestMapping(value="/login?Error", method = RequestMethod.GET)
//	public String loginerror(ModelMap model) {
//	model.addAttribute("error", "true");
//	return "login_page";
//	 
//	}
//	
//	@RequestMapping("/login")
//	public ModelAndView login(@ModelAttribute User users,
//			@RequestParam(value = "error", required = false) String error,
//			@RequestParam(value = "logout", required = false) String logout) {
//		
//		
//		ModelAndView m = new ModelAndView();
//		
//		if (error != null) {
//			m.addObject("error", "Invalid username and password!");
//			
//		} 
//		if (logout != null) {
//			
//			m.addObject("msg", "You've been logged out successfully.");
//			
//		}
//		m.setViewName("LoginPage");
//		return m;
//	}
//}