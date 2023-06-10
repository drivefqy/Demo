<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.alibaba.druid.pool.DruidDataSourceFactory" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="sun.security.provider.MD5" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    if (name!=null){
    String pwd = request.getParameter("pwd");
    pwd = "MD5("+pwd+")";
    Properties properties = new Properties();
    properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
    DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
    Connection connection = dataSource.getConnection();
    String sql = "select  count(*) from user1";
    PreparedStatement tmp = connection.prepareStatement(sql);
    ResultSet resultSet = tmp.executeQuery();
    int sum = 0;
    while (resultSet.next()){
        sum  = resultSet.getInt(1)+1;
    }
    resultSet.close();
    tmp.close();
    String s1 = LocalDate.now().toString().replaceAll("[-,\\s+]", "");
    String format =  s1 + String.format("%02d", sum);
    String id = (format).substring(0,10);
    String sql_insert1 = "insert into  user1 values(?,?,"+pwd+",NOW(),NOW())";
    PreparedStatement sta1 = connection.prepareStatement(sql_insert1);
    sta1.setString(1,id);
    sta1.setString(2,name);
    sta1.execute();
    sta1.close();}
%>
ok
<%response.sendRedirect("longin.jsp");   //再次重定向%>
</body>
</html>
