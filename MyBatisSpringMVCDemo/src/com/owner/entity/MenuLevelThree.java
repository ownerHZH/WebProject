package com.owner.entity;

public class MenuLevelThree {
	private int menu_level_three_id;
	private int menu_level_two_id;
	private String menu_level_three_name;
	
	public int getMenu_level_three_id() {
		return menu_level_three_id;
	}
	public void setMenu_level_three_id(int menu_level_three_id) {
		this.menu_level_three_id = menu_level_three_id;
	}
	public int getMenu_level_two_id() {
		return menu_level_two_id;
	}
	public void setMenu_level_two_id(int menu_level_two_id) {
		this.menu_level_two_id = menu_level_two_id;
	}
	public String getMenu_level_three_name() {
		return menu_level_three_name;
	}
	public void setMenu_level_three_name(String menu_level_three_name) {
		this.menu_level_three_name = menu_level_three_name;
	}
	@Override
	public String toString() {
		return "MenuLevelThree [menu_level_three_id=" + menu_level_three_id
				+ ", menu_level_two_id=" + menu_level_two_id
				+ ", menu_level_three_name=" + menu_level_three_name + "]";
	}

}
