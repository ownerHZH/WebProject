package com.owner.dao;

import java.util.List;

import com.owner.entity.MenuLevelThree;


public interface IMenuLevelThreeDAO
{

  public boolean addMenuLevelThree(MenuLevelThree menuLevelThree);

  public List<MenuLevelThree> getMenuLevelThree(MenuLevelThree menuLevelThree);
  
  public boolean updateMenuLevelThree( MenuLevelThree menuLevelThree);
}

