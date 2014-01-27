package com.owner.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller  
public class HelloWorldController {      
	@RequestMapping("/Hello")      
	public ModelAndView helloWorld(HttpServletResponse response) {          
		String message = "Hello World, Spring 3.0!";         
		return new ModelAndView("Hello", "message", message);     
		} 
}
