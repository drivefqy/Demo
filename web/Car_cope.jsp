<%@ page contentType="text/html;charset=UTF-8" language="java" import="xs.test" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.alibaba.druid.pool.DruidDataSourceFactory" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="Manhanlou.Order_bean" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>购物车</h2>
<%
    request.setCharacterEncoding("utf-8");
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("state");
    double price = Double.parseDouble(request.getParameter("acc"));
    String classify = request.getParameter("classify");
    int count = 0;
    ArrayList list1 =(ArrayList) session.getAttribute("list");
    if (list1==null){    //说明首次添加东西到购物车里面
        ArrayList list_tmp = new ArrayList();
        list1 = list_tmp;
        list1.add(new Order_bean(id,name,price,classify,1));
        count = 1;
    }
    else {  //说明非首次添加东西到购物车里面
        for (int i = 0;i< list1.size();i++){
            Order_bean obj = (Order_bean) list1.get(i);
            if (obj.getId()==id){
                obj.setNum(obj.getNum()+1);
                obj.setSum(obj.getNum()*obj.getPrice());
                count++;
                session.setAttribute("list",list1);
            }
        }
        if (count==0){  //购物车里面虽然有东西，但不是我要购买的东西
            list1.add(new Order_bean(id,name,price,classify,1));
            count = 1;
        }
    }
    session.setAttribute("list",list1);
    response.sendRedirect("display_car.jsp");
%>
</body>
</html>

