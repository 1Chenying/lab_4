package bookManager;
import java.sql.*;
public class test {
  public static void main(String args[]) {
    try {
      Class.forName("com.mysql.jdbc.Driver");     //����MYSQL JDBC�����   
     System.out.println("Success loading Mysql Driver!");
    }
    catch (Exception e) {
      System.out.print("Error loading Mysql Driver!");
      e.printStackTrace();
    }
    try {
      Connection connect = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/book","root","1234");
      System.out.println("Success connect Mysql server!");
      Statement stmt = connect.createStatement();
      ResultSet rs = stmt.executeQuery("select *from author");
while (rs.next()) {
        System.out.println(rs.getString("name"));
      }
    }
    catch (Exception e) {
      System.out.print("get data error!");
      e.printStackTrace();
    }
  }
}