<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>保存添加</title>
</head>
<body>
<%
//获取提交参数
    String isbn = request.getParameter("isbn");
    	String title = request.getParameter("title");
    	String authorid = request.getParameter("authorid");
    	String publisher = request.getParameter("publisher");
    	String publishdate = request.getParameter("publishdate");
    	//String price = request.getParameter("price");
	//String name=request.getParameter("name");
	//String pub=request.getParameter("publish");
	String price=request.getParameter("price");
	//int price=Integer.parseInt(strPr);//数据转换：字符串（数字）转整型
	//利用jdbc完成数据库插入操作
	String sql = "";
		     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook","root","1234");
		     System.out.println("Success connect Mysql server!");
		     Statement stmt = con.createStatement();
		     stmt.executeUpdate("insert into book values(\"" +isbn+ "\",'','','','',\"" +price+ "\")");
		     sql = "update book set title = \"" +title+ "\" , authorid =  \"" +authorid+ "\",  publisher =  \"" +publisher+ "\", publishdate =  \"" +publishdate+ "\", Price =  \"" +price+ "\" where isbn = \"" +isbn+ "\"";
		     stmt.executeUpdate(sql);
	out.print("图书已添加成功！");
	con.close();
	//
 %>
 <form><input name="add" type="button" id="add" value="返回" onClick="location='bookAdd.jsp'"></form>
<form><input name="add" type="button" id="add" value="返回管理页面" onClick="location='bookList.jsp'"></form>
 
</body>
</html>