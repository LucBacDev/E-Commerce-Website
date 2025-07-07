package com.devpro.javaweb21LuuViet.controller.administrator;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;
import org.apache.jasper.tagplugins.jstl.core.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21LuuViet.controller.BaseController;
import com.devpro.javaweb21LuuViet.dto.BaseSearchModel;
import com.devpro.javaweb21LuuViet.dto.Product;
import com.devpro.javaweb21LuuViet.dto.ProductSearchModel;
import com.devpro.javaweb21LuuViet.dto.Roles;
import com.devpro.javaweb21LuuViet.dto.UserSearchModel;
import com.devpro.javaweb21LuuViet.dto.Users;
import com.devpro.javaweb21LuuViet.services.PagerData;
import com.devpro.javaweb21LuuViet.services.ProductServices;
import com.devpro.javaweb21LuuViet.services.RolesService;
import com.devpro.javaweb21LuuViet.services.UserService;

@Controller
public class AdminUserController extends BaseController {
	
	@Autowired
	UserService userService;
	@Autowired
	RolesService roleService;
	@RequestMapping(value= {"/admin/homeUser"},method = RequestMethod.GET)
	public String homeAdmin(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse respone)
	{	
		
		UserSearchModel searchModel =new UserSearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		searchModel.setRoleId(getInteger(request,"roleId"));
		searchModel.setPage(getCurrentPage(request));
		model.addAttribute("searchData", searchModel);
		PagerData<Users> users = userService.search(searchModel);
		model.addAttribute("users",users);
		
		return "administrator/homeUser";
		
	}
	@RequestMapping(value= {"/admin/deleteUser/{id}"},method = RequestMethod.GET)
	public String homeAdminProductDelete(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse respone,
				@PathVariable("id") int userId)
	{	
		Users userBeDeleted = userService.getById(userId);
		userBeDeleted.setStatus(Boolean.FALSE);
		userService.saveOrUpdate(userBeDeleted);
		
		UserSearchModel searchModel =new UserSearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		searchModel.setRoleId(getInteger(request,"roleId"));
		searchModel.setPage(getCurrentPage(request));
		model.addAttribute("searchData", searchModel);
		PagerData<Users> users = userService.search(searchModel);
		model.addAttribute("users",users);
		
		return "administrator/homeUser";
		
	}
	
	@RequestMapping(value= {"/admin/setNewRole/{userId}/{roleId}"},method = RequestMethod.GET)
	public String homeAdminProductEdit(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse respone,
				@PathVariable("userId") int userId,
				@PathVariable("roleId") int roleId)
	{	
		Users user = userService.getById(userId);
		Roles role = roleService.getById(roleId);
		user.getRoles().removeAll(getAllRoles());
		user.addRoles(role);
		userService.saveOrUpdate(user);
		
		UserSearchModel searchModel =new UserSearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		searchModel.setRoleId(getInteger(request,"roleId"));
		searchModel.setPage(getCurrentPage(request));
		model.addAttribute("searchData", searchModel);
		PagerData<Users> users = userService.search(searchModel);
		model.addAttribute("users",users);
		return "administrator/homeUser";
		
	}
}
