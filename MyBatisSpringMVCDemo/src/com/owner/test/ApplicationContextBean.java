package com.owner.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ApplicationContextBean
{
  private static  ApplicationContext context          = null;
  private final static String       CONFIG_FILE_NAME = "beans.xml";

  static
  {
    context = new ClassPathXmlApplicationContext( CONFIG_FILE_NAME );
  }

  
  public static void main( String[] args )
  {
    /*IUserDAO dao = getUserDAO();
    UserTable userTable = new UserTable();
    userTable.setPassword( "qqqr123" );
    userTable.setUserName( "test" );
    boolean result = dao.addUser( userTable );
    System.out.println(result);*/
  }

}

