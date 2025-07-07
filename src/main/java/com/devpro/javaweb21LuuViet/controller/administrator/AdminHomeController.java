package com.devpro.javaweb21LuuViet.controller.administrator;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb21LuuViet.controller.BaseController;
import com.devpro.javaweb21LuuViet.dto.Categories;
import com.devpro.javaweb21LuuViet.dto.Product;
import com.devpro.javaweb21LuuViet.services.CategoriesServices;
import com.devpro.javaweb21LuuViet.services.ProductServices;


//ad
@Controller
public class AdminHomeController extends BaseController{
	@Autowired
	private ProductServices productService;
	@Autowired
	private CategoriesServices categoriesService;
	
	@RequestMapping(value= {"/admin/homeAdmin"},method = RequestMethod.GET)
	public String homeAdmin(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse respone)
	{	
		
		return "administrator/homeAdmin";
		
	}
	
	
	@RequestMapping(value= {"/admin/homeKhachHang"},method = RequestMethod.GET)
	public String homeKhachHang(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse respone)
	{
		return "administrator/homeKhachHang";
		
	}
	
	
	
	

}
	//cách 2
//	@RequestMapping(value= {"/admin/addnewproduct"},method = RequestMethod.POST)
//	public String home_post(final Model model,
//			final HttpServletRequest request,
//			final HttpServletResponse respone,
//			final @ModelAttribute("product1") Product product,
//			final @RequestParam("attachment") MultipartFile attachmentFile) throws IOException		
//	{
//		System.out.println("Name: "+product.getTitle());
//		//Lưu ảnh trên server nếu có upload File
//		if(!attachmentFile.isEmpty())
//			attachmentFile.transferTo(new File("E:/upload/" +attachmentFile.getOriginalFilename()));
//		//reset form
//		Product data=new Product();
//		model.addAttribute("product1",data);
//	
//		return "administrator/addNewProduct";
//		
//	}
//	//cách 3: sử dụng Ajax
//		//đối với cách này thì chỉ refresh 1 số phần của trang web không reload lại
//		//với ajax sẽ không trả về view(refresh lại) mà trả về kiểu ResponseEntity có giá trị kiểu Map<String, Object>
//		//@RequestBody dùng để hứng data
//		@RequestMapping(value = { "/ajax/admin/addnewproduct" }, method = RequestMethod.POST)
//		public ResponseEntity<Map<String, Object>> ajax_addnewproduct(final Model model, 
//																final HttpServletRequest request,
//																final HttpServletResponse response, 
//																final @RequestBody  Product product) {
//			System.out.println(product.getTitle());
//			
//			
//			Map<String, Object> jsonResult = new HashMap<String, Object>();
//			jsonResult.put("statusCode", 200); // status code ví dụ: 200: Success, 500: Error, 404: NotFound
//			jsonResult.put("statusMessage", "Sản phẩm " + product.getTitle() + ", Đã upload thành công!");
//			return ResponseEntity.ok(jsonResult);
//		}
//		@RequestMapping(value= {"/admin/home"},method = RequestMethod.GET)
//		public String homeAdmin(final Model model,
//					final HttpServletRequest request,
//					final HttpServletResponse respone)
//		{
//			Product data=new Product();
//			model.addAttribute("product1",data);
//			return "administrator/index";
//			
//		}
//		@RequestMapping(value= {"/admin/product/management"},method = RequestMethod.GET)
//		public String managementProduct(final Model model,
//					final HttpServletRequest request,
//					final HttpServletResponse respone)
//		{
//			Product data=new Product();
//			model.addAttribute("product1",data);// đây data bằng view
//			request.getSession().setAttribute("product", data);//đẩy data xuống view
//			// đẩy danh sách categories xuống view
//			List <Categories> categories = categoriesService.getEntitiesByNativeSQL("SELECT *FROM tbl_categories");
//			model.addAttribute("categories",categories);
//			return "administrator/index";
//			
//		}

