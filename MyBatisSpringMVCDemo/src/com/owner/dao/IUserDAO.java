package com.owner.dao;

import com.owner.entity.UserTable;

public interface IUserDAO
{
  /**
   * add user into db
   * @param userTable necessary user information
   * @return add if succeed
   */
  public boolean addUser(UserTable userTable);
  
  /**
   * validate user
   * @param userTable
   * @return
   */
  public boolean checkUser(UserTable userTable);
  
  
  public boolean updateUser( UserTable userTable );
}

