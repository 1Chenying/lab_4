<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑图书信息</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 36px;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<%		String strId = request.getParameter("id");//获取传过来的参数（网络上传输的只能是字符串）
	    Class.forName("com.mysql.jdbc.Driver");//java的反射
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook","root","1234");
		PreparedStatement ps =con.prepareStatement("select * from book where isbn=?");
		ps.setInt(1,Integer.parseInt(strId));
		
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
 %>
<form name="form1" method="post" action="bookSaveEdit.jsp">
<!-- 关键语句 -->
<input type="hidden" name="id" value="<%=rs.getInt("isbn") %>">
  <div align="center" class="STYLE1">编辑图书信息</div>
  <table width="300" height="120" border="1" align="center">

    <tr>
      <td width="100">图书编号：</td>
      <td width="210"><input name="name" type="text" id="isbn" value="<%=rs.getString("isbn") %>"></td>
    </tr>
    <tr>
      <td>标题：</td>
      <td><input name="publish" type="text" id="title" value="<%=rs.getString("title") %>"></td>
    </tr>
    <tr>
      <td>作者：</td>
      <td><input name="price" type="text" id="authorid" value="<%=rs.getString("authorid") %>"></td>
    </tr>
     <tr>
      <td>出版社：</td>
      <td><input name="price" type="text" id="publisher" value="<%=rs.getString("publisher") %>"></td>
    </tr>
     <tr>
      <td>出版日期：</td>
      <td><input name="price" type="text" id="publishdate" value="<%=rs.getString("publishdate") %>"></td>
    </tr>
     <tr>
      <td>价格：</td>
      <td><input name="price" type="text" id="price" value="<%=rs.getString("price") %>"></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="Submit" value="确定修改">
      <input type="reset" name="Submit2" value="取消"></td>
    </tr>
  </table>
</form>
<%
}
con.close();
 %>
</body>
</html>