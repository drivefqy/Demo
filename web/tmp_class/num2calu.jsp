<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
       div{
           width: 560px;
           height: 560px;
            margin: 0 auto;
            text-align: center;
           background: skyblue;
           font-size: 25px;
        }
    </style>
</head>
<body>
<div>
<h2>简易计算机制作</h2>
<form action="num3calu.jsp" method="post">
第一个数：<input type="text" name="num1"><br>
第二个数：<input type="text" name="num2"><br>
计算类型为：
<select name="type">
    <option  value="*">*</option>
    <option  value="+">+</option>
    <option  value="-">-</option>
    <option  value="/">/</option>
</select>
<input type="submit">
</form>
</div>
</body>
</html>
