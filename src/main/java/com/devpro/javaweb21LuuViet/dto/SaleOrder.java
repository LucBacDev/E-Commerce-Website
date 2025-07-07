package com.devpro.javaweb21LuuViet.dto;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.devpro.javaweb21LuuViet.model.BaseEntity;

@Entity
@Table(name = "tbl_saleorder")
public class SaleOrder extends BaseEntity {
	@Column(name = "code")
	private String code;

	@Column(name = "total", precision = 13, scale = 2, nullable = false)
	private String total;

	@Column(name = "customer_name")
	private String customerName;

	@Column(name = "customer_address")
	private String customerAddress;

	@Column(name = "customer_phone")
	private String customerPhone;

	@Column(name = "cutomer_email")
	private String customerEmail;

	@Column(name = "seo")
	private String seo;

	@Column(name = "tinh_trang")
	private String tinhTrang;

	@Column(name="name_first_product")
	private String nameFirstProduct;
	
	@Column(name="quanlity_first_product")
	private Integer quanlityFirstProduct;
	
	@Column(name="avatar_first_product")
	private String avatarFirstProduct;
	


	

	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getNameFirstProduct() {
		return nameFirstProduct;
	}
	public void setNameFirstProduct(String nameFirstProduct) {
		this.nameFirstProduct = nameFirstProduct;
	}
	public Integer getQuanlityFirstProduct() {
		return quanlityFirstProduct;
	}
	public void setQuanlityFirstProduct(Integer quanlityFirstProduct) {
		this.quanlityFirstProduct = quanlityFirstProduct;
	}
	public String getAvatarFirstProduct() {
		return avatarFirstProduct;
	}
	public void setAvatarFirstProduct(String avatarFirstProduct) {
		this.avatarFirstProduct = avatarFirstProduct;
	}

	@Column(name ="user_id")
	@OneToMany(cascade = CascadeType.ALL, 
			   mappedBy = "saleOrder", 
			   fetch = FetchType.EAGER)
	private Set<SaleOrderProducts> saleOrderProducts = new HashSet<SaleOrderProducts>();
	public void addSaleOrderProducts(SaleOrderProducts _saleOrderProducts) {
		_saleOrderProducts.setSaleOrder(this);
		saleOrderProducts.add(_saleOrderProducts);
	}
	public void removeSaleOrderProducts(SaleOrderProducts _saleOrderProducts) {
		_saleOrderProducts.setSaleOrder(null);
		saleOrderProducts.remove(_saleOrderProducts);
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private Users user;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	

	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Set<SaleOrderProducts> getSaleOrderProducts() {
		return saleOrderProducts;
	}

	public void setSaleOrderProducts(Set<SaleOrderProducts> saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

}
