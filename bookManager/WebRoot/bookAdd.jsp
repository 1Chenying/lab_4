<<<<<<< HEAD
%@ page language="java" contentType="text/html; charset=UTF-8"
=======
%@ page language="java" contentType="text/html; charset=UTF-8"
>>>>>>> C4
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加图书信息</title>
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
<form name="form1" method="post" action="bookSaveAdd.jsp">
  <div align="center" class="STYLE1">添加图书信息  </div>
  <table width="300" height="120" border="1" align="center">

    <tr>
      <td width="74">图书编号：</td>
      <td width="210"><input name="isbn" type="text" id="isbn"></td>
    </tr>
    <tr>
      <td>标题：</td>
      <td><input name="title" type="text" id="title"></td>
    </tr>
    <tr>
      <td>作者ID：</td>
      <td><input name="authorid" type="text" id="authorid"></td>
    </tr>
    <tr>
      <td>出版社：</td>
      <td><input name="publisher" type="text" id="publisher"></td>
    </tr>
    <tr>
      <td>出版日期：</td>
      <td><input name="publishdate" type="text" id="publishdate"></td>
    </tr>
    <tr>
      <td>价格：</td>
      <td><input name="price" type="text" id="price"></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="Submit" value="确定添加">
      <input type="reset" name="Submit2" value="重置"></td>
    </tr>
  </table>
</form>
</body>
</html>
