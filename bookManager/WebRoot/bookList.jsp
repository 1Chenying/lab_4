<1%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
    
    <title>添加书籍</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书管理面板</title>
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
此作者所著书籍：
    <h3>
	</h3> 
	<%
		
		String authorname;
		authorname = request.getParameter("name");
		out.print("作者："+authorname+"<br>");
		try {
		  String ID = "";
		  String sql = "";
	      Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook","root","1234");
	      Statement stmt = connect.createStatement();
	      sql = "select *from author where name =\""+ authorname + "\"";
	      ResultSet rs1 = stmt.executeQuery(sql);
	      while(rs1.next()){
	      	ID=rs1.getString(1);
	      	}
	      
	      sql = "select *from author where AuthorID = \"" +ID+ "\"";
	      out.print("ID号："+ID+"<br>"+"<br>");
	      rs1 = stmt.executeQuery(sql);
	    	while (rs1.next()) {
		        out.print("书   名："+rs1.getString(2)+"<br>"+"ISBN :"+rs1.getString(1)+"<br>"+"出版社 ："+rs1.getString(4)+"<br>"+"出版日期："+rs1.getString(5)+"<br>"+"<br>");
		    }
	    }catch (Exception e) {
	      out.print("get data error!");
	      e.printStackTrace();
	     }
	 %>
	 <form><input name="add" type="button" id="add" value="返回查找页面" onClick="location='sum.jsp'"></form>
<form name="form1" method="get" action="bookDel.jsp">
  <table width="600" border="1" align="center">
    <caption>
      <span class="STYLE1">图书管理面板      </span>
    </caption>
    <tr>
      <td width="98">全选
      <input type="checkbox" name="checkbox" value="checkbox"></td>
      <td width="98">图书编号</td>
      <td width="118">标题</td>
      <td width="108">作者ID</td>
      <td width="78">出版社</td>
      <td width="108">出版日期</td>
      <td width="108">价格</td>
      <td width="60">操作</td>
    </tr>
    <%
    		String strPage=request.getParameter("page");
    		int curPage=1;//当前显示的页数
    		if(strPage!=null){
    		curPage=Integer.parseInt(strPage);
    		}
    		
    		Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook","root","1234");
			//PreparedStatement ps = con.prepareStatement("select * from book");
			Statement  stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);     
			String sql="select * from book";   
			 ResultSet rs=stmt.executeQuery(sql);
			//每页显示3条,得到总页数
			rs.last();//游标指针滚动到最后一行
			int row = rs.getRow();//得到当前记录行数
			int pages = row%3!=0?row/3+1:row/3;//计算出总页数
			rs.beforeFirst();//还原到首行之前
			//定位器
			int position = (curPage-1)*3;
			if(position!=0){
				rs.absolute(position);
			}
			int count=0;
			while(rs.next()&&count<3){
			count++;
			%>
    <tr>
    <td><input type="checkbox" name="ids" value="<%=rs.getInt("isbn") %>"></td>
      <td ><%=rs.getInt("isbn") %></td>
      <td ><%=rs.getString("title") %></td>
      <td ><%=rs.getString("authorid") %></td>
       <td ><%=rs.getString("publisher") %></td>
      <td ><%=rs.getString("publishdate") %></td>
      <td ><%=rs.getInt("price") %></td>
      
      
      <td width="60"><a href="bookEdit.jsp?id=<%=rs.getInt("isbn")%>">编辑</a></td>
    </tr>
    
 
    <%
			
			}
			con.close();
     %>
    <tr>
      <td colspan="6" align="center">
      <input type="submit" name="ids" value="删除图书">
      <input name="add" type="button" id="add" value="添加图书" onClick="location='bookAdd.jsp'">
                <a href="bookList.jsp?page=1">首页</a>
          <a href="bookList.jsp?page=<%=curPage-1 %>">上一页</a>
          <a href="bookList.jsp?page=<%=curPage+1 %>">下一页</a>
          <a href="bookList.jsp?page=<%=pages %>">尾页</a>
          </td>
    </tr>
  </table>
</form>

<p align="center" style="font-size:12px;">copyritht @2014 by ChenYing </p>
	
	
</body>
</html>
