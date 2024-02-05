package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("electricValidation")
	public ModelAndView electricValidation() {
		ModelAndView page = new ModelAndView("adminElectricValidation");
		return page;
	}
	
}
