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
      color:black ;
      text-align: center;
      font: 50px 楷体;
      /*background-color: #232525;*/
    }
    .max{
      margin: 136px auto;
    }
  </style>
</head>
<body>
<div class="max">
  <h2 >注册新账号</h2>
  <form action="user_re.jsp" method="post">
    <div class="box0">
      <div class="box1">
        UserName:<input type="text" name="name" placeholder="输入用户名" > <br>
      </div>
      <div class="box2">
        PassWord:<input type="password" name="pwd" placeholder="输入密码"> <br>
      </div>
      <div class="box3">
        <input type="submit" value="注册" class="da"><br>
      </div>
      <div class="box4">
        <input type="reset" value="重置" class="da">
      </div>
    </div>
  </form>
</div>
</body>
</html>

