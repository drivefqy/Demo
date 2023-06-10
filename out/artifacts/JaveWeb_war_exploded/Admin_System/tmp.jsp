
<%@ page contentType="text/html;charset=UTF-8" language="java" isThreadSafe="true" %>
<html>
<head>
    <title>修改界面</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .box0{
            height: 500px;
            width: 500px;
            margin: 0 auto;
            font: 25px 楷体;
            color: #BABAA6;
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
    String id = request.getParameter("id");
    if (type.equals("menu")){
%>
<div class="max">
    <form action="tabel_update.jsp" method="post">
        <div class="box0">
            <div class="box1">
                ID号:<input type="text" name="name" value="<%=id+"@"+type.toUpperCase()%>" readonly> <br>
            </div>
            <div class="box2">
                价格:<input type="text" name="pwd" placeholder="输入价格"> <br>
            </div>
            <div class="box3">
                <input type="submit" value="提交" class="da"><br>
            </div>
            <div class="box4">
                <input type="reset" value="重置" class="da">
            </div>
        </div>
    </form>
</div>
<%}else if (type.equals("table")){
%>
<div class="max">
    <form action="tabel_update.jsp" method="post">
        <div class="box0">
            <div class="box1">
                ID号:<input type="text" name="name" value="<%=id+"@"+type.toUpperCase()%>" readonly> <br>
            </div>
            <div class="box2">
                人数:<input type="text" name="pwd" placeholder="输入容纳人数"> <br>
            </div>
            <div class="box3">
                <input type="submit" value="提交" class="da"><br>
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
