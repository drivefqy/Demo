<%@ page import="java.util.ArrayList" %>
<%@ page import="Manhanlou.Order_bean" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.alibaba.druid.pool.DruidDataSourceFactory" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //create table bill(name varchar(10),date1 date,consume varchar(200),sum1 int);
    request.setCharacterEncoding("utf-8");
    Properties properties = new Properties();
    properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
    DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
    Connection connection = dataSource.getConnection();
    ArrayList<Order_bean> list = (ArrayList)session.getAttribute("list");
    String  user = (String) session.getAttribute("name_sess");
    String str = "";
    double sum = 0;
    for (Order_bean i :list){
         str =str+"#"+ i.toString();
         sum = i.getSum()+sum;
    }
    System.out.println(str);
    System.out.println(sum);
    // create table consume(name varchar(10),date1 date,count double)
    String sql = "insert into bill values(?,NOW(),?,?)";
    String sql1 = "insert into consume values(?,NOW(),?)";
    PreparedStatement sta = connection.prepareStatement(sql);
    PreparedStatement sta1 = connection.prepareStatement(sql1);
    sta.setString(1,user);
    sta.setString(2,str);
    sta.setDouble(3,sum);
    sta1.setString(1,user);
    sta1.setDouble(2,sum);
    sta.executeUpdate();
    sta1.executeUpdate();
    sta.close();
    sta1.close();
    connection.close();
    list.clear();
    response.sendRedirect("display_car.jsp");
%>
</body>
</html>
