package com.owner.dao;

import java.util.List;

import com.owner.entity.Major;


public interface IMajorDAO
{

  /**
   * 添加角色
   * @param Major major 角色实体
   * @return true or false
   */
  public boolean addMajor(Major major);
  public void addMajor(List<Major> majors);

  /**
   * 通过角色Id查找
   * @param Major major 角色实体
   * @return Major major 角色实体
   */
  public Major getMajorById(Major major);
  
  /**
   * 查找所有的角色
   * @param 
   * @return Major major 角色实体List
   */
  public List<Major> getAllMajor();
  
  /**
   * 更新角色
   * @param Major major 角色实体
   * @return true or false
   */
  public boolean updateMajor(Major major);
  
}

