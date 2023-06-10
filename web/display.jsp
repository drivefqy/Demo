<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="com.alibaba.druid.pool.DruidDataSourceFactory" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@page import =" java.io.IOException"%>
<%@page import =" java.io.FileNotFoundException"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Scanner" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        h2{
            text-align: center;
            font: 36px 楷体;
            margin-top: 6px;
        }

        input{
            width: 330px;
            height: 50px;
            border: 2px solid black;
            border-radius: 10px;
            font: 25px 楷体;
            padding-left: 20px;
        }
        .xs1{
            height: 66px;
            width: 500px;
            margin: 0 auto;
        }
        .box1{
            width: 100px;
            text-align: initial;
        }
        td,th{
            height: 56px;
            line-height: 30px;
            border: 2px solid black;
            border-collapse: collapse;
            font: 25px 楷体;
        }
        table{
            width: 960px;
            height: 50px;
            background-color: skyblue;
            margin: 10px auto;
            text-align: center;
            border-collapse: collapse;
        }
        .top{
            height: 80px;
            background-color: #e3e4e5;
            position: relative;
            z-index: 100;
        }
        .test1{
            width: 200px;
            height: 80px;
            font: 30px  楷体;
            line-height: 80px;
            position: absolute;
            text-align: center;
            text-decoration: none;
            color: black;
        }
        .boxq1{left: 5%;}
        .boxq2{left: 20%;}
        .boxq3{
            left: 40%;
            color: red;
            width: 270px;
            height: 80px;
            padding-top: 16px;
            font: 45px  楷体;
            position: absolute;
            text-align: center;
            text-decoration: none;
        }
        .boxq4{left: 65%;}
        .boxq5{left: 82%;}
        .test1:hover{
            background-color: #fff;
            color: red;
            z-index: 100;
        }
    </style>
</head>
<body>
<%
    Object user = session.getAttribute("name_sess");
    if (user!=null){
%>
<div class="top">
    <a href="status.jsp" class="boxq1 test1" >显示餐桌状态</a>
    <a href="reserve.jsp" class="boxq2 test1">预定餐桌</a>
    <a href="" class="boxq3">显示所有菜品</a>
    <a href="order.jsp" class="boxq4 test1">点餐服务</a>
    <a href="my.jsp"class="boxq5 test1" >我的满汉楼</a>
</div>
<h2>若要指定菜系,请输入你要查询的菜系名称(鲁菜,川菜,湘菜,粤菜, 闽菜,浙菜,徽菜,苏菜)</h2>
<b> <hr style="border-top: 6px solid red "></b>
<div class="xs1">
    <form action="" method="get">
        <input type="text" name="state1">
        <input type="submit" value="确定" class="box1">
    </form>
</div>
<table>
    <tr><th>序号</th><th>ID</th><th>名称</th><th>价格</th><th>菜系</th></tr>
    <%
        request.setCharacterEncoding("utf-8");
        String state1 = request.getParameter("state1");
        Properties properties = new Properties();
        properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
        DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
        Connection connection = dataSource.getConnection();
        String sql ="";
        if (state1==null){
            sql = "select * from menu where 1=?";
        }
        else {
            sql = "select * from menu where classify=?";
        }
        PreparedStatement sta = connection.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        if (!(state1==null)){
            sta.setString(1,state1);
        }
        else {
            sta.setInt(1,1);
        }
        ResultSet resultSet = sta.executeQuery();
        resultSet.last();
        int row = resultSet.getRow();
        int pagesize = 6;
        int pagenow = 0;
        if (request.getParameter("page")==null){
            pagenow = 0;
        }
        else {
            pagenow = Integer.parseInt(request.getParameter("page"));
        }
        int sum_page = 0;
        if (row%pagesize==0){
            sum_page = row / pagesize;
        }
        else {
            sum_page = row / pagesize + 1;
        }
        // 用于判断pagenow是否合法
        if ((pagenow>sum_page-1)||(pagenow<0)){
            if (pagenow>sum_page-1){pagenow = pagenow-1;}
            else {
                pagenow = 0;
            }
        }
        resultSet.absolute(pagenow*pagesize+1);  // 游标从1开始,顺序不对会报错
        int id = 0;
        String state = null;
        double price = 0;
        String classify = null;
        int sum = 0;
        if (resultSet.next()){
        for (int i = 0;i<pagesize;i++){
             id = resultSet.getInt("ID");
             state = resultSet.getString("name");
             price = resultSet.getDouble("price");
             classify = resultSet.getString("classify");
             sum ++;
    %>
    <tr><td><%=sum%></td><td><%=id%></td><td><%=state%></td><td><%=price%></td><td><%=classify%></td></tr>
    <%
            if (!resultSet.next()) {
                break;
            }
        }}
    %>
    <tr>
        <td colspan="5">
            <a href="display.jsp?page=0"style="text-decoration:none;font: 25px 楷体;">第一页</a>&nbsp;&nbsp;
            <a href="display.jsp?page=<%=pagenow-1%>"style="text-decoration:none;font: 25px 楷体;">上一页</a>&nbsp;&nbsp;
            <span style="font:28px 楷体">当前页：<%=pagenow+1%></span>&nbsp;&nbsp;
            <a href="display.jsp?page=<%=pagenow+1%>"style="text-decoration:none;font: 25px 楷体;">下一页</a>&nbsp;&nbsp;
            <a href="display.jsp?page=<%=sum_page-1%>"style="text-decoration:none;font: 25px 楷体;">最后一页</a>
        </td>
    </tr>
    <tr>
        <td colspan="5">
            <a href="project.jsp"style="text-decoration:none;font: 28px 楷体;">返回主界面</a>
        </td>
    </tr>
    <%
        resultSet.close();
        sta.close();
        connection.close();
    %>
    <%
        }
        else {
    %>
    <h2 style="text-align: center;margin-top: 200px ;color: red" >请先登录</h2>
    <h2 style="text-align: center;margin-top: 20px"><a href ='longin.jsp' style="text-decoration: none;" >点击此处返回登录界面</a></h2>
    <%
        }
    %>
</table>
</body>
</html>
