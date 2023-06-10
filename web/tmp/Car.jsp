
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table{
            width: 100%;
            height: 50px;
            border: 2px solid black;
            border-collapse: collapse;
            background-color: skyblue;
        }
        tr,th,td{
            width: 60px;
            height: 50px;
            font: 25px 楷体;
            line-height: 50px;
            border: 2px solid black;
            border-collapse: collapse;
            text-align: center;
        }
        a{
            text-decoration: none;
            font: 25px 楷体 ;
            color: blue;
        }
    </style>
</head>
<body>
<h2 style="text-align: center;color: skyblue;margin: 36px auto;font-size:50px ">李华的线上购物网站</h2>
<table>
    <tr><th>商品ID</th><th>商品分类</th><th>名称</th><th>价格</th><th>我要购买</th><th>我的购物车</th></tr>
    <tr><td>1</td><td>水果</td><td>苹果</td><td>66.6</td><td><a href="buy.jsp?id=1">购买该商品</a></td><td><a href="tmpcar.jsp">查看我的购物车</a></td></tr>
    <tr><td>2</td><td>水果</td><td>葡萄</td><td>88</td><td><a href="buy.jsp?id=2">购买该商品</a></td><td><a href="tmpcar.jsp">查看我的购物车</a></td></tr>
    <tr><td>3</td><td>水果</td><td>西瓜</td><td>99</td><td><a href="buy.jsp?id=3">购买该商品</a></td><td><a href="tmpcar.jsp">查看我的购物车</a></td></tr>
</table>
</body>
</html>
