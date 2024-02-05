package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model.User;
import com.model.Electricity;
import dbUtil.userDAO;
import dbUtil.electricityDAO;
import dbUtil.waterDAO;
import dbUtil.recycleDAO;

@RequestMapping("/user")
@Controller
public class UserController {

	@RequestMapping("/login")
	public ModelAndView userLogin(HttpServletRequest request, HttpSession session)
	{
		
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		
		//Check for admin
		if (user.getUsername().equals("admin") && user.getPassword().equals("admin123")) {
			ModelAndView adminPage = new ModelAndView("dashboard-admin");
			
			int[] total = getAllEntries();
			
			adminPage.addObject("totalSubmission", total);
			
			return adminPage;
		}
		
		
		boolean validC = false;
		
		userDAO uDao = new userDAO();
		
		Electricity [] monthCarbonElectric = new Electricity[6];
		
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
		dashboardPage.addObject("isSignUp", true);
		
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
		
		Electricity [] monthCarbonElectric = monthEmission(session);
		
		dashboardPage.addObject( "monthCarbonElectric", monthCarbonElectric);
		
//		dashboardPage.addObject("username" ,user.getUsername());
		session.setAttribute("username", user.getUsername());
		
		return dashboardPage;
	}
	
	@RequestMapping("/personalInformation")
	public ModelAndView userPersonalInfoDashboard(HttpSession session)
	{
		ModelAndView page = new ModelAndView("personal_info");
		
		userDAO uDao = new userDAO();
		
		User user = uDao.getUserByUsername((String) session.getAttribute("username"));
		
		page.addObject("user", user);
		
		page.addObject("isSignUp", false);
		return page;
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
		
		Electricity [] monthCarbonElectric = monthEmission(session);
		
		page.addObject( "monthCarbonElectric", monthCarbonElectric);
		
		return page;
	}
	
	public static Electricity[] monthEmission(HttpSession session)
	{
		electricityDAO eDao = new electricityDAO();
		
		String [] monthList = {"January", "February", "March", "April", "May", "June"};
		Electricity [] monthCarbonElectric = new Electricity[6];
		
		for(int i = 0; i <=5 ; i++)
		{
			monthCarbonElectric[i] = eDao.get(monthList[i], (String) session.getAttribute("username"));
		}
		
		return monthCarbonElectric;
	}
	
	public static String[] monthColour(HttpSession session) 
	{
		Electricity[] monthCarbonElectric = UserController.monthEmission(session);
	    String[] monthColour = new String[6];
	    
	    for (int i = 0; i <= 5; i++) {
	        if (monthCarbonElectric[i] == null) {
	            // Handle the case when monthCarbonElectric[i] is null
	        	monthColour[i] = "background-color: #87CEEB; width: 130px;";
	        } else {
	            String status = monthCarbonElectric[i].getStatus();
	            
	            if (status != null) {
	                if ("validated".equals(status)) {
	                    monthColour[i] = "background-color:#4682B4; width: 130px;";
	                } else if ("submitted".equals(status)) {
	                    monthColour[i] = "background-color:#4682B4; width: 130px;";
	                } else {
	                    monthColour[i] = "background-color:#4682B4; width: 130px;";
	                }
	            } else {
	                monthColour[i] = "background-color: #87CEEB; width: 130px;";
	            }
	        }
	    }
	    
	    return monthColour;
	}
	
	public int[] getAllEntries() {
		int[] submissionE = new electricityDAO().getCountOfEntries();
		int[] submissionW = new waterDAO().getCountOfEntries();
		int[] submissionR = new recycleDAO().getCountOfEntries();
		
		int[] total = {0,0,0};
		
		for(int i=0; i<=2; i++) {
			total[i] = submissionE[i] + submissionW[i] + submissionR[i];
		}
		
		return total;
	}
}
