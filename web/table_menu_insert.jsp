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
    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String classify = request.getParameter("classify");
    double price = Double.parseDouble(request.getParameter("price"));
    String sql = "insert into menu values(?,?,?,?)";
    PreparedStatement sta = connection.prepareStatement(sql);
    sta.setString(1,id);
    sta.setString(2,name);
    sta.setDouble(3,price);
    sta.setString(4,classify);
    sta.execute();
    sta.close();
    connection.close();
        response.sendRedirect("menu.jsp");   //再次重定向
%>
</body>
</html>



