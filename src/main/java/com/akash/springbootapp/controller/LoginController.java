package com.akash.springbootapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.akash.springbootapp.model.Student;
import com.akash.springbootapp.service.StudentService;
import com.akash.springbootapp.validate.StudentValidator;

@Controller
@SessionAttributes("student")
public class LoginController {
	
	@Autowired
	private StudentService studentService;
	
	@ModelAttribute
	public Student setUpForm() {
		return new Student();
	}
	
	@GetMapping(value = "/")
	public String init() {
		return "redirect:/login";
	}
	
	@GetMapping(value = "login")
	public String index(ModelMap model) {
		return "loginPage";
	}
	
	@PostMapping(value = "login")
	public String login(@ModelAttribute("student") Student student,ModelMap model) {
		Student dummy = studentService.validateLoginCredential(student.getId(), student.getPass());
		if(dummy!=null) {
			student.setFname(dummy.getFname());
			student.setLname(dummy.getLname());
			student.setAge(dummy.getAge());
			student.setCity(dummy.getCity());
			return "redirect:home";
		} 
		model.put("loginErr",true);
		return "loginPage";
	}
	
	@GetMapping(value = "home")
	public String home() {
		return "homePage";
	}
	
	@GetMapping("register")
	public String register(@ModelAttribute("student") Student student) {
		student.setId("");
		student.setFname("");
		student.setLname("");
		student.setAge(0);
		student.setCity("");
		return "RegistrationPage";
	}
	
	
	@PostMapping(value = "register")
	public String signup(@ModelAttribute("student") Student student,BindingResult bindingResult,ModelMap model) {
		new StudentValidator().validate(student, bindingResult);
		if(bindingResult.hasErrors()) {
			return "RegistrationPage";
		}
		if(student.getPass().equals(student.getConfirmPass()) && studentService.insert(student)) {
			return "redirect:home";
		}
		model.put("RegistrationErr",true);
		return "RegistrationPage";
	}
	
	@GetMapping(value = "logout")
	public String logout(HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute("student");
		httpSession.invalidate();
		httpSession = request.getSession(false);
		return "redirect:/login";
	}
}