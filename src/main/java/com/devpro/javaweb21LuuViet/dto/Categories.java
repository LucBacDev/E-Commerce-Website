package com.devpro.javaweb21LuuViet.dto;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.engine.internal.Cascade;

import com.devpro.javaweb21LuuViet.model.BaseEntity;
@Entity
@Table(name="tbl_category")
public class Categories extends BaseEntity{
	@Column(name="name" ,length=100 , nullable=false)
	private String name;
	@Column(name="description",length=100,nullable=false)
	private String description;
	@Column(name="seo",length=1000,nullable=true)
	private String seo;
	@OneToMany(cascade=CascadeType.ALL,
				fetch=FetchType.LAZY,
				mappedBy="categories")// trỏ tới property
	private Set<Product> products=new HashSet<Product>();
	public void addProduct(Product product) {
		products.add(product);
		product.setCategories(this);
	}
	public void deleteProduct(Product product) {
		products.remove(product);
		product.setCategories(null);
	}
	public String getName() {
		return name;
	}
	public Set<Product> getProduct() {
		return products;
	}
	public void setProduct(Set<Product> product) {
		this.products = product;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSeo() {
		return seo;
	}
	public void setSeo(String seo) {
		this.seo = seo;
	}
	
}
