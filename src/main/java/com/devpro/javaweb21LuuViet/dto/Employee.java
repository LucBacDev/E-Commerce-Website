package com.devpro.javaweb21LuuViet.dto;

public class Employee {
	private Integer id;//property có get set
	private String name;//property
	
	public Employee(Integer id, String name) {
		this.id = id;
		this.name = name;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
