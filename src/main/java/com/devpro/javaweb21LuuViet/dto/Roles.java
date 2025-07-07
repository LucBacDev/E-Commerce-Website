package com.devpro.javaweb21LuuViet.dto;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

import com.devpro.javaweb21LuuViet.model.BaseEntity;

@Entity
@Table(name="tbl_roles")
public class Roles extends BaseEntity implements GrantedAuthority{
	@Column(name="name",length=45, nullable=false)
	private String name;
	@Column(name="description",length=45, nullable=false)
	private String description;
	@ManyToMany(cascade= CascadeType.ALL,fetch= FetchType.EAGER,mappedBy="roles")
	private Set<Users> users= new HashSet<Users>();
	public void addUsers(Users user) {
		user.getRoles().add(this);
		users.add(user);
	}
	public void deleteUsers(Users user) {
		user.getRoles().remove(this);
		users.remove(user);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public Set<Users> getUsers() {
		return users;
	}
	public void setUsers(Set<Users> users) {
		this.users = users;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String getAuthority() {
		
		return this.name;
	}
	
}
