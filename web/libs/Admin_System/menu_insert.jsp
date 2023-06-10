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
  Properties properties = new Properties();
  properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
  DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
  Connection connection = dataSource.getConnection();
  try {
    int acc = Integer.parseInt(request.getParameter("acc"));
    int id = Integer.parseInt(request.getParameter("id"));
    System.out.println(id);
    System.out.println(acc);
    String sql = "insert into state values(?,?,?,?)";
    PreparedStatement sta = connection.prepareStatement(sql);
    sta.setInt(1,id);
    sta.setString(2,"空闲");
    sta.setInt(3,acc);
    sta.setString(4,"9999-12-31");
    sta.executeUpdate();
    sta.close();
    connection.close();
  }catch (Exception e){

  }
    response.sendRedirect("table.jsp");   //再次重定向

%>
</body>
</html>



