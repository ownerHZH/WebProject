package com.owner.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ApplicationContextBean
{
 /* private static  ApplicationContext context          = null;
  private final static String       CONFIG_FILE_NAME = "beans.xml";

  static
  {
    context = new ClassPathXmlApplicationContext( CONFIG_FILE_NAME );
  }*/

  
  public static void main( String[] args )
  {
    /*IUserDAO dao = getUserDAO();
    UserTable userTable = new UserTable();
    userTable.setPassword( "qqqr123" );
    userTable.setUserName( "test" );
    boolean result = dao.addUser( userTable );
    System.out.println(result);*/
	  getconn();
  }



      public static   void getconn() {
         // TODO Auto-generated method stub
         // Create a variable for the connection string.
         String connectionUrl = "jdbc:sqlserver://localhost:1433;database=RepositoryDB;integratedSecurity=false;user=sa;password=699074;";
   
         // Declare the JDBC objects.
         Connection con = null;
         Statement stmt = null;
         ResultSet rs = null;
   
         try {
             // Establish the connection.
             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
             con = DriverManager.getConnection(connectionUrl);
   
             // Create and execute an SQL statement that returns some data.
             String SQL = "SELECT [menu_level_one_id],[role_code],[menu_level_one_name],[mapping_page] FROM [RepositoryDB].[dbo].[menulevelone]";
             stmt = con.createStatement();
             rs = stmt.executeQuery(SQL);
   
             // Iterate through the data in the result set and display it.
             while (rs.next()) {
               
                System.out.println("【SUCC】获取 SQL-SERVER 的连接已成功。[1]="+rs.getString(2));
             }
         }
   
         // Handle any errors that may have occurred.
         catch (Exception e) {
             System.out.println("【ERROR】打开 SQL-SERVER 的连接失败。");
             e.printStackTrace();
         }
   
         finally {
             if (rs != null)
                try {
                    rs.close();
                } catch (Exception e) {
                }
             if (stmt != null)
                try {
                    stmt.close();
                } catch (Exception e) {
                }
             if (con != null)
                try {
                    con.close();
                } catch (Exception e) {
                }
         }
      }

}

