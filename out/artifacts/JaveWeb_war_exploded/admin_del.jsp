<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="com.alibaba.druid.pool.DruidDataSourceFactory" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body style="background-color:#232525;">
<%
  String user = (String)session.getAttribute("name_sess");
  if(user.equals("admin")) {
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    Properties properties = new Properties();
    properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
    DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
    Connection connection = dataSource.getConnection();
    String sql = "delete from user1 where ID=?";
    String sql1 = "delete from admin_user where ID=?";
    PreparedStatement sta = connection.prepareStatement(sql);
    PreparedStatement sta1 = connection.prepareStatement(sql1);
    sta.setString(1, id);
    sta.execute();
    sta.close();
    sta1.setString(1, id);
    sta1.execute();
    sta1.close();
    connection.close();
    response.sendRedirect("Interface.jsp");   //再次重定向
  }else {%>
<h2 style="text-align: center;margin-top: 200px ;color: red;background-color:#232525;font: 66px 楷体" >当前管理员非超级管理员，无删除权限</h2>
<h2 style="text-align: center;margin-top: 20px;background-color:#232525;font: 66px 楷体"><a href ='Interface.jsp' style="text-decoration: none;color: red" >点击此处返回主界面</a></h2>
<%
  }
%>

</body>
</html>



