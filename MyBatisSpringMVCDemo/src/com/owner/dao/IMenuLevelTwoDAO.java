package com.owner.dao;

import java.util.List;

import com.owner.entity.MenuLevelTwo;


public interface IMenuLevelTwoDAO
{

  public boolean addMenuLevelTwo(MenuLevelTwo menuLevelTwo);

  public List<MenuLevelTwo> getMenuLevelTwo(MenuLevelTwo menuLevelTwo);
  
  public boolean updateMenuLevelTwo( MenuLevelTwo menuLevelTwo);
}

