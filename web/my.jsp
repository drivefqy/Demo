
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的满汉楼</title>
    <style>
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
        .mt{
            width: 200px;
            height: 60px;
            font: 40px  楷体;
            line-height: 60px;
            position: absolute;
            text-align: center;
            text-decoration: none;
            color:yellow;
            display: contents;
            background-color: #000000;
        }

    .bgc{
        height: calc(95vh);
        background-image: url("resoce/my1.jpg");
        background-size:100%  ;
        background-repeat: no-repeat;
        background-position: center;
        margin-top: -46px;
    }
    .top1{
        width: calc(96vh);
        position: relative;
        /*margin-top: 66px;*/
        left: 18%;
        top: 10%;
    }
    .mt:hover{
        background-color: skyblue;
        color:white;
    }

    </style>
</head>
<body>
<%
    Object user = session.getAttribute("name_sess");
    String user1 =(String) session.getAttribute("name_sess");
    if (user!=null){
%>
<div class="top">
    <a href="status.jsp" class="boxq1 test1" >显示餐桌状态</a>
   <a href="reserve.jsp" class="boxq2 test1">预定餐桌</a>
    <a href="" class="boxq3">我的满汉楼</a>
    <a href="order.jsp" class="boxq4 test1">点餐服务</a>
    <a href="display.jsp"class="boxq5 test1" >显示所有菜品</a>
</div>
<div class="bgc">
    <div class="top1">
        <h2 style="margin-top: -10px;margin-bottom: 15px;font: 45px 楷体;color:white;">用户<%=user1%>，你好！</h2>
     <a href="my_bill.jsp" class="mt">我的账单</a><br>
    <a href="my_consume.jsp" class="mt">我的消费</a><br>
<%--        可加入我的钱包 测试事务--%>
     <a href="my_appoinment.jsp" class="mt">我的预约</a><br>
        <a href="mess.jsp?type=comment" class="mt">留言/评论</a><br>
   <a href="Inet.jsp" class="mt">人工客服(此功能未实现)</a><br>
     <a href="mess.jsp?type=feedback" class="mt">投诉/反馈</a><br>
     <a href="logout.jsp" class="mt">退出登录</a><br>
    </div>
</div>
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