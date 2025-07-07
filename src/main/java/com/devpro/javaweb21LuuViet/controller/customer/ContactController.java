package com.devpro.javaweb21LuuViet.controller.customer;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21LuuViet.controller.BaseController;
import com.devpro.javaweb21LuuViet.model.Contact;
import com.devpro.javaweb21LuuViet.services.BaseService;
import com.devpro.javaweb21LuuViet.services.ContactService;
@Controller
public class ContactController extends BaseController{
	//inject 1 BEAN vao trong 1 BEAN KHAC
	//cAC BEAN quan ly boi spring-comtroller
	@Autowired
	private ContactService contactService;
	// hứng data đẩy lên từ spring form
	//@ModelAttribute để hứng data,cần phải đặt tên data cần hứng
	@RequestMapping(value= {"/contactus"},method = RequestMethod.POST)
	public String contact_post_springform(final Model model,
										final HttpServletRequest request,
										final HttpServletResponse respone,
										final @ModelAttribute("contact") Contact contact ){
		System.out.println(contact.getFullName());
	// luu vao trong data base
		contactService.saveOrUpdate(contact);
	//reset form
		Contact data = new Contact();
		model.addAttribute("contact",data);
		return "customer/contactus";
		
	}
	// cách 1:
//	@RequestMapping(value= {"/contactus"},method = RequestMethod.POST)
//	public String contact_post_simple(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
//	{
//		String fullName = request.getParameter("fullName");
//		String email = request.getParameter("email");
//		String ideal = request.getParameter("ideal");
//		System.out.println(fullName+" who person have email: "+email+" have ideal that:"+ideal);
//		return "customer/contactus";
//		
//		
//	}
	@RequestMapping(value= {"/contactus"},method = RequestMethod.GET)
	public String contact_get_simple(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
	{
		//đẩy data xuống view qua model
				//trong view có sử dụng spring form để binding-data ? lien ket du lieu ?
				//data dung để binding có tên là contact
				Contact data=new Contact();
				model.addAttribute("contact",data);
				System.out.println(data.getFullName()+"GET");
		
		return "customer/contactus";
		
		//
	}
}
