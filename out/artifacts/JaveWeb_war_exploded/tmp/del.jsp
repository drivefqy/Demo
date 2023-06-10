<%@ page import="xs.test" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: CD
  Date: 2022/10/18
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    ArrayList<test> list = (ArrayList)session.getAttribute("list");
    String id1 = request.getParameter("id");
    if (list==null){
        out.print("空");   //空指针异常
    }
    else {
        for (int i = 0; i < list.size(); i++) {
            test test = list.get(i);
            if (test.getId().equals(id1)) {
                list.remove(i);
                session.setAttribute("list", list);
                break;
            }
        }
    }
    response.sendRedirect("tmpcar.jsp");   //再次重定向
%>

</body>
</html>