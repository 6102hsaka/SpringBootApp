package com.akash.springbootapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.akash.springbootapp.model.Student;

@Controller
@SessionAttributes("student")
public class ActionController {
	
	@GetMapping(value = "profile")
	public String profile() {
		return "profilePage";
	}
	
	@PostMapping(value = "profile")
	public String updateprofile(@ModelAttribute("student") Student student) {
		return "profilePage";
	}

	@GetMapping(value = "contact")
	public String contact() {
		return "contactPage";
	}
	
	@GetMapping(value = "about")
	public String about() {
		return "aboutUsPage";
	}
}