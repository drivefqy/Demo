<%@ page import="xs.test" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Manhanlou.Order_bean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<%
  request.setCharacterEncoding("utf-8");
  ArrayList<Order_bean> list = (ArrayList)session.getAttribute("list");
  int  id1 =Integer.parseInt(request.getParameter("id")) ;
  if (list==null){
    out.print("空");   //空指针异常
  }
  else {
    for (int i = 0; i < list.size(); i++) {
      Order_bean test = list.get(i);
      if (test.getId()==id1) {
        list.remove(i);
        session.setAttribute("list", list);
        break;
      }
    }
  }
  response.sendRedirect("display_car.jsp");   //再次重定向
%>

</body>
</html>
