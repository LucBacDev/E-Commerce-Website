package com.devpro.javaweb21LuuViet.controller.administrator;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb21LuuViet.controller.BaseController;
import com.devpro.javaweb21LuuViet.dto.Product;
import com.devpro.javaweb21LuuViet.dto.ProductSearchModel;
import com.devpro.javaweb21LuuViet.services.BaseService;
import com.devpro.javaweb21LuuViet.services.PagerData;
import com.devpro.javaweb21LuuViet.services.ProductServices;
import com.devpro.javaweb21LuuViet.services.Product_imagesService;


@Controller
public class AdminProductController extends BaseController {
	@Autowired
	ProductServices productService;
	@RequestMapping(value= {"/admin/homeProduct"},method = RequestMethod.GET)
	public String homeAdmin(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse respone)
	{	
		
		ProductSearchModel searchModel =new ProductSearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		searchModel.setCategoryId(getInteger(request,"categoryId"));
		searchModel.setPage(getCurrentPage(request));
		model.addAttribute("searchData", searchModel);
		PagerData<Product> products = productService.search(searchModel);
		model.addAttribute("products",products);
		return "administrator/homeProduct";
		
	}
	@RequestMapping(value= {"/admin/addNewProduct/{id}"},method = RequestMethod.GET)
	public String homeAdminProductEdit(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse respone,
				@PathVariable("id") int productId)
	{	
		Product product = productService.getById(productId);
		model.addAttribute("product",product);
		return "administrator/addNewProduct";
		
	}
	@RequestMapping(value= {"/admin/deleteProduct/{id}"},method = RequestMethod.GET)
	public String homeAdminProductDelete(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse respone,
				@PathVariable("id") int productId)
	{	
		Product productBeDeleted = productService.getById(productId);
		productBeDeleted.setStatus(Boolean.FALSE);
		productService.saveOrUpdate(productBeDeleted);
		Product newProduct = new Product();
		model.addAttribute("product",newProduct);
		ProductSearchModel searchModel =new ProductSearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		searchModel.setCategoryId(getInteger(request,"categoryId"));
		searchModel.setPage(getCurrentPage(request));
		model.addAttribute("searchData", searchModel);
		PagerData<Product> products = productService.search(searchModel);
		//products.getData().remove(productBeDeleted);
		model.addAttribute("products",products);
		return "administrator/homeProduct";
		
	}
	@RequestMapping(value = { "/admin/addNewProduct" }, method = RequestMethod.POST)
	public String adminProductAddOrUpdate(final Model model, 
										  final HttpServletRequest request,
										  final HttpServletResponse response, 
										  @ModelAttribute("product") Product product,
										  @RequestParam("avatar") MultipartFile productAvatar,
										  @RequestParam("productImages") MultipartFile[] productPictures
	) throws Exception {

		// thêm mới
		if (product.getId() == null || product.getId() <= 0) {
			productService.add(product, productAvatar, productPictures);
		}
		// chỉnh sửa
		else
		{ 
			productService.update(product, productAvatar, productPictures);
		}
		
		// trở về trang danh sách
		return "redirect:/admin/homeProduct";
		
	}
	@RequestMapping(value= {"/admin/addNewProduct"},method = RequestMethod.GET)
	public String homeAddNewGet(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse respone)
	{	
		Product newProduct = new Product();
		model.addAttribute("product",newProduct);
		
		return "administrator/addNewProduct";
		
	}

}
