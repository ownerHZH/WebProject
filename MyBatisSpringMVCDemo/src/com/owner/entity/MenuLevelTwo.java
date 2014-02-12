package com.owner.entity;

import java.util.List;

public class MenuLevelTwo {
	private int menu_level_two_id;
	private int menu_level_one_id;
	private String menu_level_two_name;
	private List<MenuLevelThree> menuLevelThreeList;
	
	public int getMenu_level_two_id() {
		return menu_level_two_id;
	}
	public void setMenu_level_two_id(int menu_level_two_id) {
		this.menu_level_two_id = menu_level_two_id;
	}
	public int getMenu_level_one_id() {
		return menu_level_one_id;
	}
	public void setMenu_level_one_id(int menu_level_one_id) {
		this.menu_level_one_id = menu_level_one_id;
	}
	public String getMenu_level_two_name() {
		return menu_level_two_name;
	}
	public void setMenu_level_two_name(String menu_level_two_name) {
		this.menu_level_two_name = menu_level_two_name;
	}
	public List<MenuLevelThree> getMenuLevelThreeList() {
		return menuLevelThreeList;
	}
	public void setMenuLevelThreeList(List<MenuLevelThree> menuLevelThreeList) {
		this.menuLevelThreeList = menuLevelThreeList;
	}
	@Override
	public String toString() {
		return "MenuLevelTwo [menu_level_two_id=" + menu_level_two_id
				+ ", menu_level_one_id=" + menu_level_one_id
				+ ", menu_level_two_name=" + menu_level_two_name
				+ ", menuLevelThreeList=" + menuLevelThreeList + "]";
	}

}
