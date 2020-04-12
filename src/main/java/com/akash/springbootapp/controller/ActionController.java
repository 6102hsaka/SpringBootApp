package com.akash.springbootapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("student")
public class ActionController {
	
	@GetMapping(value = "profile")
	public String profile() {
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