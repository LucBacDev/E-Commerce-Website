package com.devpro.javaweb21LuuViet.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name ="tbl_contact")
public class Contact extends BaseEntity{
	@Column(name="full_name", length =45,nullable= false )
	private String fullName;
	@Column(name="email",length = 45,nullable = false)
	private String email;
	@Column(name="message",length = 1000,nullable = false)
	private String ideal;
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIdeal() {
		return ideal;
	}
	public void setIdeal(String ideal) {
		this.ideal = ideal;
	}
	
}
