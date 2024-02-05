package com.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model.Electricity;

import dbUtil.electricityDAO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("electricValidation")
	public ModelAndView electricValidation() {
		ModelAndView page = new ModelAndView("adminElectricValidation");
		
		electricityDAO eDao = new electricityDAO();
		List<Electricity> eList = eDao.getAll();
		
		page.addObject("electricityList", eList);
		
		return page;
	}
	
}
