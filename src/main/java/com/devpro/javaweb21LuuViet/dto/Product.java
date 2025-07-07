package com.devpro.javaweb21LuuViet.dto;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.devpro.javaweb21LuuViet.model.BaseEntity;

@Entity
@Table(name="tbl_products")
public class Product extends BaseEntity{
	@Column(name="ten_san_pham",length=1000,nullable=false)
	private String ten_san_pham;
	@Column(name="ten_khong_dau",length=1000,nullable=true)
	private String ten_khong_dau;
	
	@Column(name = "gia_ban", precision = 13, scale = 0, nullable = false)
	private BigDecimal gia_ban;

	@Column(name = "gia_cu", precision = 13, scale = 0, nullable = true)
	private BigDecimal gia_cu;
	
	@Column(name="huong_dan_su_dung",length=3000,nullable=false)
	private String huong_dan_su_dung;
	
	@Lob
	@Column(name="thong_tin_them",nullable=false,columnDefinition="LONGTEXT")
	private String thong_tin_them;
	
	@Column(name="anh_san_pham",nullable=true)
	private String anh_san_pham;
	
	@Column(name="seo",length=1000,nullable=true)
	private String seo;
	
	@Column(name="is_hot",nullable=true)
	private Boolean isHot = Boolean.FALSE;
	
	@Column(name="so_luong",nullable=true)
	private Integer so_luong;
	
	@Column(name="so_luong_mua",nullable=true)
	private Integer soLuongMua;
	
	public Integer getSoLuongMua() {
		return soLuongMua;
	}
	public void setSoLuongMua(Integer soLuongMua) {
		this.soLuongMua = soLuongMua;
	}
	@Column(name="thuong_hieu",length=1000,nullable=false)
	private String thuong_hieu;
	
	@Column(name="bao_quan",length=1000,nullable=false)
	private String bao_quan;
	
	public Categories getCategories() {
		return categories;
	}
	public void setCategories(Categories categories) {
		this.categories = categories;
	}
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="category_id")
	private Categories categories;
	
	
	@OneToMany(cascade=CascadeType.ALL,
			fetch=FetchType.LAZY,
			mappedBy="product")
	private Set<Product_images> danhSachAnh = new HashSet<Product_images>();
	public void addProduct_images(Product_images product_images) {
		danhSachAnh.add(product_images);
		product_images.setProduct(this);	
		}
	public void deleteProduct_images(Product_images product_images) {
		danhSachAnh.remove(product_images);
		product_images.setProduct(null);
	}
	public Set<Product_images> getDanhSachAnh() {
		return danhSachAnh;
	}
	public void setDanhSachAnh(Set<Product_images> danhSachAnh) {
		this.danhSachAnh = danhSachAnh;
	}
	public String getTen_san_pham() {
		return ten_san_pham;
	}
	public void setTen_san_pham(String ten_san_pham) {
		this.ten_san_pham = ten_san_pham;
	}
	public BigDecimal getGia_ban() {
		return gia_ban;
	}
	public void setGia_ban(BigDecimal gia_ban) {
		this.gia_ban = gia_ban;
	}
	public BigDecimal getGia_cu() {
		return gia_cu;
	}
	public void setGia_cu(BigDecimal gia_cu) {
		this.gia_cu = gia_cu;
	}
	public String getHuong_dan_su_dung() {
		return huong_dan_su_dung;
	}
	public void setHuong_dan_su_dung(String huong_dan_su_dung) {
		this.huong_dan_su_dung = huong_dan_su_dung;
	}
	public String getThong_tin_them() {
		return thong_tin_them;
	}
	public void setThong_tin_them(String thong_tin_them) {
		this.thong_tin_them = thong_tin_them;
	}
	public String getAnh_san_pham() {
		return anh_san_pham;
	}
	public void setAnh_san_pham(String anh_san_pham) {
		this.anh_san_pham = anh_san_pham;
	}
	public String getSeo() {
		return seo;
	}
	public void setSeo(String seo) {
		this.seo = seo;
	}
	public Boolean getIsHot() {
		return isHot;
	}
	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}
	public Integer getSo_luong() {
		return so_luong;
	}
	public void setSo_luong(Integer so_luong) {
		this.so_luong = so_luong;
	}
	public String getThuong_hieu() {
		return thuong_hieu;
	}
	public void setThuong_hieu(String thuong_hieu) {
		this.thuong_hieu = thuong_hieu;
	}
	public String getBao_quan() {
		return bao_quan;
	}
	public void setBao_quan(String bao_quan) {
		this.bao_quan = bao_quan;
	}
	public String getTen_khong_dau() {
		return ten_khong_dau;
	}
	public void setTen_khong_dau(String ten_khong_dau) {
		this.ten_khong_dau = ten_khong_dau;
	}
	

	
	
	
	
	
	
	
}
