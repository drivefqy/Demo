<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="com.alibaba.druid.pool.DruidDataSourceFactory" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        h2{
            text-align: center;
            font: 56px 楷体;
            margin-top: 40px;
        }
        input{
            width: 330px;
            height: 50px;
            border: 2px solid black;
            border-radius: 10px;
            font: 25px 楷体;
            padding-left: 20px;
        }
        .xs2{
            width: 500px;
            margin: 0 auto;
        }
        .box1{
            margin-top: 10px;
            line-height: 50px;
        }
        .box11{
            text-align: revert;
            background-color: skyblue;
        }
        *{
            margin: 0;
            padding:0;
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
            width: 250px;
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
    <a href="display.jsp" class="boxq1 test1" >显示所有菜品</a>
    <a href="status.jsp" class="boxq2 test1">显示餐桌状态</a>
    <a href="" class="boxq3">预定餐桌</a>
    <a href="order.jsp" class="boxq4 test1">点餐服务</a>
    <a href="my.jsp"class="boxq5 test1" >我的满汉楼</a>
</div>
<h2>请输入你要预定的日期,以及人数</h2> <br>
<b> <hr style="border-top: 6px solid red "></b>
<div class="xs2">
    <form action="" method="get">
       <div class="box1"><input type="text" name="date" placeholder="日期"> <br> </div>
        <div class="box1"> <input type="text" name="num" placeholder="人数(或者ID号)"> <br> </div>
        <div class="box1">   <input type="submit" value="确定" class="box11"> </div>
    </form>
</div>
 <h2><a href="project.jsp"style="text-decoration:none;font: 40px 楷体;margin-left: -10%">返回主界面</a></h2>
<%
    request.setCharacterEncoding("utf-8");
    Properties properties = new Properties();
    properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
    DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
    Connection connection = dataSource.getConnection();
    String date = request.getParameter("date");
    String num = request.getParameter("num");
    String sql = "";
    int tmp1 = 0;
    if (date!=null&&Integer.parseInt(num)>0){
        sql = "select * from state where state=?";
        PreparedStatement sta = connection.prepareStatement(sql);
        sta.setString(1,"空闲");
        ResultSet result = sta.executeQuery();
        int tmp = 10;
        if (result.next()){
            while (result.next()){
                tmp = 0;
                int id = result.getInt("ID");
                String state = result.getString("state");
                int acc = result.getInt("accommodate");
                if ((acc>(Integer.parseInt(num)))&&acc<(Integer.parseInt(num))+20){
                    String update ="update state set state='已预订',sta_date=? where ID=?";
                    PreparedStatement sta1 = connection.prepareStatement(update);
                    sta1.setInt(2,id);
                    sta1.setString(1,date);
                    sta1.executeUpdate();
                    tmp = 1;
                    out.print("预定成功,餐桌号为"+id);
                    String  user11 = (String) session.getAttribute("name_sess");
                    String  sql11 = "insert into appoinment values(?,NOW(),?,?,?)";
                    PreparedStatement sta5 = connection.prepareStatement(sql11);
                    sta5.setString(1,user11);
                    sta5.setString(2,date);
                    sta5.setInt(3,id);
                    sta5.setString(4,"预约成功");
                    sta5.executeUpdate();
                    result.close();
                    sta1.close();
                    sta5.close();
                    connection.close();
                    break;
                }
            }
            if (tmp==0){
                out.print("预定失败");
            }
            result.close();
            sta.close();
            connection.close();
        }
        else {
            out.print("当前没有空闲餐桌可预定");
        }
    }
//    else {
//        try {
//            tmp1 =Integer.parseInt(num);
//        }
//        catch (Exception e){
//            System.out.println("======");
//        }
//        sql = "select * from state where state=? and ID=?";
//        PreparedStatement sta2 = connection.prepareStatement(sql);
//        sta2.setString(1,"空闲");
//        sta2.setInt(2,tmp1);
//        ResultSet result = sta2.executeQuery();
//        if (result.next()) {
//            String  user1 = (String) session.getAttribute("name_sess");
//            String  sql1 = "insert into appoinment values(?,NOW(),NOW(),tmp1";
////            create table appoinment(name varchar(10),date1 date,date2 date,id int);
//            out.print("预定成功,餐桌号为");
//            String update ="update state set state='已预订' where ID=?";
//            PreparedStatement sta3 = connection.prepareStatement(update);
//            PreparedStatement sta4 = connection.prepareStatement(sql1);
//            sta4.executeUpdate();
//            sta3.setInt(1,tmp1);
//            sta3.executeUpdate();
//            result.close();
//            sta3.close();
//            sta4.close();
//            connection.close();
//        }
//        else {
//            out.print("预定失败");
//        }
//        sta2.close();
//        connection.close();
//    }
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
</body>
</html>
