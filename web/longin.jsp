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
            color: whitesmoke;
            text-align: center;
            font: 50px 楷体;
            height: calc(82vh);
            background-image: url("resoce/f.jpg");
            background-size:100%  ;
            background-repeat: no-repeat;
            background-position: center;
       }
       .max{
           margin: 136px auto;
       }
    </style>
</head>
<body>
<div class="max">
<h2 >登录</h2>
    <form action="log.jsp" method="post">
        <div class="box0">
     <div class="box1">
    UserName:<input type="text" name="name" placeholder="输入用户名" > <br>
     </div>
        <div class="box2">
    PassWord:<input type="password" name="pwd" placeholder="输入密码"> <br>
        </div>
        <div class="box3">
    <input type="submit" value="登录" class="da"><br>
        </div>
            <div class="box4">
    <input type="reset" value="重置" class="da">
            </div>
            <div class="box4">
                <a href="user1_re.jsp"style="text-decoration:none;color: ghostwhite;font: 46px 楷体;">注册新账号</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>