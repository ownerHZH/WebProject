package com.owner.service;

import java.util.List;

import com.owner.entity.MenuLevelOne;
import com.owner.entity.MenuLevelTwo;

public interface IMenuService {
	
	/**
	 * 根据角色code获取一级菜单项
	 * @param code 角色code
	 * @return 一级菜单List
	 */
   public List<MenuLevelOne> getMenuOneLevelByRoleCode(int code);
   
   /**
    * 根据一级菜单code获取相对应二级和三级菜单
    * @param code  一级菜单Code
    * @return  对应的二级和三级菜单
    */
   public List<MenuLevelTwo> getMenuLevelTwoAndThreeByMenuLevelOneCode(int code);
}
