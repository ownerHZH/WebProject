package com.owner.test;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.owner.dao.IUserDAO;
import com.owner.entity.UserTable;

public class ApplicationContextBean
{
  private static  ApplicationContext context          = null;
  private final static String       CONFIG_FILE_NAME = "beans.xml";

  static
  {
    context = new ClassPathXmlApplicationContext( CONFIG_FILE_NAME );
  }

  public static IUserDAO  getUserDAO()
  {
    try
    {
      
      return (IUserDAO)context.getBean( "userDAO" );
    }
    catch ( BeansException e )
    {
      return null;
    }
  }
  
  public static void main( String[] args )
  {
    IUserDAO dao = getUserDAO();
    UserTable userTable = new UserTable();
    userTable.setPassword( "qqqr123" );
    userTable.setUserName( "test" );
    boolean result = dao.addUser( userTable );
    System.out.println(result);
  }

}

