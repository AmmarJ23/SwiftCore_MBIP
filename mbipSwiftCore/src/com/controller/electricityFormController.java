package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.Electricity;
import dbUtil.electricityDAO;
import com.controller.UserController;

@RequestMapping("/electricity")
@Controller
public class electricityFormController {
	
	@RequestMapping("/form") 
	// Pilih bulan
	public ModelAndView formPage(HttpSession session) {
	    ModelAndView page = new ModelAndView("monthSelect");
	    
	    String[] monthColour = UserController.monthColour(session);
	   
	    page.addObject("monthColour", monthColour);
	    
	    page.addObject("formType", "electricity");
	    
	    return page;
	}

	
	@RequestMapping("/month")
	//form
	public ModelAndView monthPage(HttpSession session, @RequestParam ("selectedMonth") String selectedMonth) {
		ModelAndView page = new ModelAndView("formPageElectric");
		
		electricityDAO eDao = new electricityDAO();
		
		Electricity e = eDao.get(selectedMonth, (String) session.getAttribute("username"));
		
		page.addObject("month", selectedMonth);
		page.addObject("eObj", e);
		
		return page;
		
	}
	
	@RequestMapping("/add")
	public ModelAndView addE(HttpServletRequest request ,HttpSession session) {
		ModelAndView page = new ModelAndView("monthSelect");
		
		Double carbonFactor = 0.584;
		
		Electricity e = new Electricity();
		e.setNoInvoice(request.getParameter("invoiceNo"));
		e.setConsumption(Double.parseDouble(request.getParameter("usage")));
		e.setMonth(request.getParameter("month"));
		e.setUsername((String) session.getAttribute("username"));
		e.setCarbonFootprint(e.getConsumption() * carbonFactor);
		
		electricityDAO eDao = new electricityDAO();
		eDao.add(e);
		
		String[] monthColour = UserController.monthColour(session);
		   
	    page.addObject("monthColour", monthColour);
	
		return page;
	}
	
	@RequestMapping("/update")
	public ModelAndView updateE(HttpServletRequest request ,HttpSession session) {
		ModelAndView page = new ModelAndView("monthSelect");
		electricityDAO eDao = new electricityDAO();
		
		Double carbonFactor = 0.584;
		
		Electricity e1 = eDao.get(request.getParameter("month"), (String) session.getAttribute("username"));
		
		Electricity e2 = new Electricity();
		e2.setNoInvoice(request.getParameter("invoiceNo"));
		e2.setConsumption(Double.parseDouble(request.getParameter("usage")));
		
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

}
