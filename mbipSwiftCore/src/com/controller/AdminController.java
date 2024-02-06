package com.controller;

import java.util.List;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.Electricity;
import com.model.Recycle;
import com.model.Water;

import dbUtil.electricityDAO;
import dbUtil.recycleDAO;
import dbUtil.waterDAO;

import com.controller.UserController;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/dashboard")
	public ModelAndView adminDashboard() {
		ModelAndView page = new ModelAndView("dashboard-admin");
		
		int[] total = UserController.getAllEntries();
		
		page.addObject("totalSubmission", total);
		
		return page;
	}

	@RequestMapping("electricValidation")
	public ModelAndView electricValidation() {
		ModelAndView page = new ModelAndView("adminElectricValidation");
		
		electricityDAO eDao = new electricityDAO();
		List<Electricity> eList = eDao.getAll();
		
		page.addObject("electricityList", eList);
		
		return page;
	}
	
	@RequestMapping("waterValidation")
	public ModelAndView waterValidation() {
		ModelAndView page = new ModelAndView("adminWaterValidation");
		
		waterDAO eDao = new waterDAO();
		List<Water> waterList = eDao.getAll();
		
		page.addObject("waterList", waterList);
		
		return page;
	}
	
	@RequestMapping("recycleValidation")
	public ModelAndView recycleValidation() {
		ModelAndView page = new ModelAndView("adminRecycleValidation");
		
		recycleDAO rDao = new recycleDAO();
		List<Recycle> recycleList = rDao.getAll();
		
		page.addObject("recycleList", recycleList);
		
		return page;
	}
	
	@RequestMapping("approveFormElectric")
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
	
	@RequestMapping("rejectFormElectric")
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
	
	@RequestMapping("approveFormWater")
	public ModelAndView approveFormWater(
			@RequestParam("username") String username,
            @RequestParam("month") String month) {
		ModelAndView page = new ModelAndView("adminWaterValidation");
		
		waterDAO wDao = new waterDAO();
		
		wDao.approveForm(username, month);
		
		List<Water> wList = wDao.getAll();
		
		page.addObject("waterList", wList);
		return page;
		
	}
	
	@RequestMapping("rejectFormWater")
	public ModelAndView rejectFormWater(
			@RequestParam("username") String username,
            @RequestParam("month") String month) {
		ModelAndView page = new ModelAndView("adminWaterValidation");
		
		waterDAO wDao = new waterDAO();
		
		wDao.rejectForm(username, month);
		
		List<Water> wList = wDao.getAll();
		
		page.addObject("waterList", wList);
		return page;
		
	}
	
	@RequestMapping("approveFormRecycle")
	public ModelAndView approveFormRecycle(
			@RequestParam("username") String username,
            @RequestParam("month") String month) {
		ModelAndView page = new ModelAndView("adminRecycleValidation");
		
		recycleDAO rDao = new recycleDAO();
		
		rDao.approveForm(username, month);
		
		List<Recycle> rList = rDao.getAll();
		
		page.addObject("recycleList", rList);
		return page;
		
	}
	
	@RequestMapping("rejectFormRecycle")
	public ModelAndView rejectFormRecycle(
			@RequestParam("username") String username,
            @RequestParam("month") String month) {
		ModelAndView page = new ModelAndView("adminRecycleValidation");
		
		recycleDAO rDao = new recycleDAO();
		
		rDao.rejectForm(username, month);
		
		List<Recycle> rList = rDao.getAll();
		
		page.addObject("recycleList", rList);
		return page;
		
	}
	
	
}
