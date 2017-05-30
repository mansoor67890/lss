package org.lss.erp.Controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.lss.erp.Beans.SearchStudents;
import org.lss.erp.Beans.StudentPromotionForm;
import org.lss.erp.dao.dao.StatefulDaoSupport;
import org.lss.erp.dao.dao.StudentDao;
import org.lss.erp.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Mansoor Ahmed
 * @version 1.0
 * 
 */

@Controller
public class StudentController {

	@Autowired
	StatefulDaoSupport statfulDao;

	@Autowired
	StudentDao studentDao;

	@RequestMapping(value="/studentadmit", method=RequestMethod.GET)
	public String studentadmit() {
		return "studentAdmit";
	}

	@RequestMapping(value="/addstudent", method=RequestMethod.POST)
	public ModelAndView addStudent(@ModelAttribute Student student, @ModelAttribute("file") MultipartFile imageToUpload, HttpServletRequest req) {
		ModelAndView model= new ModelAndView();

		if(imageToUpload.getSize()!=0){
			
			Properties prop = new Properties();
			//		InputStream input = null;
			try {
				//load a properties file from class path, inside static method
				prop.load(getClass().getClassLoader().getResourceAsStream("database.properties"));
			} 
			catch (IOException ex) {
				model.addObject("errorMsg", "Something went wrong!");
				return model;
//				ex.printStackTrace();
			}
			
			String path=prop.getProperty("imagePath"); 
			int index=imageToUpload.getOriginalFilename().indexOf(".");
			
			String ext=imageToUpload.getOriginalFilename().substring(index);
			
			String filename=student.getRollNumber()+ext;  
			System.out.println(path+" "+filename); 

			File theDir = new File(path);

			// if the directory does not exist, create it
			if (!theDir.exists()) {
				System.out.println("creating directory: " + theDir.getName());
				boolean result = false;

				try{
					theDir.mkdir();
					result = true;
				} 
				catch(SecurityException se){
					//handle it
					se.printStackTrace();
				}        
				if(result) {    
					System.out.println("DIR created");
					try{  
						saveImage(imageToUpload.getBytes(), path, filename);
						student.setImageName(filename);
					}catch(Exception e){
						System.out.println(e);
					} 
				}
			}else {
				try{
					saveImage(imageToUpload.getBytes(), path, filename);
					student.setImageName(filename);
				}catch(Exception e){
					model.addObject("errorMsg", "Something went wrong!");
					return model;
//					System.out.println(e);
				}
			}
		}

		student.setStatus(true);
		statfulDao.save(student);
		model.setViewName("studentAdmit");
		model.addObject("successMsg", "Added Student Successfully!");
		return model;
	}

	
	private void saveImage(byte image[], String path, String filename) throws IOException{
		BufferedOutputStream bout=new BufferedOutputStream(new FileOutputStream(path+"/"+filename));  
		bout.write(image);  
		bout.flush();  
		bout.close(); 
	}
	
	
	//students
	@RequestMapping(value="/allstudents", method=RequestMethod.GET)
	public ModelAndView getAllStudents() {
		ModelAndView model= new ModelAndView();
		model.addObject("students", studentDao.findAllActiveStudents());
		return model;
	}

	@RequestMapping(value="/getallstudentsby", method=RequestMethod.POST)
	@ResponseBody
	public List<Student> getallstudentsby(SearchStudents searchStudentBean) {
		//		ModelAndView model= new ModelAndView();

		List<Student> students= new ArrayList<Student>();
		if(searchStudentBean.getSearchBy().equals("name")){
			students=studentDao.findStudentsByName(searchStudentBean.getSearchField().trim());
		}else{
			students=studentDao.findStudentsByRollNo(searchStudentBean.getSearchField().trim());
		}
		return students;
	}
	
	//editStudent template
	@RequestMapping(value="/editstudent/{id}", method=RequestMethod.GET)
	public ModelAndView editStudent(@PathVariable int id) {
		ModelAndView model= new ModelAndView("_editStudentModal");
		model.addObject("student", statfulDao.findById(Student.class, id));
		return model;
	}
	
	//editStudent template
		@RequestMapping(value="/editstudent", method=RequestMethod.POST)
		public ModelAndView editStudent(@ModelAttribute Student studentPosted, @ModelAttribute("file") MultipartFile imageToUpload) {
			ModelAndView model= new ModelAndView("redirect:/allstudents");
			
			Student studentToEdit=statfulDao.findById(Student.class, studentPosted.getId());
			if(studentToEdit!=null){
				if(imageToUpload.getSize()!=0){
					Properties prop = new Properties();
					//		InputStream input = null;
					try {
						//load a properties file from class path, inside static method
						prop.load(getClass().getClassLoader().getResourceAsStream("database.properties"));
					} 
					catch (IOException ex) {
						model.setViewName("allstudents");
						model.addObject("students", statfulDao.findAll(Student.class));
						model.addObject("errorMsg", "Something went wrong!");
						return model;
					}

					String path=prop.getProperty("imagePath"); 
					int index=imageToUpload.getOriginalFilename().indexOf(".");
					
					String ext=imageToUpload.getOriginalFilename().substring(index);
					
					String filename=studentPosted.getRollNumber()+ext;  
					System.out.println(path+" "+filename); 

					File theDir = new File(path);

					// if the directory does not exist, create it
					if (!theDir.exists()) {
						System.out.println("creating directory: " + theDir.getName());
						boolean result = false;

						try{
							theDir.mkdir();
							result = true;
						} 
						catch(SecurityException se){
							model.setViewName("allstudents");
							model.addObject("students", statfulDao.findAll(Student.class));
							model.addObject("errorMsg", "Something went wrong!");
							return model;
						}        
						if(result) {    
							System.out.println("DIR created");
							try{  
								saveImage(imageToUpload.getBytes(), path, filename);
								studentPosted.setImageName(filename);
							}catch(Exception e){
								model.setViewName("allstudents");
								model.addObject("students", statfulDao.findAll(Student.class));
								model.addObject("errorMsg", "Something went wrong!");
								return model;
							} 
						}
					}else {
						try{
							saveImage(imageToUpload.getBytes(), path, filename);
							studentPosted.setImageName(filename);
						}catch(Exception e){
							model.setViewName("allstudents");
							model.addObject("students", statfulDao.findAll(Student.class));
							model.addObject("errorMsg", "Something went wrong!");
							return model;
						}
					}
				}
				else{
					studentPosted.setImageName(studentToEdit.getImageName());
				}
				
				studentPosted.setStatus(true);
				statfulDao.saveOrUpdate(studentPosted);
//				model.setViewName("allstudents");
				model.addObject("students", statfulDao.findAll(Student.class));
				model.addObject("successMsg", "Student Edited Successfully!");
				return model;
			}
			
			model.addObject("errorMsg", "Could not edit Student, Please try again.");
			return model;
		}
	
	//delete student
	@RequestMapping(value="/deletestudent/{id}", method=RequestMethod.GET)
	@ResponseBody
	public String delStudent(@PathVariable int id) {
		
		Student student=statfulDao.findById(Student.class, id);
		if(student!=null){
			if(student.isStatus()){
				student.setStatus(false);
				statfulDao.saveOrUpdate(student);
				return "Student deleted successfully!!";
			}
			return "Cannot deleted student!";
		}
		return "Cannot deleted student!";
	}
	
	@RequestMapping(value="/template/getstudentstopromote/{className}/{sectionName}", method=RequestMethod.GET)
	public ModelAndView markAttendance(@PathVariable String className, @PathVariable String sectionName){

		ModelAndView model = new ModelAndView();

		ArrayList<Student> studentList=(ArrayList<Student>) studentDao.findStudentsByClassNameAndSection(className, sectionName);
		StudentPromotionForm studentPromotionForm = new StudentPromotionForm();
		studentPromotionForm.setStudentList(studentList);
		model.addObject("studentPromotionForm", studentPromotionForm);
		model.setViewName("_promoteStudents");
		return model;
	}
	
	@RequestMapping(value = "promotestudents", method = RequestMethod.POST)
	public ModelAndView promoteStudents(@ModelAttribute StudentPromotionForm studentPromotionForm) {
		ModelAndView model = new ModelAndView();

		List<Student> toSaveList=new ArrayList<Student>();
		
		for(Student obj: studentPromotionForm.getStudentList()){
			if(obj.getId()!=0){
				if(!obj.getStudentClass().equals("")){
					Student student=statfulDao.findById(Student.class, obj.getId());
					student.setStudentClass(obj.getStudentClass());
					toSaveList.add(student);
				}
			}
		}
		
		statfulDao.saveEntities(toSaveList);
		model.setViewName("studentPromotion");
		return model;
	}
	
}
