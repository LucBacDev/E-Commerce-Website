package com.devpro.javaweb21LuuViet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.client.HttpServerErrorException;

import com.devpro.javaweb21LuuViet.dto.Categories;
import com.devpro.javaweb21LuuViet.dto.Roles;
import com.devpro.javaweb21LuuViet.dto.Users;
import com.devpro.javaweb21LuuViet.services.CategoriesServices;
import com.devpro.javaweb21LuuViet.services.RolesService;

public abstract  class BaseController {
	@Autowired
	CategoriesServices categoriesService;
	@Autowired
	RolesService roleService;
	@ModelAttribute("categories")
	public List<Categories> getAllCategories(){
		return categoriesService.findAll();
	}
	@ModelAttribute("roles")
	public List<Roles> getAllRoles(){
		return roleService.findAll();
	}
	public Integer getInteger(HttpServletRequest request,String paraName) {
		try {
			return Integer.parseInt(request.getParameter(paraName));
		}catch(Exception e)
		{
			return null;
		}
	}
	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
			
		}
		catch (Exception e){
			return 1;
		}
	}
	// ktra da login chua
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined=false;
		Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal instanceof UserDetails) {
			isLogined = true;
		}
		return isLogined;
	}
	@ModelAttribute("userLogined")
	public Users getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails) {
			return (Users) userLogined;
		}
		return new Users();
	}
//	@ModelAttribute("userLogined")
//	public Users setUserLogined(Users a) {
//		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		userLogined = a;
//		return (Users) userLogined;
//		
//	}	
	}

