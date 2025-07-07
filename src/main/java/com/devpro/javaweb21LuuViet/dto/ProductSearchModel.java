package com.devpro.javaweb21LuuViet.dto;

import java.math.BigDecimal;

public class ProductSearchModel extends BaseSearchModel{
	String keyword;
	Integer CategoryId;
	String loaiSanPham;
	String giaCuaSanPham;
	public String getLoaiSanPham() {
		return loaiSanPham;
	}
	public void setLoaiSanPham(String loaiSanPham) {
		this.loaiSanPham = loaiSanPham;
	}
	public String getGiaCuaSanPham() {
		return giaCuaSanPham;
	}
	public void setGiaCuaSanPham(String string) {
		this.giaCuaSanPham = string;
	}
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getCategoryId() {
		return CategoryId;
	}
	public void setCategoryId(Integer categoryId) {
		CategoryId = categoryId;
	}
	
}
