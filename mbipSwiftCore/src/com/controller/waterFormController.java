package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.Water;
import dbUtil.waterDAO;

@RequestMapping("/water")
@Controller
public class waterFormController {
	
	@RequestMapping("/form")
	public ModelAndView formPage() {
		ModelAndView page = new ModelAndView("monthSelect");
		
		page.addObject("formType","water");
		
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
		e.setConsumption(Double.parseDouble(request.getParameter("usage")));
		e.setMonth(request.getParameter("month"));
		e.setUsername((String) session.getAttribute("username"));
		e.setCarbonFootprint(e.getConsumption() * carbonFactor);
		
		waterDAO eDao = new waterDAO();
		eDao.add(e);
	
		return page;
	}
	
	@RequestMapping("/update")
	public ModelAndView updateE(HttpServletRequest request ,HttpSession session) {
		ModelAndView page = new ModelAndView("monthSelect");
		waterDAO eDao = new waterDAO();
		
		Double carbonFactor = 0.419;
		
		Water e1 = eDao.get(request.getParameter("month"), (String) session.getAttribute("username"));
		
		Water e2 = new Water();
		e2.setNoInvoice(request.getParameter("invoiceNo"));
		e2.setConsumption(Double.parseDouble(request.getParameter("usage")));
		
		
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
