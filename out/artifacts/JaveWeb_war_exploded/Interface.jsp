<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.alibaba.druid.pool.DruidDataSourceFactory" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        *{
            margin: 0;
            padding:0;
        }
        body{
            background-color: #232525;
        }
        .top{
            height: 80px;
            background-color: #3C3F41;
            position: relative;
            z-index: 100;
        }
        .test1{
            width: 250px;
            height: 80px;
            font: 30px  楷体;
            line-height: 80px;
            position: absolute;
            text-align: center;
            text-decoration: none;
            color: #BABAA6;
        }
        .boxq1{left: 1%;}
        .boxq2{left: 16%;}
        .boxq3{left: 33%;}
        .boxq4{left: 64%;}
        .boxq5{left: 80%;}
        .boxq6{left: 49%;}
        .test1:hover{
            background-color: #0D293E;
            z-index: 100;
        }
        .box-3d{
            width: 300px;
            height: 500px;
            /*background-color: skyblue;*/
            margin: 1px auto;
        }
        .fund{
            width: 100%;
            height: 66px;
            font: 40px 楷体;
            color:#BABABA ;
            line-height: 66px;
            margin: 15px auto;
        }
    </style>
</head>
<body>
<%
    String user = (String)session.getAttribute("name_sess");
        if(user.equals("admin")){
            user = user+"(超级管理员)";
        }
        request.setCharacterEncoding("utf-8");
        Properties properties = new Properties();
        properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
        DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
        Connection connection = dataSource.getConnection();
        String sql1 = "select sum(count) from consume where date1 = current_date";
        ResultSet resultSet = connection.prepareStatement(sql1).executeQuery();
        double count = Double.parseDouble(String.format("%.2f", 0.00));
        while (resultSet.next()) {
            count = count + resultSet.getDouble(1);
        }
       count = Double.parseDouble(String.format("%.2f",count ));
%>
<div class="top">
    <a href="table.jsp" class="boxq1 test1" >餐桌信息</a>
    <a href="sum.jsp" class="boxq2 test1">营业额详情</a>
    <a href="appoinment.jsp" class="boxq6 test1">用户预约信息</a>
    <a href="menu.jsp" class="boxq3 test1">菜品信息</a>
    <a href="user.jsp" class="boxq4 test1">用户信息</a>
    <a href="propose.jsp"class="boxq5 test1" >用户建议/投诉</a>
</div>
<br>
<h2 class="fund">当前在线用户(此功能未实现):66</h2>
<h2 class="fund">当前时间(此功能未实现):1111-11-11 11:11:11</h2>
<h2 class="fund">当前营业额:<%=count%>元</h2>
<h2 class="fund">当前管理员:<%=user%></h2>
<b> <hr style="border-top: 6px solid red "></b>
<%
    String sql ="select * from admin_user";
    PreparedStatement sta = connection.prepareStatement(sql);
    ResultSet result = sta.executeQuery();
    String id = null;
    String name = null;
    String longin = null;
    while (result.next()){
         id = result.getString("ID");
         name = result.getString("name");
         longin = result.getString("login");
         if (user.contains(name)){
             continue;
         }
 %>
    <h2 class="fund" style="font-size: 32px">其他管理员:账户名:<%=name%>,上次登录时间：<%=longin.substring(0,10)%>&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin_del.jsp?id=<%=id%>"style="text-decoration:none;font: 32px 楷体;color: skyblue;">删除此管理员(需超级管理员权限)</a></h2>
    <%
    }%>
   <h2 class="fund"><a href="operation.jsp"style="text-decoration:none;font: 32px 楷体;color: skyblue;">增加新的管理员(需超级管理员权限)</a></h2>
   <h2 class="fund" style="margin-top:-22px"><a href="logout.jsp"style="text-decoration:none;font: 32px 楷体; color:red ;">注销(退出登录)</a></h2>

<%
%>
</body>
</html>