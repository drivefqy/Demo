<%@ page import="java.util.ArrayList" %>
<%@ page import="Manhanlou.Order_bean" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="com.alibaba.druid.pool.DruidDataSourceFactory" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="org.eclipse.jdt.internal.compiler.env.INameEnvironment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<%
  request.setCharacterEncoding("utf-8");
  String  id = request.getParameter("id");
  Properties properties = new Properties();
  properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
  DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
  Connection connection = dataSource.getConnection();
  String sql = "delete from user1 where ID=?";
  String sql1 = "delete from admin_user where ID=?";
  PreparedStatement sta = connection.prepareStatement(sql);
  PreparedStatement sta1 = connection.prepareStatement(sql1);
  sta.setString(1,id);
  sta.execute();
  sta.close();
  sta1.setString(1,id);
  sta1.execute();
  sta1.close();
  connection.close();
  response.sendRedirect("Interface.jsp");   //再次重定向
%>

</body>
</html>



