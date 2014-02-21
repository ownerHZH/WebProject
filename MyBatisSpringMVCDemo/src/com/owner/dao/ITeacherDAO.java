package com.owner.dao;

import java.util.List;

import com.owner.entity.Teacher;


public interface ITeacherDAO
{

  /**
   * 添加角色
   * @param Teacher teacher 角色实体
   * @return true or false
   */
  public boolean addTeacher(Teacher teacher);
  public void addTeacher(List<Teacher> teachers);

  /**
   * 通过角色Id查找
   * @param Teacher teacher 角色实体
   * @return Teacher teacher 角色实体
   */
  public Teacher getTeacherByCode(Teacher teacher);
  
  /**
   * 查找所有的角色
   * @param 
   * @return Teacher teacher 角色实体List
   */
  public List<Teacher> getAllTeacher();
  
  /**
   * 更新角色
   * @param Teacher teacher 角色实体
   * @return true or false
   */
  public boolean updateTeacher(Teacher teacher);
  
}

