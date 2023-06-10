<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
  <body> 
      <form action="insertstu.jsp" method="post">
      <fieldset>
      <legend>添加/修改信息</legend>
        <label>学号：<input type="text" name="sno"  /></label><br>
        <label>专业：<select name="sdep">
                     <option value="计算机科学系" >计算机科学系</option>
                     <option value="外语系" >外语系</option>
                     <option value="化工系" >化工系</option>
                     <option value="机械工程系">机械工程系</option>
                    </select></label><br>
        <label>性别：<input type="radio" name="ssex" value="男" >男
                    <input type="radio" name="ssex" value="女" >女</label><br>
        <label>年龄：<input type="text" name="sage"  /></label><br>
        <label>姓名：<input type="text" name="sname" /></label><br>
        <label><input type="submit" value="提交"></label>
      </fieldset>
      </form>
     
     <br>
 
  </body>
</html>