<%@ page contentType="text/html;charset=UTF-8" language="java" isThreadSafe="true" %>
<html>
<head>
    <title>登录</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .box0{
            height: 500px;
            width: 500px;
            /*background-color: skyblue;*/
            margin: 0 auto;
            font: 25px 楷体;
            padding-left: 50px;
            padding-top: 5px;
        }
        input{
            width: 300px;
            height: 50px;
            border: 2px solid black;
            font:30px 楷体;
            border-radius: 10px;
            padding-left: 5px;
        }
        .da{
            width: 412px;
            height: 50px;
            border: 2px solid black;
            font:30px 楷体;
            border-radius: 10px;
            background-color: deepskyblue;
        }
        div{
            padding-left: 30px;
            padding-top: 20px;
        }
        body{
            color:#BABABA ;
            text-align: center;
            font: 50px 楷体;
            background-color: #232525;
        }
        .max{
            margin: 136px auto;
        }
    </style>
</head>
<body>
<%
    String type = request.getParameter("type");
    if (type.equals("table")){
%>
<div class="max">
    <h2 >增加新的餐桌</h2>
    <form action="menu_insert.jsp" method="post">
        <div class="box0">
            <div class="box1">
                序号:<input type="text" name="id" placeholder="输入序号" > <br>
            </div>
            <div class="box2">
                人数:<input type="text" name="acc" placeholder="输入容纳人数"> <br>
            </div>
            <div class="box3">
                <input type="submit" value="完成" class="da"><br>
            </div>
            <div class="box4">
                <input type="reset" value="重置" class="da">
            </div>
        </div>
    </form>
</div>
<%}else{%>
<div class="max" style="margin: 50px auto;">
    <h2 >增加新的菜品</h2>
    <form action="table_menu_insert.jsp" method="post">
        <div class="box0">
            <div class="box2">
                编号:<input type="text" name="id" placeholder="输入编号"> <br>
            </div>
            <div class="box1">
                名称:<input type="text" name="name" placeholder="输入名称" > <br>
            </div>
            <div class="box2">
                价格:<input type="text" name="price" placeholder="输入价格"> <br>
            </div>
            <div class="box2">
               菜系:<input type="text" name="classify" placeholder="输入菜系"> <br>
            </div>
            <div class="box3">
                <input type="submit" value="完成" class="da"><br>
            </div>
            <div class="box4">
                <input type="reset" value="重置" class="da">
            </div>
        </div>
    </form>
</div>

<%}%>
</body>
</html>
