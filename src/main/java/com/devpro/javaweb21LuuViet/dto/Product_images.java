package com.devpro.javaweb21LuuViet.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.devpro.javaweb21LuuViet.model.BaseEntity;

@Entity
@Table(name="tbl_products_images")
public class Product_images extends BaseEntity{
	@Column(name="title",length=500,nullable=false)
	private String title;
	@Column(name="path",length=200,nullable=false)
	private String path;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="product_id")
	private Product product;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
}
