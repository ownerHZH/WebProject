package com.owner.dao;

import java.util.List;

import com.owner.entity.MenuLevelOne;


public interface IMenuLevelOneDAO
{

  public boolean addMenuLevelOne(MenuLevelOne menuLevelOne);

  public List<MenuLevelOne> getMenuLevelOne(MenuLevelOne menuLevelOne);
  
  public boolean updateMenuLevelOne( MenuLevelOne menuLevelOne);
}

