package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/")
@Controller
public class indexController {

	@RequestMapping("/")
	public ModelAndView login()
	{
		ModelAndView loginPage = new ModelAndView("login");
		return loginPage;
	}
	
}
