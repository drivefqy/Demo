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
</head>
<body>
<h2>购物车</h2>
<%
   request.setCharacterEncoding("utf-8");
    String id = " ";
    id = request.getParameter("id").replace("\\s+","");
    int count = 0;
   ArrayList list1 =(ArrayList) session.getAttribute("list");
   if (list1==null){    //说明首次添加东西到购物车里面
       ArrayList list_tmp = new ArrayList();
       list1 = list_tmp;
       if (id.equals("1")){
           list1.add(new xs.test(id,"苹果",1,66.6,"水果"));
           count = 1;
       } else if (id.equals("2")) {
           list1.add(new xs.test(id,"葡萄",1,88,"水果"));
           count = 1;
       }
       else {
           list1.add(new xs.test(id,"西瓜",1,99,"水果"));
           count = 1;
       }
   }
   else {  //说明非首次添加东西到购物车里面
      for (int i = 0;i< list1.size();i++){
        test obj =(test) list1.get(i);
        if (obj.getId().equals(id)){
            int i1 = obj.setNum(obj.getNum() + 1);
            obj.setPrice(obj.getPrice()/(i1-1)*i1);
            count++;
            session.setAttribute("list",list1);
        }
      }
      if (count==0){  //购物车里面虽然有东西，但不是我要购买的东西
          if (id.equals("1")){
              list1.add(new xs.test(id,"苹果",1,66.6,"水果"));
              count = 1;
          } else if (id.equals("2")) {
              list1.add(new xs.test(id,"葡萄",1,88,"水果"));
              count = 1;
          }
          else {
              list1.add(new xs.test(id,"西瓜",1,99,"水果"));
              count = 1;
          }
      }
   }
   session.setAttribute("list",list1);
   response.sendRedirect("tmpcar.jsp");
%>
</body>
</html>
