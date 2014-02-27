package com.owner.dao;

import java.util.List;

import com.owner.entity.MenuLevelOne;
import com.owner.entity.Role;


public interface IRoleDAO
{

  /**
   * 添加角色
   * @param Role role 角色实体
   * @return true or false
   */
  public boolean addRole(Role role);

  /**
   * 通过角色Id查找
   * @param Role role 角色实体
   * @return Role role 角色实体
   */
  public Role getRoleById(Role role);
  
  /**
   * 查找所有的角色
   * @param 
   * @return Role role 角色实体List
   */
  public List<Role> getAllRole();
  
  /**
   * 更新角色
   * @param Role role 角色实体
   * @return true or false
   */
  public boolean updateRole(Role role);
  
}

