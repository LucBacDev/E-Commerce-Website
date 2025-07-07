package com.devpro.javaweb21LuuViet.controller.customer;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21LuuViet.controller.BaseController;
import com.devpro.javaweb21LuuViet.dto.Cart;
import com.devpro.javaweb21LuuViet.dto.CartItem;
import com.devpro.javaweb21LuuViet.dto.Product;
import com.devpro.javaweb21LuuViet.dto.SaleOrder;
import com.devpro.javaweb21LuuViet.dto.SaleOrderProducts;
import com.devpro.javaweb21LuuViet.dto.Users;
import com.devpro.javaweb21LuuViet.services.ProductServices;
import com.devpro.javaweb21LuuViet.services.SaleOrderService;

@Controller
public class CartController extends BaseController {
	@Autowired
	SaleOrderService saleOrderService;
	@Autowired
	private ProductServices productService;
	@RequestMapping(value= {"/cart/checkout"},method = RequestMethod.GET)
	public String cart(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
	{
		
		return "customer/cart";
		
	}
	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.POST)
	public String cartFinished(final Model model, 
						   final HttpServletRequest request, 
						   final HttpServletResponse response) throws IOException {
		
		// Lấy thông tin khách hàng
		String customerFullName = request.getParameter("customerFullName");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");
		String customerAddress = request.getParameter("customerAddress");
		String customerTotal = request.getParameter("tongTienHang");
		
		Users userIn = getUserLogined();
		// tạo hóa đơn + với thông tin khách hàng lấy được
		SaleOrder saleOrder = new SaleOrder();
		if(isLogined()) {
		saleOrder.setUser(userIn);
		}
		saleOrder.setCustomerName(customerFullName);
		saleOrder.setCustomerEmail(customerEmail);
		saleOrder.setCustomerAddress(customerAddress);
		saleOrder.setCustomerPhone(customerPhone);	
		saleOrder.setCode(String.valueOf(System.currentTimeMillis())); // mã hóa đơn
		saleOrder.setTotal(customerTotal);
		saleOrder.setTinhTrang("Đang chuẩn bị hàng");
		//model.addAttribute("total", customerTotal);
		// lấy giỏ hàng
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		
		// set thông tin về sản phẩm đầu tiên
		int dem = 0;
		// lấy sản phẩm trong giỏ hàng
		for (CartItem cartItem : cart.getCartItems()) {
			if(dem==0&& isLogined()==true) {
				Product productFirst = productService.getById(cartItem.getProductId());
				saleOrder.setNameFirstProduct(productFirst.getTen_san_pham());
				saleOrder.setQuanlityFirstProduct(cartItem.getQuanlity());
				saleOrder.setAvatarFirstProduct(productFirst.getAnh_san_pham());
				dem++;
			}
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuanlity());

			// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}
		
		// lưu vào database
		saleOrderService.saveOrUpdate(saleOrder);
		
		// thực hiện reset lại giỏ hàng của Session hiện tại
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", 0);
		
		return "customer/thankyou";// -> đường dẫn tới View.
		
	}
	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model,
														      final HttpServletRequest request,
														      final HttpServletResponse response, 
														      final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
		Cart cart = null;
		
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
			cart = (Cart) session.getAttribute("cart");
		} else {// chưa có giỏ hàng nào trên session
			cart = new Cart(); //khởi tạo giỏ hàng mới
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu sản phẩm muốn bổ sùng vào giỏ hàng có trong giỏ hàng nếu có thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				// tăng số lượng sản phẩm lên
				item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng thì thực hiện add sản phẩm đó vào giỏ hàng
		if (!isExists) {
			// trước khi thêm mới thì lấy sản phẩm trong db
			// và thiết lập tên + đơn giá cho cartitem
			Product productInDb = productService.getById(cartItem.getProductId());

			cartItem.setProductName(productInDb.getTen_san_pham());
			cartItem.setPriceUnit(productInDb.getGia_ban());
			cartItem.setAvatar(productInDb.getAnh_san_pham());
			cart.getCartItems().add(cartItem); // thêm mới sản phẩm vào giỏ hàng
		}
	
		// tính tổng tiền
		//this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		
		// lưu totalItems vào session
		// tất cả các giá trị lưu trên session đều có thể truy cập được từ View
		session.setAttribute("totalItems", getTotalItems(request));
		
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = { "/ajax/deleteFromCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_DeleteFromCart(final Model model,
														      final HttpServletRequest request,
														      final HttpServletResponse response, 
														      final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
		Cart cart = null;
		
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
			cart = (Cart) session.getAttribute("cart");
		} else {// chưa có giỏ hàng nào trên session
			cart = new Cart(); //khởi tạo giỏ hàng mới
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		
		int index=0;
		for (CartItem ci : cartItems) {
			if(cartItem.getProductId()==ci.getProductId()) {
				break;
			}
			index++;
		}

		cartItems.remove(index);
	
		// tính tổng tiền
		//this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		
		// lưu totalItems vào session
		// tất cả các giá trị lưu trên session đều có thể truy cập được từ View
		session.setAttribute("totalItems", getTotalItems(request));
		
		return ResponseEntity.ok(jsonResult);
	}
	
	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		
		
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}
		for(CartItem item: cartItems) {
			if(item.getQuanlity()<=0) {
				cartItems.remove(item);
				
			}
		}
		
		return total;
	}
	@RequestMapping(value= {"/cart/thankyou"},method = RequestMethod.GET)
	public String thankCustomer(final Model model,final HttpServletRequest request,final HttpServletResponse respone)
	{
		
		return "customer/thankyou";
		
	}
	
}

