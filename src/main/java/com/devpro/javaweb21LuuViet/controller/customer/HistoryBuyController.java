package com.devpro.javaweb21LuuViet.controller.customer;

import java.util.ArrayList;
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
import com.devpro.javaweb21LuuViet.dto.Product;
import com.devpro.javaweb21LuuViet.dto.SaleOrder;
import com.devpro.javaweb21LuuViet.dto.SaleOrderProducts;
import com.devpro.javaweb21LuuViet.dto.Users;
import com.devpro.javaweb21LuuViet.services.SaleOrderProductsService;
import com.devpro.javaweb21LuuViet.services.SaleOrderService;



@Controller
public class HistoryBuyController extends BaseController {
	@Autowired
	SaleOrderService saleOrderService;
	@Autowired
	SaleOrderProductsService saleOrderProductsService;
	@RequestMapping(value= {"/historybuy"},method = RequestMethod.GET)
	public String hienThiLichSuMua(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse respone)
	{	
		
		List<SaleOrder> saleOrderOfUserLogin = saleOrderService.searchBuyUserId(getUserLogined().getId());
		
		model.addAttribute("list_his",saleOrderOfUserLogin);
		
		return "customer/historybuy";
		
	}
	@RequestMapping(value= {"/chiTietDonHang/{id}"},method = RequestMethod.GET)
	public String hienThiLichSuMua(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse respone,
				@PathVariable("id") int saleOrderId)
	{	
		
		List<SaleOrderProducts> listSaleOrderProducts  = saleOrderProductsService.searchBuySaleOrder(saleOrderId);
		List<Product> list_product = new ArrayList<Product>() ;
		for (SaleOrderProducts saleA : listSaleOrderProducts) {
			Product a = saleA.getProduct();
			a.setSoLuongMua(saleA.getQuality());
			list_product.add(a);
			
		}
		model.addAttribute("list_products", list_product);
		return "customer/detailSaleOrder";
		
	}
	
	@RequestMapping(value= {"/huyDonHang/{id}"},method = RequestMethod.GET)
	public String huyDonHang(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse respone,
				@PathVariable("id") int saleOrderId)
	{	
		SaleOrder saleOrderBeCancel = saleOrderService.getById(saleOrderId);
		saleOrderBeCancel.setTinhTrang("Đã hủy");
		saleOrderService.saveOrUpdate(saleOrderBeCancel);
		List<SaleOrder> saleOrderOfUserLogin = saleOrderService.searchBuyUserId(getUserLogined().getId());
		model.addAttribute("list_his",saleOrderOfUserLogin);
		
		return "customer/historybuy";
		
	}
}
