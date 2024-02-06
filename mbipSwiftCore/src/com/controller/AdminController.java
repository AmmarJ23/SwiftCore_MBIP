package com.controller;

import java.util.List;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("approveForm")
	public ModelAndView approveForm(
			@RequestParam("username") String username,
            @RequestParam("month") String month) {
		ModelAndView page = new ModelAndView("adminElectricValidation");
		
		electricityDAO eDao = new electricityDAO();
		
		eDao.approveForm(username, month);
		
		List<Electricity> eList = eDao.getAll();
		
		page.addObject("electricityList", eList);
		return page;
		
	}
	
	@RequestMapping("rejectForm")
	public ModelAndView rejectForm(
			@RequestParam("username") String username,
            @RequestParam("month") String month) {
		ModelAndView page = new ModelAndView("adminElectricValidation");
		
		electricityDAO eDao = new electricityDAO();
		
		eDao.rejectForm(username, month);
		
		List<Electricity> eList = eDao.getAll();
		
		page.addObject("electricityList", eList);
		return page;
		
	}
	
	
}
