package com.devpro.javaweb21LuuViet.controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21LuuViet.controller.BaseController;
import com.devpro.javaweb21LuuViet.dto.Users;
import com.devpro.javaweb21LuuViet.services.UserService;

@Controller
public class LoginController extends BaseController{
	@Autowired 
	UserService userService;
	@RequestMapping(value= {"/dangnhap"},method = RequestMethod.GET)
	public String dangNhap(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
	{
		return "customer/dangNhap";
	}
	@RequestMapping(value= {"/dangnhap_processing_url"},method = RequestMethod.POST)
	public String dangNhapCheck(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
	{
		return "customer/dangNhap";
	}
//	@RequestMapping(value= {"/dangnhap?login_error=true"},method = RequestMethod.GET)
//	public String dangNhapFasle(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
//	{
//		return "customer/dangNhap";
//	}
	@RequestMapping(value= {"/suaThongTin/{id}"},method = RequestMethod.GET)
	public String suaThongTin(final Model model,final HttpServletRequest request,final HttpServletResponse respone,@PathVariable("id") int userId)
	{
		Users user =userService.getById(userId);
		
		model.addAttribute("data_user",user);
		
		return "customer/suaThongTin";
	}
	@RequestMapping(value= {"/dangnhap3"},method = RequestMethod.GET)
	public String dangNhap3(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
	{
		return "customer/dangNhap3";
	}
}
