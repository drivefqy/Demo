<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.alibaba.druid.pool.DruidDataSourceFactory" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: CD
  Date: 2022/10/16
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        div{
            width: calc(95vh);
            position: relative;
            left: 22%;
        }
        .tj{
            width: 200px;
            height: 50px;
            font: 25px 楷体;
            background-color: skyblue;
            position: absolute;
            margin: 0 auto;
            left: 40%;
        }
    </style>
</head>
<body>
<h2 style="text-align: center;font: 50px 楷体;padding-top: 10px">请输入</h2>
<hr style="border-top: 5px solid red">
<div>
<form action="" method="post">
<textarea cols="66" rows="16" style="font: 25px 楷体;border: 2px solid black;resize: none;" name="text">
</textarea><br><br>
<input type="submit" value="提交" class="tj">
</form>
</div>
<%
//    id` int(11) NOT NULL AUTO_INCREMENT,
//    `username` varchar(20) DEFAULT NULL,
//    `mes` varchar(1000) DEFAULT NULL,
//    `mess_data` date DEFAULT NULL,
    request.setCharacterEncoding("utf-8");
    Properties properties = new Properties();
    properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
    DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
    Connection connection = dataSource.getConnection();
    String text1 = request.getParameter("text");
    String user = (String) session.getAttribute("name_sess");
    String type = request.getParameter("type");
    if (type.equals("feedback")){
        text1 = text1 + "$";
    } else {
        text1 = text1 + "#";
    }
    String sql = "insert into mession values (null,?,?,NOW())";
    PreparedStatement sta = connection.prepareStatement(sql);
    sta.setString(1,user);
    sta.setString(2,text1);
    System.out.println(text1);
    if (text1.length()>5){
        sta.execute();
 %>
<h3 style="text-align: left;font: 30px 楷体 ; color: red">提交成功</h3>
<%
        sta.close();
        connection.close();
    }
%>
<br>
<h2 style="width: 200px;height: 50px;margin: 20px 42%" ><a href="my.jsp"style="text-decoration:none;">回到上一个界面</a></h2>
</body>
</html>
