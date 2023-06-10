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
<h2 style="text-align: center;color: skyblue;margin: 36px auto;font-size:50px ">我的账单</h2>
<table>
    <tr><th>序号</th><th>时间</th><th>详情</th><th>合计</th></tr>
<%
    //create table bill(name varchar(10),date1 date,consume varchar(200),sum1 int);
    request.setCharacterEncoding("utf-8");
    Properties properties = new Properties();
    properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
    DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
    Connection connection = dataSource.getConnection();
    String  sql  = "select * from bill where name=?";
    String  user = (String) session.getAttribute("name_sess");
    PreparedStatement sta = connection.prepareStatement(sql);
    sta.setString(1,user);
    ResultSet result = sta.executeQuery();
    int count = 0;
    Date date1 = null;
    String  consume = null;
    double sum1 = 0;
    String print = "";
    while (result.next()){
        date1 = result.getDate("date1");
        consume = result.getString("consume");
        sum1 = result.getDouble("sum1");
        count ++;
        String[] split = consume.split("#");
        int count1 = -1;
        for (int i = 0;i<split.length;i++) {
            if (i!=0){
                print = print+split[i]+"&nbsp;&nbsp;&nbsp;";
            }else {
                print = print +split[i];
            }
            count1++;
            if (count1%3==0){
                print = print+"<br>";
            }
        }
        System.out.println(print);
%>
    <tr><th><%=count%></th><th><%=date1%></th><th style="width: 436px"><%=print%></th><th><%=sum1%></th></tr>
<%};
    result.close();
    sta.close();
    connection.close();
%>
    <tr>
        <td colspan="4">
            总计:<%=count%>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <a href="my.jsp"style="text-decoration:none;font: 28px 楷体;">返回上一个界面</a>
        </td>
    </tr>
</table>
</body>
</html>

