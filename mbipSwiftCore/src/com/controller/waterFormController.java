package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.Water;
import dbUtil.waterDAO;
import com.controller.UserController;

@RequestMapping("/water")
@Controller
public class waterFormController {
	
	@RequestMapping("/form")
	public ModelAndView formPage(HttpSession session) {
	    ModelAndView page = new ModelAndView("monthSelect");
	    
	    String[] monthColour = UserController.monthColour(session);
	   
	    page.addObject("monthColour", monthColour);
	    
	    page.addObject("formType", "water");
	    
	    return page;
	}
	
	@RequestMapping("/month")
	//form
	public ModelAndView monthPage(HttpSession session, @RequestParam ("selectedMonth") String selectedMonth) {
		ModelAndView page = new ModelAndView("formPageWater");
		
		waterDAO eDao = new waterDAO();
		
		Water e = eDao.get(selectedMonth, (String) session.getAttribute("username"));
		
		page.addObject("month", selectedMonth);
		page.addObject("eObj", e);
		
		return page;
		
	}
	
	@RequestMapping("/add")
	public ModelAndView addE(HttpServletRequest request ,HttpSession session) {
		ModelAndView page = new ModelAndView("monthSelect");
		
		Double carbonFactor = 0.419;
		
		Water e = new Water();
		e.setNoInvoice(request.getParameter("invoiceNo"));
		
		
		String usageInput = request.getParameter("usage");
		if(checkDouble(usageInput) == true) {
			e.setConsumption(Double.parseDouble(usageInput));
		} else {
			ModelAndView formPage = new ModelAndView("formPageWater");
			formPage.addObject("errorMsg", "Incorrect Data Type");
			return formPage;
		}
		
		
		e.setMonth(request.getParameter("month"));
		e.setUsername((String) session.getAttribute("username"));
		e.setCarbonFootprint(e.getConsumption() * carbonFactor);
		
		waterDAO eDao = new waterDAO();
		eDao.add(e);
		
		String[] monthColour = UserController.monthColour(session);
		   
	    page.addObject("monthColour", monthColour);
	
		return page;
	}
	
	@RequestMapping("/update")
	public ModelAndView updateE(HttpServletRequest request ,HttpSession session) {
		ModelAndView page = new ModelAndView("monthSelect");
		waterDAO eDao = new waterDAO();
		
		Double carbonFactor = 0.584;
		
		Water e1 = eDao.get(request.getParameter("month"), (String) session.getAttribute("username"));
		
		Water e2 = new Water();
		e2.setNoInvoice(request.getParameter("invoiceNo"));
		
		String usageInput = request.getParameter("usage");
		if(checkDouble(usageInput) == true) {
			e2.setConsumption(Double.parseDouble(usageInput));
		} else {
			ModelAndView formPage = new ModelAndView("formPageWater");
			formPage.addObject("errorMsg", "Incorrect Data Type");
			return formPage;
		}
		
		String[] monthColour = UserController.monthColour(session);
		   
	    page.addObject("monthColour", monthColour);
		
		if((e1.getNoInvoice() == e2.getNoInvoice()) && (e1.getConsumption() == e2.getConsumption())) {
			return page;
			
		} else {
			e2.setMonth(request.getParameter("month"));
			e2.setUsername((String) session.getAttribute("username"));
			e2.setCarbonFootprint(e2.getConsumption() * carbonFactor);
			
			eDao.update(e2);
			
			return page;
		}

	}
	
	 public boolean checkDouble(String input) {
	        try {
	            Double.parseDouble(input);
	            return true;
	        } catch (NumberFormatException e) {
	            return false;
	        }
	    }

}
