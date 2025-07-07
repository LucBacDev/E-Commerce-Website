package com.devpro.javaweb21LuuViet.dto;

public class UserSearchModel extends BaseSearchModel{
	String keyword;
	Integer RoleId;
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getRoleId() {
		return RoleId;
	}
	public void setRoleId(Integer roleId) {
		RoleId = roleId;
	}
	
}
