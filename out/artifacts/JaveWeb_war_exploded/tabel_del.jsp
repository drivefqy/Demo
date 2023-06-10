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
    int id = Integer.parseInt(request.getParameter("id"));
    String type = request.getParameter("type");
    Properties properties = new Properties();
    properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
    DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
    Connection connection = dataSource.getConnection();
    String sql = "";
    if (type.equals("menu")){
        sql = "delete from menu where ID =?";

    }else if (type.equals("table")){
        sql = "delete from state where ID =?";
    }
    PreparedStatement sta = connection.prepareStatement(sql);
    sta.setInt(1,id);
    sta.execute();
    sta.close();
    connection.close();
    if (type.equals("menu")){
        response.sendRedirect("menu.jsp");   //再次重定向

    }else if (type.equals("table")){
        response.sendRedirect("table.jsp");   //再次重定向
    }

%>

</body>
</html>


