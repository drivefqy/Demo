<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.alibaba.druid.pool.DruidDataSourceFactory" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>
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
<h2 style="text-align: center;color: skyblue;margin: 36px auto;font-size:50px ">我的预约</h2>
<table>
    <tr><th>序号</th><th>预约时间</th><th>就餐时间</th><th>餐桌号</th><th>预约状态</th><th>取消预约</th></tr>
<%
    //create table appoinment(name varchar(10),date1 date,date2 date,id int);
    request.setCharacterEncoding("utf-8");
    Properties properties = new Properties();
    properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
    DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
    Connection connection = dataSource.getConnection();
    String  sql  = "select * from appoinment where name=?";
    String  user = (String) session.getAttribute("name_sess");
    PreparedStatement sta = connection.prepareStatement(sql);
    sta.setString(1,user);
    ResultSet result = sta.executeQuery();
    Date date1 = null;
    String date2 = null;
    int id = 0;
    String status = "";
    int count = 0;
    while (result.next()){
        date1 = result.getDate("date1");
        date2 = result.getString("date2");
        id = result.getInt("id");
        status = result.getString(5);
        count++;
        %>
    <tr>
        <td><%=count%></td>
        <td><%=date1%></td>
        <td><%=date2%></td>
        <td><%=id%></td>
        <td><%=status%></td>
        <td><%if (status.equals("预约成功")){%> <a href="Cancel_App.jsp?id=<%=id%>">取消预约</a><% }%></td>
    </tr>
<%
    }
    result.close();
    sta.close();
    connection.close();
%>
    <tr>
        <td colspan="6">
            总计:<%=count%>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <a href="my.jsp"style="text-decoration:none;font: 28px 楷体;">返回上一个界面</a>
        </td>
    </tr>
</table>
</body>
</html>
