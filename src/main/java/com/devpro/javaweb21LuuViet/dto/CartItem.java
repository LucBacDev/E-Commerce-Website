package com.devpro.javaweb21LuuViet.dto;
import java.math.BigDecimal;
public class CartItem {
 //mã sản phẩm
	private int productId;
//tên sản phẩm
	private String productName;
//số lượng sản phẩm
	private int quanlity;
//đơn giá sản phẩm
	private BigDecimal priceUnit;
	private String avatar;
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getQuanlity() {
		return quanlity;
	}
	public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}
	public BigDecimal getPriceUnit() {
		return priceUnit;
	}
	public void setPriceUnit(BigDecimal priceUnit) {
		this.priceUnit = priceUnit;
	}
}

