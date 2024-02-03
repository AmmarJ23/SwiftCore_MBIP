package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model.User;
import dbUtil.userDAO;
import dbUtil.electricityDAO;

@RequestMapping("/user")
@Controller
public class UserController {

	@RequestMapping("/login")
	public ModelAndView userLogin(HttpServletRequest request, HttpSession session)
	{
		
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		boolean validC = false;
		
		userDAO uDao = new userDAO();
		
		double [] monthCarbonElectric = new double[6];
		
		boolean valid = uDao.loginVerification(user);
		
		String pageName;
		
		if(valid == true) 
		{
			pageName = "dashboard-user";
			session.setAttribute("username", user.getUsername());
			monthCarbonElectric = monthEmission(session);
			
			
			validC = true;
			
		}
		else {pageName = "login";}
		
		ModelAndView dashboardPage = new ModelAndView(pageName);
		
		if(validC == true){ dashboardPage.addObject( "monthCarbonElectric", monthCarbonElectric);}
		
		return dashboardPage;
	}
	
	@RequestMapping("/signupForm")
	public ModelAndView userSignupForm()
	{
		ModelAndView signupPage = new ModelAndView("signup");
		return signupPage;
	}
	
	@RequestMapping("/signup")
	public ModelAndView userSignup(HttpServletRequest request)
	{
		ModelAndView dashboardPage = new ModelAndView("personal_info");
		
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password1"));
		
		userDAO uDao = new userDAO();
		
		int rowAffected = uDao.addUser(user);
		
		dashboardPage.addObject("username", user.getUsername());
		
		return dashboardPage;
	}
	
	@RequestMapping("/personalInfo")
	public ModelAndView userPersonalInfo(HttpServletRequest request, HttpSession session)
	{
		ModelAndView dashboardPage = new ModelAndView("dashboard-user");
		
		User user = new User();
		
		user.setUsername(request.getParameter("username"));
		
		user.setPhoneNumber(request.getParameter("phoneNumber"));
		
		String address = request.getParameter("address1") + ", " +  request.getParameter("address2");
		user.setAddress(address);
		
		user.setState(request.getParameter("state"));
		user.setPostcode(request.getParameter("postcode"));
		user.setNoResidents(request.getParameter("noResidents"));
		user.setUserType(request.getParameter("user-type"));
		user.setBuildingType(request.getParameter("building-type"));
		
		userDAO uDao = new userDAO();
		
		int rowAffected = uDao.updateUserInformation(user);
		
//		dashboardPage.addObject("username" ,user.getUsername());
		session.setAttribute("username", user.getUsername());
		
		return dashboardPage;
	}
	
	
	@RequestMapping("/formPage")
	public ModelAndView formPage()
	{
		ModelAndView page = new ModelAndView("formPage");
		return page;
	}
	
	@RequestMapping("/dashboard")
	public ModelAndView dashboardUserPage(HttpSession session)
	{
		ModelAndView page = new ModelAndView("dashboard-user");
		
		double [] monthCarbonElectric = monthEmission(session);
		
		page.addObject( "monthCarbonElectric", monthCarbonElectric);
		
		return page;
	}
	
	public double[] monthEmission(HttpSession session)
	{
		electricityDAO eDao = new electricityDAO();
		
		String [] monthList = {"January", "February", "March", "April", "May", "June"};
		double [] monthCarbonElectric = new double[6];
		
		for(int i = 0; i <=5 ; i++)
		{
			monthCarbonElectric[i] = eDao.getCarbonEmission(monthList[i], (String) session.getAttribute("username"));
		}
		
		return monthCarbonElectric;
	}
}
