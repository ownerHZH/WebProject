package com.owner.entity;

import java.util.List;

public class MenuLevelOne {
	private int menu_level_one_id;
	private int role_code;
	private String menu_level_one_name;
	private List<MenuLevelTwo> menuLevelTwoList;
	
	public int getMenu_level_one_id() {
		return menu_level_one_id;
	}
	public void setMenu_level_one_id(int menu_level_one_id) {
		this.menu_level_one_id = menu_level_one_id;
	}
	public int getRole_code() {
		return role_code;
	}
	public void setRole_code(int role_code) {
		this.role_code = role_code;
	}
	public String getMenu_level_one_name() {
		return menu_level_one_name;
	}
	public void setMenu_level_one_name(String menu_level_one_name) {
		this.menu_level_one_name = menu_level_one_name;
	}
	public List<MenuLevelTwo> getMenuLevelTwoList() {
		return menuLevelTwoList;
	}
	public void setMenuLevelTwoList(List<MenuLevelTwo> menuLevelTwoList) {
		this.menuLevelTwoList = menuLevelTwoList;
	}
	@Override
	public String toString() {
		return "MenuLevelOne [menu_level_one_id=" + menu_level_one_id
				+ ", role_code=" + role_code + ", menu_level_one_name="
				+ menu_level_one_name + ", menuLevelTwoList="
				+ menuLevelTwoList + "]";
	}

}
