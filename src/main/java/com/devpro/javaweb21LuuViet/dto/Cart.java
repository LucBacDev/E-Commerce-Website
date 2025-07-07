package com.devpro.javaweb21LuuViet.dto;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
public class Cart {
//tổng số tiền trong giỏ hàng
	private Integer totalPrice ;
//tổng số sản phẩm
	private Integer totalProducts ;

	public Integer getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Integer getTotalProducts() {
		return totalProducts;
	}
	public void setTotalProducts(Integer totalProducts) {
		this.totalProducts = totalProducts;
	}
	public List<CartItem> getCartItems() {
		return cartItems;
	}
	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}
	//danh sách sản phẩm trong giỏ hàng
	private List<CartItem> cartItems = new ArrayList<CartItem>();
}
