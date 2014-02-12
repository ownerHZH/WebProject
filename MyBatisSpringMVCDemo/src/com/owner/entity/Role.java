package com.owner.entity;

public class Role {
	
	private int role_code;      //角色编号
	private String role_name;//角色名称
	private String role_comment;//角色备注
	
	public int getRole_code() {
		return role_code;
	}
	public void setRole_code(int role_code) {
		this.role_code = role_code;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getRole_comment() {
		return role_comment;
	}
	public void setRole_comment(String role_comment) {
		this.role_comment = role_comment;
	}
	@Override
	public String toString() {
		return "Role [role_code=" + role_code + ", role_name=" + role_name
				+ ", role_comment=" + role_comment + "]";
	}

}
