<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.alibaba.druid.pool.DruidDataSourceFactory" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
        .boxq3{left: 33%;
            width: 250px;
            height: 80px;
            font: 50px  楷体;
            line-height: 80px;
            position: absolute;
            text-align: center;
            text-decoration: none;
            color: red;
        }
        .boxq4{left: 64%;}
        .boxq5{left: 80%;}
        .boxq6{left: 49%;}
        .test1:hover{
            background-color: #0D293E;
            z-index: 100;
        }
        td,th{
            height: 40px;
            line-height: 30px;
            border: 2px solid #0D293E;
            border-collapse: collapse;
            font: 25px 楷体;
            color:#BABABA ;
        }
        table{
            width: 1200px;
            height: 50px;
            background-color: #3C3F41;
            margin: 30px auto;
            text-align: center;
            border-collapse: collapse;
        }
        h2{
            text-align: center;
            font: 30px 楷体;
            margin-top: 22px;
            color: #BABABA;
        }
        input{
            width: 330px;
            height: 40px;
            border: 2px solid #0D293E;
            border-radius: 10px;
            font: 25px 楷体;
        }
        .xs{
            height: 40px;
            width: 500px;
            margin: 16 auto;
            padding-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="top">
    <a href="" class="boxq3">营业额详情</a>
    <a href="menu.jsp" class="boxq2 test1">菜品详情</a>
    <a href="appoinment.jsp" class="boxq6 test1">用户预约信息</a>
    <a href="table.jsp" class="boxq1 test1">餐桌信息</a>
    <a href="user.jsp" class="boxq4 test1">用户信息</a>
    <a href="propose.jsp"class="boxq5 test1" >用户建议/投诉</a>
</div>
<%
    Object user = session.getAttribute("name_sess");
    if (user!=null){
%>
<h2>支持查询(输入你要查询的日期)</h2> <br>
<b> <hr style="border-top: 6px solid red "></b>
<div class="xs">
    <form action="" method="get">
        <input type="text" name="state1">
        <input type="submit" value="确定" class="box1">
    </form>
</div>
<table>
    <tr><th>序号</th><th>用户账号</th><th>日期</th><th>金额</th></tr>
    <%
        request.setCharacterEncoding("utf-8");
        String state1 =  request.getParameter("state1");
        int tmp_1 = 0;
        Properties properties = new Properties();
        properties.load(new FileInputStream("D:\\java project IDEA\\JaveWeb\\web\\druid.properties"));
        DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
        Connection connection = dataSource.getConnection();
        String sql = "";
        PreparedStatement sta = null;
        if (state1!=null){  // 说明输入的是日期
            sql ="select * from consume where date1 = ?  ;";
        }
        else {
            sql ="select * from consume ORDER BY date1 desc ";
        }
        sta = connection.prepareStatement(sql);
        if (state1!=null){  // 说明输入的是日期
            sta.setString(1,state1);
        }
        ResultSet resultSet = sta.executeQuery();
        resultSet.last();
        int row = resultSet.getRow();
        int pagesize = 15;
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
        String state = null;
        Date date = null;
        double classify = 0;
        int tmp = 0;
        int sum = 0;
        //consume;| name      | date1      | count
        for (int i = 0;i<pagesize;i++){
            state = resultSet.getString("name");
            date = resultSet.getDate("date1");
            classify = resultSet.getDouble("count");
            tmp++;
            sum = (int)classify + sum;
    %>
    <tr>
        <td><%=tmp%></td>
        <td><%=state%></td>
        <td><%=date%></td>
        <td><%=classify%></td>
    </tr>
    <%
            if (!resultSet.next()) {
                break;
            }
        }
    %>
    <tr>
        <td colspan="4">
            <a href="sum.jsp?page=0" style="text-decoration:none;font: 25px 楷体;color: skyblue;">第一页</a>&nbsp;&nbsp;
            <a href="sum.jsp?page=<%=pagenow-1%>" style="text-decoration:none;font: 25px 楷体;color: skyblue;">上一页</a>&nbsp;&nbsp;
            <span style="font:28px 楷体">当前页<%=pagenow+1%></span>&nbsp;&nbsp;
            <a href="sum.jsp?page=<%=pagenow+1%>" style="text-decoration:none;font: 25px 楷体;color: skyblue;">下一页</a>&nbsp;&nbsp;
            <a href="sum.jsp?page=<%=sum_page-1%>" style="text-decoration:none;font: 25px 楷体;color: skyblue;">最后一页</a>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            总计:<%=sum%>元
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <a href="Interface.jsp"style="text-decoration:none;font: 28px 楷体;color: skyblue;">返回主界面</a>
        </td>
    </tr>
</table>
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

