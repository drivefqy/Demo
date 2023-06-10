<%@ page contentType="text/html;charset=UTF-8" language="java" import="xs.test" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Manhanlou.Order_bean" %>
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
<h2 style="text-align: center;color: skyblue;margin: 10px auto;font-size:50px ">丐版点餐</h2>
<table>
    <tr><th>序号</th><th>名称</th><th>单价</th><th>购买数量</th><th>合计</th><th>菜系</th><th>继续点餐</th><th>删除</th></tr>
    <%
        request.setCharacterEncoding("utf-8");
        ArrayList<Order_bean> list = (ArrayList)session.getAttribute("list");
        if (list.isEmpty()){
     %>
    <tr>
        <td colspan="9">
            <a href="order.jsp">去点餐</a>
        </td>
    </tr>
    <%}
        else {
            int count = 0;
            for (Order_bean i : list){
                count++;
                int id = i.getId();
                String name = i.getName();
                String type = i.getClassify();
                double price = i.getPrice();
                int num = i.getNum();
                double sum = i.getSum();
    %>
    <tr><td><%=count%></td></td><td><%=name%></td>
        <td><%=price%></td><td><%=num%><td><%=sum%></td></td><td><%=type%></td>
        <td><a href="order.jsp">继续点餐</a></td><td><a href="order_del.jsp?id=<%=id%>"> 删除</a></td>
    </tr>

    <%
            }
        }
    %>
    <tr>
        <td colspan="9" style="height: 50px" >
            <form action="clear.jsp" method="post">
           <input type="submit" style="
            width: 300px;
            height: 50px;
            border: 2px solid black;
            font:30px 楷体;
            border-radius: 10px;
            margin-top: 10px">
            </form>
        </td>
    </tr>
</table>
</body>
</html>
