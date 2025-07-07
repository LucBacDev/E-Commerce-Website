package com.devpro.javaweb21LuuViet.controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21LuuViet.conf.SecureConf;
import com.devpro.javaweb21LuuViet.controller.BaseController;
import com.devpro.javaweb21LuuViet.dto.Roles;
import com.devpro.javaweb21LuuViet.dto.Users;


import com.devpro.javaweb21LuuViet.services.RolesService;
import com.devpro.javaweb21LuuViet.services.UserService;
@Controller
public class DangKyController extends BaseController {
	@Autowired RolesService rolesService;
	
	@Autowired UserService userService;
	@Autowired SecureConf secureconf;
	@RequestMapping(value= {"/dangky"},method = RequestMethod.GET)
	public String dangKy(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
	{
		
		Users newUser = new Users();
		model.addAttribute("data_user", newUser);
		
		return "customer/dangKy";
	}
	@RequestMapping(value= {"/addnewuser"},method = RequestMethod.POST)
	public String newuser_post_springform(final Model model,
										final HttpServletRequest request,
										final HttpServletResponse respone,
										final @ModelAttribute("data_user") Users user ){
		
	// thêm khách hàng mới
		if(user.getId()== null || user.getId() <=0) {
			Roles roleGuest= rolesService.getById(13);
			user.addRoles(roleGuest);
			
			user.setPassword(secureconf.encodePassword(user.getPassword()));
			userService.saveOrUpdate(user);
			
			//reset form
			Users newUser = new Users();
			model.addAttribute("data_user", newUser );
		
			return "customer/dangNhap2";
		}
		
	
		else {
			Users userInDB = userService.getById(user.getId());
			userInDB.setNameacc(user.getNameacc());
			
			userInDB.setShippingAddress(user.getShippingAddress());
			userInDB.setEmail(user.getEmail());
			Roles roleGuest= rolesService.getById(13);
			userInDB.addRoles(roleGuest);
			userService.saveOrUpdate(userInDB);
			userInDB.setUserName(user.getUserName());
			//setUserLogined(userInDB);
			model.addAttribute("userLogined",userInDB);
			return "customer/cart";
		}
	
	
		
		
	}
	@RequestMapping(value= {"/error"},method = RequestMethod.GET)
	public String viewLoi(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
	{
		
		Users newUser = new Users();
		model.addAttribute("data_user", newUser);
		
		return "customer/dangKy";
	}
}
