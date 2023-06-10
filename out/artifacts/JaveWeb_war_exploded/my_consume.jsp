<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.alibaba.druid.pool.DruidDataSourceFactory" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: CD
  Date: 2022/12/10
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table{
            width: 100%;
            height: 50px;
            border: 2px solid black;
            border-collapse: collapse;
            background-color: skyblue;
        }
        tr,th,td{
            width: 60px;
            height: 50px;
            font: 25px 楷体;
            line-height: 50px;
            border: 2px solid black;
            border-collapse: collapse;
            text-align: center;
        }
        a{
            text-decoration: none;
            font: 25px 楷体 ;
            color: blue;
        }
    </style>
</head>
<body>
<h2 style="text-align: center;color: skyblue;margin: 36px auto;font-size:50px ">我的消费</h2>
<table>
    <tr><th>序号</th><th>时间</th><th>金额</th></tr>
<%
    // create table consume(name varchar(10),date1 date,count double);
    request.setCharacterEncoding("utf-8");
    Properties properties = new Properties();
    properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
    DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
    Connection connection = dataSource.getConnection();
    String  sql  = "select * from consume where name=?";
    String  user = (String) session.getAttribute("name_sess");
    PreparedStatement sta = connection.prepareStatement(sql);
    sta.setString(1,user);
    ResultSet result = sta.executeQuery();
    Date date1 = null;
    double count = 0;
    int tmp = 0;
    while (result.next()){
        date1 = result.getDate("date1");
        count = result.getDouble("count");
        tmp++;
     %>
    <tr><td><%=tmp%></td><td><%=date1%><td><%=count%></td></tr>
     <%
    }
    result.close();
    sta.close();
    connection.close();
%>
    <tr>
        <td colspan="3">
            总计:<%=tmp%>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <a href="my.jsp"style="text-decoration:none;font: 28px 楷体;">返回上一个界面</a>
        </td>
    </tr>
</table>
</body>
</html>
