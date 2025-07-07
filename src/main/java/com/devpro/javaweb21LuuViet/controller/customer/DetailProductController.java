/**
 * 
 */
package com.devpro.javaweb21LuuViet.controller.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21LuuViet.controller.BaseController;
import com.devpro.javaweb21LuuViet.dto.Categories;
import com.devpro.javaweb21LuuViet.dto.Product;
import com.devpro.javaweb21LuuViet.services.CategoriesServices;
import com.devpro.javaweb21LuuViet.services.ProductServices;

/**
 * @author Admin
 *
 */
@Controller
public class DetailProductController extends BaseController{
	@Autowired
	ProductServices productService;
	@Autowired
	CategoriesServices categoriesService;
	@RequestMapping(value= {"/chitietsanpham"},method = RequestMethod.GET)
	public String chiTietSanPham(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
	{
		return "customer/chiTietSanPham";
	}
	@RequestMapping(value= {"/chitietsanpham/{id}"},method = RequestMethod.GET)
	public String homeAdminProductEdit(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse respone,
				@PathVariable("id") int productId)
	{	
		Product product = productService.getById(productId);
		model.addAttribute("product2",product);
		Categories categorie= categoriesService.getById(product.getCategories().getId());
		model.addAttribute("categorie",categorie);
		List<Product> danhSachLienQuan = productService.getEntitiesByNativeSQL("SELECT * FROM tbl_products WHERE status = 1 and category_id = " +categorie.getId());
		model.addAttribute("dslq",danhSachLienQuan);
		return "customer/chiTietSanPham";
		
	}
}
