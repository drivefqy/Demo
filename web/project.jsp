<%--
  Created by IntelliJ IDEA.
  User: CD
  Date: 2022/10/15
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
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
        .top{
            height: 80px;
            background-color: #e3e4e5;
            position: relative;
            z-index: 100;
        }
        .test1{
            width: 200px;
            height: 80px;
            font: 33px  楷体;
            line-height:80px;
            position: absolute;
            text-align: center;
            text-decoration: none;
            color: black;
        }
        .boxq1{left: 8%;}
        .boxq2{left: 28%;}
        .boxq3{left: 45%;}
        .boxq4{left: 65%;}
        .boxq5{left: 82%;}
        .test1:hover{
            background-color: #fff;
            color: red;
            z-index: 100;
        }
        .box-3d{
            width: 300px;
            height: 500px;
            /*background-color: skyblue;*/
            margin: 1px auto;
        }
        .span-3d{
            display: block;
            padding: 60px 50px;
            text-align: center;
            font: 25px 楷体;
            line-height: 40px;
            color:yellow;
            position: relative;
            /*定义动画名称*/
            animation-name: move;
            /*动画运动时间*/
            animation-duration: 800ms;
            /*动画开始时间*/
            animation-delay: 1ms;
            /*动画次数*/
            animation-iteration-count: 1;
            /*动画下一次播放是否逆播放*/
            animation-direction: alternate;
            /*动画完成后是回到起点backwards还是就在原地forwards*/
            animation-fill-mode: forwards;
            /*    动画运动速率  linear 匀速    ease 先快后满   steps()  规定步长*/
            animation-timing-function: linear;
        }
        @keyframes move {
            70%{
                transform: scale(200%,200%);
            }
            100%{
                transform: scale(500%,500%);
            }
        }
        .name{
            width: 100%;
            height: 100px;
            text-align: center;
            font: 88px 楷体;
            color: yellow;
            display: inline-block;
            margin: 50px auto;
        }
        .bgc{
            background-image: url("resoce/a.jpg");
            background-size:100%  ;
            background-repeat: no-repeat;
            background-position: center;
            background-color: #7B0001;
        }
    </style>
</head>
<body>
<%
   String user = (String)session.getAttribute("name_sess");
    if (user!=null){
%>
<div class="top">
    <a href="status.jsp" class="boxq1 test1" >显示餐桌状态</a>
    <a href="reserve.jsp" class="boxq2 test1">预定餐桌</a>
    <a href="display.jsp" class="boxq3 test1">显示所有菜品</a>
    <a href="order.jsp" class="boxq4 test1">点餐服务</a>
    <a href="my.jsp"class="boxq5 test1" >我的满汉楼</a>
</div>
<div class="bgc" >
    <span class="name">满汉楼</span>
    <div class="box-3d">
        <span class="span-3d">欢迎光临满汉楼</span>
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