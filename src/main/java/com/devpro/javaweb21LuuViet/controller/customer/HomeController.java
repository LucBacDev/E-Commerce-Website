package com.devpro.javaweb21LuuViet.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
/**
 * 1.Báo spring biết đây là controller
 * 2.Tạo instance của controller này <=> HomeController hc= new HomeController()
 * hc được lưu vào trong spring-container(1 kiểu dữ liệu list,map)
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21LuuViet.controller.BaseController;
import com.devpro.javaweb21LuuViet.dto.Employee;
import com.devpro.javaweb21LuuViet.dto.Product;
import com.devpro.javaweb21LuuViet.dto.ProductSearchModel;
import com.devpro.javaweb21LuuViet.model.Customer;
import com.devpro.javaweb21LuuViet.services.ProductServices;
import com.devpro.javaweb21LuuViet.services.UserService;

@Controller
public class HomeController extends BaseController{
	@Autowired
	ProductServices productService;
	@Autowired
	UserService userService;
	/**
	 * 1.Lấy thông tin từ request Param .Ví dụ: localhost:8080/home?hovaten=daind&tuoi=20
	 * 2.Lấy thông tin từ getPathPatvariable  .Ví dụ: localhost:8080/getPathVariable/daind/20
	 * @param model
	 * @param request
	 * @param respone
	 * @return
	 */
	

	
//	@RequestMapping(value= {"/getPathVariables/{hovaten}/{tuoi}"},method = RequestMethod.GET)
//	public String getPathVariables(final Model model,
//									final HttpServletRequest request,
//									final HttpServletResponse respone,
//									@PathVariable("hovaten") String ten,
//									@PathVariable("tuoi") Integer tuoi)
//	{		
//		
//		System.out.println("hovaten: "+ten);
//		System.out.println("tuoi: "+tuoi);
//		return "customer/danhSachSanPham";
//	}
//	@RequestMapping(value= {"/getRequestParams"},method = RequestMethod.GET)
//	public String getRequestParams(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
//	{		
//		String hovaten = request.getParameter("hovaten");
//		Integer tuoi=Integer.parseInt(request.getParameter("tuoi"));
//		System.out.println("hovaten: "+hovaten);
//		System.out.println("tuoi: "+tuoi);
//		return "customer/index";
//	}
	
	 
	
	
	@RequestMapping(value= {"/home"},method = RequestMethod.GET)
	public String home(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
	{
//		List<Employee> employees=new ArrayList<Employee>();
//		employees.add(new Employee(1,"A"));
//		employees.add(new Employee(2,"B"));
//		//Đẩy dữ liệu xuống views
//		model.addAttribute("employees",employees);
		List<Product> saleProducts = productService.getEntitiesByNativeSQL("SELECT * FROM tbl_products WHERE is_hot = 1  ");
		model.addAttribute("saleProducts",saleProducts);
		List<Product> danhSachSanPham1 = productService.getEntitiesByNativeSQL("SELECT * FROM tbl_products WHERE category_id = 1 ");
		model.addAttribute("ListType1",danhSachSanPham1 );
		List<Product> danhSachSanPham2 = productService.getEntitiesByNativeSQL("SELECT * FROM tbl_products WHERE category_id = 2 ");
		model.addAttribute("ListType2",danhSachSanPham2 );
		List<Product> danhSachSanPham3 = productService.getEntitiesByNativeSQL("SELECT * FROM tbl_products WHERE category_id = 3 ");
		model.addAttribute("ListType3",danhSachSanPham3 );
		List<Product> danhSachSanPham4 = productService.getEntitiesByNativeSQL("SELECT * FROM tbl_products WHERE category_id = 4 ");
		model.addAttribute("ListType4",danhSachSanPham4 );
		List<Product> danhSachSanPham5 = productService.getEntitiesByNativeSQL("SELECT * FROM tbl_products WHERE category_id = 5 ");
		model.addAttribute("ListType5",danhSachSanPham5 );
		List<Product> danhSachSanPham6 = productService.getEntitiesByNativeSQL("SELECT * FROM tbl_products WHERE category_id = 6 ");
		model.addAttribute("ListType6",danhSachSanPham6 );
	
		
		return "customer/index";
		
		
	}

	
	
	
	
	
	@RequestMapping(value= {"/dssanpham"},method = RequestMethod.GET)
	public String danhSachSanPham(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
	{	
		List<Product> danhSachSanPham1 = productService.getEntitiesByNativeSQL("SELECT * FROM tbl_products p WHERE p.status=1 and  (p.ten_san_pham like '% bò %' or p.ten_san_pham like  '%Bò %')");
		model.addAttribute("ListType1",danhSachSanPham1 );
		List<Product> danhSachSanPham2 = productService.getEntitiesByNativeSQL("SELECT * FROM tbl_products p WHERE p.status=1 and  (p.ten_san_pham like '% heo %' or p.ten_san_pham like  '%Heo %')");
		model.addAttribute("ListType2",danhSachSanPham2 );
		List<Product> danhSachSanPham3 = productService.getEntitiesByNativeSQL("SELECT * FROM tbl_products p WHERE p.status=1 and  (p.ten_san_pham like '% gà %' or p.ten_san_pham like  '%Gà %')");
		model.addAttribute("ListType3",danhSachSanPham3 );
		return "customer/danhSachSanPham";
	}
	@RequestMapping(value= {"/dssanpham2"},method = RequestMethod.GET)
	public String danhSachSanPham2(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
	{
		
		ProductSearchModel searchModel= new ProductSearchModel();
		searchModel.setKeyword("bò");
		List<Product> ds1 = productService.searchByKeyWord(searchModel);
		model.addAttribute("data",ds1);
		model.addAttribute("soPhanTu", ((ds1.size()/4)));
		model.addAttribute("searchData", searchModel);
		return "customer/danhSachSanPham2";
	}
	@RequestMapping(value= {"/ketquatimkiemdssanpham2"},method = RequestMethod.GET)
	public String danhSachSanPhamSearch(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
	{
		
		ProductSearchModel searchModel= new ProductSearchModel();
		searchModel.setLoaiSanPham(request.getParameter("loai_san_pham"));
		searchModel.setGiaCuaSanPham(request.getParameter("gia"));
		List<Product> ds1 = productService.hamSearchTrongDanhSach2(searchModel);
		model.addAttribute("data",ds1);
		model.addAttribute("soPhanTu", ((ds1.size()/4)));
		model.addAttribute("searchData", searchModel);
		System.out.println(ds1.size());
		return "customer/danhSachSanPham2";
	}
	@RequestMapping(value= {"/searchbykeyword"},method = RequestMethod.GET)
	public String searchIndexPage(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
	{
		ProductSearchModel searchModel= new ProductSearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		List<Product> danhSachKetQua = new ArrayList<Product>();
		danhSachKetQua=productService.searchByKeyWord(searchModel);
		model.addAttribute("data", danhSachKetQua);
		model.addAttribute("soPhanTu", ((danhSachKetQua.size()/4)));
		model.addAttribute("dataSearch", searchModel);
		return "customer/ketQuaTimKiem";
		
	}
	
}
