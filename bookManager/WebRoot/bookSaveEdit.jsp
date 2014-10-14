<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>保存编辑</title>
</head>
<body>
<%
	    String isbn = request.getParameter("isbn");
    	String title = request.getParameter("title");
    	String authorid = request.getParameter("authorid");
    	String publisher = request.getParameter("publisher");
    	String publishdate = request.getParameter("publishdate");
    	String price = request.getParameter("price");
	//int price=Integer.parseInt(pr);//数据转换：字符串（数字）转整型
	//int isbn=Integer.parseInt(strId);
	//利用jdbc完成数据库插入操作
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook","root","1234");
	PreparedStatement ps =con.prepareStatement("update book set title=?,authorid=?,publisher=?,publishdate=?,price=? where isbn=?");
	ps.setString(1,isbn);
	ps.setString(2,title);
	ps.setString(3,authorid);
	ps.setString(4,publisher);
	ps.setString(5,publishdate);
	ps.setString(6,price);
	ps.execute();
	
	out.print("图书已编辑成功！");
	con.close();
	response.sendRedirect("bookList.jsp");
 %>
 <form><input name="add" type="button" id="add" value="返回" onClick="location='bookEdit.jsp'"></form>
</body>
</html>