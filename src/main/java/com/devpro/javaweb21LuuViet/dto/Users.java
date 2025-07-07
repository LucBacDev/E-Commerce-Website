package com.devpro.javaweb21LuuViet.dto;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.devpro.javaweb21LuuViet.model.BaseEntity;

@Entity
@Table(name="tbl_users")
public class Users extends BaseEntity implements UserDetails{
	@Column(name="username",length=45,nullable=false)
	private String userName;
	@Column(name="password",length=100,nullable=false)
	private String password;
	@Column(name="email",length=45,nullable=true)
	private String email;
	@Column(name="nameacc",length=45,nullable=false)
	private String nameacc;
	@Column(name="phone",length=100,nullable=true)
	private String phone;
	

	public String getNameacc() {
		return nameacc;
	}
	public void setNameacc(String nameacc) {
		this.nameacc = nameacc;
	}
	@Column(name="shipping_address",length=1000,nullable=true)
	private String shippingAddress;
	@ManyToMany(cascade= CascadeType.ALL,fetch= FetchType.EAGER)
	@JoinTable(name="tbl_users_roles",//ten bang trung gian
		joinColumns = @JoinColumn(name="user_id"),
		inverseJoinColumns = @JoinColumn(name="role_id"))
	private Set<Roles> roles= new HashSet<Roles>();
	public void addRoles(Roles role) {
		role.getUsers().add(this);
		roles.add(role);
	}
	public void deleteRoles(Roles role) {
		role.getUsers().remove(this);
		roles.remove(role);
	}
	@OneToMany(cascade=CascadeType.ALL,
			fetch=FetchType.LAZY,
			mappedBy="user")// trỏ tới property
	private Set<SaleOrder> salerOrderSet=new HashSet<SaleOrder>();
	public void addUser(SaleOrder saleorder) {
		salerOrderSet.add(saleorder);
		saleorder.setUser(this);
	}
	public void deleteUser(SaleOrder saleOrder) {
		salerOrderSet.remove(saleOrder);
		saleOrder.setUser(null);
	}
	public	String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Set<Roles> getRoles() {
		return roles;
	}
	public void setRoles(Set<Roles> roles) {
		this.roles = roles;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		return this.roles;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.userName;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
}
