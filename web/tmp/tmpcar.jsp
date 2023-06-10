<%--
  Created by IntelliJ IDEA.
  User: CD
  Date: 2022/10/18
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="xs.test" %>
<%@ page import="java.util.ArrayList" %>
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
<h2 style="text-align: center;color: skyblue;margin: 36px auto;font-size:50px ">丐版水果购物车</h2>
<table>
    <tr><th>商品ID</th><th>名称</th><th>价格</th><th>购买数量</th><th>商品分类</th><th>继续购买</th><th>删除该商品</th></tr>
    <%
        request.setCharacterEncoding("utf-8");
       ArrayList<test> list = (ArrayList)session.getAttribute("list");
       if (list==null){
           out.print("空");
       }
       else {
        for (test i : list){
            String id = i.getId();
            String name = i.getName();
            double price = i.getPrice();
            int num = i.getNum();
            String type = i.getType();
    %>
    <tr><td><%=id%></td><td><%=name%></td>
        <td><%=price%></td><td><%=num%></td><td><%=type%></td>
        <td><a href="Car.jsp">继续购买</a></td><td><a href="del.jsp?id=<%=id%>"> 删除该商品</a></td>
    </tr>
    <%
        }
        }
    %>
</table>
</body>
</html>
