<1%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="3;URL=bookList.jsp">
<title>删除图书</title>
</head>
<body>
<%
		
		String delet="";
		delet = request.getParameter("ids");
    	out.print(delet+"<br>");
		
		//String[] ids = request.getParameterValues("ids");
		String sql = "";
		Class.forName("com.mysql.jdbc.Driver");
		Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook","root","1234");
		PreparedStatement ps = connect.prepareStatement("delete from book where isbn=?");
 		
 		Statement stmt = connect.createStatement();
		     sql = "delete from book where isbn = \"" +delet+ "\"";
		     stmt.executeUpdate(sql);
 		connect.close();
 %>
正在删除图书，3秒后自动跳转......
</body>
</html>
