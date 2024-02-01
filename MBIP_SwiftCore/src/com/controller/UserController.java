package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model.User;
import dbUtil.userDAO;

@RequestMapping("/user")
@Controller
public class UserController {

	@RequestMapping("/login")
	public ModelAndView userLogin(HttpServletRequest request)
	{
		ModelAndView dashboardPage = new ModelAndView("personal_info");
		dashboardPage.addObject(request.getParameter("name"));
		
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
		user.setUsername(request.getParameter("password"));
		
		userDAO uDao = new userDAO();
		
		int rowAffected = uDao.addUser(user);
		
		dashboardPage.addObject(request.getParameter("name"));
		
		return dashboardPage;
	}
}
