package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/user")
@Controller
public class UserController {

	@RequestMapping("/login")
	public ModelAndView userLogin()
	{
		new ModelAndView
	}
}
